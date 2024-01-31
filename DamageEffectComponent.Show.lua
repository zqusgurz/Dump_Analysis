return function (self,damageType,value,pos,criticalAttack,orderOffset) 
-- 사용법은 DamageTestComponent 참조

self.Entity.TransformComponent.WorldPosition = pos

local digits = _NumberUtils:DecomposeDigits(value)
local criticalX = criticalAttack and 30 or 0
local last = 0
local lastWidth = 0
local effX = {}

for i,d in ipairs(digits) do
	---@type table
	local obj = damageType[tostring(d)]
	local size = _WzUtils:GetSize(obj)

	local cx = size.x / 2
	lastWidth = size.x
	local x = criticalX + cx - last
	criticalX = criticalX - last + size.x
	effX[i] = x
	last = 3 * cx // 5
end

local totalX = effX[#effX] + lastWidth


local digitObjects = {}
local digitIndex = 1
local leftX = totalX / 200

if (criticalAttack) then
	---@type table
	local effectObj = damageType["effect"]
	local position = pos:Clone()
	position.x -= leftX
	position.x += 0.4
	
	local effect = self:MakeDigit(position, effectObj, 0, orderOffset)
	digitObjects[digitIndex] = effect
	digitIndex += 1
end
for i,d in ipairs(digits) do
	---@type table
	local obj = damageType[tostring(d)]
	local size = _WzUtils:GetSize(obj)

	local position = pos:Clone()
	position.x += (effX[i] / 100 - leftX)
	
	local y = 0
	if (i == 1) then
		y += 0.02
	end
	y += (i % 2 == 0 and 0.01 or 0.04)
	y += (_GlobalRand32:RandomIntegerRange(0, 1) / 100)
	--y += ((size.y - 57) / 100)
	position.y += y
	
	local digit = self:MakeDigit(position, obj, i, orderOffset)
	digitObjects[digitIndex] = digit
	digitIndex += 1

end

self:BeginTween(digitObjects, pos)
end