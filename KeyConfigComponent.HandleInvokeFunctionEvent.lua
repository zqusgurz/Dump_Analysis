return function (self,event) 
-- Parameters
local Function = event.Function
local Entity = event.Entity
---------------------------------------------------------

if (Function == "Cancel" or Function == "Close") then
	self:CheckCloseKeySetting()
elseif (Function == "Ok") then
	if (self.Changed) then
		self:SaveFuncKey()
		self:SetVisible(false, false)
	else
		self:DiscardFuncKey()
		self:SetVisible(false, false)
	end
elseif (Function == "Default") then
	_AppService:Get().ModalMan:ShowFixedYesNoModal(
		_AppService:Get().ModalMan.FixedYesNoModalPool,
		_UidMan:Get("UI/UIWindow.img/KeyConfig/notice/0"), 
		"model://f521ec56-6014-4b1a-9ef8-1c1c1255d6ef", 
		function() self:DefaultFuncKey() end, 
		nil)
elseif (Function == "Delete") then
	_AppService:Get().ModalMan:ShowFixedYesNoModal(
		_AppService:Get().ModalMan.FixedYesNoModalPool,
		_UidMan:Get("UI/UIWindow.img/KeyConfig/notice/1"),
		"model://f521ec56-6014-4b1a-9ef8-1c1c1255d6ef", 
		function() self:DeleteFuncKey() end, 
		nil)
end
end