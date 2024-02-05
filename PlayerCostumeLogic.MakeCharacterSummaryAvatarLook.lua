return function (self,avatarLook,summary) 
local equipping = summary.Equipping
local equipping2 = summary.Equipping2
for bp=1,_BodyParts.Max do
	local eqp2 = equipping2[tostring(bp)]
	local eqp = equipping[tostring(bp)]
	if (eqp2 ~= nil and _Items:IsAbleToEquip(eqp2, summary.Level, summary.Job, summary.STR, summary.DEX, summary.INT, summary.LUK, summary.POP, 100+bp, summary.Gender)) then
		avatarLook[100 + bp] = eqp2
	elseif (eqp ~= nil and _Items:IsAbleToEquip(eqp, summary.Level, summary.Job, summary.STR, summary.DEX, summary.INT, summary.LUK, summary.POP, bp, summary.Gender)) then
		avatarLook[100 + bp] = nil
		avatarLook[bp] = eqp
	else
		avatarLook[100 + bp] = nil
		avatarLook[bp] = nil
	end
end
end