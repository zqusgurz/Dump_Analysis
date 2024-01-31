return function (self,time) 
self.Entity:GetChildByName("Setting"):GetChildByName("Timer").TextComponent.Text = tostring(time)
end