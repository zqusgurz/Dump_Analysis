return function (self,data,base64,inflate) 
if (base64) then
	data = _Base64:Decode(data)
end
if (inflate) then
	data = _Deflate:DecompressDeflate(data)
end
local unpack = string.unpack
local sub = string.sub

---@type ByteBuffer
local ret = {
	Buffer = data,
	Pos = 1,
	Decode1 = function(self)
		local ret = unpack("<i1", self.Buffer, self.Pos)
		self.Pos += 1
		return ret
	end,
	Decode2 = function(self)
		local ret = unpack("<i2", self.Buffer, self.Pos)
		self.Pos += 2
		return ret
	end,
	Decode4 = function(self)
		local ret = unpack("<i4", self.Buffer, self.Pos)
		self.Pos += 4
		return ret
	end,
	Decode1U = function(self)
		local ret = unpack("<I1", self.Buffer, self.Pos)
		self.Pos += 1
		return ret
	end,
	Decode2U = function(self)
		local ret = unpack("<I2", self.Buffer, self.Pos)
		self.Pos += 2
		return ret
	end,
	Decode4U = function(self)
		local ret = unpack("<I4", self.Buffer, self.Pos)
		self.Pos += 4
		return ret
	end,
	Decode4F = function(self)
		local ret = unpack("<f", self.Buffer, self.Pos)
		self.Pos += 4
		return ret
	end,
	Decode8 = function(self)
		local ret = unpack("<i8", self.Buffer, self.Pos)
		self.Pos += 8
		return ret
	end,
	DecodeStr = function(self)
		local strlen = unpack("<I2", self.Buffer, self.Pos)
		self.Pos += 2
		local str = sub(self.Buffer, self.Pos, self.Pos + strlen - 1)
		self.Pos += strlen
		return str
	end
}

return ret
end