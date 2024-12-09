--[[
  This script is compatible with Roblox games!

  Also its made by me :D
]]

local ESP = {}

ESP.PlayerESP = {}

function ESP.apply(arg1, target)
    if target == nil then
        for _, player in pairs(game.Players:GetPlayers()) do
            ESP.apply(arg1, player)
        end
        return
    end

    if type(target) == "table" then
        for _, player in pairs(target) do
            ESP.apply(arg1, player)
        end
        return
    end

    local color = arg1[1] or Color3.fromRGB(255, 255, 255)
    local size = arg1[2] or 16
    local transparency = arg1[3] or 0
    local autoScale = arg1[4] or true

    if ESP.PlayerESP[target] then
        return
    end

    local nameTag = Instance.new("BillboardGui")
    nameTag.Adornee = target.Character:WaitForChild("Head")
    nameTag.Parent = target.Character:WaitForChild("Head")
    nameTag.Size = UDim2.new(0, 200, 0, 50)
    nameTag.StudsOffset = Vector3.new(0, 2, 0)
    nameTag.AlwaysOnTop = true
    nameTag.Name = "NameESP"

    local nameText = Instance.new("TextLabel")
    nameText.Parent = nameTag
    nameText.Text = target.Name
    nameText.Size = UDim2.new(1, 0, 1, 0)
    nameText.TextColor3 = color
    nameText.TextSize = size
    nameText.TextTransparency = transparency
    nameText.BackgroundTransparency = 1

    ESP.PlayerESP[target] = nameTag
end


function ESP.remove(target)
    if target == nil then
        for _, player in pairs(game.Players:GetPlayers()) do
            ESP.remove(player)
        end
        return
    end

    if type(target) == "table" then
        for _, player in pairs(target) do
            ESP.remove(player)
        end
        return
    end

    if ESP.PlayerESP[target] then
        local nameTag = ESP.PlayerESP[target]
        nameTag:Destroy()
        ESP.PlayerESP[target] = nil
    end
end

return ESP

