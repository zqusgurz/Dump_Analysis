return function (self) 
if (self.ButtonHandler ~= nil) then
	self:OnButtonHandler(-1)
elseif (self.ListHandler ~= nil) then
	self:OnListHandler(-1)
else
	self:ReleaseUtilDlgEx()
end
end