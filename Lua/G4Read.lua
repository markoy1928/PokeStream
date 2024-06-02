dofile("Lua\\pokemonTable.lua")

local PartyOffset
local BattleOfffset
local SeenOffset
local OwnOffset
local Seed
local PKMNumber
local PID
local BlockOrder
local DecryptedOffset
local DecryptedData
local DecryptedPKMData = {}
local EncryptedOffset
local EncryptedData
local EncryptedPKMData = {}

local party = {}

local game
local trainerName
local BadgeData = {}
local Money
local Seen
local Own
local Checksum
local MapID
local PPVal = { 0x23, 0x19, 0x0A, 0x0F, 0x14, 0x14, 0x0F, 0x0F, 0x0F, 0x23, 0x1E, 0x05, 0x0A, 0x1E, 0x1E, 0x23, 0x23, 0x14, 0x0F, 0x14, 0x14, 0x0F, 0x14, 0x1E, 0x05, 0x19, 0x0F, 0x0F, 0x0F, 0x19, 0x14, 0x05, 0x23, 0x0F, 0x14, 0x14, 0x14, 0x0F, 0x1E, 0x23, 0x14, 0x14, 0x1E, 0x19, 0x28, 0x14, 0x0F, 0x14, 0x14, 0x14, 0x1E, 0x19, 0x0F, 0x1E, 0x19, 0x05, 0x0F, 0x0A, 0x05, 0x14, 0x14, 0x14, 0x05, 0x23, 0x14, 0x19, 0x14, 0x14, 0x14, 0x0F, 0x19, 0x0F, 0x0A, 0x28, 0x19, 0x0A, 0x23, 0x1E, 0x0F, 0x14, 0x28, 0x0A, 0x0F, 0x1E, 0x0F, 0x14, 0x0A, 0x0F, 0x0A, 0x05, 0x0A, 0x0A, 0x19, 0x0A, 0x14, 0x28, 0x1E, 0x1E, 0x14, 0x14, 0x0F, 0x0A, 0x28, 0x0F, 0x0A, 0x1E, 0x14, 0x14, 0x0A, 0x28, 0x28, 0x1E, 0x1E, 0x1E, 0x14, 0x1E, 0x0A, 0x0A, 0x14, 0x05, 0x0A, 0x1E, 0x14, 0x14, 0x14, 0x05, 0x0F, 0x0A, 0x14, 0x0F, 0x0F, 0x23, 0x14, 0x0F, 0x0A, 0x14, 0x1E, 0x0F, 0x28, 0x14, 0x0F, 0x0A, 0x05, 0x0A, 0x1E, 0x0A, 0x0F, 0x14, 0x0F, 0x28, 0x28, 0x0A, 0x05, 0x0F, 0x0A, 0x0A, 0x0A, 0x0F, 0x1E, 0x1E, 0x0A, 0x0A, 0x14, 0x0A, 0x01, 0x01, 0x0A, 0x0A, 0x0A, 0x05, 0x0F, 0x19, 0x0F, 0x0A, 0x0F, 0x1E, 0x05, 0x28, 0x0F, 0x0A, 0x19, 0x0A, 0x1E, 0x0A, 0x14, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x14, 0x05, 0x28, 0x05, 0x05, 0x0F, 0x05, 0x0A, 0x05, 0x0F, 0x0A, 0x0A, 0x0A, 0x14, 0x14, 0x28, 0x0F, 0x0A, 0x14, 0x14, 0x19, 0x05, 0x0F, 0x0A, 0x05, 0x14, 0x0F, 0x14, 0x19, 0x14, 0x05, 0x1E, 0x05, 0x0A, 0x14, 0x28, 0x05, 0x14, 0x28, 0x14, 0x0F, 0x23, 0x0A, 0x05, 0x05, 0x05, 0x0F, 0x05, 0x14, 0x05, 0x05, 0x0F, 0x14, 0x0A, 0x05, 0x05, 0x0F, 0x0F, 0x0F, 0x0F, 0x0A, 0x0A, 0x0A, 0x14, 0x0A, 0x0A, 0x0A, 0x0A, 0x0F, 0x0F, 0x0F, 0x0A, 0x14, 0x14, 0x0A, 0x14, 0x14, 0x14, 0x14, 0x14, 0x0A, 0x0A, 0x0A, 0x14, 0x14, 0x05, 0x0F, 0x0A, 0x0A, 0x0F, 0x0A, 0x14, 0x05, 0x05, 0x0A, 0x0A, 0x14, 0x05, 0x0A, 0x14, 0x0A, 0x14, 0x14, 0x14, 0x05, 0x05, 0x0F, 0x14, 0x0A, 0x0F, 0x14, 0x0F, 0x0A, 0x0A, 0x0F, 0x0A, 0x05, 0x05, 0x0A, 0x0F, 0x0A, 0x05, 0x14, 0x19, 0x05, 0x28, 0x0A, 0x05, 0x28, 0x0F, 0x14, 0x14, 0x05, 0x0F, 0x14, 0x1E, 0x0F, 0x0F, 0x05, 0x0A, 0x1E, 0x14, 0x1E, 0x0F, 0x05, 0x28, 0x0F, 0x05, 0x14, 0x05, 0x0F, 0x19, 0x28, 0x0F, 0x14, 0x0F, 0x14, 0x0F, 0x14, 0x0A, 0x14, 0x14, 0x05, 0x05, 0x0A, 0x05, 0x28, 0x0A, 0x0A, 0x05, 0x0A, 0x0A, 0x0F, 0x0A, 0x14, 0x1E, 0x1E, 0x0A, 0x14, 0x05, 0x0A, 0x0A, 0x0F, 0x0A, 0x0A, 0x05, 0x0F, 0x05, 0x0A, 0x0A, 0x1E, 0x14, 0x14, 0x0A, 0x0A, 0x05, 0x05, 0x0A, 0x05, 0x14, 0x0A, 0x14, 0x0A, 0x0F, 0x0A, 0x14, 0x14, 0x14, 0x0F, 0x0F, 0x0A, 0x0F, 0x14, 0x0F, 0x0A, 0x0A, 0x0A, 0x14, 0x05, 0x1E, 0x05, 0x0A, 0x0F, 0x0A, 0x0A, 0x05, 0x14, 0x1E, 0x0A, 0x1E, 0x0F, 0x0F, 0x0F, 0x0F, 0x1E, 0x0A, 0x14, 0x0F, 0x0A, 0x0A, 0x14, 0x0F, 0x05, 0x05, 0x0F, 0x0F, 0x05, 0x0A, 0x05, 0x14, 0x05, 0x0F, 0x14, 0x05, 0x14, 0x14, 0x14, 0x14, 0x0A, 0x14, 0x0A, 0x0F, 0x14, 0x0F, 0x0A, 0x0A, 0x05, 0x0A, 0x05, 0x05, 0x0A, 0x05, 0x05, 0x0A, 0x05, 0x05, 0x05 }

