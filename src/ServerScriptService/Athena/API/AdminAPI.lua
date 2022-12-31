--[[
Credits:
Author: Mento
Date: 12/30/22
Description: i am required to put this here, simple table of admin related functions
]]

local Athena = script.Parent.Parent
local Admin = Athena.Core.Admin
local UI = Athena.UI


local API = {}
API["GetInGameAdmins"] = function()
	local temp = require(Admin.AdminSetup)
	print(temp)
end
return API