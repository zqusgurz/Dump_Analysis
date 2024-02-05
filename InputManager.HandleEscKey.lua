return function (self) 
local app = _AppService:Get()
local handledByModal = app.ModalMan:HandleEscOrReturnKey(true)
if (handledByModal) then
	return
end
local handledByOption = app.OptionMan:OnEscKey()
if (handledByOption) then
	return
end
app.ControlWindowMan:OnEscKey()
end