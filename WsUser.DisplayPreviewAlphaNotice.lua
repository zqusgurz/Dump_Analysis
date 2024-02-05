return function (self) 
local text = _StringMan:GetString("Notice")
local dlg = _UtilDlgLogic:GetUtilDlgEx().UtilDlgExComponent
dlg:SetNpc(9010000)
dlg:SetButton(_UtilDlgExButtonType.Ok)
dlg:SetContent(text)
dlg:DisableInputField()
dlg:UpdateScaleUI()
dlg.PreCheckHandler = nil
dlg.ButtonHandler = nil
dlg.ListHandler = nil
_UpdateComponentLogic:InsertUpdateVisible(dlg.Entity)
end