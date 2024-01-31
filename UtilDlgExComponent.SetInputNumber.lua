return function (self,def,min,max) 
self.InputField.Enable = true
self.InputField.TextInputComponent.ContentType = InputContentType.IntegerNumber
self.InputField.TextInputComponent.Text = tostring(def)
self.InputField.TextComponent.Text = tostring(def)
self.InputField.TextInputComponent.CharacterLimit = 11
self._T.Min = min
self._T.Max = max
end