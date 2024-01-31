return function (self) 
if (self.Rendering == true) then return end
self.Rendering = true
local time = os.clock()
log ("Begin ScriptText Render")
self:ReleaseAll()

self.Lists = {}
local tokens = _TextAnalyzer:Analyze(self.Text, nil, nil)
local maxX = self:GetMaxX()
local currentPos = Vector2(0,-8)
local fontHeight = 12
local spacingY = 6
local defaultHeight = fontHeight + spacingY
local currentHeight = defaultHeight
local font = "NotoSans24"
local color = Color.black
local scale = Vector2.one * 2 -- _ScreenResolutionLogic:GetScale()
local currentLineEntities = {}
local currentListEntities = {}
local currentListIndex = -1
local currentListDot
local lineOffsetY = 0
local upscale = _Constants.GlobalUpscaleSize
local dlg = self.UtilDlgExWindow
local insert = table.insert
local animSprites = {}
local alwaysVisibleFlag = false
local alwaysVisibleSprites = {}
self.AnimationSprites = animSprites

local function nextLine()
	currentPos.x = 0
	currentPos.y -= currentHeight
	currentHeight = defaultHeight
	lineOffsetY = 0
	currentLineEntities = {}
end

local pool = self.Pool
local vectorZero = Vector3.zero
local parent = self.Entity
local op = _ObjectPool
local pick = _ObjectPool.Pick

---@return Entity
local function pickSprite()
	-- old: model://8b18e82e-3c57-4b2e-a1a3-7382cd4f79bc
	return pick(op, pool, "PooledSprite", "model://88a9a955-03f4-462e-8f02-9280f23ba1ba", vectorZero, parent)
end

local function flushList()
	if (currentListIndex == -1) then
		return
	end
	for _,le in ipairs(currentListEntities) do
		---@type Entity
		local listEntity = le
		listEntity.RichGlyphComponent.Dot = currentListDot
	end
	self.Lists[currentListIndex] = {
		Tokens = {table.unpack(currentListEntities)},
		ListIndex = currentListIndex,
		Dot = currentListDot
	}
	currentListDot.RichGlyphComponent.DotMasterListEntities = self.Lists[currentListIndex].Tokens
	table.clear(currentListEntities)
	currentListIndex = -1
end

local getColor = self.GetColor
local sprites = self.Sprites

