return function (self) 
self._normalLeft = _UidMan:Get(string.format("UI/Basic.img/Tab%d/left0", self.TabType))
self._normalFill = _UidMan:Get(string.format("UI/Basic.img/Tab%d/fill0", self.TabType))
self._normalRight = _UidMan:Get(string.format("UI/Basic.img/Tab%d/right0", self.TabType))
self._highlightedLeft = _UidMan:Get(string.format("UI/Basic.img/Tab%d/left1", self.TabType))
self._highlightedFill = _UidMan:Get(string.format("UI/Basic.img/Tab%d/fill1", self.TabType))
self._highlightedRight = _UidMan:Get(string.format("UI/Basic.img/Tab%d/right1", self.TabType))
self._normalHighlightedMiddle = _UidMan:Get(string.format("UI/Basic.img/Tab%d/middle2", self.TabType))
self._highlightedNormalMiddle = _UidMan:Get(string.format("UI/Basic.img/Tab%d/middle1", self.TabType))
self._normalNormalMiddle = _UidMan:Get(string.format("UI/Basic.img/Tab%d/middle0", self.TabType))
end