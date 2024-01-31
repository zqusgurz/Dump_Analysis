return function (self,mmr,win,lose,draw,force) 
local record = self.Entity:GetChildByName("record"..force)
record:GetChildByName("win").TextComponent.Text = tostring(win)
record:GetChildByName("lose").TextComponent.Text = tostring(lose)
record:GetChildByName("draw").TextComponent.Text = tostring(draw)
record:GetChildByName("mmr").TextComponent.Text = tostring(mmr)
end