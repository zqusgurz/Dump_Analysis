return function (self,user,skillIds,param) 
for _,skillId in ipairs(skillIds) do
	local m, slv = self:GetMasteryFromSkill(user, skillId, param)
	if (m > 0) then
		return m, slv
	end
end
return 0, 0
end