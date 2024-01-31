return function (self,state) 
local oc, os = _CharacterActionLogic:GetBodyRect(self.Prone or state == "PRONE")
self.Entity.TriggerComponent.ColliderOffset = oc
self.Entity.TriggerComponent.BoxSize = os
if isvalid(self.Entity.ColliderVisualizer) then
	self.Entity.ColliderVisualizer:OnRefresh(TriggerComponent)
end
end