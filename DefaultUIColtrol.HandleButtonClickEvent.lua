return function (self,event) 
--------------- Native Event Sender Info ----------------
-- Sender: ButtonComponent
-- Space: Client
---------------------------------------------------------

-- Parameters
local Entity = event.Entity
---------------------------------------------------------
local panel = _EntityService:GetEntityByPath("/ui/DefaultGroup/WoodButtonUI")
panel.Enable = not panel.Enable
end