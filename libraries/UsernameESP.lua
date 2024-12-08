--[[
  This script is compatible with Roblox games!
]]

local UsernameESP = {}

UsernameESP.apply = function ApplyESP(player : Player)
   if player.Character and player.Character:FindFirstChildOfClass'Humanoid' then
       player.Character.Humanoid.NameDisplayDistance = 9e9
       player.Character.Humanoid.NameOcclusion = "NoOcclusion"
       player.Character.Humanoid.HealthDisplayDistance = 9e9
       player.Character.Humanoid.HealthDisplayType = "AlwaysOn"
       player.Character.Humanoid.Health = player.Character.Humanoid.Health
   end
end

UsernameESP.remove = function ApplyESP(player : Player)
   if player.Character and player.Character:FindFirstChildOfClass'Humanoid' then
       player.Character.Humanoid.NameDisplayDistance = 100
       player.Character.Humanoid.NameOcclusion = "EnemyOcclusion"
       player.Character.Humanoid.HealthDisplayDistance = 50
       player.Character.Humanoid.HealthDisplayType = "WhenDamaged"
       player.Character.Humanoid.Health = player.Character.Humanoid.Health
   end
end

return UsernameESP
