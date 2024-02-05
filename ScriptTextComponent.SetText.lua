return function (self,text,hasAnimation) 
local txt = _UtilLogic:Replace(text, "\\n", "\n")
txt = _UtilLogic:Replace(txt, "\r\r", "\n")
self.HasTextAnimation = hasAnimation
self.Text = txt
self:SetDirty()
end