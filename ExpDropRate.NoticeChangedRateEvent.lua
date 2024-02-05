return function (self,mode,newState,rate,endTimeElapsed) 
if (newState) then
	local endTime = DateTime(endTimeElapsed)
	local endTimeLocal = _UtilLogic:GetLocalTimeFrom(endTime)
	local mes = string.format("[이벤트] %02d월 %02d일 %02d시 %02d분 까지 %s %d배 이벤트가 시작됩니다.",
		endTimeLocal.Month, endTimeLocal.Day, endTimeLocal.Hour, endTimeLocal.Minute, mode, rate)
	_ChatMessageLogic:Add(_ChatMessageType.Yellow, mes)
else
	local mes = string.format("[이벤트] %s 이벤트가 종료되었습니다.", mode)
	_ChatMessageLogic:Add(_ChatMessageType.Yellow, mes)
end
end