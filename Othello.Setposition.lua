return function (self,player,force) 
player.RigidbodyComponent.Enable = false
if force == 1 then
	player.TransformComponent.Position = Vector3(-2.2, -1, 0)
else
	player.TransformComponent.Position = Vector3(2.2, -1, 0)
end
player.StateComponent:ChangeState("IDLE")
player.StateComponent.Enable = false
player.AvatarRendererComponent.SortingLayer = "Layer8"
player.SpriteRendererComponent.SortingLayer = "Layer8"
end