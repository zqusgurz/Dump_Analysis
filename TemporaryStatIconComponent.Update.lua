return function (self) 
local current = 0
local remain = 0
if (self.TotalDuration == 0) then
	current = 0
	remain = 0
else
	remain = self.Expire - _UtilLogic.ElapsedSeconds
	current = remain / self.TotalDuration
end

if (remain < 0) then remain = 0 end
if (current < 0) then current = 0 end
if (current > 1) then current = 1 end

self.Cooltime:SetValue(current)

if (remain > 60) then
	self.ItemNoSecond.Entity.Enable = false
	self.ItemNo.Entity.Enable = true
	self.ItemNo.Value = math.tointeger(remain / 60)
	self.ItemNo:Render()
	self:SetBlinkAnimation(false)
else
	local remainSec = math.tointeger(remain % 60)
	
	self.ItemNo.Entity.Enable = false
	self.ItemNoSecond.Entity.Enable = true
	self.ItemNoSecond.Value = remainSec
	self.ItemNoSecond:Render()
	if (remainSec < 1) then
		self:SetBlinkAnimation(true)
	else
		self:SetBlinkAnimation(false)
	end
end
end