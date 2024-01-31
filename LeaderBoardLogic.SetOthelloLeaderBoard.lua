return function (self,othelloMmr,nickname,rankNum,userId) 
local noUserText = self.OthelloRankUI.Parent:GetChildByName("NoUser")

if noUserText.Enable == true then
	noUserText.Enable = false
	self.OthelloRankUI.Enable = true
end

local rank = self.OthelloRankUI:GetChildByName(tostring(rankNum))

if rankNum <= 3 then
	rank:GetChildByName("rankNum").TextComponent.FontColor = Color.FromHexCode("#FFFFFF")
else
	rank:GetChildByName("rankNum").TextComponent.FontColor = Color.FromHexCode("#BEBEBE")
end

if _UserService.LocalPlayer.PlayerComponent.UserId == userId then
	rank:GetChildByName("NickName").TextComponent.FontColor = Color.FromHexCode("#02B3C3")
else
	rank:GetChildByName("NickName").TextComponent.FontColor = Color.FromHexCode("#5B5B5B")
end

rank:GetChildByName("rankNum").TextComponent.Text = tostring(rankNum)
rank:GetChildByName("NickName").TextComponent.Text = nickname
rank:GetChildByName("Score").TextComponent.Text = tostring(othelloMmr)

rank.Enable = true
end