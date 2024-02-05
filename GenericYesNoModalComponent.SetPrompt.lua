return function (self,prompt) 
self.Text.Text = prompt
local textHeight = self.Text:GetPreferredHeight(prompt, self.Text.Entity.UITransformComponent.RectSize.x) / 2
textHeight += 20

local height = 21 + textHeight + 55
_EntityUtils:SetRectSizeUIEntitySafelyEx(self.Entity, 266, height)
_EntityUtils:SetUIEntitySafelyEx(self.Text.Entity.Parent, 19, -21, 228, height - 21 - 55)
_EntityUtils:SetUIEntitySafelyEx(self.Text.Entity, -2, 1, 228, height - 21 - 55)

-- TextHolder: Left 19, Right 19, Top 21, Bottom 55
--   Text: Left -2, Right 2, Top -1, Bottom 1
end