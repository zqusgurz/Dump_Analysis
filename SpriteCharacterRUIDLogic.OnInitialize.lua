return function (self) 
self.ItemNumberSecondDigits = {
	-- UI/Basic.img/ItemNoSecond (MSW Resources)
	["0"] = self:CreateSpriteCharacter(_UidMan:GetRawRUID("2544f8800bb642fd8a070c26364cbc80"),Vector2(0,0),0),
	["1"] = self:CreateSpriteCharacter(_UidMan:GetRawRUID("eef53db994df4ab181455595660f6cf7"),Vector2(0,0),0),
	["2"] = self:CreateSpriteCharacter(_UidMan:GetRawRUID("99f83a54697a4cadbab57b1835a4ec5a"),Vector2(0,0),0),
	["3"] = self:CreateSpriteCharacter(_UidMan:GetRawRUID("1a6db27e6f6843a29b2a12aa971e028e"),Vector2(0,0),0),
	["4"] = self:CreateSpriteCharacter(_UidMan:GetRawRUID("af77e4cca12e488f93074d1541206b0c"),Vector2(0,0),0),
	["5"] = self:CreateSpriteCharacter(_UidMan:GetRawRUID("cd3b5f0b61c84c77acacaa60a724f76a"),Vector2(0,0),0),
	["6"] = self:CreateSpriteCharacter(_UidMan:GetRawRUID("c70dcab0d7704e50b1e916df1e4471d9"),Vector2(0,0),0),
	["7"] = self:CreateSpriteCharacter(_UidMan:GetRawRUID("c96c899f5cd04851a128a1f4f419706a"),Vector2(0,0),0),
	["8"] = self:CreateSpriteCharacter(_UidMan:GetRawRUID("c12586b4c6964034a3431935a3abcf38"),Vector2(0,0),0),
	["9"] = self:CreateSpriteCharacter(_UidMan:GetRawRUID("2ab7dea5851f4ed1a508f1f0f23c18fc"),Vector2(0,0),0)
}
self.ItemNumberDigits = {
	["0"] = self:CreateSpriteCharacter(_UidMan:Get("UI/Basic.img/ItemNo/0"),Vector2(0,0),0),
	["1"] = self:CreateSpriteCharacter(_UidMan:Get("UI/Basic.img/ItemNo/1"),Vector2(0,0),0),
	["2"] = self:CreateSpriteCharacter(_UidMan:Get("UI/Basic.img/ItemNo/2"),Vector2(0,0),0),
	["3"] = self:CreateSpriteCharacter(_UidMan:Get("UI/Basic.img/ItemNo/3"),Vector2(0,0),0),
	["4"] = self:CreateSpriteCharacter(_UidMan:Get("UI/Basic.img/ItemNo/4"),Vector2(0,0),0),
	["5"] = self:CreateSpriteCharacter(_UidMan:Get("UI/Basic.img/ItemNo/5"),Vector2(0,0),0),
	["6"] = self:CreateSpriteCharacter(_UidMan:Get("UI/Basic.img/ItemNo/6"),Vector2(0,0),0),
	["7"] = self:CreateSpriteCharacter(_UidMan:Get("UI/Basic.img/ItemNo/7"),Vector2(0,0),0),
	["8"] = self:CreateSpriteCharacter(_UidMan:Get("UI/Basic.img/ItemNo/8"),Vector2(0,0),0),
	["9"] = self:CreateSpriteCharacter(_UidMan:Get("UI/Basic.img/ItemNo/9"),Vector2(0,0),0)
}
self.Table = {
	[_SpriteCharacterType.ItemNumberSecond] = self.ItemNumberSecondDigits,
	[_SpriteCharacterType.ItemNumber] = self.ItemNumberDigits,
}
end