PPVal[0] = 0x00

function rand(seed) -- Thanks Kaphotics
	return (0x4e6d*(seed%65536)+((0x41c6*(seed%65536)+0x4e6d*math.floor(seed/65536))%65536)*65536+0x6073)%4294967296
end

function ReadSeen(offset)
	Seen = 0
	for i = 1, 0x3E, 1 do
		if bit.band(memory.readbyte(offset), 0x01) == 0x01 then
			Seen = Seen + 1
		end

		if bit.band(memory.readbyte(offset), 0x02) == 0x02 then
			Seen = Seen + 1
		end

		if bit.band(memory.readbyte(offset), 0x04) == 0x04 then
			Seen = Seen + 1
		end

		if bit.band(memory.readbyte(offset), 0x08) == 0x08 then
			Seen = Seen + 1
		end

		if bit.band(memory.readbyte(offset), 0x10) == 0x10 then
			Seen = Seen + 1
		end

		if bit.band(memory.readbyte(offset), 0x20) == 0x20 then
			Seen = Seen + 1
		end

		if bit.band(memory.readbyte(offset), 0x40) == 0x40 then
			Seen = Seen + 1
		end

		if bit.band(memory.readbyte(offset), 0x80) == 0x80 then
			Seen = Seen + 1
		end
		
		offset = offset + 1
	end	
end

