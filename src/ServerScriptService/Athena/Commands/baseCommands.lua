local adminSetting = require(script.Parent.Parent.Config.Settings) --TODO Replace this with the actual admin level
local show = require(script.Parent.Parent.UI.AdminJoinModule)
local utils = require(script.Parent.Parent.Parent.Cateriberary.Utils)

local baseAdmin = adminSetting.Ranks["GSS Moderator"].Level



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
			
			show.notif(showPlayer, title, desc, showTime)
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
			show.notif(plr, "Fly", "Fly is not yet implemented.", 5)
			return true
		end
	},

	errcmd = {
		CmdName = "errcmd",
		Level = baseAdmin;
		Desc = "error command",
		Args = {};

		Function = function(plr, args)
			return "This is an error command"
		end
	},

	showprompt = {
		CmdName = "showprompt",
		Level = baseAdmin;
		Desc = "show a prompt",
		Args = {};

		Function = function(player, args)
			local plr = args[1]
			if plr == "me" then
				plr = player
			end
			if plr == nil then
				plr = player
			end
			if typeof(plr) == "string" then
				plr = utils.findPlayer(plr)
			end
			local title = args[2]
			local desc = args[3]
			local showTime = args[4] or 10
			show.prompt(plr, title, desc, showTime)
			return true	
		end
	},
	highCommand = {
		CmdName = "highCommand", -- This is to test the command level system
		Level = 1000;
		Desc = "high command",
		Args = {};

		Function = function(plr, args)
			print("How did you get this command?")
		end
	}
	
}
return basicCommands
