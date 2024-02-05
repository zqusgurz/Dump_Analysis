return function (self,text) 
if (_UtilLogic:IsNilorEmptyString(text)) then
	self.LoadingProgress.Text = ""
else
	self.LoadingProgress.Text = string.format("불러오는 중: %s", text)
end
end