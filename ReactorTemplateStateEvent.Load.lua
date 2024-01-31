return function (self,obj) 
self.Type = obj:GetInt32("type", 0)
self.State = obj:GetInt32("state", 0)
self.Lt = obj:GetVector2D("lt", Vector2.zero)
self.Rb = obj:GetVector2D("rb", Vector2.zero)
for _,v in obj:IterateLabeled() do
	table.insert(self.Data, v:_GetValue_Int32())
end
return self
end