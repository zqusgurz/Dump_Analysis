return function (self,changeLogs,focus) 
local shopDialog = _AppService:Get().ControlWindowMan.NpcShop.NpcShopComponent
if (not shopDialog:IsVisible()) then
	return
end

local changedTI = 0
local changedPos = 0
for i=1,#changeLogs do
	---@type InventoryOperation
	local changeLog = changeLogs[i]
	if (changeLog.Type == _ChangeLogType.Added or changeLog.Type == _ChangeLogType.Number) then
		changedTI = changeLog.TI
		changedPos = changeLog.Position
		if (changeLog.Type == _ChangeLogType.Number) then
			shopDialog:InvalidateOwnItems(changeLog.TI, changeLog.Position)
		else
			shopDialog:CreateNewOwnItem(changeLog.TI, changeLog.Position)
		end
	end
end
if (changedTI ~= 0 and changedPos ~= 0) then
	shopDialog:OnSelectBoughtItem(changedTI, changedPos, focus)
end
end