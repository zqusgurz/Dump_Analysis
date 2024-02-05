return function (self,options,attrTextHeight,desc,tooltipWidth) 
local elementHeight = 11
local elementNumber = #options
local optionTextWidth = tooltipWidth - 8

---@param obj Entity
---@param text string
local function makeOptionText(obj, i, text, pivot)
	obj.Enable = true
	local tooltipOption = obj.EquipTooltipOptionComponent
	local uiTransform = obj.UITransformComponent
	local textComponent = tooltipOption.Text

	_EntityUtils:SetUIEntitySafelyEx(textComponent.Entity, nil, nil, optionTextWidth, nil)
	_EntityUtils:SetUIEntitySafelyEx(textComponent.Entity.Parent, nil, nil, optionTextWidth, nil)
    --textComponent.MSWFontOffset_ByCode.x = -2
	
	local x = 0
	if (pivot == 0) then
		uiTransform.AlignmentOption = AlignmentType.TopLeft
		uiTransform.Pivot = Vector2(0, 1)
		x = 5
		textComponent.Alignment = TextAlignmentType.UpperLeft
	else
		uiTransform.AlignmentOption = AlignmentType.TopCenter
		uiTransform.Pivot = Vector2(0.5, 1)
		x = 0
		textComponent.Alignment = TextAlignmentType.MiddleCenter
	end
	tooltipOption.Text.Text = text
	
	_EntityUtils:SetUIEntitySafelyEx(obj, x, -2 - attrTextHeight + ((i - 1) * -(elementHeight + 5)), nil, nil)
	obj.Visible = true
end

local totalNeedOptionCount = elementNumber
if (not _UtilLogic:IsNilorEmptyString(desc)) then
	totalNeedOptionCount += 1
end
---@type table<Entity>
local optionEntities = self.OptionEntities
local optionEntitiesNum = #optionEntities
for i=totalNeedOptionCount+1,optionEntitiesNum do
	local obj = optionEntities[i]
	obj.Enable = false
	obj.Visible = false
end
for i=optionEntitiesNum+1,totalNeedOptionCount do
	local obj = _SpawnService:SpawnByModelId("model://e7986b98-a764-4048-bd28-962470611c20", "PooledOption", Vector3.zero, self.Options)
	optionEntities[i] = obj
	obj.Enable = false
	obj.Visible = false
end

for i=1,elementNumber do
	local option = options[i]
	local obj = optionEntities[i]
	makeOptionText(obj, i, option, 0.5)
end

local lineCount = elementNumber
local itemDescHeight = 0

if (not _UtilLogic:IsNilorEmptyString(desc)) then
	local obj = optionEntities[totalNeedOptionCount]
	local cDesc = string.gsub(string.gsub(desc, "#", "</color>"), "</color>c", "<color=\"#FF9900\">")
	local uDesc = string.gsub(string.gsub(desc, "#c", ""), "#", "")
	makeOptionText(obj, totalNeedOptionCount, desc, 0)
	local at = obj.EquipTooltipOptionComponent.Text
	itemDescHeight = at:GetPreferredHeight(uDesc, optionTextWidth * 2) / 2
end

local optionHeight = (elementHeight * lineCount) + (5 * (lineCount + 1))
local height = 133 + attrTextHeight + 2 + optionHeight + itemDescHeight

_EntityUtils:SetRectSizeUIEntitySafelyEx(self.Entity, tooltipWidth, height)
_EntityUtils:SetRectSizeUIEntitySafelyEx(self.Options, tooltipWidth, height - 69)

return height
end