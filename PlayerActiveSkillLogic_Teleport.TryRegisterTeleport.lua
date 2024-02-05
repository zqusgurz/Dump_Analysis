return function (self,user,skillId,skillLevel,portal,targetPortal,forced) 
local map = user.CurrentMap
---@type TeleportInfo
local teleportInfo = user.WsUserController.Teleport
local now = _UtilLogic.ElapsedSeconds
if (not forced and teleportInfo ~= nil) then
    if (teleportInfo.Valid or teleportInfo.CoolTimeEnd > now) then
        return false
    end
end
local rb = user.RigidbodyComponent
local currentFh = rb:GetCurrentFoothold()
if (not forced and currentFh == nil) then
    -- log("not on ground")
	return false
end

---@type number, number
local realTargetX, realTargetY = nil, nil
local mapInfo = map.MapInfoComponent
local footholds = map.FootholdComponent
local playerPos = user.TransformComponent.WorldPosition:ToVector2()
if (skillId ~= 0) then
	if (mapInfo:IsUnableToUseSkill()) then
        -- log("unable to use skill map")
		return false
	end
	local levelData = _SkillMan:GetSkillLevelData(skillId, skillLevel)
	if (levelData == nil) then
        -- log("no skill teleport")
		return false
	end
	local keyUp = _InputManager:IsPressed(_FuncKeySystemType.Up) and 1 or 0
	local keyDown = _InputManager:IsPressed(_FuncKeySystemType.Down) and 1 or 0
	local keyLeft = _InputManager:IsPressed(_FuncKeySystemType.Left) and 1 or 0
	local keyRight = _InputManager:IsPressed(_FuncKeySystemType.Right) and 1 or 0
	local dirH = keyRight - keyLeft
	local dirV = keyUp - keyDown
	local teleportRange = levelData.range
	local targetPosX = playerPos.x + dirH * teleportRange / 100
	local targetPosY = playerPos.y + dirV * teleportRange / 100
    --log(string.format("up=%d down=%d left=%d right=%d (dirH:%d dirV:%d teleportRange:%d) | playerPos=%s, targetPos=%s", 
    --        keyUp, keyDown, keyLeft, keyRight,
    --        dirH, dirV, teleportRange,
    --        tostring(playerPos), tostring(Vector2(targetPosX, targetPosY))))
	if (dirH ~= 0) then
		local footholdAbove = footholds:Raycast(Vector2(targetPosX, playerPos.y - 0.01), Vector2.up, 0.8)
		local footholdUnder = footholds:Raycast(Vector2(targetPosX, playerPos.y + 0.01), Vector2.down, 0.8)
		local aboveY = footholdAbove and footholdAbove:GetYByX(targetPosX) or 0
		local underY = footholdUnder and footholdUnder:GetYByX(targetPosX) or 0
		if (footholdUnder ~= nil and footholdAbove ~= nil and 
			(aboveY - playerPos.y <= playerPos.y - underY)) then
			realTargetY = aboveY + 0.01
		elseif (footholdUnder ~= nil) then
			realTargetY = underY + 0.01
		elseif (footholdAbove ~= nil) then
			realTargetY = aboveY + 0.01
		end
		realTargetX = targetPosX
	elseif (dirV ~= 0) then
		local yRange = dirV * teleportRange / 100
		if (dirV > 0) then
			realTargetY = playerPos.y + 0.01
			local footholdAbove = footholds:Raycast(Vector2(playerPos.x, targetPosY + 0.01), Vector2.down, 10)
			if (footholdAbove ~= nil and footholdAbove ~= currentFh) then
				realTargetY = footholdAbove:GetYByX(playerPos.x) + 0.01
			end
		else
			local footholdUnder = footholds:Raycast(Vector2(playerPos.x, targetPosY - 0.01), Vector2.up, 10)
			if (footholdUnder == nil or footholdUnder == currentFh) then
				local underUnderFoothold = footholds:Raycast(Vector2(playerPos.x, targetPosY - 0.01), Vector2.down, (teleportRange / 100) - 0.01)
				if (underUnderFoothold ~= nil) then
					local underUnderFootholdY = underUnderFoothold:GetYByX(playerPos.x) + 0.01
					local startPos = Vector2(playerPos.x, underUnderFootholdY)
					if (_FootholdLogic:CanGoThrough(map, startPos, Vector2(playerPos.x, playerPos.y + 0.01), currentFh.Id)) then
						realTargetY = underUnderFootholdY
					end
				end
			else
				realTargetY = footholdUnder:GetYByX(playerPos.x) + 0.01
			end
			
		end
		realTargetX = playerPos.x
	else
        -- log("dirV, dirH is all 0 | ")
	end
elseif (targetPortal ~= nil) then
	local portalPos = targetPortal.TransformComponent.WorldPosition:ToVector2()
	realTargetX = portalPos.x
	local underFh = footholds:Raycast(Vector2(portalPos.x, portalPos.y + 0.1), Vector2.down, 10)
	if (underFh ~= nil) then
		realTargetY = underFh:GetYByX(portalPos.x) + 0.01
	end
end
if (realTargetX ~= nil and realTargetY ~= nil) then
    ---@type TeleportInfo
    local info = {}
    info.Valid = true
    info.Position = Vector2(realTargetX, realTargetY)
    info.Start = now
	if (targetPortal == nil) then
    	info.ByPortal = false
    	info.CoolTimeEnd = now + 0.12
		_EffectLogic:PlaySkillSound(skillId, "Use")
		_PlayerActiveSkillLogic:TryUseSkill(user, skillId, skillLevel, nil)
	else
		if (portal ~= nil) then
			info.From = portal.Entity.TransformComponent.WorldPosition:Clone()
		else
			info.From = Vector3(playerPos.x, playerPos.y, 0) 
		end
    	info.ByPortal = true
    	info.CoolTimeEnd = now + 0.12
	end
    user.WsUserController.Teleport = info
	return true
end
-- log("no target")
return false
end