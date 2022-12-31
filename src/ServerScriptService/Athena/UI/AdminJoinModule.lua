--[[
Credits:
Auhor: Cater, MentoGames08
Date: 12/30/22
Description: Originally intended to serve as the main notify module, repurposed for specifically AdminJoinNotifications
]]


local showNotif = function(player, title, desc, showTime)
	local notif = script.Parent.AdminJoinType:Clone()
	notif.Parent = player.PlayerGui
	notif.Notif:Play()
	notif.Outer.Inner.Title.Text = title or "Title!"
	notif.Outer.Inner.Msg.Text = desc or "Description!"
	notif.Enabled = true
	wait(showTime or 30)
	notif:destroy()
	return true
end

return showNotif
