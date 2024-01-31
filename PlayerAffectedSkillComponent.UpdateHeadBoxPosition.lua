return function (self,state) 
local headGroup = self.HeadGroup
if (not headGroup) then
	return
end
local bodyGroup = self.BodyGroup
local centerGroup = self.CenterGroup

local u = self.Entity
if (state == "PRONE" or (u.CharacterActionComponent.Prone and state == "NORMAL_ATTACK")) then
	if (self.Entity.WsUserController:IsFacingLeft()) then
		headGroup.TransformComponent.Position = Vector3(-0.23, 0.22, 0)
		bodyGroup.TransformComponent.Position = Vector3(0, 0.31 / 2, 0)
		centerGroup.TransformComponent.Position = Vector3(-0.02, 0.23, 0)
	else
		headGroup.TransformComponent.Position = Vector3(0.23, 0.22, 0)
		bodyGroup.TransformComponent.Position = Vector3(0, 0.31 / 2, 0)
		centerGroup.TransformComponent.Position = Vector3(0.02, 0.23, 0)
	end
else
	if (self.Entity.WsUserController:IsFacingLeft()) then
		headGroup.TransformComponent.Position = Vector3(-0.06, 0.50, 0)
		bodyGroup.TransformComponent.Position = Vector3(0, 0.65 / 2, 0)
		centerGroup.TransformComponent.Position = Vector3(-0.02, 0.4, 0)
	else
		headGroup.TransformComponent.Position = Vector3(0.06, 0.50, 0)
		bodyGroup.TransformComponent.Position = Vector3(0, 0.65 / 2, 0)
		centerGroup.TransformComponent.Position = Vector3(0.02, 0.4, 0)
	end
end
end