-- UI/Shared/FrameResolver.lua
-- !Mechanic - Frame Path Resolver Utility (Phase 8)
--
-- Utilities for converting between string paths and frame references.

local ADDON_NAME, ns = ...
local FrameResolver = {}
ns.FrameResolver = FrameResolver

--- Resolve a string path to a frame reference.
--- Supports global names (e.g. "UIParent") and dot-notation (e.g. "PlayerFrame.health").
---@param path string The path to resolve
---@return Frame|nil frame The resolved frame or nil if not found
function FrameResolver:ResolvePath(path)
	if not path or path == "" then
		return nil
	end

	-- Split path by dots
	local parts = {}
	for part in string.gmatch(path, "([^%.]+)") do
		table.insert(parts, part)
	end

	if #parts == 0 then
		return nil
	end

	-- Start with global frame
	local current = _G[parts[1]]
	if not current then
		return nil
	end

	-- Traverse children/members
	for i = 2, #parts do
		if type(current) ~= "table" then
			return nil
		end
		current = current[parts[i]]
		if not current then
			return nil
		end
	end

	return (type(current) == "table" and current.GetObjectType) and current or nil
end

--- Get a string path for a frame reference.
--- Tries to find the most concise path starting from a global parent.
---@param frame Frame The frame reference
---@return string|nil path The path string or nil if it cannot be resolved
function FrameResolver:GetFramePath(frame)
	if not frame or type(frame) ~= "table" or not frame.GetObjectType then
		return nil
	end

	-- If it has a global name, return it
	local name = frame:GetName()
	if name then
		return name
	end

	-- If anonymous, try to traverse up to a named parent
	local parts = {}
	local current = frame
	while current do
		local currentName = current:GetName()
		if currentName then
			table.insert(parts, 1, currentName)
			return table.concat(parts, ".")
		end

		-- If no name, look for this frame in the parent's members
		local parent = current:GetParent()
		if parent then
			local found = false
			-- We can't easily iterate all members of a frame to find 'current'
			-- But many frames store children as members. We'll check common ones.
			for k, v in pairs(parent) do
				if v == current then
					table.insert(parts, 1, tostring(k))
					found = true
					break
				end
			end

			if not found then
				-- If not found in members, we can't build a reliable dot-path
				-- Fall back to index-based path if needed, but for now we'll just stop
				table.insert(parts, 1, "?")
				return table.concat(parts, ".")
			end
			current = parent
		else
			-- No parent and no name?
			table.insert(parts, 1, "<anonymous>")
			return table.concat(parts, ".")
		end
	end

	return nil
end

--- Get the children of a frame for the tree browser.
---@param frame Frame The parent frame
---@return table children Array of {key, text, frame}
function FrameResolver:GetChildren(frame)
	local children = {}
	if not frame or not frame.GetChildren then
		return children
	end

	local childList = { frame:GetChildren() }
	for i, child in ipairs(childList) do
		local name = child:GetName()
		local key = name or (self:GetFramePath(child) or ("child" .. i))
		table.insert(children, {
			key = key,
			text = name or ("<anonymous " .. child:GetObjectType() .. ">"),
			frame = child,
		})
	end

	return children
end

return FrameResolver

