return function (self) 
if not (self.Changed) then
	self:DiscardFuncKey()
	self:SetVisible(false, false)
	return
end
_AppService:Get().ModalMan:ShowFixedYesNoModal(
	_AppService:Get().ModalMan.FixedYesNoModalPool,
	_UidMan:Get("UI/UIWindow.img/KeyConfig/notice/2"), 
	"model://f521ec56-6014-4b1a-9ef8-1c1c1255d6ef", 
	function()
		self:SaveFuncKey()
		self:SetVisible(false, false)
	end, 
	function()
		self:DiscardFuncKey()
		self:SetVisible(false, false)
	end)
end