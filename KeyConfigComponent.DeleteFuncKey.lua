return function (self) 
--log ("Delete!")
self.TempKeySettings = _InputManager:Deserialize(_InputManager:MakeDeleteKeySetting())
self:InvalidatePosition()
self.Changed = true
end