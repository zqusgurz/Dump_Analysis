return function (self,inputX) 
self.NextUpdateWait = 0
if (inputX == -1 or inputX == 0 or inputX == 1) then
	self.LocalInputX = inputX 
	-- log("Changed(2) local input x to ", inputX)
end
end