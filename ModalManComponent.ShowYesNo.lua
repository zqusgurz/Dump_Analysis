return function (self,prompt,callbackYes,callbackNo) 
local modal = _ObjectPool:Pick(self.GenericYesNoModalPool, "PooledGenericYesNoModal", "model://b45d5fe7-f460-48a5-89f6-e670342d804b", Vector3.zero, self.Entity)
modal.ModalComponent.ModalType = _ModalType.GenericYesNo
modal.ModalComponent.ReleasePool = self.GenericYesNoModalPool
modal.GenericYesNoModalComponent:SetPrompt(prompt)
modal.ModalComponent:SetCallback(function(value,text)
	if (value == 1)	then
		if (callbackYes ~= nil)	then
			callbackYes(text)
		end
	end
	if (value == 0)	then
		if (callbackNo ~= nil)	then
			callbackNo(text)
		end
	end
end)
table.insert(self.ActiveModalEntities, modal)
modal.UITransformComponent.anchoredPosition = Vector2.zero
_UpdateComponentLogic:InsertUpdateVisible(modal)

_SoundService:PlaySound(_UidMan:Get("Sound/UI.img/DlgNotice"), 1)
end