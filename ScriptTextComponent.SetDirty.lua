return function (self) 
--log("ScriptText SetDirty")
--_UpdateComponentLogic.ToUpdateTexts[self.Entity.Id] = self.Entity
--_UpdateComponentLogic.HasText = true
_TableUtils:Push(_UpdateComponentLogic.UpdateTextQueue, self.Entity)
end