return function (self,lcode_bitlens,max_non_zero_bitlen_lcode,dcode_bitlens,max_non_zero_bitlen_dcode) 
local rle_code_tblsize = 0
local rle_codes = {}
local rle_code_counts = {}
local rle_extra_bits_tblsize = 0
local rle_extra_bits = {}
local prev = nil
local count = 0

      max_non_zero_bitlen_dcode = (max_non_zero_bitlen_dcode < 0) and 0 or
                              max_non_zero_bitlen_dcode
local max_code = max_non_zero_bitlen_lcode + max_non_zero_bitlen_dcode + 1

for code = 0, max_code + 1 do
  local len = (code <= max_non_zero_bitlen_lcode) and
                (lcode_bitlens[code] or 0) or ((code <= max_code) and
                (dcode_bitlens[code - max_non_zero_bitlen_lcode - 1] or 0) or
                nil)
  if len == prev then
    count = count + 1
    if len ~= 0 and count == 6 then
      rle_code_tblsize = rle_code_tblsize + 1
      rle_codes[rle_code_tblsize] = 16
      rle_extra_bits_tblsize = rle_extra_bits_tblsize + 1
      rle_extra_bits[rle_extra_bits_tblsize] = 3
      rle_code_counts[16] = (rle_code_counts[16] or 0) + 1
      count = 0
    elseif len == 0 and count == 138 then
      rle_code_tblsize = rle_code_tblsize + 1
      rle_codes[rle_code_tblsize] = 18
      rle_extra_bits_tblsize = rle_extra_bits_tblsize + 1
      rle_extra_bits[rle_extra_bits_tblsize] = 127
      rle_code_counts[18] = (rle_code_counts[18] or 0) + 1
      count = 0
    end
  else
    if count == 1 then
      rle_code_tblsize = rle_code_tblsize + 1
      rle_codes[rle_code_tblsize] = prev
      rle_code_counts[prev] = (rle_code_counts[prev] or 0) + 1
    elseif count == 2 then
      rle_code_tblsize = rle_code_tblsize + 1
      rle_codes[rle_code_tblsize] = prev
      rle_code_tblsize = rle_code_tblsize + 1
      rle_codes[rle_code_tblsize] = prev
      rle_code_counts[prev] = (rle_code_counts[prev] or 0) + 2
    elseif count >= 3 then
      rle_code_tblsize = rle_code_tblsize + 1
      local rleCode = (prev ~= 0) and 16 or (count <= 10 and 17 or 18)
      rle_codes[rle_code_tblsize] = rleCode
      rle_code_counts[rleCode] = (rle_code_counts[rleCode] or 0) + 1
      rle_extra_bits_tblsize = rle_extra_bits_tblsize + 1
      rle_extra_bits[rle_extra_bits_tblsize] =
        (count <= 10) and (count - 3) or (count - 11)
    end

    prev = len
    if len and len ~= 0 then
      rle_code_tblsize = rle_code_tblsize + 1
      rle_codes[rle_code_tblsize] = len
      rle_code_counts[len] = (rle_code_counts[len] or 0) + 1
      count = 0
    else
      count = 1
    end
  end
end

return rle_codes, rle_extra_bits, rle_code_counts
end