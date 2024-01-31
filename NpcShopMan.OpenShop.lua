return function (self,npcId,shopData) 
local shopEntity = _AppService:Get().ControlWindowMan.NpcShop
local shop = shopEntity.NpcShopComponent
shop:SetShopInfo(npcId, shopData)
shop:SetVisible(true, false)
end