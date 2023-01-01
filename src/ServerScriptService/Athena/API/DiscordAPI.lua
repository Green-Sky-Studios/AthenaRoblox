--[[
    Author: Cater
    Date: 12/31/22
    Description: Code to interact with the discord API
]]

local http = game:GetService("HttpService")

local adminsettings = require(game.ServerScriptService.Athena.Config.Settings)
local webhook = require(script.Parent.Private).webhook

local discordAPI = {
commandSend = function (player, cmd, args)
    args = table.concat(args, " ")
    local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    local data = {
        ["avatar-url"] = "https://images-ext-2.discordapp.net/external/GoD8rrzRKes9hYyQrSzZuBtqAbDjeTkD9F15TJmURlo/https/cdn.discordapp.com/avatars/965076506005082153/8c3cfe99872b8f7e2b0665b4881e6d4a.webp";
        ["embeds"] = {
            {
                ["author"] = {
                    ["name"] = player.name;
                    ["icon_url"] = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.userId .. "&width=420&height=420&format=png"
                };
                ["title"] = "Command Ran: " .. cmd,
                ["description"] = player.name .. " ran the following command in " .. GameName.. "```" .. cmd .. " " .. args .. "```";
                ["color"] = tonumber(0xFFA500);
                ["url"] = "https://www.roblox.com/users/" .. player.userId .. "/profile";
                ["footer"] = {
                    ["text"] = "Athena Admin"
                };
                ["timestamp"] = os.date("%Y-%m-%dT%H:%M:%S.000Z", os.time());
                ["thumbnail"] = {
                    ["url"] = "https://images-ext-2.discordapp.net/external/GoD8rrzRKes9hYyQrSzZuBtqAbDjeTkD9F15TJmURlo/https/cdn.discordapp.com/avatars/965076506005082153/8c3cfe99872b8f7e2b0665b4881e6d4a.webp";
                }
            };
        }
    }
    local finalData = http:JSONEncode(data)
    http:PostAsync(webhook, finalData) 
    end
}


return discordAPI