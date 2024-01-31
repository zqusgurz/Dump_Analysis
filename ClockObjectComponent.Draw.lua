return function (self,_serverTime) 
---@type DateTime
local serverTime = _serverTime
local serverLocalTime = _UtilLogic:GetLocalTimeFrom(serverTime)

local ampm = serverLocalTime.Hour >= 12
local halfhour = serverLocalTime.Hour % 12
if (ampm and halfhour == 0) then
	halfhour += 12
end
self.Entity:GetChildByName("AM").Enable = not ampm
self.Entity:GetChildByName("PM").Enable = ampm
self.Entity:GetChildByName("Colon").SpriteRendererComponent.Color.a = serverLocalTime.Second % 2 == 0 and 1 or 0.4

local x1 = halfhour // 10
local x2 = halfhour % 10 // 1
local x3 = serverLocalTime.Minute // 10
local x4 = serverLocalTime.Minute % 10 // 1
local function enableDigit(name, digit)
	local digitName = tostring(math.floor(digit))
	local children = self.Entity:GetChildByName(name).Children
    for _, child in pairs(children) do
        child.Enable = child.Name == digitName
    end
end
enableDigit("X1", x1)
enableDigit("X2", x2)
enableDigit("X3", x3)
enableDigit("X4", x4)
end