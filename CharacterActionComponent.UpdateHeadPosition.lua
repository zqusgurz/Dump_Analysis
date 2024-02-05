return function (self,state) 
local head = self.Head
if (isvalid(head)) then
	if (state == "PRONE" or (self.Prone and state == "NORMAL_ATTACK")) then
		if (self.Entity.WsUserController:IsFacingLeft()) then
			head.TransformComponent.Position = Vector3(-0.23, 0.22, 0)
		else
			head.TransformComponent.Position = Vector3(0.23, 0.22, 0)
		end
	else
		head.TransformComponent.Position = Vector3(0, 0.50, 0)
	end
end
end