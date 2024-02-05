return function (self,npc,text,def,maxCharacters) 
local dlg = _UtilDlgLogic:GetUtilDlgEx()
local comp = dlg.UtilDlgExComponent
comp:SetNpc(npc)
comp:SetButton(_UtilDlgExButtonType.Ok)
comp:SetInputText(def, maxCharacters)
comp:SetContent(text)
comp:UpdateScaleUI()
comp.PreCheckHandler = function(button)
	if (button == 1) then	
		return comp:CheckInput()
	end
	return true
end
comp.ButtonHandler = function(button)
	self:OnResponse(button, 0, comp.InputField.TextInputComponent.Text)
end
comp.ListHandler = nil
_UpdateComponentLogic:InsertUpdateVisible(dlg)
end