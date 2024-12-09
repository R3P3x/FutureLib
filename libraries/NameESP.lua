--[[
  This script is compatible with Roblox games!

  Also its made by me :D
]]

local ESP = {}

-- Store references to the ESPs for each player
ESP.PlayerESP = {}

function ESP.apply(customSettings, target)
    -- If no target, apply to all players
    if target == nil then
        for _, player in pairs(game.Players:GetPlayers()) do
            ESP.apply(customSettings, player)
        end
        return
    end

    -- Handle the specific player or players
    if type(target) == "table" then
        for _, player in pairs(target) do
            ESP.apply(customSettings, player)
        end
        return
    end

    -- If the ESP already exists for this player, do nothing
    if ESP.PlayerESP[target] then
        return
    end

    -- Create the ESP for the player
    local nameTag = Instance.new("BillboardGui")
    nameTag.Adornee = target.Character:WaitForChild("Head")
    nameTag.Parent = target.Character:WaitForChild("Head")
    nameTag.Size = UDim2.new(0, 200, 0, 50)
    nameTag.StudsOffset = Vector3.new(0, 2, 0)
    nameTag.AlwaysOnTop = true
    nameTag.Name = "NameESP"

    -- Create the text label for the name
    local nameText = Instance.new("TextLabel")
    nameText.Parent = nameTag
    nameText.Text = target.Name
    nameText.Size = UDim2.new(1, 0, 1, 0)
    nameText.TextColor3 = customSettings and customSettings.Color or Color3.fromRGB(255, 255, 255)
    nameText.TextSize = customSettings and customSettings.Size or 16
    nameText.TextTransparency = customSettings and customSettings.Transparency or 0
    nameText.BackgroundTransparency = 1

    -- Store the created ESP for later removal
    ESP.PlayerESP[target] = nameTag
end

function ESP.remove(target)
    -- If no target, remove from all players
    if target == nil then
        for _, player in pairs(game.Players:GetPlayers()) do
            ESP.remove(player)
        end
        return
    end

    -- Handle the specific player or players
    if type(target) == "table" then
        for _, player in pairs(target) do
            ESP.remove(player)
        end
        return
    end

    -- Check if the ESP exists for this player
    if ESP.PlayerESP[target] then
        local nameTag = ESP.PlayerESP[target]
        nameTag:Destroy()
        ESP.PlayerESP[target] = nil
    end
end

return ESP

