return function (self,pos) 
if (self.Path) then
	self.Path.SpriteGUIRendererComponent.Color.a = 1
end

local tm = _AppService:Get().ToolTipMan
local tooltip = nil

if (not _UtilLogic:IsNilorEmptyString(self.Title)) then
	if (not _UtilLogic:IsNilorEmptyString(self.Desc)) then
		tooltip = tm:CreateToolTip(_TooltipType.Function, self.Entity)
		tooltip.TooltipFunctionComponent:SetText(self.Title, self.Desc)
	else
		tooltip = tm:CreateToolTip(_TooltipType.Mini, self.Entity)
		tooltip.TooltipMiniComponent:SetText(self.Title)
	end
else
	local mapName = string.format("m%09d", self.MapId)
	local map = string.format("%s : %s",
		_StringMan:GetStreetName(mapName), _StringMan:GetMapName(mapName))
	local desc = _StringMan:GetMapDesc(mapName)
	if (desc) then
		tooltip = tm:CreateToolTip(_TooltipType.Function, self.Entity)
		tooltip.TooltipFunctionComponent:SetText(map, desc)
	else
		tooltip = tm:CreateToolTip(_TooltipType.Mini, self.Entity)
		tooltip.TooltipMiniComponent:SetText(map)
	end
end
if (tooltip) then
	tm:MovePosition(tooltip)
	_UpdateComponentLogic:InsertUpdateVisible(tooltip)
end
if (self.MapLink) then
	self.MapLink:OnMouseEntered(pos)
end
end