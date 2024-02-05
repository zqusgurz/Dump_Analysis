return function (self,user,currentState) 
if (_CharacterActionLogic:IsOnLadderOrRope(currentState)) then
	local cd = user.WsCharacterData
	if (cd:GetSkillLevel(_Skills.SWORDMAN_ENDURE) > 0) then
		return true
	end
	if (cd:GetSkillLevel(_Skills.ASSASSIN_ENDURE) > 0) then
		return true
	end
	if (cd:GetSkillLevel(_Skills.THIEF_ENDURE) > 0) then
		return true
	end
end
return false
end