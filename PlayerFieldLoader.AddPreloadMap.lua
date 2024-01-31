return function (self,mapName) 
local dt = _DataService:GetTable("PreloadMap")
local preloadMob = _DataService:GetTable("PreloadMob")
local preloadNpc = _DataService:GetTable("PreloadNpc")
local row = dt:FindRow("id", mapName)
if (row ~= nil) then
	local mobs = _HttpService:JSONDecode(row:GetItem("mob"))
	local npcs = _HttpService:JSONDecode(row:GetItem("npc"))
	local reactors = _HttpService:JSONDecode(row:GetItem("reactor"))
	local objs = _HttpService:JSONDecode(row:GetItem("obj"))
	local tiles = _HttpService:JSONDecode(row:GetItem("tile"))
	local miniMap = row:GetItem("miniMap")
	local bgm = row:GetItem("bgm")
	local reactorsNum = #reactors
	local objsNum = #objs
	local tilesNum = #tiles
	local lifeObjects = {}
	local lifeObjectsNum = 0
	local insert = table.insert
	local totalRUIDs = {}
	local totalRUIDNum = 0
	local function checkAndMerge(cacheTable, subTable)
		for i=1,#subTable do
			local ruid = subTable[i]
			if (cacheTable[ruid]) then
				continue
			end
			cacheTable[ruid] = true
			totalRUIDs[totalRUIDNum + 1] = subTable[i]
			totalRUIDNum += 1
		end
	end
	local function merge(subTable)
		for i=1,#subTable do
			totalRUIDs[totalRUIDNum + 1] = subTable[i]
			totalRUIDNum += 1
		end
	end
	for i=1,#mobs do
		if (self.AlreadyCached["Mob"][mobs[i]] ~= true) then
			local mobRuidRow = preloadMob:FindRow("id", string.format("%07d", mobs[i]))
			if (mobRuidRow ~= nil) then
				local mobRuidList = _HttpService:JSONDecode(mobRuidRow:GetItem("desc"))
				for k=1,#mobRuidList do
					lifeObjects[lifeObjectsNum + 1] = mobRuidList[i]
					lifeObjectsNum += 1
				end
			end
			self.AlreadyCached["Mob"][mobs[i]] = true
		end
	end
	for i=1,#npcs do
		if (self.AlreadyCached["Npc"][npcs[i]] ~= true) then
			local npcRuidRow = preloadNpc:FindRow("id", string.format("%07d", npcs[i]))
			if (npcRuidRow ~= nil) then
				local npcRuidList = _HttpService:JSONDecode(npcRuidRow:GetItem("desc"))
				for k=1,#npcRuidList do
					lifeObjects[lifeObjectsNum + 1] = npcRuidList[i]
					lifeObjectsNum += 1
				end
			end
			self.AlreadyCached["Npc"][npcs[i]] = true
		end
	end
	if (lifeObjectsNum > 0) then
		local lifeRuids = {}
		local lifeRuidIndex = 0
		merge(lifeObjects)
		--table.insert(self.RegisterPreloads, {lifeObjects, string.format("리소스 - 맵 엔피시, 몬스터 (%d개)", lifeObjectsNum), 
        --    function()
        --        local fade = _AppService:Get().FadeScreen
        --        fade:SetLoadingText("캐싱 - 몬스터 정보")
        --        for i=1,#mobs do
        --            _MobTemplateMan:GetMobTemplate(mobs[i])
        --        end
        --        fade:SetLoadingText("캐싱 - 엔피시 정보")
        --        for i=1,#npcs do
        --            _NpcTemplateMan:GetNpcTemplate(npcs[i])
        --        end
        --    end
        --})			
	end
	if (objsNum > 0) then
		checkAndMerge(self.AlreadyCached["Obj"], objs)
		--table.insert(self.RegisterPreloads, {objs, string.format("리소스 - 맵 오브젝트 (%d개)", objsNum)})		
	end
	if (tilesNum > 0) then
		checkAndMerge(self.AlreadyCached["Tile"], tiles)
		--table.insert(self.RegisterPreloads, {tiles, string.format("리소스 - 맵 타일 (%d개)", tilesNum)})		
	end
	
	-- Miscs
	local miscs = {}
	local miscsIndex = 0
	if (not _UtilLogic:IsNilorEmptyString(miniMap)) then
		miscs[miscsIndex + 1] = miniMap
		miscsIndex += 1
	end
	if (not _UtilLogic:IsNilorEmptyString(bgm)) then
		local bgmRUID = _UidMan:Get(bgm)
		if (not _UtilLogic:IsNilorEmptyString(bgmRUID)) then
			miscs[miscsIndex + 1] = bgmRUID
			miscsIndex += 1
		end
	end
	if (miscsIndex > 0) then
		checkAndMerge(self.AlreadyCached["Misc"], miscs)
		--table.insert(self.RegisterPreloads, {miscs, "리소스 - 기타"})	
	end
	if (totalRUIDNum > 0) then
		insert(self.RegisterPreloads, {totalRUIDs, string.format("추가 리소스 (RUID %d개)", totalRUIDNum),
		    function()
                local fade = _AppService:Get().FadeScreen
				if (#mobs > 0 or #npcs > 0) then
	                fade:SetLoadingText("캐싱 - 몬스터, 엔피시 정보")
	                for i=1,#mobs do
	                    _MobTemplateMan:GetMobTemplate(mobs[i])
	                end
	                for i=1,#npcs do
	                    _NpcTemplateMan:GetNpcTemplate(npcs[i])
	                end
				end
            end
		})
	end
end
end