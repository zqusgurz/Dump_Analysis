return function (self,object,firstChanged) 
--self._selfIsCanvas = object.Type == _WzVariantType.Canvas
--self._selfIsCanvas = object.Type == 8
self._selfIsCanvas = object["_ruid"] ~= nil
self._obj = object
--log("Set sprite " .. self.Path)
--self._needUpdateCollider = true

self:ClearAnimationTween()
if (self._selfIsCanvas) then
	self:_SetSpriteCanvas(object, firstChanged)
else
	if (object["1"] == nil and _WzUtils:GetInt32(object["0"]["delay"], 0) == 0) then
		self:_SetSprite(0, firstChanged)
		return
	end
	self._currentIndex = -1
	self._T.zigzag = _WzUtils:GetBool(object["zigzag"], false)
	self._T.increment = 1
	self:NextFrame(firstChanged)
end
end