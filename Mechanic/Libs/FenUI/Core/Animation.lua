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
function AnimationMixin:Play(frame, options)
	if not frame then return end
	
	options = options or {}
	local config = self.config
	
	-- Create or reuse AnimationGroup
	local animName = options.name or "default"
	frame.fenUIAnims = frame.fenUIAnims or {}
	local ag = frame.fenUIAnims[animName]
	
	if not ag then
		ag = frame:CreateAnimationGroup()
		frame.fenUIAnims[animName] = ag
	end
	
	-- Stop any running animations
	if ag:IsPlaying() then
		ag:Stop()
	end
	
	-- Recreate animations if group was previously used (WoW has no RemoveAnimation)
	if ag.isDirty then
		ag = frame:CreateAnimationGroup()
		frame.fenUIAnims[animName] = ag
	end
	ag.isDirty = true

	local function AddSegment(startVals, endVals, duration, order)
		-- Alpha
		if startVals.alpha ~= nil or endVals.alpha ~= nil then
			local anim = ag:CreateAnimation("Alpha")
			if startVals.alpha ~= nil then anim:SetFromAlpha(startVals.alpha) end
			if endVals.alpha ~= nil then anim:SetToAlpha(endVals.alpha) end
			anim:SetDuration(duration)
			anim:SetSmoothing(self.smoothing)
			anim:SetOrder(order)
		end
		
		-- Scale
		if startVals.scale ~= nil or endVals.scale ~= nil then
			local anim = ag:CreateAnimation("Scale")
			local from = startVals.scale
			local to = endVals.scale
			
			if from then
				if type(from) == "table" then anim:SetScaleFrom(from.x or 1, from.y or 1)
				else anim:SetScaleFrom(from, from) end
			end
			
			if to then
				if type(to) == "table" then anim:SetScaleTo(to.x or 1, to.y or 1)
				else anim:SetScaleTo(to, to) end
			end
			
			anim:SetDuration(duration)
			anim:SetSmoothing(self.smoothing)
			anim:SetOrder(order)
		end
		
		-- Translation
		if startVals.offset ~= nil or endVals.offset ~= nil then
			local anim = ag:CreateAnimation("Translation")
			local from = startVals.offset
			local to = endVals.offset
			
			-- Translation only supports a single target offset natively.
			-- It animates from the frame's current position to the specified offset.
			if to then
				anim:SetOffset(to.x or 0, to.y or 0)
			elseif from then
				-- If only 'from' is provided, we treat it as the target (relative movement)
				anim:SetOffset(from.x or 0, from.y or 0)
			end
			
			anim:SetDuration(duration)
			anim:SetSmoothing(self.smoothing)
			anim:SetOrder(order)
		end
	end

	if self.isKeyframes then
		for i = 1, #self.keyframes - 1 do
			local startK = self.keyframes[i]
			local endK = self.keyframes[i+1]
			local segmentDuration = (endK.time - startK.time) * self.duration
			AddSegment(startK.values, endK.values, segmentDuration, i)
		end
	else
		local from = config.from or {}
		local to = config.to or {}
		
		-- Also support direct property keys in config for simplicity
		if config.alpha and type(config.alpha) == "table" then
			from.alpha = from.alpha or config.alpha.from
			to.alpha = to.alpha or config.alpha.to
		end
		
		AddSegment(from, to, self.duration, 1)
	end
	
	-- Callbacks
	ag:SetScript("OnFinished", function()
		if options.onComplete then
			options.onComplete(frame)
		end
	end)
	
	ag.onCancel = options.onCancel
	
	if options.onStart then
		options.onStart(frame)
	end
	
	ag:Play()
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
		local originalOnComplete = options.onComplete
		
		options.onComplete = function(f)
			if originalOnComplete then originalOnComplete(f) end
			nextAnim:Play(f, options)
		end
		
		originalPlay(this, frame, options)
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

--- Apply property transitions to a frame
---@param frame Frame The target frame
---@param transitions table Transition configuration
function Animation:ApplyTransitions(frame, transitions)
	if not transitions then return end
	
	for prop, config in pairs(transitions) do
		local propName = prop:sub(1,1):upper() .. prop:sub(2)
		local setter = "Set" .. propName
		local getter = "Get" .. propName
		
		if frame[setter] and frame[getter] then
			local originalSetter = frame[setter]
			
			frame[setter] = function(self, value, instant)
				if instant then
					originalSetter(self, value)
					return
				end
				
				local currentValue = self[getter](self)
				if math.abs(currentValue - value) < 0.1 then return end
				
				local anim = Animation:Define({
					from = { [prop] = currentValue },
					to = { [prop] = value },
					duration = config.duration,
					easing = config.easing,
				})
				
				anim:Play(self, { 
					name = "transition_" .. prop,
					onComplete = function()
						originalSetter(self, value)
					end
				})
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
