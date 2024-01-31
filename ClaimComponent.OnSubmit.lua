return function (self) 
local description = _UtilLogic:Trim(self.Description.Text, " \r\t\n")
local len = string.len(description)
if (len <= 0) then
	_UtilDlgLogic:Show("신고상황 설명을 입력해주세요.")
	return
end
if (len >= 1000) then
	_UtilDlgLogic:Show("신고상황 설명이 너무 깁니다.")
	return
end
local reportType = self.ReportType.SelectedIndex
if (reportType <= 0) then
	_UtilDlgLogic:Show("신고사유를 선택해주세요.")
	return
end
if (self.TargetName.SelectedIndex <= 0) then
	_UtilDlgLogic:Show("신고 캐릭터 이름을 선택해주세요.")
	return
end
local target = self.TargetName.SelectedText.Text
if (_UtilLogic:IsNilorEmptyString(target)) then
	_UtilDlgLogic:Show("신고 캐릭터 이름을 선택해주세요.")
	return
end
local attachments = nil
if (reportType ~= 6) then
	attachments = _ClaimLogic:CrawlChatLogs(self.Logs, target)
    if (#attachments == 0) then
        _UtilDlgLogic:Show("신고 기능에 문제가 발생했습니다.\n나중에 다시 시도해주세요.")
        return
    end
end
self.BtOk.FunctionButtonComponent:SetInteractible(false)
_ClaimLogic:RequestClaim(_UserService.LocalPlayer, reportType, target, description, attachments)
end