function ReadOwn(offset)
	Own = 0
	for i = 1, 0x3E, 1 do
		if bit.band(memory.readbyte(offset), 0x01) == 0x01 then
			Own = Own + 1
		end

		if bit.band(memory.readbyte(offset), 0x02) == 0x02 then
			Own = Own + 1
		end

		if bit.band(memory.readbyte(offset), 0x04) == 0x04 then
			Own = Own + 1
		end

		if bit.band(memory.readbyte(offset), 0x08) == 0x08 then
			Own = Own + 1
		end

		if bit.band(memory.readbyte(offset), 0x10) == 0x10 then
			Own = Own + 1
		end

		if bit.band(memory.readbyte(offset), 0x20) == 0x20 then
			Own = Own + 1
		end

		if bit.band(memory.readbyte(offset), 0x40) == 0x40 then
			Own = Own + 1
		end

		if bit.band(memory.readbyte(offset), 0x80) == 0x80 then
			Own = Own + 1
		end
		
		offset = offset + 1
	end
end

function ReadParty(offset)
	for CurrentPokemon = 1, 6, 1 do
		for i = 1, 236, 1 do
			EncryptedPKMData[i] = memory.readbyte(offset)
			offset = offset + 1
		end
		
		DecryptedPKMData[0x00] = EncryptedPKMData[0x00]
		DecryptedPKMData[0x01] = EncryptedPKMData[0x01]
		DecryptedPKMData[0x02] = EncryptedPKMData[0x02]
		DecryptedPKMData[0x03] = EncryptedPKMData[0x03]
		DecryptedPKMData[0x04] = EncryptedPKMData[0x04]
		DecryptedPKMData[0x05] = EncryptedPKMData[0x05]
		DecryptedPKMData[0x06] = EncryptedPKMData[0x06]
		DecryptedPKMData[0x07] = EncryptedPKMData[0x07]
		DecryptedPKMData[0x08] = EncryptedPKMData[0x08]

		Seed = EncryptedPKMData[7] + bit.lshift(EncryptedPKMData[8], 8)

		for i = 9, 136, 2 do
			EncryptedData = EncryptedPKMData[i] + bit.lshift(EncryptedPKMData[i + 1], 8)
                        Seed = rand(Seed)
			DecryptedData = bit.bxor(EncryptedData, bit.rshift(Seed, 0x10))
			EncryptedPKMData[i] = DecryptedData - bit.lshift(bit.rshift(DecryptedData, 8), 8)
			EncryptedPKMData[i + 1] = bit.rshift(DecryptedData, 8)
		end

		PID = EncryptedPKMData[0x01] + bit.lshift(EncryptedPKMData[0x02], 8) + bit.lshift(EncryptedPKMData[0x03], 16) + bit.lshift(EncryptedPKMData[0x04], 24)
		BlockOrder = bit.band(bit.rshift(PID, 0x0D), 0x1F) % 24

		EncryptedOffset = 0x09
		if BlockOrder == 0 then UnshuffleBlock_A() UnshuffleBlock_B() UnshuffleBlock_C() UnshuffleBlock_D()
		elseif BlockOrder == 1 then UnshuffleBlock_A() UnshuffleBlock_B() UnshuffleBlock_D() UnshuffleBlock_C()
		elseif BlockOrder == 2 then UnshuffleBlock_A() UnshuffleBlock_C() UnshuffleBlock_B() UnshuffleBlock_D()
		elseif BlockOrder == 3 then UnshuffleBlock_A() UnshuffleBlock_C() UnshuffleBlock_D() UnshuffleBlock_B()
		elseif BlockOrder == 4 then UnshuffleBlock_A() UnshuffleBlock_D() UnshuffleBlock_B() UnshuffleBlock_C()
		elseif BlockOrder == 5 then UnshuffleBlock_A() UnshuffleBlock_D() UnshuffleBlock_C() UnshuffleBlock_B()
		elseif BlockOrder == 6 then UnshuffleBlock_B() UnshuffleBlock_A() UnshuffleBlock_C() UnshuffleBlock_D()
		elseif BlockOrder == 7 then UnshuffleBlock_B() UnshuffleBlock_A() UnshuffleBlock_D() UnshuffleBlock_C()
		elseif BlockOrder == 8 then UnshuffleBlock_B() UnshuffleBlock_C() UnshuffleBlock_A() UnshuffleBlock_D()
		elseif BlockOrder == 9 then UnshuffleBlock_B() UnshuffleBlock_C() UnshuffleBlock_D() UnshuffleBlock_A()
		elseif BlockOrder == 10 then UnshuffleBlock_B() UnshuffleBlock_D() UnshuffleBlock_A() UnshuffleBlock_C()
		elseif BlockOrder == 11 then UnshuffleBlock_B() UnshuffleBlock_D() UnshuffleBlock_C() UnshuffleBlock_A()
		elseif BlockOrder == 12 then UnshuffleBlock_C() UnshuffleBlock_A() UnshuffleBlock_B() UnshuffleBlock_D()
		elseif BlockOrder == 13 then UnshuffleBlock_C() UnshuffleBlock_A() UnshuffleBlock_D() UnshuffleBlock_B()
		elseif BlockOrder == 14 then UnshuffleBlock_C() UnshuffleBlock_B() UnshuffleBlock_A() UnshuffleBlock_D()
		elseif BlockOrder == 15 then UnshuffleBlock_C() UnshuffleBlock_B() UnshuffleBlock_D() UnshuffleBlock_A()
		elseif BlockOrder == 16 then UnshuffleBlock_C() UnshuffleBlock_D() UnshuffleBlock_A() UnshuffleBlock_B()
		elseif BlockOrder == 17 then UnshuffleBlock_C() UnshuffleBlock_D() UnshuffleBlock_B() UnshuffleBlock_A()
		elseif BlockOrder == 18 then UnshuffleBlock_D() UnshuffleBlock_A() UnshuffleBlock_B() UnshuffleBlock_C()
		elseif BlockOrder == 19 then UnshuffleBlock_D() UnshuffleBlock_A() UnshuffleBlock_C() UnshuffleBlock_B()
		elseif BlockOrder == 20 then UnshuffleBlock_D() UnshuffleBlock_B() UnshuffleBlock_A() UnshuffleBlock_C()
		elseif BlockOrder == 21 then UnshuffleBlock_D() UnshuffleBlock_B() UnshuffleBlock_C() UnshuffleBlock_A()
		elseif BlockOrder == 22 then UnshuffleBlock_D() UnshuffleBlock_C() UnshuffleBlock_A() UnshuffleBlock_B()
		elseif BlockOrder == 23 then UnshuffleBlock_D() UnshuffleBlock_C() UnshuffleBlock_B() UnshuffleBlock_A()
		end

		Seed = PID
		for i = 137, 236, 2 do
			EncryptedData = EncryptedPKMData[i] + bit.lshift(EncryptedPKMData[i + 1], 8)
                        Seed = rand(Seed)
			DecryptedData = bit.bxor(EncryptedData, bit.rshift(Seed, 0x10))
			DecryptedPKMData[i] = DecryptedData - bit.lshift(bit.rshift(DecryptedData, 8), 8)
			DecryptedPKMData[i + 1] = bit.rshift(DecryptedData, 8)
		end

		Checksum = 0
		for i = 9, 136, 2 do
			Checksum = Checksum + DecryptedPKMData[i] + bit.lshift(DecryptedPKMData[i + 1], 8)
			Checksum = bit.band(Checksum, 0xFFFF)
		end

				
		if Checksum == DecryptedPKMData[0x07] + bit.lshift(DecryptedPKMData[0x08], 8) then
			-- Create a new pokemon
			party[CurrentPokemon] = Pokemon:new(nil)

			-- Get the moves
			for i = 1, 4, 1 do
				-- Create a new move
				party[CurrentPokemon].moves = setmetatable({}, {__index = party[CurrentPokemon].moves})
				party[CurrentPokemon].moves[i] = Move:new(nil)

				local offset1 = 0x29 + string.format("%x", ((i - 1) * 2))
				local offset2 = 0x2A + string.format("%x", ((i - 1) * 2))
				local offset3 = 0x31 + string.format("%x", (i - 1))
				local offset4 = 0x35 + string.format("%x", (i - 1))

				-- Get move data
				party[CurrentPokemon].moves[i].move = DecryptedPKMData[offset1] + bit.lshift(DecryptedPKMData[offset2], 8)
				party[CurrentPokemon].moves[i].pp = DecryptedPKMData[offset3]

				if PPVal[party[CurrentPokemon].moves[i].move] ~= nil then
					party[CurrentPokemon].moves[i].maxpp = PPVal[party[CurrentPokemon].moves[i].move] * (1.0 + (DecryptedPKMData[offset4] * 0.2))
				end
			end

			-- Get Nickname
			local nick = "";
			local i = 0x49;
			while DecryptedPKMData[i] ~= 0xFF do
				-- Determine Character
				if DecryptedPKMData[i] < 0x2B then
					-- Number
					nick = nick .. string.char(DecryptedPKMData[i] + 0x0F)
				elseif DecryptedPKMData[i] < 0x45 then
					-- Uppercase
					nick = nick .. string.char(DecryptedPKMData[i] + 0x16)
				elseif DecryptedPKMData[i] < 0x7A then
					-- Lowercase
					nick = nick .. string.char(DecryptedPKMData[i] + 0x1C)
				elseif DecryptedPKMData[i] == 0xAB then
					nick = nick .. "!"
				elseif DecryptedPKMData[i] == 0xAC then
					nick = nick .. "?"
				elseif DecryptedPKMData[i] == 0xAD then
					nick = nick .. ","
				elseif DecryptedPKMData[i] == 0xAE then
					nick = nick .. "."
				elseif DecryptedPKMData[i] == 0xAF then
					nick = nick .. "…"
				elseif DecryptedPKMData[i] == 0xB0 then
					nick = nick .. "·"
				elseif DecryptedPKMData[i] == 0xB1 then
					nick = nick .. "/"
				elseif DecryptedPKMData[i] == 0xB2 then
					nick = nick .. "‘"
				elseif DecryptedPKMData[i] == 0xB3 then
					nick = nick .. "’"
				elseif DecryptedPKMData[i] == 0xB4 then
					nick = nick .. "“"
				elseif DecryptedPKMData[i] == 0xB5 then
					nick = nick .. "”"
				elseif DecryptedPKMData[i] == 0xB9 then
					nick = nick .. "("
				elseif DecryptedPKMData[i] == 0xBA then
					nick = nick .. ")"
				elseif DecryptedPKMData[i] == 0xBB then
					nick = nick .. "♂"
				elseif DecryptedPKMData[i] == 0xBC then
					nick = nick .. "♀"
				elseif DecryptedPKMData[i] == 0xBD then
					nick = nick .. "+"
				elseif DecryptedPKMData[i] == 0xBE then
					nick = nick .. "-"
				elseif DecryptedPKMData[i] == 0xBF then
					nick = nick .. "*"
				elseif DecryptedPKMData[i] == 0xC0 then
					nick = nick .. "#"
				elseif DecryptedPKMData[i] == 0xC1 then
					nick = nick .. "="
				elseif DecryptedPKMData[i] == 0xC3 then
					nick = nick .. "~"
				elseif DecryptedPKMData[i] == 0xC4 then
					nick = nick .. ":"
				elseif DecryptedPKMData[i] == 0xC5 then
					nick = nick .. ";"
				elseif DecryptedPKMData[i] == 0xC6 then
					nick = nick .. "♠️"
				elseif DecryptedPKMData[i] == 0xC7 then
					nick = nick .. "♣"
				elseif DecryptedPKMData[i] == 0xC8 then
					nick = nick .. "♥"
				elseif DecryptedPKMData[i] == 0xC9 then
					nick = nick .. "♦"
				elseif DecryptedPKMData[i] == 0xCA then
					nick = nick .. "★"
				elseif DecryptedPKMData[i] == 0xCB then
					nick = nick .. "ʘ"
				elseif DecryptedPKMData[i] == 0xCC then
					nick = nick .. "O"
				elseif DecryptedPKMData[i] == 0xCD then
					nick = nick .. "▯"
				elseif DecryptedPKMData[i] == 0xCE then
					nick = nick .. "△"
				elseif DecryptedPKMData[i] == 0xCF then
					nick = nick .. "♢"
				elseif DecryptedPKMData[i] == 0xD0 then
					nick = nick .. "@"
				elseif DecryptedPKMData[i] == 0xD1 then
					nick = nick .. "♪"
				elseif DecryptedPKMData[i] == 0xD2 then
					nick = nick .. "%"
				elseif DecryptedPKMData[i] == 0xD3 then
					nick = nick .. "☀︎"
				elseif DecryptedPKMData[i] == 0xD4 then
					nick = nick .. "ඞ"
				elseif DecryptedPKMData[i] == 0xD5 then
					nick = nick .. "☃"
				elseif DecryptedPKMData[i] == 0xD6 then
					nick = nick .. "☂"
				elseif DecryptedPKMData[i] == 0xD7 then
					nick = nick .. "☺"
				elseif DecryptedPKMData[i] == 0xD8 then
					nick = nick .. "☻"
				elseif DecryptedPKMData[i] == 0xD9 then
					nick = nick .. "☹"
				elseif DecryptedPKMData[i] == 0xDA then
					nick = nick .. "☠"
				elseif DecryptedPKMData[i] == 0xDB then
					nick = nick .. "⤴"
				elseif DecryptedPKMData[i] == 0xDC then
					nick = nick .. "⤵"
				elseif DecryptedPKMData[i] == 0xDD then
					nick = nick .. "ᶻz"
				elseif DecryptedPKMData[i] == 0xDE then
					nick = nick .. " "
				else
					print(string.format("%x",DecryptedPKMData[i]))
				end

				i = i + 2
			end

			-- Get the pokemon data
			party[CurrentPokemon].pid = DecryptedPKMData[0x01] + bit.lshift(DecryptedPKMData[0x02], 8) + bit.lshift(DecryptedPKMData[0x03], 16) + bit.lshift(DecryptedPKMData[0x04], 24)
			party[CurrentPokemon].dex = DecryptedPKMData[0x09] + bit.lshift(DecryptedPKMData[0x0A], 8)
			party[CurrentPokemon].egg = bit.rshift(bit.band(DecryptedPKMData[0x3C], 0x40), 0x06)
			party[CurrentPokemon].gender = bit.rshift(bit.band(DecryptedPKMData[0x41], 0x06), 0x01)
			party[CurrentPokemon].status = DecryptedPKMData[0x89]
			party[CurrentPokemon].hp = DecryptedPKMData[0x8F] + bit.lshift(DecryptedPKMData[0x90], 8)
			party[CurrentPokemon].maxhp = DecryptedPKMData[0x91] + bit.lshift(DecryptedPKMData[0x92], 8)
			party[CurrentPokemon].lvl = DecryptedPKMData[0x8D]
			party[CurrentPokemon].item = DecryptedPKMData[0x0B] + bit.lshift(DecryptedPKMData[0x0C], 8)
			party[CurrentPokemon].nickname = nick
			party[CurrentPokemon].form = DecryptedPKMData[0x41]
		end

		-- for i = 0x00, 0xff, 0x01
		-- 	do
		-- 		if DecryptedPKMData[i] ~= nil then 
		-- 			print(string.format("%x: %x", i, DecryptedPKMData[i]))
		-- 		end
		-- 	end
	end
