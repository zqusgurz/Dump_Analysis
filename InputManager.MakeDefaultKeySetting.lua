return function (self) 
local keyMapped = {
	[tostring(KeyboardKey.F1)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.EmotionHit},
	[tostring(KeyboardKey.F2)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.EmotionSmile},
	[tostring(KeyboardKey.F3)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.EmotionTroubled},
	[tostring(KeyboardKey.F4)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.EmotionCry},
	[tostring(KeyboardKey.F5)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.EmotionAngry},
	[tostring(KeyboardKey.F6)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.EmotionBewildered},
	[tostring(KeyboardKey.F7)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.EmotionStunned},
	
	[tostring(KeyboardKey.Alpha1)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.ToAll},
	[tostring(KeyboardKey.Alpha2)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.ToParty},
	[tostring(KeyboardKey.Alpha3)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.ToFriend},
	[tostring(KeyboardKey.Alpha4)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.ToGuild},
	
	[tostring(KeyboardKey.Q)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.Quest},
	[tostring(KeyboardKey.W)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.WorldMap},
	[tostring(KeyboardKey.E)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.Equip},
	[tostring(KeyboardKey.R)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.Friend},
	[tostring(KeyboardKey.I)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.Inven},
	[tostring(KeyboardKey.P)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.Party},
	[tostring(KeyboardKey.LeftBracket)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.Shortcut},
	[tostring(KeyboardKey.RightBracket)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.Quickslot},
	[tostring(KeyboardKey.Backslash)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.KeySetting},
	
	[tostring(KeyboardKey.S)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.Stat},
	[tostring(KeyboardKey.G)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.Guild},
	[tostring(KeyboardKey.H)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.Whisper},
	[tostring(KeyboardKey.K)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.Skill},
	[tostring(KeyboardKey.L)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.Notifier},
	[tostring(KeyboardKey.Quote)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.ChattingPlus},
	
	[tostring(KeyboardKey.Z)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.PickUp},
	[tostring(KeyboardKey.X)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.Sit},
	[tostring(KeyboardKey.C)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.Messenger},
	[tostring(KeyboardKey.M)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.MiniMap},
	
	[tostring(KeyboardKey.LeftControl)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.Attack},
	[tostring(KeyboardKey.LeftAlt)] = {FuncType = _FuncKeyTypes.System, Id = _FuncKeySystemType.Jump},
}
return keyMapped
end