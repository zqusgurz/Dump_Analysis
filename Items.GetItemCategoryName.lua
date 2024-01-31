return function (self,itemId) 
if (self:IsWeapon(itemId)) then
	return self:GetWeaponCategoryName(itemId)
end
if (self:IsCap(itemId)) then
	return "모자"
elseif (self:IsFaceAcc(itemId)) then
	return "얼굴장식"
elseif (self:IsEyeAcc(itemId)) then
	return "눈장식"
elseif (self:IsEarAcc(itemId)) then
	return "귀고리"
elseif (self:IsLongcoat(itemId)) then
	return "한벌옷"
elseif (self:IsCoat(itemId)) then
	return "상의"
elseif (self:IsPants(itemId)) then
	return "하의"
elseif (self:IsShoes(itemId)) then
	return "신발"
elseif (self:IsGloves(itemId)) then
	return "장갑"
elseif (self:IsCape(itemId)) then
	return "망토"
elseif (self:IsShield(itemId)) then
	return "방패"
elseif (self:IsRing(itemId)) then
	return "반지"
elseif (self:IsWeapon(itemId)) then
	return "무기"
end
return ""
end