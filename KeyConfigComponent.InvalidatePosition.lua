return function (self) 
local registeredKey = {}
local registeredSystemKey = {}

-- 재등록
---@type table<KeyboardKey, FuncKey>
local settings = self:GetKeyTable()
for key,func in pairs(settings) do
	registeredKey[key] = true
	---@type table<Entity>
	local keyEntities = self.Keys[key]
	if (keyEntities == nil) then continue end
	for _,keyEntity in ipairs(keyEntities) do
		self:UpdateIcon(keyEntity, func)
	end
	if (func.FuncType == _FuncKeyTypes.System) then
		registeredSystemKey[func.Id] = true
	end
end

-- 없는 키 비활성화
for key,entities_ in pairs(self.Keys) do
	if (registeredKey[key] ~= nil) then continue end
	---@type table<Entity>
	local entities = entities_
	for _,entity in ipairs(entities) do
		self:UpdateIcon(entity, nil)
	end
end

-- 등록 안된 시스템기능 Placeholder 활성화
for funcId,entity in pairs(self.SystemPlaceholders) do
	if (registeredSystemKey[funcId] ~= nil) then
		entity.KeyConfigPlaceholderComponent:SetEnabled(false)
	else
		entity.KeyConfigPlaceholderComponent:SetEnabled(true)
	end
end
end