end

function UnshuffleBlock_A()
	DecryptedOffset = 0x09;
	for i = 1, 32, 1 do
		DecryptedPKMData[DecryptedOffset] = EncryptedPKMData[EncryptedOffset]
		EncryptedOffset = EncryptedOffset + 1
		DecryptedOffset = DecryptedOffset + 1
	end
end

function UnshuffleBlock_B()
	DecryptedOffset = 0x29;
	for i = 1, 32, 1 do
		DecryptedPKMData[DecryptedOffset] = EncryptedPKMData[EncryptedOffset]
		EncryptedOffset = EncryptedOffset + 1
		DecryptedOffset = DecryptedOffset + 1
	end
end

function UnshuffleBlock_C()
	DecryptedOffset = 0x49;
	for i = 1, 32, 1 do
		DecryptedPKMData[DecryptedOffset] = EncryptedPKMData[EncryptedOffset]
		EncryptedOffset = EncryptedOffset + 1
		DecryptedOffset = DecryptedOffset + 1
	end
end

function UnshuffleBlock_D()
	DecryptedOffset = 0x69;
	for i = 1, 32, 1 do
		DecryptedPKMData[DecryptedOffset] = EncryptedPKMData[EncryptedOffset]
		EncryptedOffset = EncryptedOffset + 1
		DecryptedOffset = DecryptedOffset + 1
	end
