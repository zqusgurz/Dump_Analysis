return function (self,win,lose,mmr,force) 
local record = self.Entity:GetChildByName("Setting"):GetChildByName("score"..tostring(force))
record:GetChildByName("win").TextComponent.Text = tostring(win)
record:GetChildByName("lose").TextComponent.Text = tostring(lose)
record:GetChildByName("mmr").TextComponent.Text = tostring(mmr)
end