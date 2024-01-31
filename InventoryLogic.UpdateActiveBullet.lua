return function (self,except,except2) 
local user = _UserService.LocalPlayer
local cd = user.WsCharacterData
local beforeItemId = _BulletConsumeLogic.ActiveBulletItemId
local afterPos, afterItemId = _BulletConsumeLogic:GetProperBulletPosition(cd, 0, 0, nil)
_BulletConsumeLogic.ActiveBulletPos = afterPos
_BulletConsumeLogic.ActiveBulletItemId = afterItemId
if (except2 == nil) then
    except2 = -1
end
-- log(string.format("UpdateActiveBullet before=%d  after=%d  except=%d  except2=%d", before, after, except, except2))
for i=1,cd.ItemMaxSlot[2] do
	local item = cd:GetItem(2, i)
	if (item == nil) then
		continue
	end
	if (i == except or i == except2) then
		continue
	end
	if (_Items:IsRechargable(item.ItemId) or _Items:IsCrossbowArrow(item.ItemId) or _Items:IsArrow(item.ItemId)) then
        --log("invalidate slot ", i , " / ", item.ItemId)
		self:InvalidateItemSlot(2, i)
	end
end
if (beforeItemId ~= afterItemId) then
	_AppService.ClientUpdateFlag |= _ChangedClientFlag.SecondaryStat
end
end