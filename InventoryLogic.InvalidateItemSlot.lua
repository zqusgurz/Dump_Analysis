return function (self,TI,pos) 
if (TI == 1 and pos < 0) then
	local e = _AppService:Get().ControlWindowMan.Equip.EquipWindowComponent
	if (e:IsVisible()) then
		if (pos < -100) then
			pos += 100
		end
		e:InvalidateItem(-pos)
		e:UpdateDisabledEquip()
	end
else
	local w = _AppService:Get().ControlWindowMan.Item.ItemWindowComponent

	if (w:IsVisible()) then
		if (w.CurrentTab == TI) then
			w:InvalidateItem(TI, pos)
		end
	end
end
end