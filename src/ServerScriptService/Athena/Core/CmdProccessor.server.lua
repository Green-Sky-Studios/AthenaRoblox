--[[
Credits:
Author: Cater
Date: 12/30/22
Description: Processes the chat message at which point it is sent to the command function to use
]]

local adminSettings = require(script.Parent.Parent.Config.Settings)
local prefix = adminSettings.prefix
local bk = adminSettings.batchkey
local sep = adminSettings.seperatorKey
local utils = require(script.Parent.Parent.Parent.CaterLibrary.Utils)
local Commands = require(script.Parent.Parent.Commands.Commands)
local showNotif = require(script.Parent.Parent.UI.AdminJoinModule)


local function handleCommands(player, message)
	local temp = message:split(bk) -- splits by batchkey
	for i,cmd in pairs(temp) do -- does every command in the table (from batch key split)
		
		if not utils.startsWith(cmd, prefix) then
			return false
		end
	
		cmd = cmd:sub(2)
	
		if cmd == "" then
			return false
		end
	
		local index = cmd:find(" ")
		local args
		if index ~= nil then
			args = cmd:sub(index + 1, -1)
			cmd = cmd:sub(1, index - 1)
		else
			args = ""
			cmd = cmd:lower()
		end
	
	

	
		-- local args = {}
	
		args = string.split(args, sep) -- not splitting
		
		if table.getn(args) == 1 and args[1] == "" then
			args = {}
		end

		local status = false
	
	
		for v,cmds in pairs(Commands) do
			if cmds.CmdName:lower() == cmd then
				status = cmds.Function(player,args)
			end
		end

		if status == nil then
			showNotif(player, "Command Error!", cmd.. " not found or failed to execute", 5)
		end

		if status == false then
			showNotif(player, "Command Error!", cmd.. " not found or failed to execute", 5)
		end

		if typeof(status) == "string" then
			showNotif(player, "Command Error!", status, 5)
		end
	
	end
end

game.Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(function(msg,ok)
		handleCommands(plr,msg)
	end)
end)
