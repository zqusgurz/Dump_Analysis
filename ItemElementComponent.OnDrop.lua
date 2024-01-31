return function (self,obj) 
local d = obj.DraggingComponent
if (d.ObjectType ~= _DraggableObjectType.Item) then
	return
end

_ControlWindowLogic:SetFocusOnTab(self.Entity)

---@type DraggableItem
local item = d.HoldingObject
local srcPos = item.LinkedPos
local dstPos = self.LinkedItemPos
local player = _UserService.LocalPlayer
local cd = player.WsCharacterData

log(string.format("TI: %d src: %d dst: %d", item.LinkedTI, srcPos, dstPos))

if (item.LinkedTI == 6) then
	return
end
if (not player.WsUser:IsAvailableInventoryOperation()) then
	return
end
if (player.CharacterActionComponent:CheckAlert()) then
	return
end

if (self.LinkedItemTI == 6) then
	self:OnDropToConsumeElement(item, srcPos, dstPos, player, cd)
else
	self:OnDropToItemElement(item, srcPos, dstPos, player, cd)
end
end