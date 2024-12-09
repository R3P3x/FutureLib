--[[
  This script is compatible with Roblox games!

  Also its made by me :D
]]

local ESP = {}

local settings = {
    Color = Color3.fromRGB(255, 0, 0),
    Size = 15,
    Transparency = 1,
    AutoScale = true
}

local space = game:GetService("Workspace")
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local camera = space.CurrentCamera

local activeESP = {}

local function NewText(color, size, transparency)
    local text = Drawing.new("Text")
    text.Visible = false
    text.Text = ""
    text.Position = Vector2.new(0, 0)
    text.Color = color
    text.Size = size
    text.Center = true
    text.Transparency = transparency
    return text
end

local function SetVisibility(state, lib)
    for _, instance in pairs(lib) do
        instance.Visible = state
    end
end

local function SetSize(size, lib)
    for _, instance in pairs(lib) do
        instance.Size = size
    end
end

local function CreatePlayerESP(player, library)
    local function UpdateESP()
        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            if player.Character
                and player.Character:FindFirstChild("Humanoid")
                and player.Character:FindFirstChild("HumanoidRootPart")
                and player.Name ~= localPlayer.Name
                and player.Character.Humanoid.Health > 0
            then
                local rootPartPosition, onScreen = camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
                if onScreen then
                    library.name.Text = player.Name
                    library.name.Position = Vector2.new(rootPartPosition.X, rootPartPosition.Y)
                    if settings.AutoScale then
                        local distance = (camera.CFrame.Position - player.Character.HumanoidRootPart.Position).Magnitude
                        local textSize = math.clamp(1 / distance * 1000, 2, 30)
                        SetSize(textSize, library)
                    else
                        SetSize(settings.Size, library)
                    end
                    SetVisibility(true, library)
                else
                    SetVisibility(false, library)
                end
            else
                SetVisibility(false, library)
                if not players:FindFirstChild(player.Name) then
                    connection:Disconnect()
                end
            end
        end)

        activeESP[player] = {connection = connection, library = library}
    end

    coroutine.wrap(UpdateESP)()
end

function ESP.apply(customSettings, target)
    if customSettings then
        for key, value in pairs(customSettings) do
            settings[key] = value
        end
    end

    local function applyToPlayer(player)
        if activeESP[player] then
            ESP.remove(player) -- Remove existing ESP for this player to avoid duplication
        end

        local library = {
            name = NewText(settings.Color, settings.Size, settings.Transparency)
        }
        CreatePlayerESP(player, library)
    end

    if target then
        if typeof(target) == "Instance" and target:IsA("Player") then
            -- Apply to a single player
            applyToPlayer(target)
        elseif typeof(target) == "table" then
            -- Apply to a list of players
            for _, player in ipairs(target) do
                if typeof(player) == "Instance" and player:IsA("Player") then
                    applyToPlayer(player)
                end
            end
        end
    else
        -- Apply to all players
        for _, player in ipairs(players:GetPlayers()) do
            if player ~= localPlayer then
                applyToPlayer(player)
            end
        end

        players.PlayerAdded:Connect(function(newPlayer)
            if newPlayer ~= localPlayer then
                applyToPlayer(newPlayer)
            end
        end)
    end
end

function ESP.remove(target)
    local function removeFromPlayer(player)
        if activeESP[player] then
            local data = activeESP[player]
            if data.connection then
                data.connection:Disconnect()
            end
            if data.library then
                for _, text in pairs(data.library) do
                    if typeof(text) == "Instance" or typeof(text) == "userdata" then
                        text:Remove()
                    end
                end
            end
            activeESP[player] = nil
        end
    end

    if target then
        if typeof(target) == "Instance" and target:IsA("Player") then
            -- Remove from a single player
            removeFromPlayer(target)
        elseif typeof(target) == "table" then
            -- Remove from a list of players
            for _, player in ipairs(target) do
                if typeof(player) == "Instance" and player:IsA("Player") then
                    removeFromPlayer(player)
                end
            end
        end
    else
        -- Remove from all players
        for player, _ in pairs(activeESP) do
            removeFromPlayer(player)
        end
    end
end

return ESP
