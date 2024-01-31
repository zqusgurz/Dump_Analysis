return function (self,key) 
if (key == nil) then
	key = self.LocalBodyKey
end

---@type BodyAction
local registered = self.Registered[key]

registered.CurrentActionIndex += 1
---@type ActionData
local actionData = registered.ActionData
if (actionData.Pieced) then
	if (registered.CurrentActionIndex > actionData.PiecesNum) then
		return false
	end
else
	if (registered.CurrentActionIndex > 1) then
		return false
	end
end
local playRate = (registered.ActionAttackSpeed + 10) / 16
local body = registered.ActionBody
---@type ActionDataPiece
local piece = actionData.Pieces[registered.CurrentActionIndex]
local currentPiecePlayRate = actionData.PlayRate[registered.CurrentActionIndex]

--log(string.format("ActionPlay  action=%s currentIndex=%d currentPiecePlayRate=%.2f  playRate=%.2f",
--		piece.Action, registered.CurrentActionIndex, currentPiecePlayRate, playRate))
if (actionData.Pieced) then
	body:SendEvent(ActionStateChangedEvent(piece.Action, piece.Action, currentPiecePlayRate / playRate, SpriteAnimClipPlayType.Onetime, piece.Frame-1, piece.Frame-1))
else
	body:SendEvent(ActionStateChangedEvent(piece.Action, piece.Action, currentPiecePlayRate / playRate, SpriteAnimClipPlayType.Onetime))
end
return true
end