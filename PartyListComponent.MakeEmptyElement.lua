return function (self) 
local newMember = _SpawnService:SpawnByModelId("model://9a0ff8b2-cb5e-4b70-ab36-ef4df657ca01", "Empty", Vector3.zero, self.MemberElements)
local elem = newMember.PartyMemberElementComponent
elem.Job.Text = ""
elem.JobTooltip.Title = ""
elem.Name.Text = "없음"
elem.Level.Text = ""
elem.LeaderIcon.Enable = false
elem:SetSelected(false)
self.MemberNumText.Text = "0/0"
self.EmptyElement = newMember
end