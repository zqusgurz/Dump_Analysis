return function (self) 
if (self.ExpRateByEvent ~= 1) then
	local endTime = DateTime(self.ExpRateEndTime)
	local endTimeLocal = _UtilLogic:GetLocalTimeFrom(endTime)
	local mes = string.format("[이벤트] 현재 %02d월 %02d일 %02d시 %02d분 까지 경험치 %d배 이벤트가 진행중입니다.",
		endTimeLocal.Month, endTimeLocal.Day, endTimeLocal.Hour, endTimeLocal.Minute, self.ExpRateByEvent)
	_ChatMessageLogic:Add(_ChatMessageType.Yellow, mes)
end
if (self.DropRateByEvent ~= 1) then
	local endTime = DateTime(self.DropRateEndTime)
	local endTimeLocal = _UtilLogic:GetLocalTimeFrom(endTime)
	local mes = string.format("[이벤트] 현재 %02d월 %02d일 %02d시 %02d분 까지 드롭률 %d배 이벤트가 진행중입니다.",
		endTimeLocal.Month, endTimeLocal.Day, endTimeLocal.Hour, endTimeLocal.Minute, self.DropRateByEvent)
	_ChatMessageLogic:Add(_ChatMessageType.Yellow, mes)
end
end