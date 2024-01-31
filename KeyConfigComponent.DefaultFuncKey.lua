return function (self) 
--log ("Default!")
self.TempKeySettings = _InputManager:Deserialize(_InputManager:MakeDefaultKeySetting())
self:InvalidatePosition()
self.Changed = true
end