return function (self,type,callbackYes,callbackNo) 
local loginErrorWnd = self.LoginError.LoginErrorWindowComponent
loginErrorWnd:ChangeBack(0)
loginErrorWnd.BtOk.Enable = false
loginErrorWnd.BtYes1.Enable = true
loginErrorWnd.BtNo1.Enable = true
self.LoginErrorPromptNoCallback = nil
self.LoginErrorPromptYesCallback = nil
if (type == _LoginError.Prompt_DeleteCharacter) then
	self.LoginErrorPromptNoCallback = callbackNo
	self.LoginErrorPromptYesCallback = callbackYes
	loginErrorWnd:Show(_UidMan:GetRawRUID("c2f4102b843040c9a9e3b120e729b1e4")) -- UI/Login.img/Notice/text/13
end
end