hook.Add("InitPostEntity", "removeChatBubble", function()
    hook.Remove("StartChat", "StartChatIndicator")
    hook.Remove("FinishChat", "EndChatIndicator")
end)