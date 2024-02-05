return function (self,prompt) 
local modal = self.Entity
local text = self.Text

text.Text = prompt
local textHeight = text:GetPreferredHeight(prompt, self.Text.Entity.UITransformComponent.RectSize.x) / 2
local inputPosY = textHeight - 24

local height = 21 + textHeight + 78
_EntityUtils:SetRectSizeUIEntitySafelyEx(modal, 266, height)
_EntityUtils:SetPositionUIEntitySafelyEx(self.TextInput.Entity, nil, -(48 + inputPosY))

_EntityUtils:SetUIEntitySafelyEx(self.Text.Entity.Parent, 19, -21, 228, textHeight)
_EntityUtils:SetUIEntitySafelyEx(self.Text.Entity, -2, 1, 228, textHeight)
end