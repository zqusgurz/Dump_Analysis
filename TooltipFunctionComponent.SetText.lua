return function (self,title,description) 
local cDesc = string.gsub(string.gsub(description, "#", "</color>"), "</color>c", "<color=\"#FF9900\">")
local uDesc = string.gsub(string.gsub(description, "#c", ""), "#", "")

self.Title.Text = title
self.Description.Text = cDesc
local height = self.Description:GetPreferredHeight(uDesc, self.Entity.UITransformComponent.RectSize.x) / 2
local top = 29
local bottom = 7
_EntityUtils:SetRectSizeUIEntitySafelyEx(self.Entity, nil, top + height + bottom)
end