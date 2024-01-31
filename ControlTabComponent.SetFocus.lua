return function (self) 
--log("Trying focus..", self.Entity)
-- 나보다 위에 ControlTab이 있는가?
if _ControlWindowLogic:SetFocusOnTab(self.Entity) then
	return
end

--log("Doing focus..", self.Entity)
-- 부모 전환 Hack (창을 맨 앞으로 가져오기)
--local entity = self.Entity
--local parent = entity.Parent
--local beforePos = entity.UITransformComponent.anchoredPosition
--entity:AttachTo(_EntityService:GetEntityByPath("/ui/TempUIGroup"))
--entity:AttachTo(parent)
--entity.UITransformComponent.anchoredPosition = beforePos
end