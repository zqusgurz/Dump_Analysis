return function (self) 
self._textArea = _SpawnService:SpawnByModelId("model://uiempty", "TextArea", Vector3.zero, self.Entity)
---@type ChildObjectPoolComponent
local objectPool = self._textArea:AddComponent(ChildObjectPoolComponent)
objectPool.ModelId = "model://9665fbdd-778a-4206-a1c6-e6c651f5fa29"
end