return function (self,b) 
self.Disabled = b
self.NameText.Enable = not b
local prefix = "/ui/LoginUIGroup/CharacterCreationUI/Creation/Board/"
_EntityService:GetEntityByPath(prefix .. "BtOk").FunctionButtonComponent:SetInteractible(not b)
_EntityService:GetEntityByPath(prefix .. "BtCancel").FunctionButtonComponent:SetInteractible(not b)
end