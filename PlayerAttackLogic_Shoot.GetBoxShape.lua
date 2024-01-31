return function (self,skillId,levelData,startPos,mapleRange,left) 
---@type BoxShape
local boxShape = _UserSkillLogic:MakeBoxShapeFromLtRb(startPos, Vector2(-mapleRange, 1), Vector2(0, 0), left)
--_UserSkillLogic:MakeBoxShape(startPos, Vector2(0, 0), Vector2(range, 0.01), left)
local adjustVertical = _PlayerAttackLogic:GetVerticalAdjustOfAttackRange(skillId) / 100
if (adjustVertical <= 0) then
	if (_PlayerAttackLogic:IsAttackAreaSetByData(skillId)) then
		boxShape = _UserSkillLogic:MakeBoxShapeFromSkillLevelData(startPos, levelData, left)
	end
else
	if (adjustVertical > 0) then
		-- boxShape.Position.y += adjustVertical
		boxShape.Size.y += adjustVertical * 2
	end
end
return boxShape
end