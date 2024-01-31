return function (self) 
local ret = 0
if not (_UtilLogic:IsNilorEmptyString(self.Tab1UOL)) then
	ret = ret + 1
end
if not (_UtilLogic:IsNilorEmptyString(self.Tab2UOL)) then
	ret = ret + 1
end
if not (_UtilLogic:IsNilorEmptyString(self.Tab3UOL)) then
	ret = ret + 1
end
if not (_UtilLogic:IsNilorEmptyString(self.Tab4UOL)) then
	ret = ret + 1
end
if not (_UtilLogic:IsNilorEmptyString(self.Tab5UOL)) then
	ret = ret + 1
end
return ret
end