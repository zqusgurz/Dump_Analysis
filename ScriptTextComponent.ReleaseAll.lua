return function (self) 
_TimerService:ClearTimer(self.AnimationSpriteTimer)
local pool = self.Pool
for _,spr in ipairs(self.Sprites) do
	---@type Entity
	local entity = spr
	entity.UITransformComponent.anchoredPosition.x = -1000
	local rich = entity.RichGlyphComponent
	rich.Underline.Enable = false
	rich.Handler = nil
	rich.Dot = nil
	rich.DotMasterListEntities = {}
	rich:SetEnableMouseOver(0, nil, 0, 0, 0, nil)
	rich.MouseOver = false
	entity.Visible = false
	_ObjectPool:Release(pool, entity)
	--entity:AttachTo(_TextSpritePool.Parent)
end
self.Sprites = {}
end