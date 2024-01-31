return function (self) 
for i=1,self.SpriteNum do
	local s = self.Sprites[i]
	if (s == nil or not isvalid(s[1]) or s[2] == nil) then
		continue
	end
	---@type MapleSpriteRendererComponent
	local msp = s[1]
	msp:SetWzSprite(s[2], true)
end
self.SpriteNum = 0
self.Sprites = {}
end