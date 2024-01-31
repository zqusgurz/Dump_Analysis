return function (self,type) 
self.TextContent.ScriptTextComponent.AddHeightForButton = false
self.BtEnd.Enable = true
if (type == _UtilDlgExButtonType.Ok or type == _UtilDlgExButtonType.PrevOk) then
	self.BtOk.Enable = true
else
	self.BtOk.Enable = false
end
if (type == _UtilDlgExButtonType.PrevOk or type == _UtilDlgExButtonType.PrevNext) then
	self.BtPrev.Enable = true
	self.TextContent.ScriptTextComponent.AddHeightForButton = true
else
	self.BtPrev.Enable = false
end
if (type == _UtilDlgExButtonType.PrevNext or type == _UtilDlgExButtonType.Next) then
	self.BtNext.Enable = true
	self.TextContent.ScriptTextComponent.AddHeightForButton = true
else
	self.BtNext.Enable = false
end
if (type == _UtilDlgExButtonType.AcceptDecline) then
	self.BtAccept.Enable = true
	self.BtDecline.Enable = true
else
	self.BtAccept.Enable = false
	self.BtDecline.Enable = false
end
if (type == _UtilDlgExButtonType.YesNo) then
	self.BtYes.Enable = true
	self.BtNo.Enable = true
else
	self.BtYes.Enable = false
	self.BtNo.Enable = false
end
end