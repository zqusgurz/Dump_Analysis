return function (self,level,string_table,hash_tables,block_start,block_end,offset,dictionary) 
local config = self._compression_level_configs[level]
local config_use_lazy, config_good_prev_length, config_max_lazy_match,
      config_nice_length, config_max_hash_chain = config[1], config[2],
                                                  config[3], config[4],
                                                  config[5]

local config_max_insert_length = (not config_use_lazy) and
                                    config_max_lazy_match or 2147483646
local config_good_hash_chain =
  (config_max_hash_chain - config_max_hash_chain % 4 / 4)

local hash

local dict_hash_tables
local dict_string_table
local dict_string_len = 0

if dictionary then
  dict_hash_tables = dictionary.hash_tables
  dict_string_table = dictionary.string_table
  dict_string_len = dictionary.strlen
  assert(block_start == 1)
  if block_end >= block_start and dict_string_len >= 2 then
    hash = dict_string_table[dict_string_len - 1] * 65536 +
              dict_string_table[dict_string_len] * 256 + string_table[1]
    local t = hash_tables[hash]
    if not t then
      t = {};
      hash_tables[hash] = t
    end
    t[#t + 1] = -1
  end
  if block_end >= block_start + 1 and dict_string_len >= 1 then
    hash =
      dict_string_table[dict_string_len] * 65536 + string_table[1] * 256 +
        string_table[2]
    local t = hash_tables[hash]
    if not t then
      t = {};
      hash_tables[hash] = t
    end
    t[#t + 1] = 0
  end
end

local dict_string_len_plus3 = dict_string_len + 3

hash = (string_table[block_start - offset] or 0) * 256 +
          (string_table[block_start + 1 - offset] or 0)

local lcodes = {}
local lcode_tblsize = 0
local lcodes_counts = {}
local dcodes = {}
local dcodes_tblsize = 0
local dcodes_counts = {}

local lextra_bits = {}
local lextra_bits_tblsize = 0
local dextra_bits = {}
local dextra_bits_tblsize = 0

local match_available = false
local prev_len
local prev_dist
local cur_len = 0
local cur_dist = 0

local index = block_start
local index_end = block_end + (config_use_lazy and 1 or 0)

local ltdc = self._length_to_deflate_code

while (index <= index_end) do
  local string_table_index = index - offset
  local offset_minus_three = offset - 3
  prev_len = cur_len
  prev_dist = cur_dist
  cur_len = 0

  hash = (hash * 256 + (string_table[string_table_index + 2] or 0)) % 16777216

  local chain_index
  local cur_chain
  local hash_chain = hash_tables[hash]
  local chain_old_size
  if not hash_chain then
    chain_old_size = 0
    hash_chain = {}
    hash_tables[hash] = hash_chain
    if dict_hash_tables then
      cur_chain = dict_hash_tables[hash]
      chain_index = cur_chain and #cur_chain or 0
    else
      chain_index = 0
    end
  else
    chain_old_size = #hash_chain
    cur_chain = hash_chain
    chain_index = chain_old_size
  end

  if index <= block_end then hash_chain[chain_old_size + 1] = index end

  if (chain_index > 0 and index + 2 <= block_end and
    (not config_use_lazy or prev_len < config_max_lazy_match)) then

    local depth =
      (config_use_lazy and prev_len >= config_good_prev_length) and
        config_good_hash_chain or config_max_hash_chain

    local max_len_minus_one = block_end - index
    max_len_minus_one = (max_len_minus_one >= 257) and 257 or
                          max_len_minus_one
    max_len_minus_one = max_len_minus_one + string_table_index
    local string_table_index_plus_three = string_table_index + 3

    while chain_index >= 1 and depth > 0 do
      local prev = cur_chain[chain_index]

      if index - prev > 32768 then break end
      if prev < index then
        local sj = string_table_index_plus_three

        if prev >= -257 then
          local pj = prev - offset_minus_three
          while (sj <= max_len_minus_one and string_table[pj] ==
            string_table[sj]) do
            sj = sj + 1
            pj = pj + 1
          end
        else
          local pj = dict_string_len_plus3 + prev
          while (sj <= max_len_minus_one and dict_string_table[pj] ==
            string_table[sj]) do
            sj = sj + 1
            pj = pj + 1
          end
        end
        local j = sj - string_table_index
        if j > cur_len then
          cur_len = j
          cur_dist = index - prev
        end
        if cur_len >= config_nice_length then break end
      end

      chain_index = chain_index - 1
      depth = depth - 1
      if chain_index == 0 and prev > 0 and dict_hash_tables then
        cur_chain = dict_hash_tables[hash]
        chain_index = cur_chain and #cur_chain or 0
      end
    end
  end

  if not config_use_lazy then prev_len, prev_dist = cur_len, cur_dist end
  if ((not config_use_lazy or match_available) and
    (prev_len > 3 or (prev_len == 3 and prev_dist < 4096)) and cur_len <=
    prev_len) then
    local code = ltdc[prev_len]
    local length_extra_bits_bitlen = self._length_to_deflate_extra_bitlen[prev_len]
    local dist_code, dist_extra_bits_bitlen, dist_extra_bits
    if prev_dist <= 256 then         dist_code = self._dist256_to_deflate_code[prev_dist]
      dist_extra_bits = self._dist256_to_deflate_extra_bits[prev_dist]
      dist_extra_bits_bitlen = self._dist256_to_deflate_extra_bitlen[prev_dist]
    else
      dist_code = 16
      dist_extra_bits_bitlen = 7
      local a = 384
      local b = 512

      while true do
        if prev_dist <= a then
          dist_extra_bits = (prev_dist - (b / 2) - 1) % (b / 4)
          break
        elseif prev_dist <= b then
          dist_extra_bits = (prev_dist - (b / 2) - 1) % (b / 4)
          dist_code = dist_code + 1
          break
        else
          dist_code = dist_code + 2
          dist_extra_bits_bitlen = dist_extra_bits_bitlen + 1
          a = a * 2
          b = b * 2
        end
      end
    end
    lcode_tblsize = lcode_tblsize + 1
    lcodes[lcode_tblsize] = code
    lcodes_counts[code] = (lcodes_counts[code] or 0) + 1

    dcodes_tblsize = dcodes_tblsize + 1
    dcodes[dcodes_tblsize] = dist_code
    dcodes_counts[dist_code] = (dcodes_counts[dist_code] or 0) + 1

    if length_extra_bits_bitlen > 0 then
      local lenExtraBits = self._length_to_deflate_extra_bits[prev_len]
      lextra_bits_tblsize = lextra_bits_tblsize + 1
      lextra_bits[lextra_bits_tblsize] = lenExtraBits
    end
    if dist_extra_bits_bitlen > 0 then
      dextra_bits_tblsize = dextra_bits_tblsize + 1
      dextra_bits[dextra_bits_tblsize] = dist_extra_bits
    end

    for i = index + 1, index + prev_len - (config_use_lazy and 2 or 1) do
      hash = (hash * 256 + (string_table[i - offset + 2] or 0)) % 16777216
      if prev_len <= config_max_insert_length then
        hash_chain = hash_tables[hash]
        if not hash_chain then
          hash_chain = {}
          hash_tables[hash] = hash_chain
        end
        hash_chain[#hash_chain + 1] = i
      end
    end
    index = index + prev_len - (config_use_lazy and 1 or 0)
    match_available = false
  elseif (not config_use_lazy) or match_available then
    local code = string_table[config_use_lazy and (string_table_index - 1) or
                    string_table_index]
    lcode_tblsize = lcode_tblsize + 1
    lcodes[lcode_tblsize] = code
    lcodes_counts[code] = (lcodes_counts[code] or 0) + 1
    index = index + 1
  else
    match_available = true
    index = index + 1
  end
end

  lcode_tblsize = lcode_tblsize + 1
lcodes[lcode_tblsize] = 256
lcodes_counts[256] = (lcodes_counts[256] or 0) + 1

return lcodes, lextra_bits, lcodes_counts, dcodes, dextra_bits, dcodes_counts
end