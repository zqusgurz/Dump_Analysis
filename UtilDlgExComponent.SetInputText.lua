return function (self,def,maxCharacters) 
self.InputField.Enable = true
self.InputField.TextInputComponent.ContentType = InputContentType.Standard
self.InputField.TextInputComponent.Text = def
self.InputField.TextComponent.Text = def
self.InputField.TextInputComponent.CharacterLimit = maxCharacters
end