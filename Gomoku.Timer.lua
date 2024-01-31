return function (self,time) 
self.Entity:GetChildByName("setting"):GetChildByName("Timer").TextComponent.Text = tostring(time)
end