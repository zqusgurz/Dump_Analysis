return function (self,id) 
for i=#self.ActiveIcons,1,-1 do
	---@type TemporaryStatIconComponent
	local currentViewIcon = self.ActiveIcons[i]
	
	-- StatToId에 있는 스탯이 현재 아이콘에 맞는 스탯 + StatToId가 가진 Reason과 일치
	--   -->  아직 활성화된 스탯이 있음, 아이콘 유지 필요.
    local remainStat = _TableUtils:Any(self.StatToId, function(stat,reason)
        return currentViewIcon:ContainsStat(stat) and currentViewIcon.Id == reason
    end)
	
	if (currentViewIcon.Id == id or not remainStat) then
		log("overlapped icon index: ", i)
		self:RemoveIcon(currentViewIcon)
		table.remove(self.ActiveIcons, i)
	end
end
end