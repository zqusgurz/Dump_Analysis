return function (self,mob) 
local ai = mob.MobAIComponent
local kb = mob.MobKnockbackComponent
local rb = mob.MobRigidbodyComponent
if (not isvalid(rb)) then
	if (isvalid(ai)) then
		ai:EnableNextControlTimer(0.1)
	end
	return
end
local fh = rb.LastFoothold
if (fh == 0) then
	--log("last foothold is 0")
	ai:EnableNextControlTimer(0.1)
	return
end
local target = ai.Target
local nextAction = 0
local inputX = nil
local mobX = mob.TransformComponent.WorldPosition.x
if (isvalid(target) and ai.LocalUnchaseTick < 7) then
	nextAction = _GlobalRand32:RandomIntegerRange(1000, 1600) / 1000
	local targetX = target.TransformComponent.WorldPosition.x
	inputX = targetX > mobX and 1 or -1
else
	nextAction = (_GlobalRand32:RandomIntegerRange(1000, 3000) / 1000)
	inputX = _GlobalRand32:RandomIntegerRange(-1, 1)
end

local platforms = mob.CurrentMap.PlatformInfoComponent
local platform = platforms.FootholdToPlatform[fh]
local elapse = 0.09
local state = {
	Position = mobX, 
	Velocity = rb.RealMoveVelocity.x
}
local timelines = {}
local timelineIndex = 0
--log("platform left x (fh=%d)", platform.left.x, platform.left.foothold.Id)
--log("platform right x (fh=%d)", platform.right.x, platform.right.foothold.Id)
local lastTimeline = 0
local playerFh = _UserService.LocalPlayer.WsUserController.LastFoothold
if (playerFh == 0 or platforms.ZMass[playerFh] ~= ai.LocalStartChaseZMass) then
	ai.LocalUnchaseTick += 1
end

local function makeCommand(cmd, value, timeline)
	timelines[timelineIndex + 1] = {cmd, value, timeline - lastTimeline}
	timelineIndex += 1
	lastTimeline = timeline
end

kb:SetShoeAttr(0)

