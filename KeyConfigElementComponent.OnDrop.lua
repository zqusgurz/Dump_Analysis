return function (self,obj) 
local d = obj.DraggingComponent
local keyConfig = _AppService:Get().ControlWindowMan.KeyConfig.KeyConfigComponent
local k = KeyboardKey.CastFrom(self.KeyType)
if (d.ObjectType == _DraggableObjectType.FuncKey) then
	---@type FuncKey
	local func = d.HoldingObject
	local newFunc = {FuncType = func.FuncType, Id = func.Id}
	keyConfig:EnsureNotDuplicated(func)
	keyConfig:GetKeyTable()[k] = newFunc
	if (not keyConfig:IsVisible()) then
		keyConfig:SaveFuncKey()
	end
elseif (d.ObjectType == _DraggableObjectType.Item) then
	---@type DraggableItem
	local item = d.HoldingObject
	if (item.LinkedTI ~= 2) then
		--log(string.format("TI %d is not 2", item.LinkedTI))
		return
	end
	local itemSlot = _UserService.LocalPlayer.WsCharacterData:GetItem(2, item.LinkedPos)
	if (itemSlot == nil) then
		--log(string.format("TI %d, Pos %d is nil", 2, item.LinkedPos))
		return
	end
	if (not _ConsumeItemType:CanRegisterKeyConfig(itemSlot.ItemId)) then
		--log(string.format("%d item is not statechange", itemSlot.ItemId))
		return
	end
	---@type FuncKey
	local f = {FuncType = _FuncKeyTypes.Item, Id = item.ItemId}
	keyConfig:EnsureNotDuplicated(f)
	keyConfig:GetKeyTable()[k] = f
	if (not keyConfig:IsVisible()) then
		keyConfig:SaveFuncKey()
	end
elseif (d.ObjectType == _DraggableObjectType.Skill) then
	---@type FuncKey
	local func = d.HoldingObject
	keyConfig:EnsureNotDuplicated(func)
	keyConfig:GetKeyTable()[k] = func
	if (not keyConfig:IsVisible()) then
		keyConfig:SaveFuncKey()
	end
elseif (d.ObjectType == _DraggableObjectType.FuncSystemKeyPlaceholder) then
	---@type FuncKey
	local func = d.HoldingObject
	keyConfig:EnsureNotDuplicated(func)
	keyConfig:GetKeyTable()[k] = func
	if (not keyConfig:IsVisible()) then
		keyConfig:SaveFuncKey()
	end
end

keyConfig.Changed = true
--_SoundService:PlaySound(_DragDropLogic.DragDropSounds["DragEnd"], 1)
keyConfig:InvalidatePosition()
end