local baseAdmin = script.Name
local TS = game:GetService("TextService")
local Athena = script.Parent.Parent
local API = {}
for i, APIserv in pairs(Athena.API:GetChildren()) do
	API[APIserv.Name] = require(APIserv)
end

local msg = "Don't know what this does, putting this so roblox doesn't throw a fit."

local Commands = {

	Shutdown = {
		CmdName = "Shutdown",
		Level = baseAdmin,
		Desc = "This command shuts down the game with a given reason.",
		Args = { msg }, -- Message? Mento explain this please?
		Function = function(plr, Args)
			local filtered
			local success, errorMessage = pcall(function()
				filtered = TS:FilterStringAsync(Args[1], plr.UserId, Enum.TextFilterContext.PublicChat)
			end)
			if success then
				local reason = filtered:GetNonChatStringForBroadcastAsync() or "No reason provided."
				print("Shutdown by " .. plr.Name .. ": " .. reason)
				game.Players.PlayerAdded:Connect(function(p)
					p:Kick("Shutdown by " .. plr.Name .. ": " .. reason)
				end)
				for i, v in pairs(game.Players:GetPlayers()) do
					v:Kick("Shutdown by " .. plr.Name .. ": " .. reason)
				end
			else
				error(errorMessage)
			end
		end,
	},
}

return Commands
