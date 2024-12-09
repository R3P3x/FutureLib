--[[
  Library loadstring: require(game:HttpGet("https://raw.githubusercontent.com/R3P3x/FutureLib/refs/heads/main/main.lua"))
]]

local lib = {}

lib.ESP = {}

lib.ESP.UsernameESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/R3P3x/FutureLib/refs/heads/main/libraries/UsernameESP.lua"))()

lib.ESP.NameESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/R3P3x/FutureLib/refs/heads/main/libraries/NameESP.lua"))()

lib.ESP.Chams = loadstring(game:HttpGet("https://raw.githubusercontent.com/R3P3x/FutureLib/refs/heads/main/libraries/chams.lua"))()

lib.Notification = {}

lib.Notification.AbyssNotifications = loadstring(game:HttpGet("https://raw.githubusercontent.com/R3P3x/FutureLib/refs/heads/main/libraries/abyssNotifications.lua"))()

lib.Notification.unnamedbuildinrobloxnotificationsbutmadeeasy = "This will be made lator yesyes"

lib.UI = {}

lib.UI.Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/R3P3x/FutureLib/refs/heads/main/libraries/Fluent.lua"))()

lib.UI["0x37"] = loadstring(game:HttpGet("https://raw.githubusercontent.com/R3P3x/FutureLib/refs/heads/main/libraries/0x37.lua"))()

return lib
