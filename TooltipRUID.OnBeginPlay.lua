return function (self) 
self.Table[_EquipTooltipReqType.Level] = {
	[true] = _UidMan:Get("UI/UIWindow.img/ToolTip/Equip/Can/reqLEV"),
	[false] = _UidMan:Get("UI/UIWindow.img/ToolTip/Equip/Cannot/reqLEV")
}
self.Table[_EquipTooltipReqType.Str] = {
	[true] = _UidMan:Get("UI/UIWindow.img/ToolTip/Equip/Can/reqSTR"),
	[false] = _UidMan:Get("UI/UIWindow.img/ToolTip/Equip/Cannot/reqSTR")
}
self.Table[_EquipTooltipReqType.Dex] = {
	[true] = _UidMan:Get("UI/UIWindow.img/ToolTip/Equip/Can/reqDEX"),
	[false] = _UidMan:Get("UI/UIWindow.img/ToolTip/Equip/Cannot/reqDEX")
}
self.Table[_EquipTooltipReqType.Int] = {
	[true] = _UidMan:Get("UI/UIWindow.img/ToolTip/Equip/Can/reqINT"),
	[false] = _UidMan:Get("UI/UIWindow.img/ToolTip/Equip/Cannot/reqINT")
}
self.Table[_EquipTooltipReqType.Luk] = {
	[true] = _UidMan:Get("UI/UIWindow.img/ToolTip/Equip/Can/reqLUK"),
	[false] = _UidMan:Get("UI/UIWindow.img/ToolTip/Equip/Cannot/reqLUK")
}
self.Table[_EquipTooltipReqType.Pop] = {
	[true] = _UidMan:Get("UI/UIWindow.img/ToolTip/Equip/Can/reqPOP"),
	[false] = _UidMan:Get("UI/UIWindow.img/ToolTip/Equip/Cannot/reqPOP")
}
end