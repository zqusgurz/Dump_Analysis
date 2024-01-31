return function (self) 
if (self.InputField.TextInputComponent.Text == "") then
	_UtilDlgLogic:Show("값이 입력되지 않았습니다.")
	return false
end
if (self.InputField.TextInputComponent.ContentType == InputContentType.Standard) then
	-- Another check?
elseif (self.InputField.TextInputComponent.ContentType == InputContentType.IntegerNumber) then
	local num = tonumber(self.InputField.TextInputComponent.Text)
	if (num < self._T.Min) then
		_UtilDlgLogic:Show(string.format("%d 이상의 값만 입력할 수 있습니다.", self._T.Min))
		return false
	end
	if (num > self._T.Max) then
		_UtilDlgLogic:Show(string.format("%d 이하의 값만 입력할 수 있습니다.", self._T.Max))
		return false
	end
end
return true
end