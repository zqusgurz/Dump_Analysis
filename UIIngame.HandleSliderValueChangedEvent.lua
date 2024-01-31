return function (self,event) 
--------------- Native Event Sender Info ----------------
-- Sender: SliderComponent
-- Space: Client
---------------------------------------------------------

-- Parameters
local Value = event.Value
---------------------------------------------------------
self.dt:GetChildByName("LevelShow").TextComponent.Text = tostring(math.floor(Value))
self.lv = Value
end