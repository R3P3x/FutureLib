local function tobecreated()
  warn("libraries set to tobecreated are libraries that are planned/confirmed to be added in the future but i dont have the time to do it yet, if you see this warn in console it means you called a lib that hasnt been added yet.")
end

local lib = {}

lib.ESP = {}

lib.ESP.UsernameESP = require(game:HttpGet(https://raw.githubusercontent.com/R3P3x/FutureLib/refs/heads/main/libraries/UsernameESP.lua))

lib.Notification = {}

lib.Notification.AbyssNotifications = require(game:HttpGet(https://raw.githubusercontent.com/R3P3x/FutureLib/refs/heads/main/libraries/abyssNotifications.lua))

lib.UI = {}

lib.UI.Fluent = require(game:HttpGet(https://raw.githubusercontent.com/R3P3x/FutureLib/refs/heads/main/libraries/Fluent.lua))

lib.UI.0x37 = require(game:HttpGet(https://raw.githubusercontent.com/R3P3x/FutureLib/refs/heads/main/libraries/0x37.lua))

return lib
