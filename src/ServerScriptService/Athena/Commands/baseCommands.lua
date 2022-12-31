local baseAdmin = script.Name --TODO Replace this with the actual admin level
local showNotif = require(script.Parent.Parent.UI.AdminJoinModule)
local utils = require(script.Parent.Parent.Parent.CaterLibrary.Utils)



local basicCommands = {
	test = {
		CmdName = "test";
		Level = baseAdmin;
		Desc = "testing";
		Args = {};
		
		Function = function()
			print("test")
			return true
		end,
	},
	
	
	notif = {
		CmdName = "notif";
		Level = baseAdmin;
		Desc = "notif tester";
		Args = {};
		
		Function = function(player, args)
			if args[1] == nil then
				args[1] = player.Name
			end
			if args[1] == "me" then
				args[1] = player.Name
			end
			local showPlayer = utils.findPlayer(args[1])
			if showPlayer == false then
				return false
			end
			local title = args[2]
			local desc = args[3]
			local showTime = args[4]
			
			showNotif(showPlayer, title, desc, showTime)
			return true
		end,
	},
	
	kill = {
		CmdName = "kill",
		Level = baseAdmin;
		Desc = "kill a user",
		Args = {};
		
		Function = function(player, args)
			local arg = args[1]
			if arg == "me" then
				arg = player.Name
			end
			if arg == nil then
				arg = player.Name -- If there is no player set it to the player who ran it.
			end
			local ptk = utils.findPlayer(arg) -- Find the player
			if ptk == nil then -- If it doesn't find anything return false.
				return false
			end
			ptk.Character.Humanoid.Health = 0 -- Set the health of the player 0 to kill them
			return true -- Return true.
		end,
	},
	
	fly = {
		CmdName = "fly",
		Level = baseAdmin;
		Desc = "fly a user",
		Args = {};

		Function = function(plr, args)
			showNotif(plr, "Fly", "Fly is not yet implemented.", 5)
		end
	}
}
return basicCommands
