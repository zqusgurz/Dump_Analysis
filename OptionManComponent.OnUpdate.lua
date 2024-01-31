return function (self,delta) 
self.BlockRaycast.Enable = 
	self.ChannelChange.Enable or 
	self.GameOpt.Enable or 
	self.SysOpt.Enable or
	self.ClaimNotice.Enable or
	self.Claim.Enable
end