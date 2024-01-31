return function (self,event) 
--------------- Native Event Sender Info ----------------
-- Sender: UserService
-- Space: Server
---------------------------------------------------------

-- Parameters
local UserId = event.UserId
---------------------------------------------------------
for i = 1, 2 do
	if self.force[i] and self.force[i].PlayerComponent.UserId == UserId then
		if self.ingame then
			self.force[i].PlayerMinigameDB.Free = 99999998
			self:EndGame(3 - i)
			return
		else
			self.force[i] = nil
			return
		end
	end
end
end