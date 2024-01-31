return function (self,npcIndex,s) 
local function send(index)
	if (index <= 0 or index > #s) then
		return
	end
	local dlg = _UtilDlgLogic:GetUtilDlgEx()
	dlg.UtilDlgExComponent:SetNpc(npcIndex)
	if (index == 1) then
		if (#s == 1) then
			dlg.UtilDlgExComponent:SetButton(_UtilDlgExButtonType.Ok)
		else
			dlg.UtilDlgExComponent:SetButton(_UtilDlgExButtonType.Next)
		end
	elseif (index == #s) then
		dlg.UtilDlgExComponent:SetButton(_UtilDlgExButtonType.PrevOk)
	else
		dlg.UtilDlgExComponent:SetButton(_UtilDlgExButtonType.PrevNext)
	end
	local content = s[index]
	dlg.UtilDlgExComponent:SetContent(_UtilLogic:Replace(_UtilLogic:Replace(content, "\\r\\r", "\n"), "\\r", ""))
	dlg.UtilDlgExComponent:DisableInputField()
	dlg.UtilDlgExComponent:UpdateScaleUI()
	dlg.UtilDlgExComponent.PreCheckHandler = nil
	dlg.UtilDlgExComponent.ButtonHandler = function(button)
		if (button == -1) then
			return
		end
		if (button == 0) then
			send(index - 1)
		elseif (button == 1) then
			send(index + 1)
		end
	end
	dlg.UtilDlgExComponent.ListHandler = nil
	_UpdateComponentLogic:InsertUpdateVisible(dlg)
end

send(1)
end