return function (self,entity) 
local eventControls = entity:GetChildComponentsByTypeName(_Types:Get(IEventControlComponent), true)
for _, pp in ipairs(eventControls) do
    ---@type IEventControlComponent
    local control = pp
    control:OnCreate()
end
end