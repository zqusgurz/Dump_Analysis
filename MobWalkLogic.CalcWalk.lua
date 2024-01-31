return function (self,mob,fh,inputX,state,swimming,sec) 
local map = mob.CurrentMap
local rb = mob.MobRigidbodyComponent
local mass = rb.Mass
local walkAcc
local fhDrag, footholdforce, sin1, vMaxL
local hd = 1
local v
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
	v = state.Velocity
else
	fhDrag = 1
	footholdforce = 0
	sin1 = 0
	vMaxL = 0
	v = state.Velocity.x
end

local fSlip
local drag2 = 0
if (fhDrag == 1 and footholdforce == 0) then
    fSlip = true
    walkAcc = rb.WalkAcceleration
else
    fSlip = false
    walkAcc = 1
end
local v70 = -1
local drag = walkAcc * (_Physics.WalkForce * map.MapInfoComponent.Fs) --  * pAttrFoothold.walk
local f = inputX * drag
if (swimming) then
    f = _Physics.SwimSpeedDec * f
end
local v11
if (footholdforce == 0) then
    if (inputX * f > 0) then
        v11 = f
    end
elseif (inputX ~= 0) then
    local v10 = math.abs(footholdforce)
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
local pa = rb.WalkSpeed * _Physics.WalkSpeed -- * pAttrFoothold.walk
if (swimming) then
    pa = _Physics.SwimSpeedDec * pa
end
if (footholdforce ~= 0) then
    local v18
    if (inputX ~= 0) then
        local v17 = math.abs(footholdforce)
        if (inputX * footholdforce <= 0) then
            v18 = 0.2 / v17
        else
            v18 = v17 + v17
        end
    else
        v18 = math.abs(footholdforce)
    end
    pa = v18 * pa
end
local walkDrag
if (fSlip) then
    walkDrag = rb.WalkDrag
else
    walkDrag = 1
end
local maxFriction = walkDrag * map.MapInfoComponent.Fs * fhDrag
if (maxFriction > _Physics.MaxFriction) then
    maxFriction = _Physics.MaxFriction
end
if (maxFriction < _Physics.MinFriction) then
    maxFriction = _Physics.MinFriction
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

local walkSlant = rb.WalkSlant
local v33 = 0
local v27 = _Physics.WalkDrag * (maxFriction == 0 and 0.2 or maxFriction)
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
    local fb = _Physics.SlipForce * sin1 * -hd
    local vb = sin1 * _Physics.SlipSpeed
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
    f = f - sin1 * _Physics.SlipForce * hd
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