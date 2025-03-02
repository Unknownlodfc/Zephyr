local textChatService = game:GetService("TextChatService")

local playerNameToCustomize = "0zephyr_x0"
local customPrefix = "[Dick]"
local customColor = "#00ffee"
local useCustomColor = true

textChatService.OnIncomingMessage = function(message: TextChatMessage)	
	local properties = Instance.new("TextChatMessageProperties")
	
	if message.TextSource then		
		local player = game:GetService("Players"):GetPlayerByUserId(message.TextSource.UserId)
		
		if player and player.Name == playerNameToCustomize then			
			if useCustomColor then
				properties.PrefixText = "<font color='" .. customColor .. "'>" .. customPrefix .. "</font> " .. message.PrefixText
			else
				properties.PrefixText = customPrefix .. " " .. message.PrefixText
			end
		end		
	end	
	return properties	
end
