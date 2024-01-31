return function (self,obj,defaultDelay) 
---@type AnimationFrameData
local data = self.Animations[obj]

if (data ~= nil) then
	return data
end

--log("parsing anim...")

data = {}

if (self:IsClient()) then
	data.RUID = obj["_ruid"]
end

local spriteSize = Vector2(tonumber(obj["_width"]), tonumber(obj["_height"]))
local originP = _WzUtils:GetVector(obj["origin"])

-- origin 계산	
-- 나누기 100은 Wvs와 MSW간의 좌표 비율. 상수도 지원 안하는 MSW...
local mapleBase = Vector3(spriteSize.x / 2, -spriteSize.y / 2, 0)
data.OriginUI = Vector2(spriteSize.x / 2, -spriteSize.y) + Vector2(-originP.x, originP.y)
data.OriginUIFlip = Vector2(spriteSize.x / 2, -spriteSize.y) + Vector2(-(spriteSize.x - originP.x), originP.y)
data.OriginOffset = (mapleBase + Vector3(-originP.x, originP.y, 0)) / 100
data.OriginOffsetFlip = (mapleBase + Vector3(-(spriteSize.x - originP.x), originP.y, 0)) / 100

-- lt, rb 계산
local lt = _WzUtils:GetVector(obj["lt"]) / 100
local rb = _WzUtils:GetVector(obj["rb"]) / 100
if (lt ~= Vector2.zero and rb ~= Vector2.zero) then
	local ltPos =  Vector3(lt.x, lt.y, 0)
	local rbPos = Vector3(rb.x, -rb.y, 0)
	local boxSize = rbPos - ltPos
	data.CollisionOffset = Vector2(lt.x + (rb.x - lt.x) / 2, (rb.y - lt.y) / 2 - rb.y)
	data.BoxSize = Vector2(boxSize.x, boxSize.y)
--else
--    data.CollisionOffset = (spriteSize / 2 - originP) / 100
--    data.BoxSize = spriteSize / 100
end

-- delay 계산
data.Delay = _WzUtils:GetInt32(obj["delay"], defaultDelay)

data.A0 = _WzUtils:GetInt32(obj["a0"], 255)
data.A1 = _WzUtils:GetInt32(obj["a1"], data.A0)
data.A0 /= 255
data.A1 /= 255
data.SpriteSize = spriteSize

-- 캐싱 저장
_AnimationMan.Animations[obj] = data
return data
end