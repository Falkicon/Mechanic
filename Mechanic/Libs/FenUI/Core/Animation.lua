--------------------------------------------------------------------------------
-- FenUI Animation System
--
-- A declarative animation system wrapping WoW's native AnimationGroup API.
--------------------------------------------------------------------------------

local Animation = {}
FenUI.Animation = Animation

-- Map FenUI easing names to WoW smoothing types
local SMOOTHING_MAP = {
	["linear"] = "NONE",
	["ease-in"] = "IN",
	["ease-out"] = "OUT",
	["ease-in-out"] = "IN_OUT",
}

-- Default animation values
local DEFAULTS = {
	duration = 0.2,
	easing = "ease-out",
}

--------------------------------------------------------------------------------
-- Group Building
--------------------------------------------------------------------------------

-- Resolve a scale value (number or { x, y }) to x, y; nil falls back to fbX, fbY
local function ScaleXY(value, fbX, fbY)
	if value == nil then
		return fbX, fbY
	end
	if type(value) == "table" then
		return value.x or 1, value.y or 1
	end
	return value, value
end

-- Resolve an offset ({ x, y }) to x, y; nil falls back to fbX, fbY
local function OffsetXY(value, fbX, fbY)
	if value == nil then
		return fbX, fbY
	end
	return value.x or 0, value.y or 0
end

