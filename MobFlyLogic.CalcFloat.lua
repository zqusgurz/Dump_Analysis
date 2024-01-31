return function (self,entity,fh,inputX,inputY,state,swimming,sec) 
local map = entity.CurrentMap
local rb = entity.AdvancedRigidbodyComponent
local mass = rb.Mass
local floating = fh == 0
local fs = map.MapInfoComponent.Fs
local swim = map.MapInfoComponent.Swim
local drag1 = fs * _Physics.FloatDrag1
local drag2 = fs * _Physics.FloatDrag2
local abs = math.abs
local delta, accShoe
if (swim) then
	accShoe = rb.SwimAcceleration
	delta = rb.SwimSpeedH * _Physics.SwimSpeed
else
	accShoe = rb.FlyAcc
	delta = rb.FlySpeed * _Physics.FlySpeed
end
local vyMax = abs(fs)
local vMax = delta * vyMax
local swimForce
if (swim) then
	swimForce = _Physics.SwimForce
else
	swimForce = _Physics.FlyForce
end
local fx = inputX * swimForce * accShoe * vyMax
local v = state.Velocity.x
local vy = state.Velocity.y
local g = drag1
local min, max = math.min, math.max
v = _MobWalkLogic:DecSpeed(v, g, mass, vMax, sec)
if (inputX ~= 0) then
	v = _MobWalkLogic:AccSpeed(v, fx, mass, vMax, sec)
else
	v = _MobWalkLogic:DecSpeed(v, g, mass, 0, sec)
end
_MobWalkLogic:DecSpeed(vy, g, mass, vMax, sec)
local fDef = swimForce
g = fDef / mass / vyMax * accShoe
if (inputY == 0) then
	vy = _MobWalkLogic:AccSpeed(vy, mass * g, mass, vMax, sec)
elseif (inputY < 0) then
	local v24 = -vMax  -- * -1.5
	if (vy < v24) then
		vy = min(v24, vy + g * 0.5 * sec)
	elseif (vy > v24) then
		vy = max(v24, vy - g * sec)
	end
else
	local v24 = vMax   -- * 0.3
	if (vy > v24) then
		vy = min(v24, vy - g * 0.5 * sec)
	elseif (vy < v24) then
		vy = max(v24, vy + g * sec)
	end
end

state.Position.x += (state.Velocity.x + v) / 100 * 0.5 * sec
state.Position.y += (state.Velocity.y + vy) / 100 * 0.5 * sec
state.Velocity.x = v
state.Velocity.y = vy
end