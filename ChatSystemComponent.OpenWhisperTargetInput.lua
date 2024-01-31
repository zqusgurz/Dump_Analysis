return function (self) 
_UtilDlgLogic:Input("귓속말 상대를 입력하세요.", false, self.LastReceivedWhisperFrom, function(name)
	self:OnTypeWhisperTarget(name)
end, nil)
self.ChatTargetList.Enable = false
end