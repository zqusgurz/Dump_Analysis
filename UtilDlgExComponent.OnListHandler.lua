return function (self,index) 
--log(string.format("UtilDlgEx List: %d", index))
local func = self.ListHandler
if (func ~= nil) then
	func(index)
end
self:ReleaseUtilDlgEx()
end