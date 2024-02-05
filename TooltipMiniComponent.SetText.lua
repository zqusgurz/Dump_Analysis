return function (self,title) 
local cDesc = string.gsub(string.gsub(string.gsub(title, "#", "</color>"), "\\</color>", "#"), "</color>c", "<color=\"#FF9900\">")
local uDesc = string.gsub(string.gsub(title, "#c", ""), "#", "")
local width = (self.Title:GetPreferredWidth(uDesc) / 2) + self.Padding.x
local height = (self.Title:GetPreferredHeight(uDesc, width * 2) / 2) + self.Padding.y
_EntityUtils:SetRectSizeUIEntitySafelyEx(self.Title.Entity.Parent, 3 + width + 3, height)
_EntityUtils:SetRectSizeUIEntitySafelyEx(self.Title.Entity.Parent.Parent, 3 + width + 3, height)
self.Title.Text = cDesc
end