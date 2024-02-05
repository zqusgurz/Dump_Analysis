return function (self,obj,map) 
local ic = map.MapInfoComponent
if not(isvalid(map.MapInfoComponent)) then
	ic = map:AddComponent(MapInfoComponent)
end

---@type WzObject
local info = obj.Children["info"]
ic.Town = info:GetBoolean("town", false)
ic.MobRate = info:GetInt32("mobRate", 0)
ic.Bgm = info:GetString("bgm", "")
ic.ReturnMap = info:GetInt32("returnMap", 0)
ic.ForcedReturn = info:GetInt32("forcedReturn", 0)
ic.HideMinimap = info:GetBoolean("hideMinimap", false)
ic.MoveLimit = info:GetInt32("moveLimit", 0)
ic.Swim = info:GetBoolean("swim", false)
ic.Fly = info:GetBoolean("fly", false)
ic.FieldLimit = info:GetInt32("fieldLimit", 0)
ic.OnUserEnter = info:GetString("onUserEnter", "")
ic.MapMark = info:GetString("mapMark", "")
ic.MapDesc = info:GetString("mapDesc", "")
ic.VRTop = info:GetInt32("VRTop", 0)
ic.VRLeft = info:GetInt32("VRLeft", 0)
ic.VRBottom = info:GetInt32("VRBottom", 0)
ic.VRRight = info:GetInt32("VRRight", 0)
ic.OnFirstUserEnter = info:GetString("OnFirstUserEnter", "")
ic.Effect = info:GetString("effect", "")
ic.DecHP = info:GetInt32("decHP", 0)
ic.ProtectItem = info:GetInt32("protectItem", 0)
ic.LvLimit = info:GetInt32("lvLimit", 0)
ic.FieldType = info:GetInt32("fieldType", 0)
ic.Link = info:GetInt32("link", 0)
ic.PartyOnly = info:GetBoolean("partyOnly", false)
ic.DropExpire = info:GetInt32("dropExpire", 0)
ic.TimeLimit = info:GetInt32("timeLimit", 0)
end