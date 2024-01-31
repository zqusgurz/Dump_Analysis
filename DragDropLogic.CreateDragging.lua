return function (self,type,from,obj,icon) 
local entity = _SpawnService:SpawnByModelId(
	"model://7bf96308-9581-4698-934d-ad84087a2c09", "Draggable", Vector3.zero, _DragDropLogic.CursorGroup)
local draggingComp = entity.DraggingComponent
draggingComp.Created = _UtilLogic.ElapsedSeconds
draggingComp.ObjectType = type
draggingComp.From = from
draggingComp.HoldingObject = obj
local sprite = from.SpriteGUIRendererComponent
if (isvalid(icon)) then
	entity.SpriteGUIRendererComponent.ImageRUID = icon.ImageRUID
end
_EntityUtils:CheckUIMemory(entity, true, -1)
return draggingComp
end