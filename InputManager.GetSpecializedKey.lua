return function (self,key,func) 
if (key == KeyboardKey.Keypad0) then
	func = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.PickUp}
end
return func
end