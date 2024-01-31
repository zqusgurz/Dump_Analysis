return function (self,npc,text,def,min,max) 
local dlg = _UtilDlgLogic:GetUtilDlgEx()
local comp = dlg.UtilDlgExComponent
comp:SetNpc(npc)
comp:SetButton(_UtilDlgExButtonType.Ok)
comp:SetInputNumber(def, min, max)
comp:SetContent(text)
comp:UpdateScaleUI()
comp.PreCheckHandler = function(button)
	if (button == 1) then
		return comp:CheckInput()
	end
	return true
end
comp.ButtonHandler = function(button)
	self:OnResponse(button, tonumber(comp.InputField.TextInputComponent.Text), nil)
end
comp.ListHandler = nil
_UpdateComponentLogic:InsertUpdateVisible(dlg)
end