return function (self,delta) 
local parent = self.ParentAI.Entity

local npc = parent.NpcComponent
local ai = parent.NpcAIComponent
local template = _NpcTemplateMan:GetNpcTemplate(npc.NpcTemplateID)

local randomActions = {}
local i = 1
for name,act in pairs(template.Actions) do
	---@type NpcTemplateAction
	local action = act
	
    --if (template.Shop and name == "move") then
    --    goto CONTINUE
    --end
	if (name == "move") then
		goto CONTINUE
	end
	if (name == "stand") then
		goto CONTINUE
	end
	if (name == "shop") then
		goto CONTINUE
	end
	if (action.Special) then
		goto CONTINUE
	end
	
	randomActions[i] = name
	i += 1
	::CONTINUE::
end
for _,speak in ipairs(template.Speak) do
	randomActions[i] = speak
	i += 1
end

local pickedIndex = _GlobalRand32:RandomIntegerRange(1, #randomActions)
local pickedActionOrChat = randomActions[pickedIndex]

--log("picked action or chat", pickedActionOrChat)
---@type NpcTemplateAction
local pickedAction = template.Actions[pickedActionOrChat]

ai.WaitForNextActionOrChat = 0

if (pickedAction == nil) then
	-- speak
	ai:RequestChangeState("stand", pickedActionOrChat)
else
	-- action
	if (pickedActionOrChat == "move") then
		npc.Moved = true
	end
	ai.WaitForNextActionOrChat = pickedAction.AnimationDuration
	--log("animation duration", pickedAction.AnimationDuration)
	ai:RequestChangeState(pickedActionOrChat, nil)
end

parent.NpcRigidbodyComponent.IsMoving = pickedActionOrChat == "move"

-- 다음 액션을 위한 대기
ai.WaitForNextActionOrChat = ai.WaitForNextActionOrChat + 3 + _GlobalRand32:RandomIntegerRange(0, 6000) / 1000
--log("wait next", ai.WaitForNextActionOrChat, _UtilLogic.ServerElapsedSeconds)
ai.WaitForNextActionOrChat = ai.WaitForNextActionOrChat + _UtilLogic.ElapsedSeconds

-- Move일 경우 다음 BTNode로 넘김
if (pickedActionOrChat == "move") then
	return BehaviourTreeStatus.Success
end

return BehaviourTreeStatus.Running
end