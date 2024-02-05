return function (self) 
if not (isvalid(self.Entity.UITouchReceiveComponent)) then
	self.Entity:AddComponent(UITouchReceiveComponent)
end
end