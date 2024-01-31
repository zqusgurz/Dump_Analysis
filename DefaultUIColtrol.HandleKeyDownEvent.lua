return function (self,event) 
--------------- Native Event Sender Info ----------------
-- Sender: InputService
-- Space: Client
---------------------------------------------------------

-- Parameters
local key = event.key
---------------------------------------------------------
local abc = _EntityService:GetEntityByPath("/ui/DefaultGroup/PartyDefault")
local scroll = _EntityService:GetEntityByPath("/ui/DefaultGroup/WoodButtonUI/Menu_Panel/ScrollList")
local info = _EntityService:GetEntityByPath("/ui/UIGroup/Model_EmptyEntity/PartyInfo")
if key == KeyboardKey.P then
    scroll:GetChildByName("4"):SendEvent(ButtonClickEvent())
elseif key == KeyboardKey.M and info.Enable then
    info:GetChildByName("PartyUITitle"):GetChildByName("Create"):SendEvent(ButtonClickEvent())
elseif abc.Enable and key == KeyboardKey.I then
    abc:GetChildByName("Button2"):SendEvent(ButtonClickEvent())
end
end