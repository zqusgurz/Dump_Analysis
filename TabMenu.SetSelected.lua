return function (self,selected) 
if (selected) then
	self.Left.SpriteGUIRendererComponent.ImageRUID = self.Tabs._highlightedLeft
	self.Fill.SpriteGUIRendererComponent.ImageRUID = self.Tabs._highlightedFill
	self.Right.SpriteGUIRendererComponent.ImageRUID = self.Tabs._highlightedRight
else
	self.Left.SpriteGUIRendererComponent.ImageRUID = self.Tabs._normalLeft
	self.Fill.SpriteGUIRendererComponent.ImageRUID = self.Tabs._normalFill
	self.Right.SpriteGUIRendererComponent.ImageRUID = self.Tabs._normalRight
end
end