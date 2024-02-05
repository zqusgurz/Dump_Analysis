return function (self) 
self.TooltipModelByType = {
	[_TooltipType.Bundle] = "model://ab401197-f77c-469a-869c-07290704166b",
	[_TooltipType.CashEquip] = "model://6ae64eaf-7efa-4e06-9613-c74f7f0ff9a8",
	[_TooltipType.Equip] = "model://215fcf60-b4ed-4e1a-9594-c0ec66ed1f7e",
	[_TooltipType.Function] = "model://41e9ab07-939f-440d-94cf-d8037732e91e",
	[_TooltipType.Mini] = "model://ed82ed05-0837-41c3-9894-8734a66e34c2",
	[_TooltipType.Shop] = "model://9485de30-7c14-47b1-a89e-f9842a33db96",
	[_TooltipType.Skill] = "model://b79bdf8f-58cb-4f64-8df9-2ccd9cac492e",
}
for type,modelId in pairs(self.TooltipModelByType) do
	local obj = _SpawnService:SpawnByModelId(modelId, "PooledTooltip-"..type, Vector3.zero, self.Entity)
	obj.Visible = false
	obj.Enable = false
	self.Test_Tooltips[type] = obj
end

_TimerService:SetTimerRepeat(self.CheckAutoTooltipClose, 0.5)
end