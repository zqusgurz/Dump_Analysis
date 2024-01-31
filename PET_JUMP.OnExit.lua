return function (self) 
local pet = self.ParentComponent.Entity
pet.MovementComponent:Stop()
pet.PetComponent.InputX = 0
end