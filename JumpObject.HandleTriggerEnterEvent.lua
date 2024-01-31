return function (self,event) 
--------------- Native Event Sender Info ----------------
-- Sender: TriggerComponent
-- Space: Server, Client
---------------------------------------------------------

-- Parameters
local TriggerBodyEntity = event.TriggerBodyEntity
---------------------------------------------------------
if TriggerBodyEntity.RigidbodyComponent and not TriggerBodyEntity.RigidbodyComponent:IsOnGround() then
	TriggerBodyEntity.RigidbodyComponent:SetForce(self.force)
end
end