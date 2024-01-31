return function (self,npc,text,buttonType) 
local dlg = _UtilDlgLogic:GetUtilDlgEx()
local comp = dlg.UtilDlgExComponent
comp:SetNpc(npc)
comp:SetButton(buttonType)
comp:SetContent(text)
comp:DisableInputField()
comp:UpdateScaleUI()
comp.PreCheckHandler = nil
comp.ButtonHandler = function(button)
	self:OnResponse(button, 0, nil)
end
comp.ListHandler = nil
_UpdateComponentLogic:InsertUpdateVisible(dlg)
end