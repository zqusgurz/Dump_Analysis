return function (self,e,scroll) 
local t = self._T[e]
if (not t) then
	t = {}
	self._T[e] = t
end

if (not t.ConnectedSetLowestCaret) then
	local base
	base = scroll.Entity:ConnectEvent(ScrollPositionChangedEvent, function(event)
		scroll:SetScrollNormalizedPosition(UITransformAxis.Vertical, 1)
		scroll.Entity:DisconnectEvent(ScrollPositionChangedEvent, base)
		t.ConnectedSetLowestCaret = nil
	end)
	t.ConnectedSetLowestCaret = true
end
end