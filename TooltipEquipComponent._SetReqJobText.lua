return function (self,jobClass,available) 
if (jobClass == 0) then
	self.ReqJobBeginner.FontColor = available and Color.white or Color.red
elseif (jobClass == 1) then
	self.ReqJobWarrior.FontColor = available and Color.white or Color.red
elseif (jobClass == 2) then
	self.ReqJobMagician.FontColor = available and Color.white or Color.red
elseif (jobClass == 3) then
	self.ReqJobArcher.FontColor = available and Color.white or Color.red
elseif (jobClass == 4) then
	self.ReqJobThief.FontColor = available and Color.white or Color.red
end
end