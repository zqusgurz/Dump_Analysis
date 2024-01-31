return function (self) 
local root
if (_DebugConstants:IsMobile()) then
	root = self.MobileRoot
else
	root = self.PcRoot
end
return root
end