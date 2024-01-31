return function (self) 
local fontBase = _FontService.MSWFontBase[self.Font]
local baseSize = fontBase[1]
--self.TextComponent.FontSize = math.max(6, math.floor(baseSize * _ScreenResolutionLogic:GetScale().x) - 1)
self.TextComponent.FontSize = math.max(6, math.floor(baseSize * _ScreenResolutionLogic:GetScale().x))
end