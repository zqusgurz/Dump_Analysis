return function (self) 
self.Entity:GetChildByName("BackgroundHour").Enable = false
self.Entity:GetChildByName("BackgroundMinute").Enable = false
local function disableDigits(name)
	local children = self.Entity:GetChildByName(name).Children
    for _, child in pairs(children) do
        child.Enable = false
    end
end
disableDigits("X1")
disableDigits("X2")
disableDigits("X3")
disableDigits("X4")
end