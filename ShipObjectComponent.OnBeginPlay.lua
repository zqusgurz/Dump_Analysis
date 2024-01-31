return function (self) 
self.SpriteRenderer = self.Entity.SpriteRendererComponent
self.Transform = self.Entity.TransformComponent
if not isvalid(self.SpriteRenderer) or not isvalid(self.Transform) then
	log_error("[ShipObjectComponent] Invalid usage")
end
self.OriginalPosition = Vector3(self.Transform.Position.x, self.Transform.Position.y, self.Transform.Position.z)
-- Set MoveTime Manually
-- Set ShipKind Manually
if self.ShipKind == 0 then
	-- Set BeginPosition Manually
	self.Transform.Position.x = self.BeginPosition.x
	self.Transform.Position.y = self.BeginPosition.y
else
	self.BeginPosition = Vector3(
		self.OriginalPosition.x + (self.SpriteRenderer.FlipX and -1.00 or 1.00),
		self.OriginalPosition.y + (1.00),
		self.OriginalPosition.z)
	self.SpriteRenderer.Color.a = 0
end
self.MinimumPosition = Vector3(
	self.OriginalPosition.x - 0.50,
	self.OriginalPosition.y - 1.00,
	self.OriginalPosition.z)
self.MaximumPosition = Vector3(
	self.OriginalPosition.x + 0.50,
	self.OriginalPosition.y + 1.00,
	self.OriginalPosition.z)
end