if (inputX ~= nil) then
	
	-- Start Make Command
	local map = mob.CurrentMap
	local mass = rb.Mass
	local fhDrag, footholdforce
	local sin1, vMaxL
	local hd = 1
	local walkAcc
	local fSlip
	local drag2 = 0
	
	if (fh ~= 0) then
		local foothold = map.FootholdComponent:GetFoothold(fh)
		local fhOwner = _EntityService:GetEntity(foothold.OwnerId)
		if (isvalid(fhOwner.TileMapComponent)) then
			fhDrag = fhOwner.TileMapComponent.FootholdDrag
			footholdforce = fhOwner.TileMapComponent.FootholdForce
		else
			fhDrag = fhOwner.CustomFootholdComponent.FootholdDrag
			footholdforce = fhOwner.CustomFootholdComponent.FootholdForce
		end
		sin1 = math.abs((foothold.EndPoint.y - foothold.StartPoint.y) / foothold.Length)
		vMaxL = sin1 * sin1
		if (foothold.Variance.y <= 0) then
		    hd = -1
		end
	else
		fhDrag = 1
		footholdforce = 0
		sin1 = 0
		vMaxL = 0
	end
	if (fhDrag == 1 and footholdforce == 0) then
	    fSlip = true
	    walkAcc = rb.WalkAcceleration
	else
	    fSlip = false
	    walkAcc = 1
	end
	local walkForce = _Physics.WalkForce
	local fs = map.MapInfoComponent.Fs
	local swimSpeedDec = _Physics.SwimSpeedDec
	local abs = math.abs
	local walkSpeed = rb.WalkSpeed
	local physicsWalkSpeed = _Physics.WalkSpeed
	local walkDrag
	if (fSlip) then
	    walkDrag = rb.WalkDrag
	else
	    walkDrag = 1
	end
	local physicsMaxFriction = _Physics.MaxFriction
	local physicsMinFriction = _Physics.MinFriction
	local walkSlant = rb.WalkSlant
	local physicsWalkDrag = _Physics.WalkDrag
	local slipForce = _Physics.SlipForce
	local slipSpeed = _Physics.SlipSpeed
	
	---@param mob Entity
	---@param fh integer
	---@param inputX integer
	---@param state table
	---@param swimming boolean
	---@param sec number
	local function calcWalk(mob,fh,inputX,state,swimming,sec)
		local v
		if (fh ~= 0) then
			v = state.Velocity
		else
			v = state.Velocity.x
		end
		local v70 = -1
		local drag = walkAcc * (walkForce * fs) --  * pAttrFoothold.walk
		local f = inputX * drag
		if (swimming) then
		    f = swimSpeedDec * f
		end
		local v11
		if (footholdforce == 0) then
		    if (inputX * f > 0) then
		        v11 = f
		    end
		elseif (inputX ~= 0) then
		    local v10 = abs(footholdforce)
		    if (inputX * footholdforce <= 0) then
		        v11 = 0.2 / v10 * f
		    else
		        v11 = (v10 + v10) * f
		    end
		else
		    v11 = footholdforce * drag
		end
		local v12
		if (hd <= 0) then
		    v12 = vMaxL + 1
		else
		    v12 = 1 - vMaxL
		end
		f = v11 * v12
		local pa = walkSpeed * physicsWalkSpeed -- * pAttrFoothold.walk
		if (swimming) then
		    pa = swimSpeedDec * pa
		end
		if (footholdforce ~= 0) then
		    local v18
		    if (inputX ~= 0) then
		        local v17 = abs(footholdforce)
		        if (inputX * footholdforce <= 0) then
		            v18 = 0.2 / v17
		        else
		            v18 = v17 + v17
		        end
		    else
		        v18 = abs(footholdforce)
		    end
		    pa = v18 * pa
		end
		local maxFriction = walkDrag * fs * fhDrag
		if (maxFriction > physicsMaxFriction) then
		    maxFriction = physicsMaxFriction
		end
		if (maxFriction < physicsMinFriction) then
		    maxFriction = physicsMinFriction
		end
		if (maxFriction < 1) then
		    maxFriction = 0.5 * maxFriction
		end
		
		-- For Player
		--if (state.SlideCount > 0) then
		--    if (maxFriction > state.ShortDrag) then
		--        maxFriction = state.ShortDrag
		--    end
		--    state.SlideCount = state.SlideCount - elapse
		--end
		
		local v33 = 0
		local v27 = physicsWalkDrag * (maxFriction == 0 and 0.2 or maxFriction)
		local fa = math.max(0, pa)
		local v35
		if (sin1 == 0) then
		    v = self:DecSpeed(v, v27, mass, pa, sec)
		    if (inputX ~= 0 or footholdforce ~= 0) then
		        v = self:AccSpeed(v, f, mass, pa, sec)
		        goto NEXT
		    end
		    v = self:DecSpeed(v, v27, mass, 0, sec)
		    goto NEXT
		end
		if (hd * v <= 0) then
		    v33 = (vMaxL + 1) * pa
		end
		v = self:DecSpeed(v, v27, mass, v33, sec)
		if (sin1 > walkSlant) then
		    local fb = slipForce * sin1 * -hd
		    local vb = sin1 * slipSpeed
		    if (hd * inputX <= 0) then
		        if (inputX ~= 0 or footholdforce ~= 0) then
		            fb = fb + f
		            vb = vb + v33
		        end
		    else
		        fb = fb * 0.5
		        vb = vb * 0.5
		    end
		    if (hd * v > 0) then
		        v = self:DecSpeed(v, v27, mass, 0, sec)
		    end
		    v = self:AccSpeed(v, fb, mass, vb, sec)
		    goto NEXT
		end
		if (maxFriction == 0) then
		    f = f - sin1 * slipForce * hd
		end
		if (inputX == 0 and maxFriction ~= 0 and footholdforce == 0) then
		    v = self:DecSpeed(v, drag, mass, 0, sec)
		    goto NEXT
		end
		if (hd * f <= 0) then
		    v35 = v33
		else
		    v35 = fa
		end
		v = self:AccSpeed(v, f, mass, v35, sec)
		
		::NEXT::
		if (fh ~= 0) then
			state.Position += ((state.Velocity + v) / 100) * 0.5 * sec
			state.Velocity = v
		else
			state.Position.x += ((state.Velocity.x + v) / 100) * 0.5 * sec
			state.Velocity.x = v
		end
	
	--log(string.format("Velocity: %.2f  Position: %.2f", state.Velocity, state.Position))
	end
	
	local actionPartMove = _MobActionPartType.Move
	makeCommand(actionPartMove, inputX, 0)
	if (inputX ~= 0) then
		while (elapse < nextAction) do
			calcWalk(mob, fh, inputX, state, false, 0.09)
			local x = state.Position
			if (inputX < 0) then
				if (x < platform.left.x + 0.1) then
					inputX = 1
					makeCommand(actionPartMove, inputX, elapse)
				end
			else
				if (platform.right.x - 0.1 < x) then
					inputX = -1
					makeCommand(actionPartMove, inputX, elapse)
				end
			end
			elapse += 0.09
		end
	end
end

if (timelineIndex > 0) then
	mob.CurrentMap.LifeControllerComponent:RequestControl(mob, timelines, timelineIndex, false)
end
ai:EnableNextControlTimer(nextAction)
end