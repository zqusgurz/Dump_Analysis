return function (self,message) 
if self.inited == false then
	self.inited = true
	self.offset = -self.message.Entity.UITransformComponent.anchoredPosition.y
end
self.message.Text = message
self:StartTween()
end