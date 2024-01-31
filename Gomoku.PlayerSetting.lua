return function (self,on,force) 
local posi = {Vector3(-0.63, -0.8, 0), Vector3(0.63, -0.8, 0)}
local player = _UserService.LocalPlayer
if on then
	player.RigidbodyComponent.Enable = false
	player.StateComponent:ChangeState("IDLE")
	player.StateComponent.Enable = false
	player.TransformComponent.Position = posi[force]
	player.AvatarRendererComponent.SortingLayer = "Layer8"
	player.SpriteRendererComponent.SortingLayer = "Layer8"
	_CameraService:SwitchCameraTo(self.Entity.CameraComponent)
	

else
	player.RigidbodyComponent.Enable = true
	player.StateComponent.Enable = true
	_CameraService:SwitchCameraTo(player.CameraComponent)
end
end