end

function ReadBadgeSet1(badge)
	if bit.band(badge, 0x01) == 0x01 then
		BadgeData[1] = 0x01
	else
		BadgeData[1] = 0x00
	end

	if bit.band(badge, 0x02) == 0x02 then
		BadgeData[2] = 0x01
	else
		BadgeData[2] = 0x00
	end

	if bit.band(badge, 0x04) == 0x04 then
		BadgeData[3] = 0x01
	else
		BadgeData[3] = 0x00
	end

	if bit.band(badge, 0x08) == 0x08 then
		BadgeData[4] = 0x01
	else
		BadgeData[4] = 0x00
	end

	if bit.band(badge, 0x10) == 0x10 then
		BadgeData[5] = 0x01
	else
		BadgeData[5] = 0x00
	end

	if bit.band(badge, 0x20) == 0x20 then
		BadgeData[6] = 0x01
	else
		BadgeData[6] = 0x00
	end

	if bit.band(badge, 0x40) == 0x40 then
		BadgeData[7] = 0x01
	else
		BadgeData[7] = 0x00
	end

	if bit.band(badge, 0x80) == 0x80 then
		BadgeData[8] = 0x01
	else
		BadgeData[8] = 0x00
	end
end

function ReadBadgeSet2(badge)
	if bit.band(badge, 0x01) == 0x01 then
		BadgeData[9] = 0x01
	else
		BadgeData[9] = 0x00
	end

	if bit.band(badge, 0x02) == 0x02 then
		BadgeData[10] = 0x01
	else
		BadgeData[10] = 0x00
	end

	if bit.band(badge, 0x04) == 0x04 then
		BadgeData[11] = 0x01
	else
		BadgeData[11] = 0x00
	end

	if bit.band(badge, 0x08) == 0x08 then
		BadgeData[12] = 0x01
	else
		BadgeData[12] = 0x00
	end

	if bit.band(badge, 0x10) == 0x10 then
		BadgeData[13] = 0x01
	else
		BadgeData[13] = 0x00
	end

	if bit.band(badge, 0x20) == 0x20 then
		BadgeData[14] = 0x01
	else
		BadgeData[14] = 0x00
	end

	if bit.band(badge, 0x40) == 0x40 then
		BadgeData[15] = 0x01
	else
		BadgeData[15] = 0x00
	end

	if bit.band(badge, 0x80) == 0x80 then
		BadgeData[16] = 0x01
	else
		BadgeData[16] = 0x00
	end
