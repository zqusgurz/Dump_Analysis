return function (self,npc,text) 
local dlg = _UtilDlgLogic:GetUtilDlgEx()
local comp = dlg.UtilDlgExComponent
comp:SetNpc(npc)
comp:SetButton(_UtilDlgExButtonType.None)
comp:SetContent(text)
comp:DisableInputField()
comp:UpdateScaleUI()
comp.PreCheckHandler = nil
comp.ButtonHandler = nil
comp.ListHandler = function(button)
	self:OnResponse(button, 0, nil)
end
_UpdateComponentLogic:InsertUpdateVisible(dlg)
end