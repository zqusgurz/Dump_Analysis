return function (self) 
local time = _UtilLogic.ElapsedSeconds

local function get_data(key)
	return _ResourceMan:ParseGenericWzCollection("CharacterMotion", key)
end

if (self:IsClient()) then
	_AppService:Get().FadeScreen:SetLoadingText(string.format("캐릭터 액션"))
end

local actions = self.Actions
_CharacterAction:EnsureInitialized()
local characterActions = _CharacterAction.ActionToString
local function getActionString(actionId)
	return characterActions[actionId]
end

-- Not Pieced
actions[getActionString(_CharacterAction.WALK1)] = self:LoadActionData(get_data("walk1"), "walk1", false, false)
actions[getActionString(_CharacterAction.WALK2)] = self:LoadActionData(get_data("walk2"), "walk2", false, false)
actions[getActionString(_CharacterAction.STAND1)] = self:LoadActionData(get_data("stand1"), "stand1", false, true)
actions[getActionString(_CharacterAction.STAND2)] = self:LoadActionData(get_data("stand2"), "stand2", false, true)
actions[getActionString(_CharacterAction.ALERT)] = self:LoadActionData(get_data("alert"), "alert", false, false)
actions[getActionString(_CharacterAction.SWINGO1)] = self:LoadActionData(get_data("swingO1"), "swingO1", false, false)
actions[getActionString(_CharacterAction.SWINGO2)] = self:LoadActionData(get_data("swingO2"), "swingO2", false, false)
actions[getActionString(_CharacterAction.SWINGO3)] = self:LoadActionData(get_data("swingO3"), "swingO3", false, false)
actions[getActionString(_CharacterAction.SWINGOF)] = self:LoadActionData(get_data("swingOF"), "swingOF", false, false)
actions[getActionString(_CharacterAction.SWINGT1)] = self:LoadActionData(get_data("swingT1"), "swingT1", false, false)
actions[getActionString(_CharacterAction.SWINGT2)] = self:LoadActionData(get_data("swingT2"), "swingT2", false, false)
actions[getActionString(_CharacterAction.SWINGT3)] = self:LoadActionData(get_data("swingT3"), "swingT3", false, false)
actions[getActionString(_CharacterAction.SWINGTF)] = self:LoadActionData(get_data("swingTF"), "swingTF", false, false)
actions[getActionString(_CharacterAction.SWINGP1)] = self:LoadActionData(get_data("swingP1"), "swingP1", false, false)
actions[getActionString(_CharacterAction.SWINGP2)] = self:LoadActionData(get_data("swingP2"), "swingP2", false, false)
actions[getActionString(_CharacterAction.SWINGPF)] = self:LoadActionData(get_data("swingPF"), "swingPF", false, false)
actions[getActionString(_CharacterAction.STABO1)] = self:LoadActionData(get_data("stabO1"), "stabO1", false, false)
actions[getActionString(_CharacterAction.STABO2)] = self:LoadActionData(get_data("stabO2"), "stabO2", false, false)
actions[getActionString(_CharacterAction.STABOF)] = self:LoadActionData(get_data("stabOF"), "stabOF", false, false)
actions[getActionString(_CharacterAction.STABT1)] = self:LoadActionData(get_data("stabT1"), "stabT1", false, false)
actions[getActionString(_CharacterAction.STABT2)] = self:LoadActionData(get_data("stabT2"), "stabT2", false, false)
actions[getActionString(_CharacterAction.STABTF)] = self:LoadActionData(get_data("stabTF"), "stabTF", false, false)
actions[getActionString(_CharacterAction.SHOOT1)] = self:LoadActionData(get_data("shoot1"), "shoot1", false, false)
actions[getActionString(_CharacterAction.SHOOT2)] = self:LoadActionData(get_data("shoot2"), "shoot2", false, false)
actions[getActionString(_CharacterAction.SHOOTF)] = self:LoadActionData(get_data("shootF"), "shootF", false, false)
actions[getActionString(_CharacterAction.PRONESTAB)] = self:LoadActionData(get_data("proneStab"), "proneStab", false, false)
actions[getActionString(_CharacterAction.PRONE)] = self:LoadActionData(get_data("prone"), "prone", false, false)
actions[getActionString(_CharacterAction.HEAL)] = self:LoadActionData(get_data("heal"), "heal", false, false)
actions[getActionString(_CharacterAction.FLY)] = self:LoadActionData(get_data("fly"), "fly", false, false)
actions[getActionString(_CharacterAction.JUMP)] = self:LoadActionData(get_data("jump"), "jump", false, false)
actions[getActionString(_CharacterAction.SIT)] = self:LoadActionData(get_data("sit"), "sit", false, false)
actions[getActionString(_CharacterAction.LADDER)] = self:LoadActionData(get_data("ladder"), "ladder", false, false)
actions[getActionString(_CharacterAction.ROPE)] = self:LoadActionData(get_data("rope"), "rope", false, false)
actions[getActionString(_CharacterAction.DEAD)] = self:LoadActionData(get_data("dead"), "dead", false, false)

