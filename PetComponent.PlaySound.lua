return function (self,action) 
local sound = _UidMan:Get(string.format("Sound/Pet.img/%07d/%s", self.TemplateId, action))
if (not _UtilLogic:IsNilorEmptyString(sound)) then
	_SoundService:PlaySoundAtPos(sound, self.Entity.TransformComponent.WorldPosition, _UserService.LocalPlayer, 1)
end
end