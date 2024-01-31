return function (self) 
if self:IsClient() then
    self:SpawnLeaderBoard()
    
elseif self:IsServer() then
    self.updateLeaderBoard = _TimerService:SetTimerRepeat(function() self:UpdateLeaderBoard() end,180,10)
    
end
end