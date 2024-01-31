return function (self,color,bgColor,fromName,channel,text) 
local logs = self.ChatLogs
local scrollLayout = self.Entity_Layout.ScrollLayoutGroupComponent
scrollLayout.UseScroll = false
self.Entity_Layout.Enable = false

local modelId
if (_DebugConstants:IsMobile()) then
	modelId = "model://bdd1c2eb-1677-44e0-a880-8844d5d6b64f"
else
	modelId = "model://204104c9-a457-448e-b6bc-83b6efd02c6c"
end
local newLog = _SpawnService:SpawnByModelId(modelId, "ChatLogEntry", Vector3.zero, self.Temp)
local newLogBackground = newLog.ChatLogEntryComponent.Background
local newLogText = newLog.TextComponent

newLogText.FontColor = color
newLogBackground.Color = bgColor

local font = "NotoSans24"
local maxX = _DebugConstants:IsMobile() and 624 or 1106
local currentPosX = 0
local linesNum = 1
local lines = {}
local currentLine = {}
local insert = table.insert
local char = utf8.char

local function newLine()
	insert(lines, table.concat(currentLine))
	currentLine = {}
	linesNum += 1
	currentPosX = 0
end

for _,c in utf8.codes(text) do
	local x
	if (c == 12288) then
		x = 14
	elseif (c == 10) then
		newLine()
		continue
	else
		---@type Glyph
		local glyph = _FontService:EnsureGetGlyph(font, c)
		x = glyph.XAdvance
	end
	if (currentPosX + x * 2 > maxX) then
		newLine()
	end
	currentPosX += x * 2
	insert(currentLine, char(c))
end
if (#currentLine > 0) then
	insert(lines, table.concat(currentLine))
end

newLog.UITransformComponent.RectSize = Vector2(maxX + 50, 36 * linesNum)
newLogText.Text = table.concat(lines, "\n")
newLogText.Padding.left = 8
if (bgColor.a > 0) then
	local overText = newLog.ChatLogEntryComponent.OverText
	overText.Entity.UITransformComponent.RectSize = Vector2(maxX + 50, 36 * linesNum)
	overText.Text = table.concat(lines, "\n")
	overText.FontColor = color
	overText.Padding.left = 8
end

local whisperIcon = newLog.ChatLogEntryComponent.WhisperIcon
if (channel) then
	whisperIcon.Enable = true
	local x = newLogText:GetPreferredWidth(fromName) + 10.5
	whisperIcon.UITransformComponent.anchoredPosition = Vector2(x, -7)
	if (not isvalid(whisperIcon.UITouchReceiveComponent)) then
		whisperIcon:AddComponent(UITouchReceiveComponent)
	end
	whisperIcon.SpriteGUIRendererComponent.RaycastTarget = true
	whisperIcon:ConnectEvent(UITouchDownEvent, function()
		_AppService:Get().ChatSystem:OnTypeWhisperTarget(fromName)
	end)
	newLog.ChatLogEntryComponent.ChannelText.Text = channel:sub(channel:len()-1)
else
	whisperIcon.Enable = false
end

newLog:AttachTo(self.Entity_Layout)
table.insert(logs, 1, newLog)

newLog.Enable = false
newLog.ChatLogEntryComponent.OverText.Entity.Enable = false
newLog.Visible = false
newLog.ChatLogEntryComponent.OverText.Entity.Visible = false
_UpdateComponentLogic:InsertUpdateEnable(newLog)
_UpdateComponentLogic:InsertUpdateVisible(newLog)
if (bgColor.a > 0) then
    _UpdateComponentLogic:InsertUpdateEnable(newLog.ChatLogEntryComponent.OverText.Entity)
    _UpdateComponentLogic:InsertUpdateVisible(newLog.ChatLogEntryComponent.OverText.Entity)
end

-- 일탄 테스트로 10개.. 원래는 30개가 넘는 채팅 기록은 삭제
local maxLogs = 30
local num = #logs
if (num > maxLogs) then
	for i=num,maxLogs+1,-1 do
		---@type Entity
		local log = logs[i]
		log:Destroy()
		logs[i] = nil
	end
end

scrollLayout.UseScroll = true
self.Entity_Layout.Enable = true
local scrollY = scrollLayout:GetScrollNormalizedPosition(UITransformAxis.Vertical)
if (scrollY >= 0.9 or not self.SpreadChatLog or #logs == self.SpreadHeight + 1) then
    self:MoveToBottom()
end
end