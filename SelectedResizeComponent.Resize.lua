return function (self,event) 
local count = 0

---@param parent Entity
local function doResize(parent)
	---@type table<UITransformComponent>
	local childs = parent:GetChildComponentsByTypeName("UITransformComponent", true)
	for i=1,#childs do
		local ui = childs[i]
		local form = ui.AlignmentOption
		local adjustWidth = true
		local adjustHeight = true
		if (form == AlignmentType.HorizontalBottom or
			form == AlignmentType.HorizontalCenter or
			form == AlignmentType.HorizontalTop or
			form == AlignmentType.StretchAll) then
			adjustWidth = false
		end
		if (form == AlignmentType.VerticalLeft or
			form == AlignmentType.VerticalCenter or
			form == AlignmentType.VerticalRight or
			form == AlignmentType.StretchAll) then
			adjustHeight = false
		end
		if (adjustWidth) then
			ui.RectSize.x *= 2
			ui.anchoredPosition.x *= 2
		end
		if (adjustHeight) then
			ui.RectSize.y *= 2
			ui.anchoredPosition.y *= 2
		end
	end
	count += #childs
end

local statusBar = _EntityService:GetEntityByPath("/ui/StatusBar")
local statusBarMobile = _EntityService:GetEntityByPath("/ui/StatusBar (Mobile)")
local chat = _EntityService:GetEntityByPath("/ui/ChatUIGroup")
local controlWnd = _EntityService:GetEntityByPath("/ui/ControlWindowGroup")
local screenMsg = _EntityService:GetEntityByPath("/ui/ScreenMsgUI")
local temporaryStat = _EntityService:GetEntityByPath("/ui/TemporaryStats")
local alarmGroup = _EntityService:GetEntityByPath("/ui/AlarmGroup")
local modalGroup = _EntityService:GetEntityByPath("/ui/ModalUIGroup")

doResize(statusBar)
doResize(statusBarMobile)
doResize(chat)
doResize(controlWnd)
doResize(screenMsg)
doResize(temporaryStat)
doResize(alarmGroup)
doResize(modalGroup)

_EditorGUIService:MessageBox(string.format("%d개 UITransformComponent 처리", count))

        --_EntityUtils:AdjustChildrenGUIScaleByEvent(self.ModalMan.Entity)
        --if (_DebugConstants:IsMobile()) then
        --    _EntityUtils:AdjustChildrenGUIScaleByEvent(self.StatusBarMobile.Entity)
        --else
        --    _EntityUtils:AdjustChildrenGUIScaleByEvent(self.StatusBar.Entity)
        --    self.StatusBar:UpdateQuickslotPosition()
        --end
        --_EntityUtils:AdjustChildrenGUIScaleByEvent(self.ScreenMsgMan.Entity)
        --_EntityUtils:AdjustChildrenGUIScaleByEvent(self.TemporaryStat.Entity)
        --_EntityUtils:AdjustChildrenGUIScaleByEvent(self.AlarmMan.Entity)
        --_EntityUtils:AdjustChildrenGUIScaleByEvent(self.ToolTipMan.Entity)
        --_EntityUtils:AdjustChildrenGUIScaleByEvent(self.ChatGroup)
end