for i,tok in ipairs(tokens) do
	---@type TextToken
	local token = tok
	color = getColor(self, token.Color)
	if (token.Bold == "e") then
		font = "NotoSans24Bold"
	else
		font = "NotoSans24"
	end
	if (currentListIndex ~= token.ListIndex) then
		local lastListIndex = currentListIndex
		flushList()
		if (token.ListIndex ~= -1) then
			-- List
            --if (#self.Lists == 0) then
            --    currentPos.y -= spacingY
            --end
			currentPos.x += 12
			currentListIndex = token.ListIndex
			local dot = pickSprite()
			local ds = dot.SpriteGUIRendererComponent
			ds.Color = Color.white
			ds.ImageRUID = self.Dot0
			local glyph = dot.RichGlyphComponent.Glyph
			glyph.Text = ""
			glyph.Enable = false
			dot.RichGlyphComponent.Underline.Enable = false
			_EntityUtils:SetUIEntitySafelyEx(dot, currentPos.x, currentPos.y - lineOffsetY - 2, 6, 7)
			currentPos.x += 6
			currentListDot = dot
			insert(sprites, dot)
			insert(currentLineEntities, dot)
			if (alwaysVisibleFlag) then
				insert(alwaysVisibleSprites, dot)
			else
				insert(animSprites, dot)
			end
		end
	end
	
	local type = token.Type
	-- (ivf)
	local data = token.Data
	-- flag2: No animation
	local flag = 0
	while data:sub(-1) == ':' do
        flag = flag + 1
        data = data:sub(1, -2)
    end
	if (flag == 2) then
		alwaysVisibleFlag = true
	end
	-- Image
	if (type == "i" or type == "v" or type == "f") then
		local image = ""
		local imageSize = Vector2.zero
		local imageOrigin = Vector2.zero
		if (type == "i" or type == "v") then
			local info = _Items:GetItemInfo(tonumber(data))
			image = info.icon
			imageSize = info.iconSize
			imageOrigin = info.iconOrigin
		elseif (type == "f") then
			local ruid = _UidMan:Get(data)
			---@type Sprite
			local sprite = _ResourcePreloadService:GetSprite(ruid)
			image = ruid
			imageSize = Vector2(sprite.Width, sprite.Height)
			imageOrigin = Vector2(0, sprite.Height)
		end
		if (currentPos.x + imageSize.x > maxX) then
			nextLine()
		end
		local obj = pickSprite()
		local offset = Vector2(-imageOrigin.x, imageSize.y - imageOrigin.y)
		local sp = obj.SpriteGUIRendererComponent
		sp.Color = Color.white
		sp.ImageRUID = image
		local glyph = obj.RichGlyphComponent.Glyph
		glyph.Text = ""
		glyph.Enable = false
		local richGlyph = obj.RichGlyphComponent
		richGlyph:MakeUnderline(offset, imageSize.x + 6, imageSize.y, scale)
		richGlyph:SetEnableMouseOver(1, offset, imageSize.x, imageSize.y, imageSize.y, scale)
		
		local realHeight = currentHeight - spacingY
		--log(string.format("Data: %s  currentHeight:%d spacingY=%d realHeight=%d imageSize.y=%d currentPos.y=%.2f lineOffsetY=%d",
		--		data, currentHeight, spacingY, realHeight, imageSize.y, currentPos.y, lineOffsetY))
		if (imageSize.y > realHeight) then
			local gap = imageSize.y - realHeight
			for _,lo in ipairs(currentLineEntities) do
				_EntityUtils:MovePositionUIEntitySafely(lo, nil, -gap)
			end
			currentHeight = imageSize.y + spacingY
			lineOffsetY += gap
		else
			_EntityUtils:MovePositionUIEntitySafely(obj, nil, -(realHeight - imageSize.y))
		end
		_EntityUtils:SetUIEntitySafelyEx(obj, currentPos.x + offset.x, currentPos.y + offset.y, imageSize.x, imageSize.y)
		currentPos.x += (imageSize.x + 6)
		insert(currentLineEntities, obj)
		if (currentListIndex ~= -1) then
			insert(currentListEntities, obj)
		end
		insert(sprites, obj)
		if (flag == 2 or alwaysVisibleFlag) then
			insert(alwaysVisibleSprites, obj)
		else
			insert(animSprites, obj)
		end
	else
		if (type == "h") then
			data = _UserService.LocalPlayer.WsUser.CharacterName
		elseif (type == "p") then
			data = _StringMan:GetNpcName(tonumber(data))
		elseif (type == "o") then
			data = _StringMan:GetMobName(tonumber(data))
		elseif (type == "m") then
			if (data ~= nil and tonumber(data) ~= nil) then
				data = _StringMan:GetMapName(string.format("m%09d", tonumber(data)))
			else
				data = ""
			end
		elseif (type == "a") then
			local tokenLen = #data
			local questId = tonumber(data:sub(1, tokenLen - 1))
			local mobIndex = tonumber(data:sub(tokenLen, tokenLen))
			local completeDemand = _QuestMan.CompleteDemand[questId]
			if (completeDemand ~= nil) then
				local questInfo = _UserQuestLogic:GetQuestData(_UserService.LocalPlayer.WsCharacterData, questId)
				local maxMobCount = _QuestDemandCheck:GetMaxMobCount(questId, mobIndex)
				data = string.format("%d/%d",_QuestDemandCheck:GetMobCount(questInfo, mobIndex), maxMobCount)
			else
				data = "?"
			end
		elseif (type == "t") then
			data = _StringMan:GetItemName(tonumber(data))
		elseif (type == "q") then
			data = _StringMan:GetSkillName(tonumber(data))
		elseif (type == "c") then
			data = tostring(_InventoryLogic:GetItemCount(_UserService.LocalPlayer.WsCharacterData, tonumber(data)))
		elseif (type == "z") then -- MouseOver item
			data = _StringMan:GetItemName(tonumber(data))
		end
		
		-- Regular Text
		for _,c in utf8.codes(data) do
			if (c == 13) then -- CR
				continue
			end
			if (c == 10) then -- LF
				nextLine()
				continue
			end
			
			---@type Glyph
			local glyph = _FontService:EnsureGetGlyph(font, c)
			local sz = glyph.Size
			if (currentPos.x + sz.x + glyph.Offset.x > maxX) then
				nextLine()
			end
			local obj = pickSprite()
			local offset = Vector2(0, 0) --Vector2(glyph.Offset.x, -glyph.Offset.y)
			local sp = obj.SpriteGUIRendererComponent 
			sp.Color = Color(0,0,0,0)
			local tg = obj.RichGlyphComponent.Glyph
			tg.Enable = true
			tg.Text = utf8.char(c)
			tg.FontColor = color
			tg.Bold = token.Bold == "e"
			local richGlyph = obj.RichGlyphComponent
			richGlyph:MakeUnderline(offset, glyph.XAdvance, fontHeight, scale)
			_EntityUtils:SetUIEntitySafelyEx(obj, currentPos.x + offset.x, currentPos.y + offset.y - lineOffsetY, sz.x, sz.y)
			_EntityUtils:SetRectSizeUIEntitySafelyEx(tg.Entity, 50, sz.y)
			currentPos.x += glyph.XAdvance
			insert(currentLineEntities, obj)
			if (currentListIndex ~= -1) then
				richGlyph:SetEnableMouseOver(1, offset, glyph.XAdvance, sz.y, fontHeight, scale)
				insert(currentListEntities, obj)
			end
			insert(sprites, obj)
			if (alwaysVisibleFlag) then
				insert(alwaysVisibleSprites, obj)
			else
				insert(animSprites, obj)
			end
		end
	end
end
if (currentListIndex ~= -1) then
	flushList()
	if (#self.Lists == 0) then
		currentPos.y -= spacingY
	end
end
currentPos.y -= currentHeight

if (isvalid(dlg)) then
	local inputField = dlg.UtilDlgExComponent.InputField
	if (inputField.Enable) then
		_EntityUtils:SetPositionUIEntitySafelyEx(inputField, nil, currentPos.y)
		--inputField.UITransformComponent.anchoredPosition.y = currentPos.y * scale.y
		currentPos.y -= defaultHeight
		currentPos.y -= spacingY
	end
end

if (self.AddHeightForButton) then
	currentPos.y -= 18
end

local totalPos = -currentPos.y
local minY = self:GetMinY()
local maxY = self:GetMaxY()
-- log(string.format("Text TotalPos=%d  currentPos:%d  minY=%d (sprites num:%d)", totalPos, currentPos.y, minY, #sprites))
if (totalPos < minY) then
	local y = (minY - totalPos) / 2
	--local offset = (y * scale.y)
	for _,ob in ipairs(sprites) do
		_EntityUtils:MovePositionUIEntitySafely(ob, nil, -y * 2)
        -----@type Entity
        --local obj = ob
        --obj.UITransformComponent.anchoredPosition.y -= offset
	end
	if (isvalid(dlg)) then
		local inputField = dlg.UtilDlgExComponent.InputField
		if (inputField.Enable) then
			_EntityUtils:MovePositionUIEntitySafely(inputField, nil, -y * 2)
			-- inputField.UITransformComponent.anchoredPosition.y -= offset
		end
	end
end

currentPos.y -= 8
local height = math.max(-currentPos.y, minY)
local npcOffsetY = math.min(height, maxY) - minY
if (isvalid(dlg)) then
	_EntityUtils:SetPositionUIEntitySafelyEx(dlg.UtilDlgExComponent.NpcGroup, nil, -(114 + (npcOffsetY//2)))
end
_EntityUtils:SetRectSizeUIEntitySafelyEx(self.Entity, maxX, height)
if (isvalid(dlg)) then
	local textHeight = math.min(height, self:GetMaxY())
	local windowHeight = textHeight + self:GetWindowYPadding()
	local utilDlgEx = dlg.UtilDlgExComponent
	_EntityUtils:SetRectSizeUIEntitySafelyEx(dlg, nil, windowHeight)
	_EntityUtils:SetRectSizeUIEntitySafelyEx(utilDlgEx.Resize_Back_Center, nil, textHeight)
	_EntityUtils:SetRectSizeUIEntitySafelyEx(utilDlgEx.ScrollView.Entity, nil, textHeight)
end

local scrollView = self.ScrollView
if (isvalid(scrollView)) then
	scrollView.UseScroll = height > self:GetMaxY()
	scrollView:ResetScrollPosition(UITransformAxis.Vertical)
	scrollView.ScrollBarVisible = ScrollBarVisibility.AlwaysShow
	scrollView.ScrollBarVisible = ScrollBarVisibility.Hide
	_ScrollEventHolder:SendScrollbarEvent(scrollView.Entity, height > self:GetMaxY(), nil)
end

if (isvalid(dlg)) then
	for idx,listElem in pairs(self.Lists) do
		local myElem = listElem
		local listIndex = myElem.ListIndex
		local function listHandler()
			--log("Trying menu handler index.. " .. tostring(listIndex))
			self.UtilDlgExWindow.UtilDlgExComponent:OnListHandler(listIndex)
		end
		for _,t in ipairs(myElem.Tokens) do
			---@type Entity
			local token = t
			token.RichGlyphComponent.Handler = listHandler
		end
		myElem.Dot.RichGlyphComponent.Handler = listHandler
	end
end

for i=1,#alwaysVisibleSprites do
	self:EnableAnimationSpriteAtIndex(alwaysVisibleSprites, i)
end

local max = #animSprites
if (self.HasTextAnimation) then
	for i=1,max do
		animSprites[i].Visible = false
	end
	local i = 1
	local function renderTimer()
		if i <= max then
			self:EnableAnimationSpriteAtIndex(animSprites, i)
			i += 1
		else
			_TimerService:ClearTimer(self.AnimationSpriteTimer)
		end
	end
	self.AnimationSpriteTimer = _TimerService:SetTimerRepeat(renderTimer, 0.03, 0.1)
else
	for i=1,max do
		self:EnableAnimationSpriteAtIndex(animSprites, i)
	end
end

log ("Finish ScriptText Render", os.clock() - time)
self.Rendering = false
end