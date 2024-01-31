return function (self,event) 
--------------- Native Event Sender Info ----------------
-- Sender: InputService
-- Space: Client
---------------------------------------------------------

-- Parameters
local key = event.key
---------------------------------------------------------
if self.Entity.Enable then
    if self.ok and key == KeyboardKey.Return then
        self.ok:SendEvent(ButtonClickEvent())
    elseif self.no and key == KeyboardKey.Escape then
        self.no:SendEvent(ButtonClickEvent())
    end
end
end