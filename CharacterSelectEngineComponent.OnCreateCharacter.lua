return function (self) 
if (self.Disabled or self.LoginEngine.MoveStepTween ~= nil) then
	return
end
local currentCreatedChara = self:GetCreatedCharacters()
if (currentCreatedChara >= self.CharacterSlot) then
	self.LoginEngine:OnCheckLoginResult(_LoginError.NoMoreCharacter)
	return
end
self.LoginEngine:MoveToStep(2)
self.CharacterCreationEngine:ResetCreation()
self.CharacterCreationEngine:UpdateAvatarLook()
end