end

for i = 1, 6, 1 do
	party[i] = nil
end

Seen = 0
Own = 0

while true do
	if emu.framecount() % 60 == 1 then
		BadgeData[1] = 0
		BadgeData[2] = 0
		BadgeData[3] = 0
		BadgeData[4] = 0
		BadgeData[5] = 0
		BadgeData[6] = 0
		BadgeData[7] = 0
		BadgeData[8] = 0
		BadgeData[9] = 0
		BadgeData[10] = 0
		BadgeData[11] = 0
		BadgeData[12] = 0
		BadgeData[13] = 0
		BadgeData[14] = 0
		BadgeData[15] = 0
		BadgeData[16] = 0
		PartyOffset = 0
		BattleOffset = 0
		SeenOffset = 0
		OwnOffset = 0
		Money = 0
		BadgeSet1 = 0
		BadgeSet2 = 0
		MapID = 0
		if memory.readdword(0x02FFFE0C) == 0x45414441 or memory.readdword(0x02FFFE0C) == 0x45415041 then --DP
			if memory.readdword(0x021C4D28) ~= 0x00 then
				PartyOffset = memory.readdword(memory.readdword(0x021C4D28) + 0x04) + 0x2FC
				BattleOffset = memory.readdword(memory.readdword(memory.readdword(0x021C4D28) + 0x1C) + 0xC0)
				SeenOffset = memory.readdword(memory.readdword(0x021C4D28) + 0x04) + 0x158C
				OwnOffset = memory.readdword(memory.readdword(0x021C4D28) + 0x04) + 0x154C
				Money = memory.readdword(memory.readdword(memory.readdword(0x021C4D28) + 0x04) + 0x2E4)
				BadgeSet1 = memory.readbyte(memory.readdword(memory.readdword(0x021C4D28) + 0x04) + 0x2EA)
				MapID = memory.readword(memory.readdword(memory.readdword(0x021C48BC) + 0x1C))
				game = "DP"
			end
		elseif memory.readdword(0x02FFFE0C) == 0x45555043 then -- Pt
			if memory.readdword(0x02101D40) ~= 0x00 then
				PartyOffset = memory.readdword(0x02101D40) + 0xAC
				BattleOffset = memory.readdword(memory.readdword(0x021BF680) + 0x68)
				SeenOffset = memory.readdword(0x02101D40) + 0x1380
				OwnOffset = memory.readdword(0x02101D40) + 0x1340
				Money =  memory.readdword(memory.readdword(0x02101D40) + 0x90)
				BadgeSet1 = memory.readbyte(memory.readdword(0x02101D40) + 0x96)
				MapID = memory.readword(memory.readdword(memory.readdword(0x021BF680) + 0x1C))
				game = "Pt"
			end
		elseif memory.readdword(0x02FFFE0C) == 0x454B5049 or memory.readdword(0x02FFFE0C) == 0x45475049 then --HGSS
			if memory.readdword(0x02111880) ~= 0x00 then
				PartyOffset = memory.readdword(0x02111880) + 0xA0
				BattleOffset = memory.readdword(memory.readdword(0x021D1110) + 0x68)
				SeenOffset = memory.readdword(0x02111880) + 0x130C
				OwnOffset = memory.readdword(0x02111880) + 0x12CC
				Money =  memory.readdword(memory.readdword(0x02111880) + 0x88)
				BadgeSet1 =  memory.readbyte(memory.readdword(0x02111880) + 0x8E)
				BadgeSet2 =  memory.readbyte(memory.readdword(0x02111880) + 0x93)
				MapID = memory.readword(memory.readdword(memory.readdword(0x021D1110) + 0x20))
				game = "HGSS"
			end
		end

		if BattleOffset ~= 0x00 then
			if memory.readdword(BattleOffset) == 0x06 then
				ReadParty(BattleOffset + 0x08)
			elseif PartyOffset ~= 0x00 then
				if memory.readdword(PartyOffset) == 0x06 then
					ReadParty(PartyOffset + 0x08)
				end
			end
		end

		if SeenOffset ~= 0x00 then
			ReadSeen(SeenOffset)
		end

		if OwnOffset ~= 0x00 then
			ReadOwn(OwnOffset)
		end

		ReadBadgeSet1(BadgeSet1)
		ReadBadgeSet2(BadgeSet2)
		
		-- Write data to file
		file = io.open("game_data.json", "w")
		io.output(file)

		io.write("{\n")
		io.write(string.format("\"game\":\"%s\",\n", game)) 
		io.write(string.format("\"mapID\":%d,\n", MapID))

		io.write("\"badges\":[")
		for i = 1, 16, 1 do
			if BadgeData[i] == 0 then
				io.write("false")
			else
				io.write("true")
			end

			if i < 16 then
				io.write(",")
			end
		end
		io.write("],\n")

		io.write(string.format("\"money\":%d,\n", Money))
		io.write(string.format("\"seen\":%d,\n", Seen))
		io.write(string.format("\"own\":%d,\n", Own))

		io.write("\"party\":[")
		for i = 1, 6, 1 do
			io.write("{\n")
			io.write(string.format("\"pid\":%d,\n", party[i].pid))
			io.write(string.format("\"dex\":%d,\n", party[i].dex))
			io.write(string.format("\"gender\":%d,\n", party[i].gender))
			io.write(string.format("\"hp\":%d,\n", party[i].hp))
			io.write(string.format("\"maxHP\":%d,\n", party[i].maxhp))
			io.write(string.format("\"level\":%d,\n", party[i].lvl))
			io.write(string.format("\"status\":%d,\n", party[i].status))
			io.write(string.format("\"item\":%d,\n", party[i].item))
			io.write(string.format("\"nickname\":\"%s\",\n", party[i].nickname))
			io.write(string.format("\"form\":%d,\n", party[i].form))

			if party[i].egg == 0 then
				io.write("\"egg\":false,\n")
			else
				io.write("\"egg\":true,\n")
			end

			io.write("\"moves\":[\n")
			for j = 1, 4, 1 do
				io.write("{\n")
				io.write(string.format("\"move\":%d,\n", party[i].moves[j].move))
				io.write(string.format("\"pp\":%d,\n", party[i].moves[j].pp))
				io.write(string.format("\"maxPP\":%d\n", party[i].moves[j].maxpp))
				io.write("}")

				if j < 4 then
					io.write(",")
				end

				io.write("\n")
			end
			io.write("]}")

			if i < 6 then
				io.write(",")
			end

			io.write("\n")
		end
		io.write("]}")

		io.close(file)

		--Egg
		--0x00 = Not Egg
		--0x01 = Is Egg

		--Gender
		--0x00 = Male
		--0x01 = Female
		--0x02 = Genderless

		--Status
		--0x00 = Healthy
		--0x01 to 0x07 Sleeping, each turn it is reduced by 1. when it is 0x01 it means it will wake that turn.
		--0x08 = Poisoned
		--0x10 = Burned
		--0x20 = Frozen
		--0x40 = Paralyzed
		--0x80 = Toxic
	end
	emu.frameadvance()
end