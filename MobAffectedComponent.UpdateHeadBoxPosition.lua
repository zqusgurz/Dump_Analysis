return function (self,state) 
local headGroup = self.HeadGroup
if (not headGroup) then
	return
end

local mobComponent = self.Entity.MobComponent
if (state == "IDLE") then
	if (mobComponent.Fly) then
		state = "FLY"
	end
end
local ani = _MobAction.StateToPropertyAnimation[state]
if (ani) then
	local template = mobComponent:GetTemplate()
	local action = template.Actions[ani]
	if (not action) then
		return
	end
	---@type MobActionFrameData
	local actionFrame = action[1]
	if (not actionFrame) then
		return
	end
	local head = actionFrame.Head
	if (head.x == 0 and head.y == 0) then
		self.CurrentHeadPosBase = Vector3(0, -actionFrame.Lt.y / 100, 0)
		headGroup.TransformComponent.Position = self.CurrentHeadPosBase:Clone()
	else
		self.CurrentHeadPosBase = actionFrame.Head:ToVector3()
		self:UpdateHeadPositionFlipX()
	end
end
end