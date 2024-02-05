return function (self,objPool,backRUID,modelId,callbackYes,callbackNo) 
local modal = _ObjectPool:Pick(objPool, "PooledFixedYesNoModal", modelId, Vector3.zero, self.Entity)
modal.ModalComponent.ModalType = _ModalType.FixedYesNo
if (backRUID) then
	modal.SpriteGUIRendererComponent.ImageRUID = backRUID
end
modal.ModalComponent.ReleasePool = objPool
modal.ModalComponent:SetCallback(function(value)
	if (value == 1)	then
		if (callbackYes ~= nil)	then
			callbackYes()
		end
	end
	if (value == 0)	then
		if (callbackNo ~= nil)	then
			callbackNo()	
		end
	end
end)
table.insert(self.ActiveModalEntities, modal)
modal.UITransformComponent.anchoredPosition = Vector2.zero
_UpdateComponentLogic:InsertUpdateVisible(modal)
end