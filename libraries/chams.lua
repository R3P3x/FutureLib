--[[
  This script is compatible with Roblox games!

  This script is made by me! big epic
]]

local chams = {}

local DEFAULT_COLOR = Color3.new(1, 1, 1)

local playerConnections = {}

function chams.apply(plr, transparency, outlineTransparency, colorOverwrite)
    -- Define function to apply highlights
    local function applyToCharacter(character)
        -- Prevent multiple Highlights on the same character
        for _, child in ipairs(character:GetChildren()) do
            if child:IsA("Highlight") then
                child:Destroy()
            end
        end

        -- Set up the new Highlight
        local fillColor = colorOverwrite or (plr.Team and plr.Team.TeamColor.Color or DEFAULT_COLOR)

        local hl = Instance.new("Highlight")
        hl.FillColor = fillColor
        hl.FillTransparency = transparency or 0.5
        hl.OutlineColor = Color3.new(0, 0, 0)
        hl.OutlineTransparency = outlineTransparency or 0
        hl.Enabled = true
        hl.Parent = character
    end

    -- Disconnect existing connections
    if playerConnections[plr] then
        playerConnections[plr]:Disconnect()
    end

    -- Set up a new connection for character appearance changes
    local connection
    connection = plr.CharacterAppearanceLoaded:Connect(function(character)
        -- Delay slightly to allow character to load fully
        task.wait(0.5)
        applyToCharacter(character)
    end)

    playerConnections[plr] = connection

    -- Apply immediately if the character exists
    if plr.Character then
        applyToCharacter(plr.Character)
    end
end

function chams.remove(plr)
    -- Safely remove Highlights from character
    if plr.Character then
        for _, child in ipairs(plr.Character:GetChildren()) do
            if child:IsA("Highlight") then
                pcall(function()
                    child:Destroy()
                end)
            end
        end
    end

    -- Disconnect and clean up connections
    if playerConnections[plr] then
        playerConnections[plr]:Disconnect()
        playerConnections[plr] = nil
    end
end

return chams




--[[
local chams = {}

local DEFAULT_COLOR = Color3.new(1, 1, 1)

local playerConnections = {}

function chams.apply(plr, transparency, outlineTransparency, colorOverwrite)
    local function applyToCharacter(character)
        local fillColor
        if colorOverwrite then
            fillColor = colorOverwrite
        else
            fillColor = plr.Team and plr.Team.TeamColor.Color or DEFAULT_COLOR
        end

        local hl = Instance.new("Highlight")
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

function chams.remove(plr)
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

]]
