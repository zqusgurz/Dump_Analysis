return function (self,remain) 
local old_remain = self._T.Remain

local hour = remain // 3600
local minute = remain % 3600 // 60
local second = remain % 60 // 1

local old_hour = old_remain // 3600
local old_minute = old_remain % 3600 // 60

local hourTimer = hour > 0
local old_HourTimer = old_hour > 0
if (old_HourTimer and hourTimer and hour == old_hour and minute == old_minute) then
	-- NOTE: 업데이트 필요 없음. 시간-분 타이머에서 시간과 분이 이전 상태와 같음.
	return
end

local invalidateBackground = old_remain < 0 or old_HourTimer ~= hourTimer
if (invalidateBackground) then
	self.Entity:GetChildByName("BackgroundHour").Enable = hourTimer
	self.Entity:GetChildByName("BackgroundMinute").Enable = not hourTimer
end

local x1 = 0
local x2 = 0
local x3 = 0
local x4 = 0
if (hourTimer) then
	x1 = hour // 10
	x2 = hour % 10 // 1
	x3 = minute // 10
	x4 = minute % 10 // 1
else
	x1 = minute // 10
	x2 = minute % 10 // 1
	x3 = second // 10
	x4 = second % 10 // 1
end
local function enableDigit(name, digit)
	local digitName = tostring(math.floor(digit))
	local children = self.Entity:GetChildByName(name).Children
    for _, child in pairs(children) do
        child.Enable = child.Name == digitName
    end
end
enableDigit("X1", x1 ~= 0 and x1 or -1)
enableDigit("X2", x2)
enableDigit("X3", x3)
enableDigit("X4", x4)
end