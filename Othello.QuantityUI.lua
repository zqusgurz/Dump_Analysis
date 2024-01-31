return function (self,force1,force2) 
local panel = self.Entity:GetChildByName("Setting")
panel:GetChildByName("Point1").TextComponent.Text = tostring(force1)
panel:GetChildByName("Point2").TextComponent.Text = tostring(force2)
end