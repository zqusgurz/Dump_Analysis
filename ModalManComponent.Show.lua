return function (self,message,callback) 
local modal = _ObjectPool:Pick(self.GenericModalPool, "PooledGenericModal", "model://0977e0c5-06b5-4b41-8448-ee7fab1edbfc", Vector3.zero, self.Entity)
modal.ModalComponent.ModalType = _ModalType.Generic
modal.ModalComponent.ReleasePool = self.GenericModalPool
modal.GenericYesNoModalComponent:SetPrompt(message)
modal.ModalComponent:SetCallback(function(value)
	if (value == 1)	then
		if (callback ~= nil)	then
			callback()
		end
	end
end)
table.insert(self.ActiveModalEntities, modal)
modal.UITransformComponent.anchoredPosition = Vector2.zero
_UpdateComponentLogic:InsertUpdateVisible(modal)

_SoundService:PlaySound(_UidMan:Get("Sound/UI.img/DlgNotice"), 1)
end