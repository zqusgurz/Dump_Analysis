return function (self,cd,equip) 
self.ToRenderEquip = equip
local itemId = equip.ItemId
local info = _ItemInfoMan:GetEquip(itemId)
local name = _StringMan:GetItemName(itemId)
local desc = _StringMan:GetItemDesc(itemId)

local itemGender = _Items:GetGenderFromId(itemId)
if (itemGender == 0) then
	name = name .. " (남)"
elseif (itemGender == 1) then
	name = name .. " (여)"
end

if (equip.CUC > 0) then
	name = string.format("%s (+%d)", name, equip.CUC)
	self.ItemName.FontColor = Color.FromHexCode("#FF9900")
else
	self.ItemName.FontColor = Color.white
end

_TooltipLogic:SetItemTypeIcon(self.CashIcon, itemId, 2, _ItemAssetType.Regular)

self.ItemName.Text = name
self:_SetIcon(info.icon, info.iconSize)
local attributeText = _TooltipItemIconLogic:MakeAttributeText(equip)

local nameWidth = self.ItemName:GetPreferredWidth(name) / 2
local attributeTextsConv = string.gsub(string.gsub(attributeText, "#c", ""), "#", "")
local attributeWidth = self.ItemAttr:GetPreferredWidth(attributeTextsConv) / 2
-- log(string.format("[%s] : %d", attributeTextsConv, attributeWidth))
local elementWidth = math.max(attributeWidth, math.max(188, nameWidth))
local tooltipWidth = elementWidth + 24

local bs = cd.Entity.WsBasicStat
self.ReqLevel:SetData(_EquipTooltipReqType.Level, cd.Level >= info.reqLevel, info.reqLevel)
self.ReqStr:SetData(_EquipTooltipReqType.Str, bs.Str >= info.reqSTR, info.reqSTR)
self.ReqDex:SetData(_EquipTooltipReqType.Dex, bs.Dex >= info.reqDEX, info.reqDEX)
self.ReqInt:SetData(_EquipTooltipReqType.Int, bs.Int >= info.reqINT, info.reqINT)
self.ReqLuk:SetData(_EquipTooltipReqType.Luk, bs.Luk >= info.reqLUK, info.reqLUK)
self.ReqPop:SetData(_EquipTooltipReqType.Pop, info.reqPOP == 0 or cd.Pop >= info.reqPOP, info.reqPOP)

local rj = info.reqJob
self:_SetReqJobText(0, rj == 0)
self:_SetReqJobText(1, rj == 0 or (rj & (1 << 0)) ~= 0)
self:_SetReqJobText(2, rj == 0 or (rj & (1 << 1)) ~= 0)
self:_SetReqJobText(3, rj == 0 or (rj & (1 << 2)) ~= 0)
self:_SetReqJobText(4, rj == 0 or (rj & (1 << 3)) ~= 0)

local insert = table.insert
local options = {}
if (_Items:IsWeapon(itemId)) then
	insert(options, string.format("무기분류 : %s", _Items:GetItemCategoryName(itemId)))
	insert(options, string.format("공격속도 : %s", _Items:GetWeaponAttackSpeed(itemId)))
else
	insert(options, string.format("장비분류 : %s", _Items:GetItemCategoryName(itemId)))	
end
if (equip.STR ~= 0) then
	insert(options, string.format("STR : +%d", equip.STR))	
end
if (equip.DEX ~= 0) then
    insert(options, string.format("DEX : +%d", equip.DEX))
end
if (equip.INT ~= 0) then
    insert(options, string.format("INT : +%d", equip.INT))
end
if (equip.LUK ~= 0) then
    insert(options, string.format("LUK : +%d", equip.LUK))
end
if (equip.MHP ~= 0) then
    insert(options, string.format("HP : +%d", equip.MHP))
end
if (equip.MMP ~= 0) then
    insert(options, string.format("MP : +%d", equip.MMP))
end
-- MaxHPr
-- MaxMPr
if (equip.PAD ~= 0) then
    insert(options, string.format("공격력 : +%d", equip.PAD))
end
if (equip.MAD ~= 0) then
    insert(options, string.format("마력 : +%d", equip.MAD))
end
if (equip.PDD ~= 0) then
    insert(options, string.format("물리방어력 : +%d", equip.PDD))
end
if (equip.MDD ~= 0) then
    insert(options, string.format("마법방어력 : +%d", equip.MDD))
end
if (equip.ACC ~= 0) then
    insert(options, string.format("명중률 : +%d", equip.ACC))
end
if (equip.EVA ~= 0) then
    insert(options, string.format("회피율 : +%d", equip.EVA))
end
if (equip.Craft ~= 0) then
    insert(options, string.format("손재주 : +%d", equip.Craft))
end
if (equip.Speed ~= 0) then
    insert(options, string.format("이동속도 : +%d", equip.Speed))
end
if (equip.Jump ~= 0) then
    insert(options, string.format("점프력 : +%d", equip.Jump))
end
if (info.knockback ~= 0) then
    insert(options, string.format("직접 타격시 %d%%의 확률로 넉백", info.knockback))
end
-- 미끄럼 방지 적용
-- 추위 방지 적용
if (info.tuc ~= 0) then
	insert(options, string.format("업그레이드 가능 횟수 : %d", equip.RUC))
end


local attrSizeY = 0
if (#attributeText > 0) then
	self.ItemAttr.Entity.Enable = true
	self.ItemAttr.Text = string.gsub(string.gsub(attributeText, "#", "</color>"), "</color>c", "<color=\"#FF9900\">")
	attrSizeY = self.ItemAttr:GetPreferredHeight(attributeTextsConv, attributeWidth * 2) / 2
	-- log("AttributeTextRect: ", attrSize)
	attrSizeY += 4
	_EntityUtils:SetRectSizeUIEntitySafelyEx(self.ItemAttr.Entity, tooltipWidth - 8, nil)
	_EntityUtils:SetUIEntitySafelyEx(self.ItemAttr.Entity.Parent, nil, -32, tooltipWidth - 8, nil)
	_EntityUtils:SetUIEntitySafelyEx(self.Entity_Line, nil, -(128 + attrSizeY), tooltipWidth - 8, nil)
	_EntityUtils:SetPositionUIEntitySafelyEx(self.Entity_Req, nil, -(32 + attrSizeY))
	_EntityUtils:SetPositionUIEntitySafelyEx(self.Entity_ReqJob, nil, -(107 + attrSizeY))
	_EntityUtils:SetPositionUIEntitySafelyEx(self.Entity_Icon, nil, -(30 + attrSizeY))
else
	self.ItemAttr.Entity.Enable = false
	_EntityUtils:SetUIEntitySafelyEx(self.Entity_Line, nil, -128, tooltipWidth - 8, nil)
	_EntityUtils:SetPositionUIEntitySafelyEx(self.Entity_Req, nil, -32)
	_EntityUtils:SetPositionUIEntitySafelyEx(self.Entity_ReqJob, nil, -107)
	_EntityUtils:SetPositionUIEntitySafelyEx(self.Entity_Icon, nil, -33)
end
local height = self:_SetEquipOptions(options, attrSizeY, desc, tooltipWidth)
self.RenderedEquip = equip
self.Entity.Visible = true
return Vector2(tooltipWidth, height)
end