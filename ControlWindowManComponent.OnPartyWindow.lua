return function (self) 
local userListWin = self.UserList.UserListComponent
if (userListWin:IsVisible()) then
	userListWin:SetVisible(false, false)
else
	userListWin.Tabs:OnSelectedTab(1)
	userListWin:SetVisible(true, false)
end
end