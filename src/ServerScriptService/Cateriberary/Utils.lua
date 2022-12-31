-- Type: ModuleScript

--[[
	Credits:
		Author: Cater
		Date: 12/31/22

	Documentation:

	startsWith(str, start) -- Checks to see if a string starts with another string
		str: The string to check : string
		start: The string to check against : string
		returns: boolean

	endsWith(str, ends) -- Checks to see if a  string ends with another string
		str: The string to check : string
		ends: The string to check against : string
		returns: boolean

	findPlayer(name) -- Finds a player by name or display name
		name: The name or display name of the player : string
		returns: Player or if the player isn't found returns false
]]

local utils = {
	startsWith = function(str, start) -- Checks to see if a string starts with another string
		local result = true

		str = str:split("")
		start = start:split("")

		for i = 1, table.getn(start), 1 do
			if str[i] ~= start[i] then
				result = false
			end
		end
		return result
	end,

	endsWith = function(str, ends) -- Checks to see if a  string ends with another string
		local result = true
		str = string.reverse(str)
		str = str:split("")
		ends = string.reverse(ends)
		ends = ends:split("")

		for i = 1, table.getn(ends), 1 do
			if str[i] ~= ends[i] then
				result = false
			end
		end
		return result
	end,

	findPlayer = function(name)

		if name == nil then
			return false
		end
		
		local players = game:GetService("Players"):GetPlayers()

		for i, v in pairs(players) do
			if v.Name:lower():sub(1, #name) == name:lower() then
				return v
			else -- If the player isn't found, check the display name
				if v.DisplayName:lower():sub(1, #name) == name:lower() then
					return v
				end
			end
		end
		return false
	end,
}

return utils
