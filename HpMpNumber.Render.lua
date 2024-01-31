return function (self) 
local value = tostring(self.Value)
local maxValue = tostring(self.MaxValue)

local firstTextComp = self.First.TextComponent
local secondTextComp = self.Second.TextComponent
local slashTextComp = self.Slash.TextComponent
local slashUI = self.Slash.UITransformComponent
local secondUI = self.Second.UITransformComponent

firstTextComp.Text = tostring(value)
secondTextComp.Text = tostring(maxValue)
slashUI.anchoredPosition.x = firstTextComp:GetPreferredWidth(value) + 2
local slashWidth = slashTextComp:GetPreferredWidth(slashTextComp.Text)
secondUI.anchoredPosition.x = slashUI.anchoredPosition.x + slashWidth + 2
self.RightBracket.UITransformComponent.anchoredPosition.x = secondUI.anchoredPosition.x + secondTextComp:GetPreferredWidth(maxValue) + 3
end