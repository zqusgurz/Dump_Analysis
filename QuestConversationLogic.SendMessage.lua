return function (self,state) 
local buttonType = _UtilDlgExButtonType.Ok
local text = state.Messages[state.MessageIndex]
if (state.MessageIndex > #state.Messages) then
	self:OnResponse(state, 1)
	return
end

-- 거절하기, 조건 체크 실패, 퀘스트 수락/완료 이후
if (state.Stop) then
	if (state.MessageIndex == #state.Messages) then
		if (state.MessageIndex > 1) then
			buttonType = _UtilDlgExButtonType.PrevOk
		else
			buttonType = _UtilDlgExButtonType.Ok
		end
	elseif (state.MessageIndex == 1) then
		buttonType = _UtilDlgExButtonType.Next
	else
		buttonType = _UtilDlgExButtonType.PrevNext
	end
	
-- 아이템 선택
elseif (state.HasItemSelection) then
	buttonType = _UtilDlgExButtonType.None
	
-- 퀴즈 형식 퀘스트
elseif (state.Ask) then
	if (state.MessageIndex == #state.Messages) then
		buttonType = _UtilDlgExButtonType.Next
		state.Ask = false
	else
		buttonType = _UtilDlgExButtonType.None
	end
-- 수행 가능한 퀘스트
elseif (state.QuestState == 0) then
	if (state.MessageIndex == #state.Messages) then
		buttonType = _UtilDlgExButtonType.AcceptDecline
	elseif (state.MessageIndex == 1) then
		buttonType = _UtilDlgExButtonType.Next
	else
		buttonType = _UtilDlgExButtonType.PrevNext
	end
	
-- 진행중인 퀘스트
elseif (state.QuestState == 1) then
	if (not state.Lost) then
		-- 완료 가능한 퀘스트
		if (state.MessageIndex == 1) then
			buttonType = _UtilDlgExButtonType.Next
		else
			buttonType = _UtilDlgExButtonType.PrevNext
		end
		-- 마지막 대사일 경우, 보상 텍스트 추가
		if (state.MessageIndex == #state.Messages) then
			local rewardText, count = self:MakeRewardText(state)
			if (count > 1) then
				text ..= "\n\n" .. rewardText
			end
		end
	else
		-- 퀘스트 아이템 재지급일 경우
		if (state.MessageIndex == #state.Messages) then
			if (state.MessageIndex > 1) then
				buttonType = _UtilDlgExButtonType.PrevOk
			else
				buttonType = _UtilDlgExButtonType.Ok
			end
		elseif (state.MessageIndex == 1) then
			buttonType = _UtilDlgExButtonType.Next
		else
			buttonType = _UtilDlgExButtonType.PrevNext
		end
	end
end

local dlg = _UtilDlgLogic:GetUtilDlgEx()
dlg.UtilDlgExComponent:SetNpc(state.Npc)
dlg.UtilDlgExComponent:SetButton(buttonType)
dlg.UtilDlgExComponent:SetContent(_UtilLogic:Replace(_UtilLogic:Replace(text, "\\r\\r", "\n"), "\\r", ""))
dlg.UtilDlgExComponent:DisableInputField()
dlg.UtilDlgExComponent:UpdateScaleUI()
dlg.UtilDlgExComponent.PreCheckHandler = nil
if (state.Ask or state.HasItemSelection) then
	dlg.UtilDlgExComponent.ButtonHandler = nil
	dlg.UtilDlgExComponent.ListHandler = function(button)
		self:OnResponse(state, button)
	end
else
	dlg.UtilDlgExComponent.ButtonHandler = function(button)
		self:OnResponse(state, button)
	end
	dlg.UtilDlgExComponent.ListHandler = nil
end
_UpdateComponentLogic:InsertUpdateVisible(dlg)
end