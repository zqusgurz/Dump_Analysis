return function (self,button) 
--log(string.format("UtilDlgEx Button: %d", button))
local func = self.ButtonHandler
if (func ~= nil) then
	func(button)
end
self:ReleaseUtilDlgEx()
end