return function (self) 
local rb = self.Entity.AdvancedRigidbodyComponent
local template = _NpcTemplateMan:GetNpcTemplate(self.NpcTemplateID)

local totalSpeed = template.Speed

if (template.Move) then
	rb.WalkSpeed = math.min(140, math.max(10, totalSpeed)) / 100
else
	rb.WalkSpeed = 0
end

rb.WalkDrag = 2
end