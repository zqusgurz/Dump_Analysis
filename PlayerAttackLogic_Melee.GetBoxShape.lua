return function (self,user,actionId,range,masteryLevel,checkMeleeFromRange,wt,skillId,userPos,left,levelData) 
local boxShape
if (skillId == _Skills.THIEF_SAVAGE_BLOW) then
	boxShape = _UserSkillLogic:MakeBoxShapeFromLtRb(userPos, Vector2(-88, -62), Vector2(-18, -6), left)
elseif (skillId == 0 or (levelData.lt == Vector2.zero and levelData.rb == Vector2.zero)) then
	local ac = user.CharacterActionComponent
	local afterImageData = ac:MakeAfterimageData(actionId, masteryLevel)
	boxShape = _CharacterActionLogic:MakeAfterimageBox(user, left, userPos, wt, actionId, checkMeleeFromRange, afterImageData, range)
else
	boxShape = _UserSkillLogic:MakeBoxShapeFromSkillLevelData(userPos, levelData, left)
end
return boxShape
end