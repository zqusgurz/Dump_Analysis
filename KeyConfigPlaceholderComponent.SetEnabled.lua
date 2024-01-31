return function (self,b) 
self.Enabled = b
self.Sprite.Color.a = b and 1 or 0
self.Sprite.RaycastTarget = b
end