-- Pieced
actions[getActionString(_CharacterAction.SAVAGE)] = self:LoadActionData(get_data("savage"), "savage", true, false)
actions[getActionString(_CharacterAction.ALERT2)] = self:LoadActionData(get_data("alert2"), "alert2", true, false)
actions[getActionString(_CharacterAction.ALERT3)] = self:LoadActionData(get_data("alert3"), "alert3", true, false)
actions[getActionString(_CharacterAction.ALERT4)] = self:LoadActionData(get_data("alert4"), "alert4", true, false)
actions[getActionString(_CharacterAction.ALERT5)] = self:LoadActionData(get_data("alert5"), "alert5", true, false)
actions[getActionString(_CharacterAction.ALERT6)] = self:LoadActionData(get_data("alert6"), "alert6", true, false)
actions[getActionString(_CharacterAction.LADDER2)] = self:LoadActionData(get_data("ladder2"), "ladder2", true, false)
actions[getActionString(_CharacterAction.ROPE2)] = self:LoadActionData(get_data("rope2"), "rope2", true, false)
actions[getActionString(_CharacterAction.SHOOT6)] = self:LoadActionData(get_data("shoot6"), "shoot6", true, false)
actions[getActionString(_CharacterAction.MAGIC1)] = self:LoadActionData(get_data("magic1"), "magic1", true, false)
actions[getActionString(_CharacterAction.MAGIC2)] = self:LoadActionData(get_data("magic2"), "magic2", true, false)
actions[getActionString(_CharacterAction.MAGIC3)] = self:LoadActionData(get_data("magic3"), "magic3", true, false)
actions[getActionString(_CharacterAction.MAGIC4)] = self:LoadActionData(get_data("magic4"), "magic4", true, false)
--actions[getActionString(_CharacterAction.BURSTER1)] = self:LoadActionData(get_data("burster1"), "burster1", true, false)
--actions[getActionString(_CharacterAction.BURSTER2)] = self:LoadActionData(get_data("burster2"), "burster2", true, false)
--actions[getActionString(_CharacterAction.AVENGER)] = self:LoadActionData(get_data("avenger"), "avenger", true, false)
--actions[getActionString(_CharacterAction.ASSAULTER)] = self:LoadActionData(get_data("assaulter"), "assaulter", true, false)
actions[getActionString(_CharacterAction.PRONE2)] = self:LoadActionData(get_data("prone2"), "prone2", true, false)
--actions[getActionString(_CharacterAction.ASSASSINATION)] = self:LoadActionData(get_data("assassination"), "assassination", true, false)
--actions[getActionString(_CharacterAction.ASSASSINATIONS)] = self:LoadActionData(get_data("assassinationS"), "assassinationS", true, false)
--actions[getActionString(_CharacterAction.BLAST)] = self:LoadActionData(get_data("blast"), "blast", true, false)
--actions[getActionString(_CharacterAction.BLIZZARD)] = self:LoadActionData(get_data("blizzard"), "blizzard", true, false)
--actions[getActionString(_CharacterAction.BRANDISH1)] = self:LoadActionData(get_data("brandish1"), "brandish1", true, false)
--actions[getActionString(_CharacterAction.BRANDISH2)] = self:LoadActionData(get_data("brandish2"), "brandish2", true, false)
--actions[getActionString(_CharacterAction.CHAINLIGHTNING)] = self:LoadActionData(get_data("chainlightning"), "chainlightning", true, false)
--actions[getActionString(_CharacterAction.GENESIS)] = self:LoadActionData(get_data("genesis"), "genesis", true, false)
--actions[getActionString(_CharacterAction.HOLYSHIELD)] = self:LoadActionData(get_data("holyshield"), "holyshield", true, false)
--actions[getActionString(_CharacterAction.METEOR)] = self:LoadActionData(get_data("meteor"), "meteor", true, false)
--actions[getActionString(_CharacterAction.NINJASTORM)] = self:LoadActionData(get_data("ninjastorm"), "ninjastorm", true, false)
--actions[getActionString(_CharacterAction.PARALYZE)] = self:LoadActionData(get_data("paralyze"), "paralyze", true, false)
--actions[getActionString(_CharacterAction.RESURRECTION)] = self:LoadActionData(get_data("resurrection"), "resurrection", true, false)
--actions[getActionString(_CharacterAction.RUSH)] = self:LoadActionData(get_data("rush"), "rush", true, false)
--actions[getActionString(_CharacterAction.RUSH2)] = self:LoadActionData(get_data("rush2"), "rush2", true, false)
--actions[getActionString(_CharacterAction.SANCTUARY)] = self:LoadActionData(get_data("sanctuary"), "sanctuary", true, false)
--actions[getActionString(_CharacterAction.SHOWDOWN)] = self:LoadActionData(get_data("showdown"), "showdown", true, false)
--actions[getActionString(_CharacterAction.SMOKESHELL)] = self:LoadActionData(get_data("smokeshell"), "smokeshell", true, false)

_Log:Info(string.format("[ACTION] Loaded %d actions. (%.2f secs)", _TableUtils:GetLength(actions), _UtilLogic.ElapsedSeconds - time))
end