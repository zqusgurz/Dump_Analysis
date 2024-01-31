return function (self,funcType,value) 
for key, f in pairs(self.FuncKeyMapped) do
	---@type FuncKey
	local func = f
	if (func.FuncType == _FuncKeyTypes.System and func.Id == value) then
		self.SystemInputs[func.Id] = nil
	end
end
end