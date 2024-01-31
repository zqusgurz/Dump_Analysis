return function (self,b) 
self.Entity.TriggerComponent.Enable = b
self.Entity.WsUserController.Enable = b
self.Entity.MovementComponent.Enable = b
self.Entity.RigidbodyComponent.Enable = b
end