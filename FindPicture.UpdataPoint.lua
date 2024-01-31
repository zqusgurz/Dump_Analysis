return function (self,force,num) 
local score = self.Entity:GetChildByName("Setting"):GetChildByName("score"..tostring(force)):GetChildByName("point")
score.TextComponent.Text = tostring(num)
end