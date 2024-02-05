return function (self,mem) 
local element = _SpawnService:SpawnByModelId("model://f681ee98-dcdc-4ee7-bfe5-62e0e4c4a1a1", "MemberElement",  Vector3.zero, self.MemberListRoot)
element.PartyHPMemberElementComponent.CharacterId = mem.Id
element.PartyHPMemberElementComponent.Name.Text = mem.CharacterName
table.insert(self.MemberListEntities, element)
self:ResizeControlSize()
end