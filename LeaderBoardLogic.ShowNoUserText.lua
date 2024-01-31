return function (self,type) 
if type == "Othello" then
	local noUserText = self.OthelloRankUI.Parent:GetChildByName("NoUser")
	noUserText.Enable = true
	
elseif type == "Gomoku" then
	local noUserText = self.GomokuRankUI.Parent:GetChildByName("NoUser")
	noUserText.Enable = true

elseif type == "Yut" then
	local noUserText = self.YutRankUI.Parent:GetChildByName("NoUser")
	noUserText.Enable = true

end
end