return function (self,id,duration,stats) 
for i=1,#stats do
	self.StatToId[stats[i]] = id
end
local ts = nil
if (id < 0 or (id > 0 and _SkillMan:GetSkill(id))) then
	local icon = _ObjectPool:PickEx(self.IconPool, "PooledTemporaryStatIcon", "model://3ba5626b-b947-4390-8380-6ffbe8c56b9a", Vector3.zero, self.Entity, false)
	ts = icon.TemporaryStatIconComponent
	ts:SetData(id, duration, stats)
	ts:SetBlinkAnimation(false)
	icon.Enable = true
end
self:RemoveOverlappedIcon(id)
if (ts) then
	self.ActiveIcons[#self.ActiveIcons + 1] = ts
end
self:AdjustPosition()
end