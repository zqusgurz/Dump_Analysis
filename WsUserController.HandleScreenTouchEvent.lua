return function (self,event) 
if (not _InputService:IsPointerOverUI()) then
	local st = _AppService:Get():GetStatusBar()
	if (st:IsEnabledShortcut()) then
		st:SetShortcut(st.ShortcutButton, false)
	end
end
end