return function (self,life) 
local x = life.TransformComponent.WorldPosition.x
local hit = life.TriggerComponent.BoxSize.x / 2
if (isvalid(life.MobComponent)) then
	if (life.MobComponent:IsFacingLeft()) then
		x = x - hit
	else
		x = x + hit
	end
end
return x
end