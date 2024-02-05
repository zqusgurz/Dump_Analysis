return function (self,pool,entity) 
_ObjectPool:Release(pool, entity)
entity.Visible = false
---@type table<Entity>
local tb = self.ActiveModalEntities
for i=1,#tb do
	local t = tb[i]
	if (t.Id == entity.Id) then
		table.remove(tb, i)
		return
	end
end
end