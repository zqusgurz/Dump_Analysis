return function (self) 
local left = self.LeftBracket
local right = self.RightBracket
local value = tostring(self.Value)
local percent = string.format("%04.2f%%", self.Percent)

self.First.TextComponent.Text = value
left.UITransformComponent.anchoredPosition.x = self.First.TextComponent:GetPreferredWidth(value) + 2
self.Second.UITransformComponent.anchoredPosition.x = self.LeftBracket.UITransformComponent.anchoredPosition.x + 6
self.Second.TextComponent.Text = percent
right.UITransformComponent.anchoredPosition.x = 2 + self.Second.UITransformComponent.anchoredPosition.x + self.Second.TextComponent:GetPreferredWidth(percent)
end