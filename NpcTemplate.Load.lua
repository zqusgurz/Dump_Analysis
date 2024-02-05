return function (self,templateID,data) 
---@type table
local info = data["info"]
if (info == nil) then
	log_error(string.format("NpcTemplate %07d has nil info", templateID))
end

local link = _WzUtils:GetInt32(info["link"], 0)
if (link ~= 0) then
	self._linkObject = _NpcTemplateMan:GetNpcTemplate(link)
	self:Load(templateID, self._linkObject._property)
end
self.Link = link

self.Speed = math.min(140, math.max(0, _WzUtils:GetInt32(info["speed"], 0) + 70))
self.Hide = _WzUtils:GetBool(info["hide"], false)
self.HideName = _WzUtils:GetBool(info["hideName"], false)
self.DcMark = _WzUtils:GetBool(info["dcMark"], false)
self.DcLb = Vector2(_WzUtils:GetInt32(info["dcLeft"], 0), -_WzUtils:GetInt32(info["dcBottom"], 0))
self.DcRt = Vector2(_WzUtils:GetInt32(info["dcRight"], 0), -_WzUtils:GetInt32(info["dcTop"], 0))
self.Cash = _WzUtils:GetBool(info["cash"], false)
self.Float = _WzUtils:GetBool(info["float"], false)
self.Shop = _WzUtils:GetBool(info["shop"], false)
self.Imitate = _WzUtils:GetInt32(info["imitate"], 0)

local speaks = info["speak"]
if (speaks ~= nil) then
	local i = 1
	for _,sp in _WzUtils:GetLabeled(speaks) do
		self.Speak[i] = sp
		i += 1
	end
end
self.TalkMouseOnly = _WzUtils:GetBool(info["talkMouseOnly"], false)

local script = info["script"]
if (script ~= nil) then
	self.Script = script["0"]["script"]
else
	self.Script = nil
end
--if (templateID == 9909000) then
--    self.Script = "4th_mapleWeapon"
--end

local i = 0
for key,value in pairs(data) do
	if (key == "info") then
		continue
	end
	if (_UtilLogic:Contains(key, "condition")) then
		continue
	end
	self.Actions[key] = NpcTemplateAction():Load(i, value)
	i = i + 1
end
if (self.Actions["move"] ~= nil) then
	self.Move = true
end
if (self.Actions["stand"] ~= nil) then
	local frame = self.Actions["stand"].Property["0"]
	local standOrigin = _WzUtils:GetVector(frame["origin"])
	self.BalloonOffset = Vector3(20, 2 * frame["_height"] - standOrigin.y + 15, 0) / 100
end

self._property = data

return self

end