-- Describe one from -> to segment as animation specs (plain data, applied to a
-- group at play time).
-- A finished animation keeps its transform while later orders play, and Scale and
-- Translation compose with each other, so each segment animates relative to what
-- earlier segments left applied (`applied`) instead of from the frame's rest state.
local function AddSegmentSpecs(specs, applied, startVals, endVals, duration, order, smoothing)
	-- Alpha (absolute, doesn't compose). nil means the frame's alpha at play time.
	if startVals.alpha ~= nil or endVals.alpha ~= nil then
		local from = startVals.alpha
		if from == nil then from = applied.alpha end
		specs[#specs + 1] = {
			type = "Alpha", order = order, duration = duration, smoothing = smoothing,
			from = from, to = endVals.alpha,
		}
		applied.alpha = endVals.alpha
	end

	-- Scale (multiplies with earlier segments' scale)
	if startVals.scale ~= nil or endVals.scale ~= nil then
		local fromX, fromY = ScaleXY(startVals.scale, applied.scaleX, applied.scaleY)
		local toX, toY = ScaleXY(endVals.scale, fromX, fromY)

		specs[#specs + 1] = {
			type = "Scale", order = order, duration = duration, smoothing = smoothing,
			fromX = fromX / applied.scaleX, fromY = fromY / applied.scaleY,
			toX = toX / applied.scaleX, toY = toY / applied.scaleY,
		}
		applied.scaleX, applied.scaleY = toX, toY
	end

	-- Translation (adds to earlier segments' offset). WoW only animates by a delta,
	-- so a start offset is reached with a zero-duration Translation first (the same
	-- pattern Blizzard's XML uses), then the delta to the end offset plays.
	if startVals.offset ~= nil or endVals.offset ~= nil then
		local fromX, fromY = OffsetXY(startVals.offset, applied.x, applied.y)
		local toX, toY = OffsetXY(endVals.offset, fromX, fromY)

		if fromX ~= applied.x or fromY ~= applied.y then
			specs[#specs + 1] = {
				type = "Translation", order = order, duration = 0,
				x = fromX - applied.x, y = fromY - applied.y,
			}
		end
		specs[#specs + 1] = {
			type = "Translation", order = order, duration = duration, smoothing = smoothing,
			x = toX - fromX, y = toY - fromY,
		}
		applied.x, applied.y = toX, toY
	end
end

-- The from/to values of a Define animation, with shorthand and defaults resolved
local function ResolveFromTo(animObj)
	local config = animObj.config

	-- Copies, so the definition's tables aren't changed
	local from, to = {}, {}
	for k, v in pairs(config.from or {}) do from[k] = v end
	for k, v in pairs(config.to or {}) do to[k] = v end

	-- Also support direct property keys in config for simplicity
	if config.alpha and type(config.alpha) == "table" then
		if from.alpha == nil then from.alpha = config.alpha.from end
		if to.alpha == nil then to.alpha = config.alpha.to end
	end

	-- A `from` with no matching `to` animates back to rest
	if from.scale ~= nil and to.scale == nil then to.scale = 1 end
	if from.offset ~= nil and to.offset == nil then to.offset = { x = 0, y = 0 } end

	return from, to
end

-- Build an animation object's specs, and its shape: the animation types and
-- orders, which is all a group needs to be reused for it
local function BuildSpecs(animObj)
	local specs = {}
	local applied = { scaleX = 1, scaleY = 1, x = 0, y = 0 }

	if animObj.isKeyframes then
		local keyframes = animObj.keyframes
		for i = 1, #keyframes - 1 do
			local startK = keyframes[i]
			local endK = keyframes[i + 1]
			local segmentDuration = (endK.time - startK.time) * animObj.duration
			AddSegmentSpecs(specs, applied, startK.values, endK.values, segmentDuration, i, animObj.smoothing)
		end
	else
		local from, to = ResolveFromTo(animObj)
		AddSegmentSpecs(specs, applied, from, to, animObj.duration, 1, animObj.smoothing)
	end

	local shape = {}
	for i, spec in ipairs(specs) do
		shape[i] = spec.type .. spec.order
	end
	return specs, table.concat(shape, ",")
end

-- Set a frame's alpha without going through an alpha transition (ApplyTransitions)
local function SetAlphaDirect(frame, alpha)
	local raw = frame.fenUIRawSetters and frame.fenUIRawSetters.alpha
	if raw then
		raw(frame, alpha)
	else
		frame:SetAlpha(alpha)
	end
end

-- Create the animations for a shape in a new group
local function CreateGroup(frame, specs)
	local ag = frame:CreateAnimationGroup()
	ag.fenUIAnimList = {}
	for i, spec in ipairs(specs) do
		local anim = ag:CreateAnimation(spec.type)
		anim:SetOrder(spec.order)
		ag.fenUIAnimList[i] = anim
	end

	ag:SetScript("OnFinished", function()
		-- Keep the final alpha (WoW otherwise reverts it when the group ends).
		-- Scale and offset return to rest.
		if ag.finalAlpha ~= nil then
			SetAlphaDirect(frame, ag.finalAlpha)
		end
		local onComplete = ag.onComplete
		ag.onComplete, ag.onCancel = nil, nil
		if onComplete then
			onComplete(frame)
		end
	end)
	return ag
end

-- Set this play's values on a group's animations
local function ApplySpecs(frame, ag, specs)
	local currentAlpha = frame:GetAlpha()
	ag.finalAlpha = nil

	for i, spec in ipairs(specs) do
		local anim = ag.fenUIAnimList[i]
		anim:SetDuration(spec.duration)
		anim:SetSmoothing(spec.smoothing or "NONE")
		if spec.type == "Alpha" then
			local from, to = spec.from, spec.to
			if from == nil then from = currentAlpha end
			if to == nil then to = currentAlpha end
			anim:SetFromAlpha(from)
			anim:SetToAlpha(to)
			ag.finalAlpha = to
		elseif spec.type == "Scale" then
			anim:SetScaleFrom(spec.fromX, spec.fromY)
			anim:SetScaleTo(spec.toX, spec.toY)
		else
			anim:SetOffset(spec.x, spec.y)
		end
	end
end

--------------------------------------------------------------------------------
-- Animation Mixin
--------------------------------------------------------------------------------

local AnimationMixin = {}

function AnimationMixin:Init(config)
	self.config = config
	self.duration = config.duration or DEFAULTS.duration
	self.easing = config.easing or DEFAULTS.easing
	self.smoothing = SMOOTHING_MAP[self.easing] or "OUT"
end

--- Play the animation on a frame
---@param frame Frame The target frame
---@param options? table Optional callbacks and overrides
---@return AnimationGroup|nil group The group that is playing
function AnimationMixin:Play(frame, options)
	if not frame then return end

	options = options or {}
	local animName = options.name or "default"

	-- WoW has no RemoveAnimation, so a group is never rebuilt: groups are cached per
	-- frame by name and shape and get this animation's values on each play. Any
	-- number of animations with the same shape share one group.
	if not self.specs then
		self.specs, self.shape = BuildSpecs(self)
	end
	local key = animName .. "|" .. self.shape
	frame.fenUIAnimGroups = frame.fenUIAnimGroups or {}
	local ag = frame.fenUIAnimGroups[key]
	if not ag then
		ag = CreateGroup(frame, self.specs)
		frame.fenUIAnimGroups[key] = ag
	end

	-- Stop whatever is playing under this name (the name is what Cancel targets)
	frame.fenUIAnims = frame.fenUIAnims or {}
	local previous = frame.fenUIAnims[animName]
	if previous and previous:IsPlaying() then
		previous:Stop()
	end
	if ag:IsPlaying() then
		ag:Stop()
	end
	frame.fenUIAnims[animName] = ag

	ApplySpecs(frame, ag, self.specs)
	ag.onComplete = options.onComplete
	ag.onCancel = options.onCancel

	if options.onStart then
		options.onStart(frame)
	end

	ag:Play()
	return ag
end

--- Stop any running animations of a certain name on a frame
---@param frame Frame
---@param name? string
function Animation:Cancel(frame, name)
	if not frame or not frame.fenUIAnims then return end
	local animName = name or "default"
	local ag = frame.fenUIAnims[animName]
	if ag and ag:IsPlaying() then
		ag:Stop()
		if ag.onCancel then
			ag.onCancel(frame)
		end
	end
end

--- Chain another animation after this one
---@param nextAnim table The animation to play next
---@return table A new chained animation object
function AnimationMixin:Then(nextAnim)
	local originalPlay = self.Play
	local chained = {}
	FenUI.Mixin(chained, self)

	chained.Play = function(this, frame, options)
		options = options or {}

		-- Copies, so the caller's table isn't changed and the next animation gets the
		-- caller's onComplete (it runs once, after the whole chain)
		local firstOptions, nextOptions = {}, {}
		for k, v in pairs(options) do
			firstOptions[k] = v
			nextOptions[k] = v
		end
		nextOptions.onStart = nil
		firstOptions.onComplete = function(f)
			nextAnim:Play(f, nextOptions)
		end

		return originalPlay(this, frame, firstOptions)
	end

	return chained
end

--------------------------------------------------------------------------------
-- Factory Methods
--------------------------------------------------------------------------------

--- Define a new animation
---@param config table Animation configuration
---@return table Animation object
function Animation:Define(config)
	local anim = {}
	FenUI.Mixin(anim, AnimationMixin)
	anim:Init(config)
	return anim
end

--- Define an animation with keyframes
---@param config table Keyframe configuration
---@return table Animation object
function Animation:Keyframes(config)
	local anim = {}
	FenUI.Mixin(anim, AnimationMixin)

	local duration = config.duration or DEFAULTS.duration
	local easing = config.easing or DEFAULTS.easing

	local times = {}
	for k, v in pairs(config) do
		if type(k) == "number" then
			table.insert(times, k)
		end
	end
	table.sort(times)

	anim.isKeyframes = true
	anim.keyframes = {}
	for i, t in ipairs(times) do
		table.insert(anim.keyframes, {
			time = t,
			values = config[t],
		})
	end

	anim.duration = duration
	anim.easing = easing
	anim.smoothing = SMOOTHING_MAP[easing] or "OUT"

	return anim
end

-- Properties ApplyTransitions can animate, and the WoW animation type for each
local TRANSITION_TYPES = {
	alpha = "Alpha",
	scale = "Scale",
}

--- Apply property transitions to a frame
--- Supports alpha and scale; the setter takes an optional `instant` flag.
---@param frame Frame The target frame
---@param transitions table Transition configuration
function Animation:ApplyTransitions(frame, transitions)
	if not transitions then return end

	frame.fenUIAnims = frame.fenUIAnims or {}

	for prop, config in pairs(transitions) do
		local propName = prop:sub(1,1):upper() .. prop:sub(2)
		local setter = "Set" .. propName
		local getter = "Get" .. propName
		local animType = TRANSITION_TYPES[prop]

		if animType and frame[setter] and frame[getter] then
			local originalSetter = frame[setter]
			local isScale = animType == "Scale"
			frame.fenUIRawSetters = frame.fenUIRawSetters or {}
			frame.fenUIRawSetters[prop] = originalSetter

			-- One group per property, reused by every transition. Values are in
			-- animation space: absolute alpha, or a factor of the frame's scale
			-- (a Scale animation multiplies with the frame's own scale).
			local ag = frame:CreateAnimationGroup()
			local anim = ag:CreateAnimation(animType)
			anim:SetDuration(config.duration or DEFAULTS.duration)
			anim:SetSmoothing(SMOOTHING_MAP[config.easing or DEFAULTS.easing] or "OUT")
			frame.fenUIAnims["transition_" .. prop] = ag

			local fromValue, toValue, target = 1, 1, nil

			ag:SetScript("OnFinished", function()
				originalSetter(frame, target)
			end)

			frame[setter] = function(self, value, instant)
				-- The on-screen value, in animation space. The getter still returns
				-- the old value until a transition finishes.
				local current = isScale and 1 or self[getter](self)
				if ag:IsPlaying() then
					if value == target and not instant then return end -- already heading there
					current = fromValue + (toValue - fromValue) * anim:GetSmoothProgress()
					ag:Stop()
				end

				local goal = value
				if isScale then
					local base = self[getter](self)
					goal = base > 0 and value / base or nil
				end

				-- Apply directly when there's nothing to animate, or it wouldn't be seen
				-- (animations don't advance on hidden frames)
				if instant or not goal or not self:IsVisible() or math.abs(goal - current) < 0.001 then
					originalSetter(self, value)
					return
				end

				fromValue, toValue, target = current, goal, value
				if isScale then
					anim:SetScaleFrom(fromValue, fromValue)
					anim:SetScaleTo(toValue, toValue)
				else
					anim:SetFromAlpha(fromValue)
					anim:SetToAlpha(toValue)
				end
				ag:Play()
			end
		end
	end
end

--------------------------------------------------------------------------------
-- Animation Library Presets
--------------------------------------------------------------------------------

Animation.Presets = {
	fadeIn = Animation:Define({ from = { alpha = 0 }, to = { alpha = 1 }, duration = 0.2 }),
	fadeOut = Animation:Define({ from = { alpha = 1 }, to = { alpha = 0 }, duration = 0.2 }),
	scaleIn = Animation:Define({ from = { scale = 0.95 }, to = { scale = 1 }, duration = 0.15 }),
	scaleOut = Animation:Define({ from = { scale = 1 }, to = { scale = 0.95 }, duration = 0.15 }),
	slideUp = Animation:Define({ from = { offset = { x = 0, y = -20 } }, to = { offset = { x = 0, y = 0 } }, duration = 0.25 }),
	slideDown = Animation:Define({ from = { offset = { x = 0, y = 20 } }, to = { offset = { x = 0, y = 0 } }, duration = 0.25 }),
	bounce = Animation:Keyframes({
		[0] = { scale = 1 },
		[0.5] = { scale = 1.1 },
		[1] = { scale = 1 },
		duration = 0.3,
	}),
}
