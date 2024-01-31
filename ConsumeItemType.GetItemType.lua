return function (self,itemId) 
local t = itemId // 10000
if (t == 200 or t == 201 or t == 202 or t == 205 or t == 221 or t == 245) then
	return self.StateChange
elseif (t == 204) then
	return self.Upgrade
elseif (t == 203) then
	return self.PortalScroll
elseif (t == 210) then
	return self.MobSummon
elseif (t == 212) then
	return self.PetFood
elseif (t == 226) then
	return self.TamingMobFood
elseif (t == 227) then
	return self.Bridle
elseif (t == 301) then
	return self.PortableChair
elseif (t == 228 or t == 229) then
	return self.SkillLearn
elseif (t == 243 or t == 263 or t == 568) then
	return self.Scripted
elseif (t == 505) then
	return self.CashScroll
elseif (t == 507) then
	return self.CashSpeaker
end
return self.None
end