return function (self) 
for _,e in ipairs(self.Entity.Children) do
	if (e.EnabledInHierarchy) then
		local dlg = e.UtilDlgExComponent
		if (isvalid(dlg)) then
			dlg:EndChat()
		end
	end
end
end