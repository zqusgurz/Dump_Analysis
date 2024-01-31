return function (self) 
local path = "/maps/Login/CharacterSelection/Characters"
local parent = _EntityService:GetEntityByPath(path)

for i=1,self.Max do
	local newPos = Vector3(-2.3, -1.7, 0) + Vector3(i-1, 0, 0)
	local entity = _SpawnService:SpawnByModelId("model://13259a46-a7a6-4b11-9564-e93aafc9ab8d", string.format("Character%d", i), Vector3(0, 0, 10000), parent)
	entity.TransformComponent.Position = newPos
	
	local entry = entity.CharacterSelectEntryComponent
	
	-- 임시
	entry:SetData(nil)
	
	entry.Avatar:ConnectEvent(TouchEvent, function()
		self:OnTouched(entity)
	end)
	
	self.Entries[i] = entity
end
self.CreateButton:ConnectEvent(ButtonClickEvent, function()
	self:OnCreateCharacter()		
end)
self.StartButton:ConnectEvent(ButtonClickEvent, function()
	self:OnGameStart()		
end)
self.DeleteButton:ConnectEvent(ButtonClickEvent, function()
	self:OnDeleteCharacter()		
end)
self:UpdateSignboardButton()
end