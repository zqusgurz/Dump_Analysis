return function (self,name,member,lv,job,chanel) 
local panels = _EntityService:GetEntityByPath("/ui/UIGroup/Model_EmptyEntity/PartyInfo/PartyInfoPanel/UIEmpty")
local members = _EntityService:GetEntityByPath("/ui/UIGroup/Model_EmptyEntity/PartyInfo/PartyInfoPanel/UIEmpty/Member/Scroll_Layout")
_EntityService:GetEntityByPath("/ui/UIGroup/Model_EmptyEntity/PartyInfo/PartyInfoPanel/UIEmpty").Enable = true
panels:GetChildByName("PartyName").TextComponent.Text = name
panels:GetChildByName("Category").TextComponent.Text = "일반"
panels:GetChildByName("Chanel").TextComponent.Text = chanel
_SoundService:PlaySound("cd0bd46d7f454640b82c9dfff0c6677b", 1)
if chanel == "현재" then
	if self.partyID ~= 0 then
		panels:GetChildByName("JoinParty").Enable = false
	else
		panels:GetChildByName("JoinParty").Enable = true
	end
else
	panels:GetChildByName("JoinParty").Enable = false
end

if self.clickParty and isvalid(self.clickParty) then
	self.clickParty:GetChildByName("LeaderName").TextComponent.FontColor = Color(255, 255, 255)
	self.clickParty:GetChildByName("PartyName").TextComponent.FontColor = Color(255, 255, 255)
	self.clickParty:GetChildByName("Category").TextComponent.FontColor = Color(255, 255, 255)
end
self.clickParty = self.voidClickParty
self.clickParty:GetChildByName("LeaderName").TextComponent.FontColor = Color(0, 199, 24)
self.clickParty:GetChildByName("PartyName").TextComponent.FontColor = Color(0, 199, 24)
self.clickParty:GetChildByName("Category").TextComponent.FontColor = Color(0, 199, 24)

for i = 1, 6 do
	local mem = members:GetChildByName("Member"..tostring(i))
	local nick = mem:GetChildByName("NickName").TextComponent
	local LL = mem:GetChildByName("Level").TextComponent
	local JJ = mem:GetChildByName("Job").TextComponent
	if member[i] ~= nil and member[i] ~= "" then
		nick.Text = member[i]
		if job[i] == "" then
			JJ.Text = "?"
		else
			JJ.Text = tostring(job[i])
		end
		
		if lv[i] == 0 then
			LL.Text = "?"
		else
			LL.Text = tostring(lv[i])
		end
	else
		nick.Text = ""
		LL.Text = ""
		JJ.Text = ""		
	end
end
end