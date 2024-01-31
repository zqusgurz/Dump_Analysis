return function (self) 
local time = os.clock()
local ds = _DataService:GetTable("WorldMap")
for i=1,ds:GetRowCount() do
	local key = ds:GetCell(i, 1)
	local data = _HttpService:JSONDecode(ds:GetCell(i, 2))
	
	---@type WorldMapInfo
	local worldMapInfo = {}
	worldMapInfo.Key = key
	worldMapInfo.BaseImg = data["BaseImg"]["0"]["_ruid"]
	
	local info = data["info"]
	if (info) then
		worldMapInfo.ParentMap = info["parentMap"]
	end
	
	---@type table<WorldMapLinkInfo>
	local mapLinkByLayerOrder = {}
	local mapLink = {}
	local wzNameToLinkOrder = {}
	local mapLinkWz = data["MapLink"]
	if (mapLinkWz) then
		local function parseMapLink(d)
			---@type WorldMapLinkInfo
			local linkData = {}
			local linkImg = d["link"]["linkImg"]
			linkData.LinkImg = linkImg["_ruid"]
			linkData.LinkImgOrigin = _WzUtils:GetVector(linkImg["origin"])
			linkData.LinkImgSize = Vector2(tonumber(linkImg["_width"]), tonumber(linkImg["_height"]))
			linkData.LinkTarget = d["link"]["linkMap"]
			return linkData
		end
		
		-- 순차적으로 입력
		for _,mapLinkData in _WzUtils:GetLabeled(mapLinkWz) do
			mapLink[#mapLink + 1] = parseMapLink(mapLinkData)
		end
		
		-- 야매 레이어
		local linkOrder = {}
		if (key == "WorldMap") then
			--[[
				0: 메이플 아일랜드
				1: 빅토리아 아일랜드
				2: 오르비스, 엘나스 산맥
				5: 미나르숲
				6: 무릉도원
				4: 아쿠아로드
				3: 루더스 호수
			]]
			linkOrder = {"0", "1", "2", "5", "6", "4", "3"}
			wzNameToLinkOrder = {[0] = 1, [1] = 2, [2] = 3, [3] = 7, [4] = 6, [5] = 4, [6] = 5}
		end
		if (#linkOrder == 0) then
			log_error(string.format("MapLink order is not defined: %s", key))
		end
		for i=1,#linkOrder do
			mapLinkByLayerOrder[#mapLinkByLayerOrder + 1] = mapLink[tonumber(linkOrder[i])+1]
		end
	end
	worldMapInfo.WzIndexToLayerOrder = wzNameToLinkOrder
	worldMapInfo.MapLinkByLayerOrder = mapLinkByLayerOrder
	
	---@type table<WorldMapListData>
	local spotList = {}
	---@type table<integer, WorldMapListData>
	local mapIdToSpot = {}
	if (data["MapList"]) then
		for j,d in _WzUtils:GetLabeled(data["MapList"]) do
			local spotData = self:ParseMapSpotData(d)
			spotList[tonumber(j)+1] = spotData
			
			local mapNo = d["mapNo"]
			for _,mapId in pairs(mapNo) do
				mapIdToSpot[tonumber(mapId)] = spotData
			end
		end
	end
	worldMapInfo.MapSpot = spotList

	self.MapIdToSpot[key] = mapIdToSpot
	self.WorldMapInfo[key] = worldMapInfo
end
log(string.format("Loaded worldmap %.2f sec", os.clock() - time))
end