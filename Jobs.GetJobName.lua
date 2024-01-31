return function (self,job,modernName) 
if (job == 0) then
	return "초보자"
elseif (job == 100) then
	return "검사"
elseif (job == 110) then
	return "파이터"
elseif (job == 111) then
	return "크루세이더"
elseif (job == 112) then
	return "히어로"
elseif (job == 120) then
	return "페이지"
elseif (job == 121) then
	return "나이트"
elseif (job == 122) then
	return "팔라딘"
elseif (job == 130) then
	return "스피어맨"
elseif (job == 131) then
	return "용기사"
elseif (job == 132) then
	return "다크나이트"
elseif (job == 200) then
	return "매지션"
elseif (job == 210) then
	if (modernName) then
		return "위자드(불,독)"
	end
	return "위자드"
elseif (job == 211) then
	if (modernName) then
		return "메이지(불,독)"
	end
	return "메이지"
elseif (job == 212) then
	if (modernName) then
		return "아크메이지(불,독)"
	end
	return "아크메이지"
elseif (job == 220) then
	if (modernName) then
		return "위자드(썬,콜)"
	end
	return "위자드"
elseif (job == 221) then
	if (modernName) then
		return "메이지(썬,콜)"
	end
	return "메이지"
elseif (job == 222) then
	if (modernName) then
		return "아크메이지(썬,콜)"
	end
	return "아크메이지"
elseif (job == 230) then
	return "클레릭"
elseif (job == 231) then
	return "프리스트"
elseif (job == 232) then
	return "비숍"
elseif (job == 300) then
	return "아처"
elseif (job == 310) then
	return "헌터"
elseif (job == 311) then
	return "레인저"
elseif (job == 312) then
	return "보우마스터"
elseif (job == 320) then
	return "사수"
elseif (job == 321) then
	return "저격수"
elseif (job == 322) then
	return "신궁"
elseif (job == 400) then
	return "로그"
elseif (job == 410) then
	return "어쌔신"
elseif (job == 411) then
	return "허밋"
elseif (job == 412) then
	return "나이트로드"
elseif (job == 420) then
	return "시프"
elseif (job == 422) then
	return "섀도어"
elseif (job == 421) then
	return "시프마스터"
elseif (job == 500) then
	return "운영자"
end
return ""
end