return function (self,obj) 
if (self.TradingRoomPos < 0) then
	log("drop return 1")
	return
end

local d = obj.DraggingComponent
if (d.ObjectType ~= _DraggableObjectType.Item) then
	log("drop return 2")
	return
end
-- Try Put Item on TradingRoom
local tradeRoom = _AppService:Get().ControlWindowMan.TradingRoom.TradingRoomComponent
if (tradeRoom.MyLock.Enable) then
	log("drop return 3")
	return
end

---@type DraggableItem
local draggedItem = d.HoldingObject
local TI = draggedItem.LinkedTI
local pos = draggedItem.LinkedPos
local tradePos = self.TradingRoomPos
local player = _UserService.LocalPlayer
local cd = player.WsCharacterData

if (self.Item ~= nil) then
	log("drop return 4")
	return
end
local item = cd:GetItem(TI, pos)
if (item == nil) then
	_UtilDlgLogic:Show("잠시 후 다시 시도하세요.")
	return
end
if (not _TradingRoomLogic:IsTradeAvailable(item)) then
	_UtilDlgLogic:Show("이 아이템은 다른 사람에게 줄 수 없습니다.")
	return
end
if (_Items:IsTreatSinglyOnTrading(item) or item.Number == 1) then
	player.WsUser.ExclusiveAction = true
	_TradingRoomLogic:PutItem(player, tradePos, TI, pos, item.Number)
else
	_UtilDlgLogic:Input("몇 개나 올리시겠습니까?", true, tostring(item.Number), function(val)
		local num = math.tointeger(tonumber(val))
		if (num == nil or num <= 0) then
			_UtilDlgLogic:Show("1 이상의 숫자만 가능합니다.")
			return true
		end
		if (num > item.Number) then
			_UtilDlgLogic:Show(string.format("%d 이하의 숫자만 가능합니다", item.Number))
			return true
		end
		player.WsUser.ExclusiveAction = true
		_TradingRoomLogic:PutItem(player, tradePos, TI, pos, num)
	end, nil)
end
end