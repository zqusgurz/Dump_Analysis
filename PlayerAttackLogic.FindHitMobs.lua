return function (self,user,attackCount,origin,trigger) 
local ac = user.CharacterActionComponent
local targets = {}
local box = _NumberUtils:TriggerToBox(trigger)
user.CurrentMap.LifePoolComponent:FindHitMobInTrigger(origin, trigger, targets)
return self:MakeAttackInfos(attackCount, origin, box, nil, targets, {})
end