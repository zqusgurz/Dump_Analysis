return function (self,normalized) 
-- UI/UIWindow.img/Skill/CoolTime
local value = _NumberUtils:Round(normalized * 15)
local sp = self.Entity.SpriteGUIRendererComponent
if (value == 0) then
    sp.ImageRUID = _UidMan:GetRawRUID("35e062f7eae74c56894191fa132288d3")
elseif (value == 1) then
    sp.ImageRUID = _UidMan:GetRawRUID("32f91382effc46a5b72c5e8ce12365f8")
elseif (value == 2) then
    sp.ImageRUID = _UidMan:GetRawRUID("d031aae7fcc146daafdb83daad5b8125")
elseif (value == 3) then
    sp.ImageRUID = _UidMan:GetRawRUID("7b446b4aa8d44002b58f28e7f2e825ce")
elseif (value == 4) then
    sp.ImageRUID = _UidMan:GetRawRUID("6278b46870a3491da97b5b2ff7869763")
elseif (value == 5) then
    sp.ImageRUID = _UidMan:GetRawRUID("083caaa990f7458382e35fc2730c886e")
elseif (value == 6) then
    sp.ImageRUID = _UidMan:GetRawRUID("5462ff008a394525b234c5ca5e3760d4")
elseif (value == 7) then
    sp.ImageRUID = _UidMan:GetRawRUID("9f065cbf615e4fcda672d7d655c5e101")
elseif (value == 8) then
    sp.ImageRUID = _UidMan:GetRawRUID("d1e1213c777b4de2b6a7f02a3157f467")
elseif (value == 9) then
    sp.ImageRUID = _UidMan:GetRawRUID("6093f6d7679f40ee94067d2ec0214061")
elseif (value == 10) then
    sp.ImageRUID = _UidMan:GetRawRUID("90b01740773548eb9bc079084e11c50f")
elseif (value == 11) then
    sp.ImageRUID = _UidMan:GetRawRUID("4f5abe89662046d9ab605e8064ecb00f")
elseif (value == 12) then
    sp.ImageRUID = _UidMan:GetRawRUID("1887621366054959a13f832aba65c65e")
elseif (value == 13) then
    sp.ImageRUID = _UidMan:GetRawRUID("2d0b81fb3b2a483bbe92f3c0ef3590bd")
elseif (value == 14) then
    sp.ImageRUID = _UidMan:GetRawRUID("50a45b9e9083425a9d85d165b47ae661")
else
    sp.ImageRUID = _UidMan:GetRawRUID("da11c26888704be9a2fd74aad38e0c71")
end
end