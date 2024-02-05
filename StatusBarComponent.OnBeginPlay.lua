return function (self) 
_EntityUtils:ExecuteOnCreateChildren(self.Entity)

if (not self.Mobile) then
	local quickslots = self.QuickslotIcons
	table.insert(quickslots, _EntityService:GetEntityByPath("/ui/StatusBar/Quickslot/Delete").KeyConfigElementComponent)
	table.insert(quickslots, _EntityService:GetEntityByPath("/ui/StatusBar/Quickslot/End").KeyConfigElementComponent)
	table.insert(quickslots, _EntityService:GetEntityByPath("/ui/StatusBar/Quickslot/Home").KeyConfigElementComponent)
	table.insert(quickslots, _EntityService:GetEntityByPath("/ui/StatusBar/Quickslot/Insert").KeyConfigElementComponent)
	table.insert(quickslots, _EntityService:GetEntityByPath("/ui/StatusBar/Quickslot/LeftControl").KeyConfigElementComponent)
	table.insert(quickslots, _EntityService:GetEntityByPath("/ui/StatusBar/Quickslot/LeftShift").KeyConfigElementComponent)
	table.insert(quickslots, _EntityService:GetEntityByPath("/ui/StatusBar/Quickslot/PageDown").KeyConfigElementComponent)
	table.insert(quickslots, _EntityService:GetEntityByPath("/ui/StatusBar/Quickslot/PageUp").KeyConfigElementComponent)
end

_ScreenResolutionLogic.CreateUIReadyFlag = _ScreenResolutionLogic.CreateUIReadyFlag | _Constants.CreateFlag_StatusBar
end