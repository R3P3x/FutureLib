--[[
  This script is compatible with Roblox games!

  This script is made by me! big epic
]]

local chams = {}

local DEFAULT_COLOR = Color3.new(1, 1, 1)

local playerConnections = {}

chams.apply = function(plr : Player, transparency, outlineTransparency, colorOverwrite)
    local function applyToCharacter(character)
        --chams.remove(plr)

        local fillColor
        if colorOverwrite then
            fillColor = colorOverwrite
        else
            fillColor = plr.Team and plr.Team.TeamColor.Color or DEFAULT_COLOR
        end

        local hl = Instance.new("Highlight")
        hl.Adornee = character
        hl.FillColor = fillColor
        hl.FillTransparency = transparency
        hl.OutlineColor = Color3.new(0, 0, 0)
        hl.OutlineTransparency = outlineTransparency
        hl.Enabled = true
        hl.Parent = character
    end

    if playerConnections[plr] then
        playerConnections[plr]:Disconnect()
    end

    local connection
    connection = plr.CharacterAppearanceLoaded:Connect(function(character)
        applyToCharacter(character)
    end)

    playerConnections[plr] = connection

    if plr.Character then
        applyToCharacter(plr.Character)
    end
end

chams.remove = function(plr : Player)
    if plr.Character then
        for _, child in ipairs(plr.Character:GetChildren()) do
            if child:IsA("Highlight") then
                child:Destroy()
            end
        end
    end

    if playerConnections[plr] then
        playerConnections[plr]:Disconnect()
        playerConnections[plr] = nil
    end
end

return chams

