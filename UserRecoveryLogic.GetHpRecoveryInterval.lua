return function (self,user,option) 
if (option == 1) then
	local cd = user.WsCharacterData
	local endures = {_Skills.SWORDMAN_ENDURE, _Skills.THIEF_ENDURE, _Skills.ASSASSIN_ENDURE}
	for i=1,#endures do
		local slv = cd:GetSkillLevel(endures[i])
		if (slv == 0) then continue end
		local levelData = _SkillMan:GetSkillLevelData(endures[i], slv)
		if (levelData ~= nil) then
			return levelData.time
		end
	end
	return math.maxinteger
end
return 10
end