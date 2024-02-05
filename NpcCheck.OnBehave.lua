return function (self,delta) 
--local npc = self.ParentAI.Entity.NpcComponent
--if not (npc.Moved) then
--    local wp = self.ParentAI.Entity.TransformComponent.WorldPosition
--    if (wp.x ~= npc.HomePosition.x or wp.y ~= npc.HomePosition.y) then
--        self.ParentAI.Entity.MovementComponent:SetWorldPosition(npc.HomePosition)
--    end
--end

local parent = self.ParentAI.Entity

local ai = parent.NpcAIComponent
if (ai.WaitForNextActionOrChat > _UtilLogic.ElapsedSeconds) then
	return BehaviourTreeStatus.Failure
end
if (ai.MaxLeft == 0 and ai.MaxRight == 0) then
	local fh = parent.AdvancedRigidbodyComponent:GetCurrentFoothold()
	ai.MaxLeft = fh.StartPoint.x
	ai.MaxRight = fh.EndPoint.x
	--log(ai.MaxLeft, ai.MaxRight)
end
return BehaviourTreeStatus.Success
end