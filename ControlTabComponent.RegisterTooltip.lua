return function (self,lt,rb,title,desc) 
if (_UtilLogic:IsNilorEmptyString(title) or _UtilLogic:IsNilorEmptyString(desc)) then
	return
end

local obj = _SpawnService:SpawnByModelId("model://uisprite", "TooltipBox", Vector3.zero, self.Entity)
_EntityUtils:PrepareForGUI(obj)
obj:AddComponent(UITouchReceiveComponent)
---@type QuickTooltipComponent
local qt = obj:AddComponent(QuickTooltipComponent)
qt:SetData(lt, rb, title, desc)
obj.SpriteGUIRendererComponent.Color.a = 0
return obj
end