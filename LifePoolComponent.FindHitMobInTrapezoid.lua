return function (self,x0,x1,x2,y,r,output,left,finalBoxShape) 
local rcAttack = {}

--[[
  x1: Max X (X + ShootRange)
  x2: Max X (X + levelData.range/100)
]]

---@type BoxShape
local boxShape = finalBoxShape
local simulator = _CollisionService:GetSimulator(self.Entity)

local i = 1
while x1 < x2 do
    local range = x2 - x1
    local height = x1 / r
    ---@type BoxShape
    local box = _UserSkillLogic:MakeBoxShape(Vector2(x0, y), Vector2(0, -0.5), Vector2(range, height*2), left)
    --log(string.format("Trapezoid Box pos:%.2f, %.2f  size:%.2f, %.2f", 
    --        box.Position.x, box.Position.y, box.Size.x, box.Size.y))
    --_UserService.LocalPlayer.EffectDisplayerComponent:DrawBoxShape(i, box)
    local temp = {}
    local hit = simulator:OverlapAllFast(CollisionGroups.MapleMob, box, temp)
	
	local function filterOnlyLiveMobs(hit, temp, output)
		if (hit > 0) then
			local count = 0
			for i=1,#temp do
				---@type TriggerComponent
				local c = temp[i]
				if (not c.Enable) then
					continue
				end
				---@type Entity
				local e = c.Entity
				---@type MobComponent
				local mob = e.MobComponent
				if (mob.DeadType ~= -1) then
					continue
				end
				count += 1
				output[#output + 1] = mob
			end
			if (count > 0) then
				return count
			end
		end
		return 0
	end
	
    local count = filterOnlyLiveMobs(hit, temp, output)
    if (count > 0) then
		if (boxShape ~= nil) then
			boxShape.Angle = box.Angle
	        boxShape.Size = box.Size
	        boxShape.Position = box.Position
		end
        return count
    end
	x1 += 0.2
	if (left) then
		x0 -= 0.2
	else
		x0 += 0.2	
	end
    i += 1
end

return 0
end