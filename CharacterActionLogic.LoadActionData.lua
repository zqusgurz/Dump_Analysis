return function (self,root,rootActionName,pieced,zigzag) 
---@type ActionData
local ret = {}

ret.Pieced = pieced
ret.Zigzag = zigzag
ret.EventDelay = 0
ret.TotalDelay = 0
ret.Pieces = {}
ret.PlayRate = {}
local pieces = ret.Pieces

local num = 0

for i, obj in _WzUtils:GetLabeled(root) do
	local delay = _WzUtils:GetInt32(obj.delay, 0) / 1000
	local piece = {}
	if (pieced) then
		if (delay < 0) then
			delay = -delay
			ret.EventDelay += delay
		end
		piece.Action = _WzUtils:GetString(obj.action, "")
		piece.Frame = _WzUtils:GetInt32(obj.frame, 0) + 1
	else
		piece.Action = rootActionName
		piece.Frame = 1
	end
	piece.Delay = delay
	--self.Pieces[piece.Frame] = piece
	
	pieces[num + 1] = piece
	num += 1
	
	ret.TotalDelay += delay
end
if not (pieced) then
	ret.EventDelay = ret.TotalDelay - pieces[#pieces].Delay
end
ret.PiecesNum = num

local playRates = ret.PlayRate
local actions = self.Actions

for i=1,#pieces do
	local piece = pieces[i]
	if (pieced) then
		local originalAction = actions[piece.Action]
		local originalFrame = originalAction.Pieces[piece.Frame]
		playRates[i] = originalFrame.Delay / piece.Delay
	else
		playRates[i] = 1
	end
end

ret.GetTotalFrameDelay = function(self, playRate) 
	return self.TotalDelay * playRate
end
ret.GetActionDelay = function(self, playRate) 
	return self:GetTotalFrameDelay(playRate) * self.EventDelay / self.TotalDelay
end

return ret
end