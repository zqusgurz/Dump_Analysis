return function (self,str,dictionary,configs) 
local WriteBits, WriteString, FlushWriter = self:CreateWriter()
self:Deflate(configs, WriteBits, WriteString, FlushWriter, str, dictionary)
local total_bitlen, result = FlushWriter(self._FLUSH_MODE_OUTPUT)
local padding_bitlen = (8 - total_bitlen % 8) % 8
return result, padding_bitlen
end