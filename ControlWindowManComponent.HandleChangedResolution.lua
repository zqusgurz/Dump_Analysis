return function (self,event) 
local screenRatio = event.ScreenResolution.x / event.ScreenResolution.y
_ControlWindowLogic.UIRatio.x = 1920 / event.ScreenResolution.x
_ControlWindowLogic.UIRatio.y = 1920 / screenRatio / event.ScreenResolution.y
log("ScreenResolution:", event.ScreenResolution, " / UIRatio:", _ControlWindowLogic.UIRatio)

---@type table<ControlWindowComponent>
local windows = self.Entity:GetChildComponentsByTypeName(_Types:Get(ControlWindowComponent), true)
for _,win in ipairs(windows) do
	_ControlWindowLogic:MakeFirstPosition(win.Entity, win.DefaultPositionRatio)
end

-----@param ref EntityRef
--local function checkAndResize(ref)
--    if (ref.Enable or ref.ControlTabComponent.CreatedMemoryInitComponent) then
--        _EntityUtils:AdjustChildrenGUIScaleByEvent(ref)
--        _EntityUtils:CheckUIMemory(ref, false, -1)
--    end
--end
--
--checkAndResize(self.Skill)
--checkAndResize(self.Min)
--checkAndResize(self.MinMap)
--checkAndResize(self.MaxMap)
--checkAndResize(self.Stat)
--checkAndResize(self.Equip)
--checkAndResize(self.Item)
--checkAndResize(self.Revive)
--checkAndResize(self.KeyConfig)
--checkAndResize(self.UserInfo)
--checkAndResize(self.Quest)
--checkAndResize(self.NpcShop)
--checkAndResize(self.TradingRoom)
--checkAndResize(self.WorldMap)

-- self:EnsureWindowsInScreen()
end