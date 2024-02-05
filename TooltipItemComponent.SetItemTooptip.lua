return function (self,cd,item) 
local itemId = item.ItemId
local info = _ItemInfoMan:GetItem(itemId)
local name = ""
local desc = ""
if (_Items:IsPet(item.ItemId)) then
	---@type ItemSlotPet
	local pet = item
	if (not _UtilLogic:IsNilorEmptyString(pet.Name)) then
		name = pet.Name
	else
		name = _StringMan:GetItemName(itemId)
	end
	if (pet.DeadTime and DateTime(pet.DeadTime) > DateTime.UtcNow) then
		self:_SetIcon(info.icon, info.iconSize)
		desc = _StringMan:GetItemDesc(itemId)
	else
		self:_SetIcon(info.iconD, info.iconDSize)
		desc = _StringMan:GetItemDescD(itemId)
	end
else
	name = _StringMan:GetItemName(itemId)
	desc = _StringMan:GetItemDesc(itemId)
	self:_SetIcon(info.icon, info.iconSize)
end

self.ItemName.Text = name

local cDesc = string.gsub(string.gsub(desc, "#", "</color>"), "</color>c", "<color=\"#FF9900\">")
local uDesc = string.gsub(string.gsub(desc, "#c", ""), "#", "")

self.ItemDesc.Text = cDesc
local textRectY = self.ItemDesc:GetPreferredHeight(uDesc, 286 * 2) / 2
local top = 33
local bottom = 8
local tooltipY = math.max(112, top + textRectY + bottom)

local y = -31
if (info.i_reqLevel > 0) then
	local lv = (cd and cd.Level) or _PlayerStatLogic.MaxLevel
	local offsetY = 7 + 5
	y -= offsetY
	tooltipY += offsetY
	self.ReqLevel.EquipTooltipReqElementComponent:SetData(_EquipTooltipReqType.Level, lv >= info.i_reqLevel, info.i_reqLevel)
	self.ReqLevel.Enable = true
else
	self.ReqLevel.Enable = false
end

local attributeText = _TooltipItemIconLogic:MakeAttributeText(item)
if (#attributeText > 0) then
	self.ItemAttr.Entity.Enable = true
	self.ItemAttr.Text = string.gsub(string.gsub(attributeText, "#", "</color>"), "</color>c", "<color=\"#FF9900\">")
	local attrSizeX = self.ItemAttr:GetPreferredWidth(attributeText)
	local attrSizeY = self.ItemAttr:GetPreferredHeight(attributeText, attrSizeX) / 2
	_EntityUtils:SetPositionUIEntitySafelyEx(self.ItemAttr.Entity.Parent, nil, -32) -- 30
	if (_FontService.DisableCustomFont) then
		y -= (attrSizeY + 0)
		tooltipY += (attrSizeY - 3)
		_EntityUtils:SetPositionUIEntitySafelyEx(self.Entity_IconPlace, nil, -(33 + attrSizeY - 3))
		_EntityUtils:SetPositionUIEntitySafelyEx(self.Entity_Req, nil, -(32 + attrSizeY - 3))
	else
		y -= (attrSizeY + 7)
		tooltipY += (attrSizeY + 4)
		_EntityUtils:SetPositionUIEntitySafelyEx(self.Entity_IconPlace, nil, -(33 + attrSizeY + 4))
		_EntityUtils:SetPositionUIEntitySafelyEx(self.Entity_Req, nil, -(32 + attrSizeY + 4))
	end
else
	self.ItemAttr.Entity.Enable = false
	_EntityUtils:SetPositionUIEntitySafelyEx(self.Entity_IconPlace, nil, -33)
	_EntityUtils:SetPositionUIEntitySafelyEx(self.Entity_Req, nil, -32)
end

_EntityUtils:SetPositionUIEntitySafelyEx(self.ItemDesc.Entity.Parent, nil, y)
_EntityUtils:SetRectSizeUIEntitySafelyEx(self.Entity, nil, tooltipY)

_TooltipLogic:SetItemTypeIcon(self.CashIcon, itemId, 2, _ItemAssetType.Regular)
self.Entity.Visible = true
return tooltipY
end