return function (self,result) 
if (result == -1) then
	self.LoginButton.FunctionButtonComponent:SetInteractible(true)
	return
end

local loginErrorWnd = self.LoginError.LoginErrorWindowComponent
if (result == _LoginError.AlreadyConnected) then
	loginErrorWnd:ChangeBack(1)
	loginErrorWnd:Show(_UidMan:GetRawRUID("0434603dc2184fa7a8f7821bca4f0b60")) -- UI/Login.img/Notice/text/17
elseif (result == _LoginError.SystemError) then
	loginErrorWnd:ChangeBack(1)
	loginErrorWnd:Show(_UidMan:GetRawRUID("4ea3769123c94b2a8ccaafb99ee3cbca")) -- UI/Login.img/Notice/text/15
elseif (result == _LoginError.UnknownError) then
	loginErrorWnd:ChangeBack(1)
	loginErrorWnd:Show(_UidMan:GetRawRUID("c09e67f26b3b480b9cc33a298ffe2b71")) -- UI/Login.img/Notice/text/18
elseif (result == _LoginError.Busy) then
	loginErrorWnd:ChangeBack(1)
	loginErrorWnd:Show(_UidMan:GetRawRUID("8cc580f0870a4a1f94ae0543b98b98e2")) -- UI/Login.img/Notice/text/19
elseif (result == _LoginError.AlreadyUsingName) then
	loginErrorWnd:ChangeBack(1)
	loginErrorWnd:Show(_UidMan:GetRawRUID("6a84ea8075e34dd7a7aa24be8fdef8ad")) -- UI/Login.img/Notice/text/8
elseif (result == _LoginError.UnavailableName) then
	loginErrorWnd:ChangeBack(1)
	loginErrorWnd:Show(_UidMan:GetRawRUID("94ec08229475437cbb919f3d92b764d8")) -- UI/Login.img/Notice/text/10
elseif (result == _LoginError.NoMoreCharacter) then
	loginErrorWnd:ChangeBack(1)
	loginErrorWnd:Show(_UidMan:GetRawRUID("7b401a4c7152484ba7fe77f95a0c3eb0")) -- UI/Login.img/Notice/text/9
elseif (result == _LoginError.MaintenanceMode) then
	loginErrorWnd:ChangeBack(1)
	loginErrorWnd:Show(_UidMan:GetRawRUID("b2941dfaf366484d9f6a6e227b693a76")) -- UI/Login.img/Notice/text/32
end
loginErrorWnd.BtOk.Enable = true
loginErrorWnd.BtYes1.Enable = false
loginErrorWnd.BtNo1.Enable = false
end