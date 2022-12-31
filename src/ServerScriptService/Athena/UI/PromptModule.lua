local showPrompt = function(player, title, desc, showTime)
    local prompt = script.Parent.Prompt:Clone()
    prompt.Parent = player.PlayerGui
    -- prompt.PromptSound:Play() -- Unused
    prompt.Outer.Inner.Title.Text = title or "Title!"
    prompt.Outer.Inner.Description.Text = desc or "Description!"
    prompt.Enabled = true
    wait(showTime or 30)
    prompt:destroy()
    return true
end

return showPrompt