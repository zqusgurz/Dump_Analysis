return function (self,id,duration,stats) 
self.Id = id
self.Expire = _UtilLogic.ElapsedSeconds + duration
self.TotalDuration = duration
self.NotCanceled = _UserSkillLogic:IsNotCanceled(id)
self.Stats = {}
for i=1,#stats do
	self.Stats[i] = stats[i]
end
if (id < 0) then
	local info = _Items:GetItemInfo(-id)
	self.Icon.ImageRUID = info.iconRaw
	_EntityUtils:SetRectSizeUIEntitySafelyEx(self.Icon.Entity, info.iconRawSize.x, info.iconRawSize.y)
else
	local skill = _SkillMan:GetSkill(id)
	self.Icon.ImageRUID = skill.Icon
	_EntityUtils:SetRectSizeUIEntitySafelyEx(self.Icon.Entity, 32, 32)
end
self.Entity.CanvasGroupComponent.GroupAlpha = 1
self:SetBlinkAnimation(false)
self:Update()
end