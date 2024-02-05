return function (self,appearType,d,returnPool) 
self.Position = d.Position
self.OriginalPosition = d.OriginalPosition
self.DropId = d.ObjectId
self.ReturnPool = returnPool
self.IsMoney = d.ItemId == 0
self.PickUpTarget = nil
self.OwnType = d.OwnType
self.OwnId = d.OwnerId
self.CreateTime = d.CreateTime
self.ReservedDestroy = 1E1000
-- Set Sprite
local xOffset = 0
if (d.ItemId == 0) then
	local spriteRenderer = self.Entity.SpriteRendererComponent
	if (d.Amount < 50) then
		spriteRenderer.SpriteRUID = _UidMan:GetRawAnimation("dbcd3e987e834c51b003fafa15d0982b")
		-- 28 or 29
		xOffset = 0.14
    elseif (d.Amount < 100) then
		spriteRenderer.SpriteRUID = _UidMan:GetRawAnimation("3e463fa70fc7439e86a8a23551ac1c0a")
		-- 28 or 29
		xOffset = 0.14
    elseif (d.Amount < 1000) then
		spriteRenderer.SpriteRUID = _UidMan:GetRawAnimation("f111d07632b74815b632a2dfeb46e958")
		-- 33 or 34
		xOffset = 0.17
    else
		spriteRenderer.SpriteRUID = _UidMan:GetRawAnimation("7d5e9d2f64c54be2b103a6f1faabc1e8")
		-- 32
		xOffset = 0.16
    end
	spriteRenderer.Color.a = 1
	self.SpriteEntity = self.Entity
else
	local anim = _ItemInfoMan:GetIconRawAnimation(d.ItemId)
	if (anim == nil) then
		log_error(string.format("No iconRawAnimation itemId: %d", d.ItemId))
	end
	local msp = self.Entity.MapleSpriteRendererComponent
	msp:SetRawAnimation(anim, false)
	msp.DefaultAnimationDelay = 100
	xOffset = anim.SpriteSize.x / 200
	self.SpriteEntity = msp:GetSpriteEntity()
	self.SpriteEntity.SpriteRendererComponent.Color.a = 1
end
self.SpriteEntity.SpriteRendererComponent.OrderInLayer = 2
self.Position.x -= xOffset
self.OriginalPosition.x -= xOffset
self.XOffset = xOffset
self.Entity.TriggerComponent.ColliderOffset.x = xOffset
if (appearType == _DropAppearType.Vanish) then
	self.AppearType = _DropAppearType.Create
	self.Vanish = true
else
	self.AppearType = appearType
	self.Vanish = false
end
if (appearType == _DropAppearType.Create or self.Vanish) then
	self.Entity.TransformComponent.WorldPosition = self.OriginalPosition:Clone()
	self:ChangeAnimation(1)
	if (self.Vanish) then
		self:BeginVanishTween()
	end
else
	-- 그냥 생성
	self.Entity.TransformComponent.WorldPosition = self.Position:Clone()
	self:ChangeAnimation(3)
end
end