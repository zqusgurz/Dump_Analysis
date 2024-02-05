return function (self,id) 
if (id < 0) then
	id = -id
	local info = _ItemInfoMan:GetItem(id)
	if (info == nil) then
		log_warning(string.format("unknown item id %d", id))
		return
	end
	-- TODO check not canceled
else
	local info = _SkillMan:GetSkill(id)
	if (info == nil) then
		log_warning(string.format("unknown skill id %d", id))
		return
	end
	-- TODO check not canceled
end
end