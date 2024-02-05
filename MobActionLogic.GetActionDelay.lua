return function (self,action,key) 
local mob = action.ParentComponent.Entity.MobComponent
---@type MobTemplate
local template = mob.Template
return _UtilLogic.ServerElapsedSeconds + template.TotalAnimationTimes[key]
end