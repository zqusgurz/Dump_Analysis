return function (self) 
local text = self.Entity.TextComponent
if (not isvalid(text)) then
	return
end
local fontSize = _NumberUtils:Round(_ScreenResolutionLogic:GetScale().x * self.BaseFontSize)
if (fontSize < 10) then
	fontSize = 10
end
if (fontSize > 40) then
	fontSize = 40
end
text.FontSize = fontSize
if (self.SyncConstraint and text.SizeFit) then
	if (text.UseConstraintX) then
		text.ConstraintX = self:GetParentScrollLayout().UITransformComponent.RectSize.x
	end
	if (text.UseConstraintY) then
		text.ConstraintY = self:GetParentScrollLayout().UITransformComponent.RectSize.y
	end
end
end