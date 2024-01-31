return function (self,type,id) 
local function CheckUpdateKey(key, func)
	if (func == nil) then return end
	if (func.FuncType == type and func.Id == id) then
		---@type table<Entity>
		local keyEntities = self.Keys[key]
		if (keyEntities == nil) then return end
		if (type == _FuncKeyTypes.Item) then
			local itemCount = _InventoryLogic:GetItemCount(_UserService.LocalPlayer.WsCharacterData, id)
			for _,keyEntity in ipairs(keyEntities) do
				local keyConfig = keyEntity.KeyConfigElementComponent.ItemNo
				keyConfig.ItemNoComponent.Value = itemCount
				keyConfig.ItemNoComponent:Render()
			end
		elseif (type == _FuncKeyTypes.Skill) then
			for _,keyEntity in ipairs(keyEntities) do
				local keyConfig = keyEntity.KeyConfigElementComponent
				keyConfig:Render(func)
			end
		end
	end
end

---@type table<KeyboardKey, FuncKey>
local settings = self:GetKeyTable()

if (self.EnableInHierarchy) then
	for key,func in pairs(settings) do
		CheckUpdateKey(key, func)
	end
else
	CheckUpdateKey(KeyboardKey.LeftShift, settings[KeyboardKey.LeftShift])
	CheckUpdateKey(KeyboardKey.Insert, settings[KeyboardKey.Insert])
	CheckUpdateKey(KeyboardKey.Home, settings[KeyboardKey.Home])
	CheckUpdateKey(KeyboardKey.PageUp, settings[KeyboardKey.PageUp])
	CheckUpdateKey(KeyboardKey.LeftControl, settings[KeyboardKey.LeftControl])
	CheckUpdateKey(KeyboardKey.Delete, settings[KeyboardKey.Delete])
	CheckUpdateKey(KeyboardKey.End, settings[KeyboardKey.End])
	CheckUpdateKey(KeyboardKey.PageDown, settings[KeyboardKey.PageDown])
end
end