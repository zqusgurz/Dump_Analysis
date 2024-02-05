return function (self,avatarLook,lv,job,str,dex,int,luk,pop,gender,equipping,equipping2) 
-- local allParts = {_BodyParts.Cap,_BodyParts.Cape,_BodyParts.Clothes,_BodyParts.EarAcc,_BodyParts.EyeAcc,_BodyParts.FaceAcc,_BodyParts.Gloves,_BodyParts.Pants,_BodyParts.Ring1,_BodyParts.Ring2,_BodyParts.Ring3,_BodyParts.Ring4,_BodyParts.Shield,_BodyParts.Shoes,_BodyParts.Weapon}
for bp=1,_BodyParts.Max do
	local eqp2 = equipping2[bp]
	local eqp = equipping[bp]
	if (eqp2 ~= nil and _Items:IsAbleToEquip(eqp2.ItemId, lv, job, str, dex, int, luk, pop, 100+bp, gender)) then
		avatarLook[100 + bp] = eqp2.ItemId
	elseif (eqp ~= nil and _Items:IsAbleToEquip(eqp.ItemId, lv, job, str, dex, int, luk, pop, bp, gender)) then
		avatarLook[100 + bp] = nil
		avatarLook[bp] = eqp.ItemId
	else
		avatarLook[100 + bp] = nil
		avatarLook[bp] = nil
	end
end
end