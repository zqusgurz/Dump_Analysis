return function (self) 
local scroll = self.Entity_Layout.ScrollLayoutGroupComponent
for i=1,15 do
	scroll:SetScrollNormalizedPosition(UITransformAxis.Vertical, 1)
    wait(0.01)
end
--log("Move To Bottom")
end