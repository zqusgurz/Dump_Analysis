return function (self) 
if (self.ActiveShortcutMenu) then
	return self.ActiveShortcutMenu.Enable
end
return false
end