return function (self,num) 
self.Entity:GetChildByName("Setting"):GetChildByName("Timer").TextComponent.Text = tostring(num)
end