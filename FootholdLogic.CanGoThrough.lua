return function (self,map,startPos,hitPt,originFh) 
local direction = Vector2.Normalize(hitPt - startPos)
local distance = Vector2.Distance(hitPt, startPos)
local fhc = map.FootholdComponent
local allThroughs = fhc:RaycastAll(startPos, direction, distance)
local delta = hitPt - startPos
local getZMass = self.GetZMass
local zMass = originFh == 0 and 0 or getZMass(self, map, originFh)
local pFirstCollide = 1
local qFirstCollide = 2
local firstCollideCW = 0
local firstCollideCCW = 0

-- function cache
local crossProduct = _NumberUtils.CrossProduct
local nu = _NumberUtils
local isBlockedArea = self.IsBlockedArea
local getFoothold = fhc.GetFoothold
local abs = math.abs

for _,fh in ipairs(allThroughs) do
	local fhZMass = getZMass(self, map, fh.Id)
	-- self:IsConnectedEach(map, originFh, fh.Id)
	-- fhZMass == zMass
    --if (fh.Variance.x == 0) then
    --    log(string.format("[%d] originFh: %d  fhZMass: %d  zMass: %d", fh.Id, originFh, fhZMass, zMass))
    --end
	if (fh.Variance.x > 0 or originFh == 0 or fhZMass == 0 or fhZMass == zMass) then -- 원래는 IsConnectedEach 대신 fhZMass == zMass
		local ground = fh.EndPoint - fh.StartPoint
		local c1 = crossProduct(nu, ground, startPos - fh.StartPoint)
		local c2 = crossProduct(nu, ground, hitPt - fh.StartPoint)
		if (c1 <= 0 and c2 >= 0 and (c1 ~= 0 or c2 ~= 0)) then
			local c3 = crossProduct(nu, hitPt - startPos, fh.StartPoint - startPos)
			local c4 = crossProduct(nu, hitPt - startPos, fh.EndPoint - startPos)
			if (c3 < 0 and c4 < 0) then
				continue
			end
			if (c3 <= 0 or c4 <= 0) then
				local prevId = 0
				local nextId = 0
				if (c3 ~= 0) then
					if (c4 == 0) then
						nextId = fh.NextFootholdId
						if (nextId == 0 or isBlockedArea(self, map, fh.Id, nextId, hitPt)) then
							continue
						end
						prevId = fh.Id
					else
						prevId = fh.Id
						nextId = fh.Id
					end
				else
					prevId = fh.PreviousFootholdId
					if (prevId == 0 or isBlockedArea(self, map, prevId, fh.Id, hitPt)) then
						continue
					end
					nextId = fh.Id
				end
				
				local v23 = abs(crossProduct(nu, delta, ground))
				local v24 = abs(crossProduct(nu, ground, startPos) + crossProduct(nu, fh.StartPoint, fh.EndPoint))
				local nextFh = getFoothold(fhc, nextId)
                local prevFh = getFoothold(fhc, prevId)
                local firstCollideCWFh = getFoothold(fhc, firstCollideCW)
                local firstCollideCCWFh = getFoothold(fhc, firstCollideCCW)
				
				local v25 = qFirstCollide * v23 - pFirstCollide * v24
				
				if v25 == 0 then
				    local k1a = nextFh.StartPoint - firstCollideCWFh.StartPoint
					local k1b = firstCollideCWFh.EndPoint - firstCollideCWFh.StartPoint
					local k2a = prevFh.EndPoint - firstCollideCCWFh.StartPoint
					local k2b = firstCollideCCWFh.EndPoint - firstCollideCCWFh.StartPoint
					
					local value1 = crossProduct(nu, k1b, k1a)
					local value2 = crossProduct(nu, k2b, k2a)
			        
					if value1 < 0 then
			            firstCollideCW = nextFh.Id
			        end
			
			        if value2 < 0 then
			            firstCollideCCW = prevFh.Id
			        end
				elseif (v25 > 0) then
				    pFirstCollide = v23
				    qFirstCollide = v24
				    firstCollideCW = nextFh.Id
				    firstCollideCCW = prevFh.Id
				end
			end
		end
	end
end
if (firstCollideCW ~= 0 and firstCollideCCW ~= 0) then
    local scaleFactor = qFirstCollide / pFirstCollide
    local collisionPos = delta * scaleFactor + startPos
	hitPt.x = collisionPos.x
	hitPt.y = collisionPos.y
	return false
end
return true
end