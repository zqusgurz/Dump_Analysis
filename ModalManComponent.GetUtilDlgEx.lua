return function (self) 
local modal = _ObjectPool:PickEx(self.UtilDlgExPool, "PooledUtilDlgExModal", 
		"model://218a4589-9d2f-4b93-bac1-52fdf7456624", Vector3.zero, self.Entity, false)
modal.Visible = false
modal.Enable = true
modal.UITransformComponent.anchoredPosition = Vector2.zero
table.insert(self.ActiveModalEntities, modal)
return modal
end