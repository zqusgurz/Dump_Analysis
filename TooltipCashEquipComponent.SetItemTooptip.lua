return function (self,cd,cashEqp,eqp) 
self.Cash.TooltipEquipComponent:SetItemTooptip(cd, cashEqp)
self.Normal.TooltipEquipComponent:SetItemTooptip(cd, eqp)

local co = self.Cash.UITransformComponent.RectSize
local no = self.Normal.UITransformComponent.RectSize

self.Entity.UITransformComponent.RectSize = co.y + no.y + 2
self.Normal.UITransformComponent.anchoredPosition = Vector2(0, -(co.y + 2))
self.Cash.UITransformComponent.anchoredPosition = Vector2.zero
end