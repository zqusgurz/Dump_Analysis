return function (self,key,sfx) 
---@type WorldMapInfo
local worldMapInfo = _WorldMapLogic.WorldMapInfo[key]
if (not key) then
	self.ParentKey = nil
	log_warning("not key")
	return
end

self.Base.SpriteGUIRendererComponent.ImageRUID = worldMapInfo.BaseImg
self.ParentKey = worldMapInfo.ParentMap
local currentMapId = tonumber(_UserService.LocalPlayer.CurrentMapName:sub(2))
local currentMapSpot = _WorldMapLogic.MapIdToSpot[key][currentMapId]
self.PosIndicator.Visible = false

---@type table<WorldMapLinkInfo>
local links = worldMapInfo.MapLinkByLayerOrder
local linkNum = #links

---@type table<WorldMapListData>
local spots = worldMapInfo.MapSpot
local spotNum = #spots

---@type table
local paths = {}
for i=1,spotNum do
	local spot = spots[i]
	if (spot.PathImg) then
		paths[#paths + 1] = {i, spot}
	end
end

self:EnsureCreatedNeedEntities(linkNum, spotNum, #paths)

---@type table<Entity>
local linkEntities = self.LinksEntities
---@type table<Entity>
local spotEntities = self.SpotEntities
---@type table<Entity>
local pathEntities = self.PathEntities

for i=1,linkNum do
	local linkEntity = linkEntities[i]
	linkEntity.WorldMapLinkComponent:SetWorldMapLinkInfo(links[i])
	linkEntity.WorldMapLinkComponent.WorldMap = self
	linkEntity.Enable = true
	_UpdateComponentLogic:InsertUpdateVisible(linkEntity)
end
for i=1,spotNum do
	local spotEntity = spotEntities[i]
	spotEntity.WorldMapSpotComponent:SetSpotData(self, spots[i])
	spotEntity.Enable = true
	_UpdateComponentLogic:InsertUpdateVisible(spotEntity)
	if (currentMapSpot == spots[i]) then
		self.PosIndicator.Visible = true
		self.PosIndicator:AttachTo(spotEntity)
		self.PosIndicator.UITransformComponent.anchoredPosition = Vector2.zero
	end
end
for i=1,#paths do
	local pathEntity = pathEntities[i]
	-- [integer, WorldMapListData]
	local path = paths[i]
	local spotIndex = path[1]
	---@type WorldMapListData
	local pathSpot = path[2]
	pathEntity.SpriteGUIRendererComponent.ImageRUID = pathSpot.PathImg
	pathEntity.SpriteGUIRendererComponent.Color.a = 0
	pathEntity.Enable = true
	pathEntity.Visible = true
	_EntityUtils:SetUIEntitySafelyEx(pathEntity, -pathSpot.PathImgOrigin.x, pathSpot.PathImgOrigin.y,
		pathSpot.PathImgSize.x, pathSpot.PathImgSize.y)
	spotEntities[spotIndex].WorldMapSpotComponent.Path = pathEntity
end

if (sfx) then
	_SoundService:PlaySound(_UidMan:Get("Sound/UI.img/SelectMap"), 1)
end

-- spot -> link 하드코딩

local function connectSpotToMapLink(wzName, destLinkWzName)
	local spotEntity = spotEntities[wzName + 1]
	local linkEntity = linkEntities[worldMapInfo.WzIndexToLayerOrder[destLinkWzName]]
	spotEntity.WorldMapSpotComponent.MapLink = linkEntity.WorldMapLinkComponent
end

if (key == "WorldMap") then
	connectSpotToMapLink(0, 0) -- 메이플 아일랜드
	connectSpotToMapLink(1, 1) -- 빅토리아 아일랜드 : 헤네시스
	connectSpotToMapLink(2, 1) -- 빅토리아 아일랜드 : 엘리니아
	connectSpotToMapLink(3, 1) -- 빅토리아 아일랜드 : 페리온
	connectSpotToMapLink(4, 1) -- 빅토리아 아일랜드 : 커닝시티
	connectSpotToMapLink(5, 1) -- 빅토리아 아일랜드 : 리스항구
	connectSpotToMapLink(6, 1) -- 빅토리아 아일랜드 : 세계수 던전
	connectSpotToMapLink(7, 1) -- 빅토리아 아일랜드 : 플로리나 비치
	connectSpotToMapLink(8, 4) -- 아쿠아로드
	connectSpotToMapLink(9, 2) -- 오르비스
	connectSpotToMapLink(10, 2) -- 엘나스 산맥
	connectSpotToMapLink(11, 3) -- 루디브리엄
	connectSpotToMapLink(12, 3) -- 지구방위본부
	connectSpotToMapLink(13, 3) -- 아랫마을
	connectSpotToMapLink(14, 5) -- 미나르숲
	connectSpotToMapLink(15, 6) -- 무릉도원
	connectSpotToMapLink(16, 6) -- 백초마을
	-- connectSpotToMapLink(17, -1) -- 아리안트
end

_TooltipLogic:SendEvent(ShouldCloseToolTipEvent(_CloseToolTipType.Mini))
_TooltipLogic:SendEvent(ShouldCloseToolTipEvent(_CloseToolTipType.Function))
end