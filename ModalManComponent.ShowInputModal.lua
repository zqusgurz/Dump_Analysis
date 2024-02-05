return function (self,prompt,onlyNumber,defaultText,callbackYes,callbackNo) 
local modal = _ObjectPool:Pick(self.GenericInputModalPool, "PooledGenericInputModal", 
		"model://09dcd665-0f69-4566-9090-6cd4305c0b43", Vector3.zero, self.Entity)
modal.ModalComponent.ModalType = _ModalType.GenericInput
modal.ModalComponent.ReleasePool = self.GenericInputModalPool
modal.GenericInputModalComponent:SetPrompt(prompt)
local txt = modal.GenericInputModalComponent.TextInput
txt.Text = defaultText
txt.Entity.TextComponent.Text = defaultText
txt:ActivateInputField()
if (onlyNumber) then
	txt.ContentType = InputContentType.IntegerNumber
	txt.CharacterLimit = 10
else
	txt.ContentType = InputContentType.Standard
	txt.CharacterLimit = 50
end
modal.ModalComponent:SetCallback(function(value,text)
	if (value == 1)	then
		if (callbackYes ~= nil)	then
			return callbackYes(text)
		end
	end
	if (value == 0)	then
		if (callbackNo ~= nil)	then
			return callbackNo(text)
		end
	end
end)
table.insert(self.ActiveModalEntities, modal)
modal.UITransformComponent.anchoredPosition = Vector2.zero
_UpdateComponentLogic:InsertUpdateVisible(modal)
end