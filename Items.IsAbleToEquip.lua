return function (self,itemId,level,job,str,dex,int,luk,pop,pos,gender) 
local equipInfo = _ItemInfoMan:GetEquip(itemId)
if (equipInfo == nil) then
	log_warning("Failed equip info is nil:", itemId)
	return false
end

local class = _Jobs:GetJobClass(job)
local function ReqJob(rj) return 1 << (rj - 1) end
local j = class ~= 0 and ReqJob(class) or 0
local itemGender = self:GetGenderFromId(itemId)
if not (_Jobs:IsAdmin(job)) then
	if (pos >= 100 and pos < 100 + _BodyParts.Max and equipInfo.cash == 0) then
		log_warning("pos is out of range (cash item):", pos, equipInfo.cash)
		return false
	end
	if (itemGender ~= 2 and gender ~= 2 and gender ~= itemGender) then
		log_warning("gender is missing. itemGender:", itemGender, "gender:", gender)
		return false
	elseif (level < equipInfo.reqLevel) then
		log_warning("reqLevel failed", level, equipInfo.reqLevel)
		return false
	elseif (str < equipInfo.reqSTR) then
		log_warning("reqSTR failed", str, equipInfo.reqSTR)
		return false
	elseif (dex < equipInfo.reqDEX) then
		log_warning("reqDEX failed", dex, equipInfo.reqDEX)
		return false
	elseif (int < equipInfo.reqINT) then
		log_warning("reqINT failed", int, equipInfo.reqINT)
		return false
	elseif (luk < equipInfo.reqLUK) then
		log_warning("reqLUK failed", luk, equipInfo.reqLUK)
		return false
	elseif (pop < equipInfo.reqPOP and equipInfo.reqPOP ~= 0) then
		log_warning("reqPOP failed", pop, equipInfo.reqPOP)
		return false
	elseif (equipInfo.reqJob ~= 0 and (equipInfo.reqJob ~= -1 or j ~= 0) and (equipInfo.reqJob <= 0 or (equipInfo.reqJob & j) == 0)) then
		log_warning("reqJob failed j:", j, equipInfo.reqJob)
		return false
	end
end
return true
end