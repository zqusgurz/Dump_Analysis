return function (self) 
local type = self.ScrollBarType
self._vbarPrevEnabledRUID = _UidMan:Get(string.format("UI/Basic.img/VScr%d/enabled/prev0", type))
self._vbarPrevDisabledRUID = _UidMan:Get(string.format("UI/Basic.img/VScr%d/disabled/prev", type))
self._vbarNextEnabledRUID = _UidMan:Get(string.format("UI/Basic.img/VScr%d/enabled/next0", type))
self._vbarNextDisabledRUID = _UidMan:Get(string.format("UI/Basic.img/VScr%d/disabled/next", type))
self._vbarBaseEnabledRUID = _UidMan:Get(string.format("UI/Basic.img/VScr%d/enabled/base", type))
self._vbarBaseDisabledRUID = _UidMan:Get(string.format("UI/Basic.img/VScr%d/disabled/base", type))
self._vbarHandleRUID = _UidMan:Get(string.format("UI/Basic.img/VScr%d/enabled/thumb0", type))
self._vbarHandlePressedRUID = _UidMan:Get(string.format("UI/Basic.img/VScr%d/enabled/thumb1", type))
self._vbarHandleHighlightedRUID = _UidMan:Get(string.format("UI/Basic.img/VScr%d/enabled/thumb2", type))
end