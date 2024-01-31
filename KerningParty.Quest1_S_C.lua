return function (self) 
local num = self.randomNumber
if num == 10 then
	_UIToast:ShowMessage("전사/도적/궁수의 최소 전직레벨은 몇인가? 그 이상 잡으시오. 지금 ".._UserService.LocalPlayer.PlayerData.ticket.." 마리")
elseif num == 8 then
		_UIToast:ShowMessage("법사의 최소 전직레벨은 몇인가? 그 이상 잡으시오. 지금 ".._UserService.LocalPlayer.PlayerData.ticket.." 마리")
elseif num == 35 then
		_UIToast:ShowMessage("전사의 최소 STR은 몇인가? 그 이상 잡으시오. 지금 ".._UserService.LocalPlayer.PlayerData.ticket.." 마리")
elseif num == 15 then
		_UIToast:ShowMessage("1에서 2레벨이 될때 필요한 경험치는 몇인가? 그 이상 잡으시오. 지금 ".._UserService.LocalPlayer.PlayerData.ticket.." 마리")
elseif num == 25 then
		_UIToast:ShowMessage("도적/궁수의 최소 DEX는 몇인가? 그 이상 잡으시오. 지금 ".._UserService.LocalPlayer.PlayerData.ticket.." 마리")
elseif num == 20 then
		_UIToast:ShowMessage("법사의 최소 INT는 몇 인가? 그 이상 잡으시오. 지금 ".._UserService.LocalPlayer.PlayerData.ticket.." 마리")
end
end