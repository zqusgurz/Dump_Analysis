return function (self,changeLogs) 
local shopDialog = _AppService:Get().ControlWindowMan.NpcShop.NpcShopComponent
if (not shopDialog:IsVisible()) then
	return
end

for i=1,#changeLogs do
	---@type InventoryOperation
	local changeLog = changeLogs[i]
	if (changeLog.Type == _ChangeLogType.Removed or changeLog.Type == _ChangeLogType.Number) then
		if (changeLog.Type == _ChangeLogType.Number) then
			shopDialog:OnUpdateSoldItem(changeLog.TI, changeLog.Position, true)
		else
			shopDialog:OnUpdateSoldItem(changeLog.TI, changeLog.Position, false)
		end
	end
end
end