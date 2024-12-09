--[[
  This script is compatible with Roblox games!

  This script is made by me yesyes!
]]


local highlightService = {}

local DEFAULT_COLOR = Color3.new(1, 1, 1)

function highlightService.highlight(BasePart, color)
    if BasePart == nil then return end
    local fillColor
    if color then
        fillColor = color
    else
        fillColor = DEFAULT_COLOR
    end

    local hl = Instance.new("Highlight")
    hl.Name = "highlightServiceHighlight"
    hl.FillColor = fillColor
    hl.FillTransparency = 0.7
    hl.OutlineColor = Color3.new(0, 0, 0)
    hl.OutlineTransparency = 0
    hl.Enabled = true

    if BasePart:IsA("BasePart") then
        hl.Parent = BasePart
    elseif BasePart:IsA("Table") then
        for _, part in BasePart do
            local hlC = hl:Clone()
            hlC.Parent = part
        end
    else
        warn("Invalid instance argument in highlight function!")
    end
end

function highlightService.remove(BasePart)
    if BasePart == nil then return end
    if BasePart:IsA("BasePart") then
        local hl = BasePart:FindFirstDescendant("highlightServiceHighlight")
        if hl then hl:Destroy() end
    elseif BasePart:IsA("Table") then
        for _, part in BasePart do
            local hl = BasePart:FindFirstDescendant("highlightServiceHighlight")
            if hl then hl:Destroy() end
        end
    end
end

return highlightService
