return function (self,tabIndex) 
if (isvalid(self.FunctionTarget)) then
	if (tabIndex == 1) then
		self.FunctionTarget:SendEvent(InvokeFunctionEvent("Tab1", self.Entity))
	elseif (tabIndex == 2) then
		self.FunctionTarget:SendEvent(InvokeFunctionEvent("Tab2", self.Entity))
	elseif (tabIndex == 3) then
		self.FunctionTarget:SendEvent(InvokeFunctionEvent("Tab3", self.Entity))
	elseif (tabIndex == 4) then
		self.FunctionTarget:SendEvent(InvokeFunctionEvent("Tab4", self.Entity))
	elseif (tabIndex == 5) then
		self.FunctionTarget:SendEvent(InvokeFunctionEvent("Tab5", self.Entity))
	end
end
end