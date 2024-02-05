return function (self,data) 
---@type WorldMapListData
local spotData = {}
spotData.Desc = data["desc"]
local path = data["path"]
if (path) then
	spotData.PathImg = path["_ruid"]
	spotData.PathImgOrigin = _WzUtils:GetVector(path["origin"])
	spotData.PathImgSize = Vector2(tonumber(path["_width"]), tonumber(path["_height"]))
end
spotData.Spot = _WzUtils:GetVector(data["spot"])
spotData.Title = data["title"]
spotData.Type = tonumber(data["type"])
spotData.MasterMapId = tonumber(data["mapNo"]["0"])
return spotData
end