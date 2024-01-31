return function (self,mob,hitByLeft,knockbackType) 
local kb = mob.MobKnockbackComponent
local ai = mob.MobAIComponent
local rb = mob.MobRigidbodyComponent

local map = mob.CurrentMap
local boundLt, boundRb = map.MapComponent:GetBound()
local minX = boundLt.x + 0.1
local maxX = boundRb.x - 0.1
local mobPos = mob.TransformComponent.WorldPosition:ToVector2()
local sqrt = math.sqrt

local elapse = 0
local knockbackMoveEnd
local interruptedEnd
if (knockbackType == 2) then 
	knockbackMoveEnd = 0.5	
	interruptedEnd = 0.7 
else 
	knockbackMoveEnd = 0.1
	interruptedEnd = 0.5
end

local timelines = {}
local timelineIndex = 0
local currentX = mobPos.x
local currentY = mobPos.y

local function makeDistance(x1, y1, x2, y2)
	return sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1))
end

kb:SetShoeAttr(knockbackType)
local knockbackSpeed = rb.WalkSpeed * _Physics.FlySpeed / 100

---@param destX number
---@param destY number
---@param floating boolean
---@return number
local function makeFlyCommand(cmd, destX, destY, floating)
	local distance = makeDistance(currentX, currentY, destX, destY) 
	currentX = destX
	currentY = destY
	local duration = distance / knockbackSpeed
	timelines[timelineIndex + 1] = {cmd, {destX, destY, duration, floating}, 0}
	timelineIndex += 1
	return duration
end
local function makeCommand(cmd, value, nextTime)
	timelines[timelineIndex + 1] = {cmd, value, nextTime}
	timelineIndex += 1
end

local inputX = 1
if (hitByLeft) then
	inputX = -1
end

makeCommand(_MobActionPartType.HitMotion, 1, 0)

local knockbackDestX = mobPos.x
local delta = knockbackSpeed * knockbackMoveEnd
if (inputX < 0) then
	knockbackDestX = math.max(minX, mobPos.x - delta)
else
	knockbackDestX = math.min(maxX, mobPos.x + delta)
end

if (mobPos.x ~= knockbackDestX) then
	mobPos.y += 0.02
	makeCommand(_MobActionPartType.KnockbackPos, mobPos, 0)
	makeFlyCommand(_MobActionPartType.KnockbackFly, knockbackDestX, mobPos.y, false)
end

makeCommand(_MobActionPartType.HitMotion, 0, interruptedEnd)

if (timelineIndex > 0) then
	map.LifeControllerComponent:RequestControl(mob, timelines, timelineIndex, true)
end
ai:EnableNextControlTimer(interruptedEnd)
ai:SetLocalControlUpdate(true, interruptedEnd)
end