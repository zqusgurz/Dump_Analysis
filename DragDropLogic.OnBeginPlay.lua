return function (self) 
self.DragDropSounds = {
	["DragStart"] = "fe94ee3bd6c64b05adba9538a538f90a", -- DragStart
	["DragEnd"] = "2cbd0fd67ba3493491ea2e18a776a095"  -- DragEnd
}
_TimerService:SetTimerRepeat(self.CheckDragging, 0.03, 1)
end