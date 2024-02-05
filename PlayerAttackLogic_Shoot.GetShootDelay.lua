return function (self,skillId,def) 
if skillId == 0 then
	return def
end

if skillId == 3221001 then
	local skill = _SkillMan:GetSkill(3221001)
	local ball = skill:GetBall()
	return _WzUtils:GetInt32(ball["delay"], 0)
elseif skillId == 13111007 then
	return 561
elseif skillId == 15111007 then
	return 449
elseif skillId == 13111006 then
	return 618
elseif skillId == 5210000 then
	return 90
elseif skillId == 5001003 then
	return 90
elseif skillId == 5221007 then
	return 180
elseif skillId == 5221008 then
	return 600
else
	return def
end
end