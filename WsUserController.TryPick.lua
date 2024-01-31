return function (self,d) 
local user = self.Entity
user.WsUser.ExclusiveAction = true
user.CurrentMap.DropPoolComponent:PickUp(user, d.DropId, 0, nil, user.TransformComponent.WorldPosition)
end