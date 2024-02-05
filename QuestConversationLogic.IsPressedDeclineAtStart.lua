return function (self,state,response) 
-- 퀘스트 시작 전이고, 마지막 메시지이고(수락/거절), 거절하기를 눌렀을 경우.
return state.QuestState == 0 and state.MessageIndex == #state.Messages and response == 0
end