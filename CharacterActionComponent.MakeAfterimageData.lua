return function (self,actionId,masteryLevel) 
local afterImage = self.CurrentWeaponAfterImage
local actionName = _CharacterAction:GetActionString(actionId)
local actionData = _CharacterActionLogic:GetActionData(actionName)
local afterImageData = _AfterImageLogic:GetAfterImage(afterImage, actionName, masteryLevel)
local after = self.AfterImage
if (self:IsClient()) then
	after.TriggerComponent.Enable = true
end
return afterImageData
end