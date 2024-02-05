return function (self,k_) 
---@type KeyboardKey
local key = k_

if (key == KeyboardKey.RightAlt) then
	key = KeyboardKey.LeftAlt
elseif (key == KeyboardKey.RightControl) then
	key = KeyboardKey.LeftControl
elseif (key == KeyboardKey.RightShift) then
	key = KeyboardKey.LeftShift
end

return key
end