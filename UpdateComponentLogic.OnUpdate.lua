return function (self,delta) 
if (self._T.ChangedResolution == true) then
	if (_ScreenResolutionLogic:IsAvailableCheckResolution()) then
		---@type ScreenResolutionChangedEvent
		local event = self.ChangedResolutionEvent
        self.ControlWindowMan:HandleChangedResolution(event)
		
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
	    self._T.ChangedResolution = nil
	end
end

local alreadyUpdatedTexts = {}
local queue = self.UpdateTextQueue
local updates = nil
while true do
	local t = _TableUtils:Pop(queue)
	if (not t) then
		break
	end
	if (not updates) then
		updates = {}
	end
	updates[#updates + 1] = t
end
if (updates) then
	for i=1,#updates do
		---@type Entity
		local t = updates[i]
		local st = t.ScriptTextComponent 
		if (isvalid(st)) then
			st:Render()
		end
	end
end

local visibleUpdateNum = self.UpdateVisibleListNum
if (visibleUpdateNum > 0) then
	---@type table<Entity>
	local list = _UpdateComponentLogic.UpdataVisibleList
	for i=1,visibleUpdateNum do
		list[i].Visible = true
	end
	_UpdateComponentLogic.UpdataVisibleList = {}
	self.UpdateVisibleListNum = 0
end

local enableUpdateNum = self.UpdateEnableListNum
if (enableUpdateNum > 0) then
	---@type table<Entity>
	local list = _UpdateComponentLogic.UpdateEnableList
	for i=1,enableUpdateNum do
		list[i].Enable = true
	end
	_UpdateComponentLogic.UpdateEnableList = {}
	self.UpdateEnableListNum = 0
end

local updateUISizeNum = self.UpdateUISizeListNum
if (updateUISizeNum > 0) then
	local list = _UpdateComponentLogic.UpdateUISizeList
	for i=1,updateUISizeNum do
		local entry = list[i]
		local entity = entry[1]
		local includeChild = entry[2]
		local invalidateFlag = entry[3]
		_EntityUtils:CheckUIMemory(entity, false, invalidateFlag)
		if (includeChild) then
			_EntityUtils:ExecuteCheckUIMemoryChildren(entity, false, invalidateFlag)
		end
	end
	_UpdateComponentLogic.UpdateUISizeList = {}
	self.UpdateUISizeListNum = 0
end

if (self.DoubleClickEventContext[1] ~= nil) then
	self.DoubleClickEventContext[1] = nil
	---@type Entity
	local e = self.DoubleClickEventContext[2]
	e:SendEvent(FieldObjectInteractionEvent())
end
if (self.ClickEventContext[1] ~= nil) then
	self.ClickEventContext[1] = nil
	---@type Entity
	local e = self.ClickEventContext[2]
	e:SendEvent(FieldObjectInteractionEvent())
end
end