return function (self) 
_AppService:Get().ChatSystem.ShowWhisper = self.Whisper.State
self:SaveOption("Whisper", self.Whisper)
self:SaveOption("Trade", self.Trade)
self:SaveOption("Party", self.Party)
self.Entity.Enable = false
end