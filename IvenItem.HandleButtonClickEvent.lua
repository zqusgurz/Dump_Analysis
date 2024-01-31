return function (self,event) 
--------------- Native Event Sender Info ----------------
-- Sender: ButtonComponent
-- Space: Client
---------------------------------------------------------

-- Parameters
local Entity = event.Entity
local common = _EntityService:GetEntityByPath("/common").Inven
---------------------------------------------------------
common:ItemSelectEvent(self.category, self.info, self.icon, self.Entity.Name)
common.click_item = self.idx

end