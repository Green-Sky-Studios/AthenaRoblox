--[[
Credits:
Auhor: Cater, MentoGames08
Date: 12/30/22
Description: Originally intended to serve as the main notify module, repurposed for specifically AdminJoinNotifications
]]

local show = {
	notif = function(player, title, desc, showtime)
		local notif = script.Parent.AdminJoinType:Clone()
		notif.Parent = player.PlayerGui
		notif.Notif:Play()
		notif.Outer.Inner.Title.Text = title or "Title!"
		notif.Outer.Inner.Msg.Text = desc or "Description!"
		notif.Enabled = true
		wait(showtime or 30)
		notif:destroy()
		return true
	end;

	prompt = function(player, title, desc, showtime)
		local prompt = script.Parent.Prompt:Clone()
		prompt.Parent = player.PlayerGui
		prompt.Outer.Inner.Title.Text = title or "Title!"
		prompt.Outer.Inner.Description.Text = desc or "Description!"
		prompt.Enabled = true
		wait(showtime or 30)
		prompt:destroy()
		return true
	end;
}

return show
