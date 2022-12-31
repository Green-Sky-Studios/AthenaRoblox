--[[
Credits:
Author: Mento
Date: 12/30/22
Description: This system enables us to detect when an administrator (pre-defined in Config.Settings) joins, granting them
\\\\\\\\\\\\ their respective admin level. Do not tamper with this script.
]]

-- i hate long documentation >:C

local InGameAdmins = {} -- table of in game admins, can be required

local Athena = script.Parent.Parent.Parent -- basic vars
local Settings = require(Athena.Config.Settings)
local Ranks = Settings["Ranks"]
local UI = Athena.UI
local Notifier = require(UI.AdminJoinModule)

game.Players.PlayerAdded:Connect(function(plr)
	local temp = {} -- temporary table to store all elligable ranks the user can be
	local AdminLvl = nil
	for i,rank in pairs(Ranks) do
		for _,req in pairs(rank["Users"]) do
			local strg = string.split(req,":") -- sifts through our custom "table" made in settings
			if strg[1]:lower() == "group" then
				--GROUP--
				if plr:GetRankInGroup(tonumber(strg[2])) >= tonumber(strg[3]) then -- gets group id/rank from settings
					table.insert(temp,rank["Level"])	-- adds to list, gets sorted to highest later
				end
				
			elseif strg[1]:lower() == "plrid" then
				--PLAYERID--
				if plr.UserId == strg[2] then
					table.insert(temp,rank["Level"])
				end
			end
		end
	end
	table.sort(temp,function(a,b) return a>b end) -- sorts temp table (admin ranks), highest is set to their level
	InGameAdmins[plr] = temp[1] --admin set
	for i,rank in pairs(Ranks) do
		if rank["Level"] == temp[1] then
			AdminLvl = rank["Name"]
		end
	end
	local wt = (10-plr:GetNetworkPing())*0.5
	wait(wt)
	Notifier(plr,AdminLvl.." ("..temp[1]..")","Athena Pre-Alpha (V0.01) loaded. Welcome back "..plr.DisplayName..".",10)
end)

return InGameAdmins -- in game admins table can be returned by any script that requires it