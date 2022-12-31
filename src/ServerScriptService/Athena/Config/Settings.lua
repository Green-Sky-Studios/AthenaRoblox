--[[
Credits:
Author: Cater and Mento
Date: 12/30/22
Description: Settings for the bot to access to make it more dynamic and configurable.
]]


local adminSettings = {
	prefix = ";"; -- Set this to the default prefix
	batchkey = "|";
	seperatorKey = ", "; -- Set this to the seperator key to split arguments.
	trelloFunctionality = false;
	useranks = true;
	useDiscord = false;
	webhook = "";

	Ranks = {
		["Command Blacklist"] = {
			Level = 0; -- Set this to the moderator level
			Users = {};
			Name = "Command Blacklist";
		};
		
		["GSS Moderator"] = {
			Level = 350; -- Set this to the moderator level
			Users = {"group:12339933:2"};
			Name = "GSS Moderator";
		};
		["GSS Staff Manager"] = {
			Level = 400; -- Set this to the moderator level
			Users = {};
			Name = "GSS Staff Manager";
		};
		["GSS Developer"] = {
			Level = 500; -- Set this to the moderator level
			Users = {"group:12339933:2"};
			Name = "GSS Developer";
		};
		["GSS Executive"] = {
			Level = 950; -- Set this to the moderator level
			Users = {"group:14418566:2"};
			Name = "GSS Executive";
		};
	};	
}

return adminSettings
