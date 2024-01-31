return function (self,str,dictionary) 
local state = self:CreateDecompressState(str, dictionary)
local result, status = self:Inflate(state)
if not result then return nil, status end

local bitlen_left = state.ReaderBitlenLeft()
local bytelen_left = (bitlen_left - bitlen_left % 8) / 8
return result, bytelen_left
end