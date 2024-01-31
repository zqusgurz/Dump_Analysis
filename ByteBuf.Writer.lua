return function (self,base64,deflate) 
local insert = table.insert
local pack = string.pack
---@type ByteBuffer
local ret = {
	Buffer = {},
	Base64 = base64,
	Deflate = deflate,
	Encode1 = function(self, data)
		insert(self.Buffer, pack("<i1", data))
	end,
	Encode1U = function(self, data)
		insert(self.Buffer, pack("<I1", data))
	end,
	Encode2 = function(self, data)
		insert(self.Buffer, pack("<i2", data))
	end,
	Encode2U = function(self, data)
		insert(self.Buffer, pack("<I2", data))
	end,
	Encode4 = function(self, data)
		insert(self.Buffer, pack("<i4", data))
	end,
	Encode4U = function(self, data)
		insert(self.Buffer, pack("<I4", data))
	end,
	Encode4F = function(self, data)
		insert(self.Buffer, pack("<f", data))
	end,
	Encode8 = function(self, data)
		insert(self.Buffer, pack("<i8", data))
	end,
	EncodeStr = function(self, data)
		insert(self.Buffer, pack("<I2", #data))
		insert(self.Buffer, data)
	end,
	Get = function(self)
		local ret = table.concat(self.Buffer)
		if (self.Deflate > 0) then
			ret = _Deflate:CompressDeflate(ret, {level=self.Deflate, strategy="dynamic"})
		end
		if (self.Base64) then
			ret = _Base64:Encode(ret)
		end
		return ret
	end
}
return ret
end