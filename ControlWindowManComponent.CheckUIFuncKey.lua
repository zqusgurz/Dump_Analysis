return function (self,systemFunc,action) 
if (_InputManager:IsPressed(systemFunc)) then
	_InputManager:MarkNoKeyInputFuncKey(_FuncKeyTypes.System, systemFunc)
	action()
end
end