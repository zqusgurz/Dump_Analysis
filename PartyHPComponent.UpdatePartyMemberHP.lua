return function (self,id,user) 
---@type table<Entity>
local members = self.MemberListEntities
for i=1,#members do
	local member = members[i]
	local hpElement = member.PartyHPMemberElementComponent
	if (hpElement.CharacterId == id) then
		if (isvalid(user)) then
			hpElement.GaugeBar.FillAmount = (user.WsUser.Hp / user.WsUser.MaxHp)
			hpElement.Name.FontColor = Color.black
		else
			hpElement.GaugeBar.FillAmount = 0
			hpElement.Name.FontColor = Color.FromHexCode("#444444")
		end
	end
end
end