return function (self) 
if self.update == false then
	self.update = true
	
	local jobList = self.dt:GetChildByName("JobList")
	
	jobList:ConnectEvent(ButtonClickEvent, function()
		local Scroll_Layout = jobList:GetChildByName("Scroll_Layout")
		Scroll_Layout.Enable = not Scroll_Layout.Enable
		end)
	local job = _EntityService:GetEntityByPath("/ui/DataInput/PlayerDataInput/img_pattern/JobList/Scroll_Layout/0")
	local jobsTable = {"검사", "파이터", "크루세이더", "히어로", "페이지", "나이트", "팔라딘", "스피어맨", "버서커", "다크나이트",
	"매지션", "위자드(불,독)", "메이지(불,독)", "아크메이지(불,독)", "위자드(썬,콜)", "메이지(썬,콜)", "아크메이지(썬,콜)","클레릭", "프리스트", "비숍",
	"아처", "헌터", "레인저", "보우마스터", "사수", "저격수", "신궁",
	"로그", "어쌔신", "허밋", "나이트로드", "시프", "시프마스터", "섀도어",
	"해적", "인파이터", "버커니어", "바이퍼", "건슬링거", "발키리", "캡틴"
	}
	for i = 1, #jobsTable do
		local touchJob = _SpawnService:SpawnByEntity(job, tostring(i), Vector3.zero)
		touchJob.TextComponent.Text = jobsTable[i]
		touchJob:ConnectEvent(ButtonClickEvent, function()
			jobList:GetChildByName("Scroll_Layout").Enable = false
			jobList.TextComponent.Text = jobsTable[tonumber(touchJob.Name)]
			self.job = jobsTable[tonumber(touchJob.Name)]
			end)
	end
	
	for i = 1, 3 do
		local text = _EntityService:GetEntityByPath("/ui/DataInput/PlayerDataInput/img_pattern/F_input"..tostring(i)).TextComponent
		text.Text = self.favorite[i]
	end
	
end
end