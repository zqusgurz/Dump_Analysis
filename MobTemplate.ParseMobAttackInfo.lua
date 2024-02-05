return function (self,attack) 
---@type MobAttackInfo
local ret = {}

---@type table
local info = attack["info"]

ret.Type = _WzUtils:GetInt32(info["type"], 0)
ret.ConMp = _WzUtils:GetInt32(info["conMP"], 0)
ret.MagicAttack = _WzUtils:GetBool(info["magic"], false)
ret.DeadlyAttack = _WzUtils:GetBool(info["deadlyAttack"], false)
ret.MpBurn = _WzUtils:GetInt32(info["mpBurn"], 0)
ret.Disease = _WzUtils:GetInt32(info["disease"], 0)
ret.SkillLevel = _WzUtils:GetInt32(info["level"], 0)
ret.Pad = _WzUtils:GetInt32(info["PADamage"], 0)
ret.BulletSpeed = _WzUtils:GetInt32(info["bulletSpeed"], 100)
ret.BulletNumber = _WzUtils:GetInt32(info["bulletNumber"], 0)
ret.RandDelayAttack = _WzUtils:GetInt32(info["randDelayAttack"], 0)
ret.Attack = attack

ret.MagicElemAttr = _ElementType.Physical
local curElem = _WzUtils:GetString(info["elemAttr"], "")
if (curElem == "P") then ret.MagicElemAttr = _ElementType.Physical
elseif (curElem == "I") then ret.MagicElemAttr = _ElementType.Ice
elseif (curElem == "F") then ret.MagicElemAttr = _ElementType.Fire
elseif (curElem == "L") then ret.MagicElemAttr = _ElementType.Light
elseif (curElem == "S") then ret.MagicElemAttr = _ElementType.Poison
elseif (curElem == "H") then ret.MagicElemAttr = _ElementType.Holy
elseif (curElem == "D") then ret.MagicElemAttr = _ElementType.Dark
end

ret.JumpAttack = _WzUtils:GetBool(info["jumpAttack"], false)
ret.Effect = info["effect"]
ret.Hit = info["hit"]
ret.Ball = info["ball"]
ret.AreaWarning = info["areaWarning"]

ret.EffectAfter = _WzUtils:GetInt32(info["effectAfter"], 0) / 1000
ret.AttackAfter = _WzUtils:GetInt32(info["attackAfter"], 0) / 1000
ret.DoFirst = _WzUtils:GetBool(info["doFirst"], false)
if (ret.Hit ~= nil) then
	ret.HitAttach = _WzUtils:GetBool(ret.Hit["attach"], false)
end
ret.Tremble = _WzUtils:GetBool(info["tremble"], false)

---@type table
local range = info["range"]
if (range ~= nil) then
	if (ret.Type == 3 or ret.Type == 4 or ret.Type == 0) then
		ret.Lt = _WzUtils:GetVector(range["lt"], Vector2.zero)
		ret.Rb = _WzUtils:GetVector(range["rb"], Vector2.zero)
		if (ret.Type == 3 or ret.Type == 4) then
			ret.Start = _WzUtils:GetInt32(range["start"], 0)
			ret.AreaCount = _WzUtils:GetInt32(range["areaCount"], 0)
			ret.AttackCount = _WzUtils:GetInt32(range["attackCount"], 0)
		end
	elseif (ret.Type ~= 0) then
		ret.Range = _WzUtils:GetInt32(range["r"], 0) / 100
	end
	if (ret.Type == 1 or ret.Type == 2) then
		local sp = _WzUtils:GetVector(range["sp"], Vector2.zero) / 100
		ret.Sp = Vector2(sp.x, -sp.y)
	end
end

--[[
if (info["ball"]) then
	local mx = 0
	local my = 0
	local bx = 0
	local by = 0
	for i, bf in _WzUtils:GetLabeled(info["ball"]) do
		local w = bf["_width"] / 100
		if (w > mx) then
			mx = w
			local ox = bf["origin"]["x"] / 100
			bx = (w - ox * 2) / 2
		end
		local h = bf["_height"] / 100
		if (h > my) then
			my = h
			local oy = bf["origin"]["y"] / 100
			by = (h - oy * 2) / 2
		end
	end
	ret.BallSize = Vector2(mx, my)
	ret.BallOrigin = Vector2(bx, -by)
end
]]

return ret
end