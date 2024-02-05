return function (self,text) 
local txtComp = self.TextComponent

txtComp.Text = text
txtComp.FontColor = self.Color
self:ResizeMSWFont()

local width = txtComp:GetPreferredWidth(self.Text)
local height = txtComp:GetPreferredHeight(self.Text, width)
return Vector2(width, height)
end