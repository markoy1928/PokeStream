local DecryptedPKMData = {}
local EncryptedPKMData = {}
local DecryptedData
local EncryptedData
local PPVal = { 0x23, 0x19, 0x0A, 0x0F, 0x14, 0x14, 0x0F, 0x0F, 0x0F, 0x23, 0x1E, 0x05, 0x0A, 0x1E, 0x1E, 0x23, 0x23, 0x14, 0x0F, 0x14, 0x14, 0x0F, 0x14, 0x1E, 0x05, 0x19, 0x0F, 0x0F, 0x0F, 0x19, 0x14, 0x05, 0x23, 0x0F, 0x14, 0x14, 0x14, 0x0F, 0x1E, 0x23, 0x14, 0x14, 0x1E, 0x19, 0x28, 0x14, 0x0F, 0x14, 0x14, 0x14, 0x1E, 0x19, 0x0F, 0x1E, 0x19, 0x05, 0x0F, 0x0A, 0x05, 0x14, 0x14, 0x14, 0x05, 0x23, 0x14, 0x19, 0x14, 0x14, 0x14, 0x0F, 0x19, 0x0F, 0x0A, 0x28, 0x19, 0x0A, 0x23, 0x1E, 0x0F, 0x14, 0x28, 0x0A, 0x0F, 0x1E, 0x0F, 0x14, 0x0A, 0x0F, 0x0A, 0x05, 0x0A, 0x0A, 0x19, 0x0A, 0x14, 0x28, 0x1E, 0x1E, 0x14, 0x14, 0x0F, 0x0A, 0x28, 0x0F, 0x0A, 0x1E, 0x14, 0x14, 0x0A, 0x28, 0x28, 0x1E, 0x1E, 0x1E, 0x14, 0x1E, 0x0A, 0x0A, 0x14, 0x05, 0x0A, 0x1E, 0x14, 0x14, 0x14, 0x05, 0x0F, 0x0A, 0x14, 0x0F, 0x0F, 0x23, 0x14, 0x0F, 0x0A, 0x14, 0x1E, 0x0F, 0x28, 0x14, 0x0F, 0x0A, 0x05, 0x0A, 0x1E, 0x0A, 0x0F, 0x14, 0x0F, 0x28, 0x28, 0x0A, 0x05, 0x0F, 0x0A, 0x0A, 0x0A, 0x0F, 0x1E, 0x1E, 0x0A, 0x0A, 0x14, 0x0A, 0x01, 0x01, 0x0A, 0x0A, 0x0A, 0x05, 0x0F, 0x19, 0x0F, 0x0A, 0x0F, 0x1E, 0x05, 0x28, 0x0F, 0x0A, 0x19, 0x0A, 0x1E, 0x0A, 0x14, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x14, 0x05, 0x28, 0x05, 0x05, 0x0F, 0x05, 0x0A, 0x05, 0x0F, 0x0A, 0x0A, 0x0A, 0x14, 0x14, 0x28, 0x0F, 0x0A, 0x14, 0x14, 0x19, 0x05, 0x0F, 0x0A, 0x05, 0x14, 0x0F, 0x14, 0x19, 0x14, 0x05, 0x1E, 0x05, 0x0A, 0x14, 0x28, 0x05, 0x14, 0x28, 0x14, 0x0F, 0x23, 0x0A, 0x05, 0x05, 0x05, 0x0F, 0x05, 0x14, 0x05, 0x05, 0x0F, 0x14, 0x0A, 0x05, 0x05, 0x0F, 0x0F, 0x0F, 0x0F, 0x0A, 0x0A, 0x0A, 0x14, 0x0A, 0x0A, 0x0A, 0x0A, 0x0F, 0x0F, 0x0F, 0x0A, 0x14, 0x14, 0x0A, 0x14, 0x14, 0x14, 0x14, 0x14, 0x0A, 0x0A, 0x0A, 0x14, 0x14, 0x05, 0x0F, 0x0A, 0x0A, 0x0F, 0x0A, 0x14, 0x05, 0x05, 0x0A, 0x0A, 0x14, 0x05, 0x0A, 0x14, 0x0A, 0x14, 0x14, 0x14, 0x05, 0x05, 0x0F, 0x14, 0x0A, 0x0F, 0x14, 0x0F, 0x0A, 0x0A, 0x0F, 0x0A, 0x05, 0x05, 0x0A, 0x0F, 0x0A, 0x05, 0x14, 0x19, 0x05, 0x28, 0x0A, 0x05, 0x28, 0x0F, 0x14, 0x14, 0x05, 0x0F, 0x14, 0x1E, 0x0F, 0x0F, 0x05, 0x0A, 0x1E, 0x14, 0x1E, 0x0F, 0x05, 0x28, 0x0F, 0x05, 0x14, 0x05, 0x0F, 0x19, 0x28, 0x0F, 0x14, 0x0F, 0x14, 0x0F, 0x14, 0x0A, 0x14, 0x14, 0x05, 0x05, 0x0A, 0x05, 0x28, 0x0A, 0x0A, 0x05, 0x0A, 0x0A, 0x0F, 0x0A, 0x14, 0x1E, 0x1E, 0x0A, 0x14, 0x05, 0x0A, 0x0A, 0x0F, 0x0A, 0x0A, 0x05, 0x0F, 0x05, 0x0A, 0x0A, 0x1E, 0x14, 0x14, 0x0A, 0x0A, 0x05, 0x05, 0x0A, 0x05, 0x14, 0x0A, 0x14, 0x0A, 0x0F, 0x0A, 0x14, 0x14, 0x14, 0x0F, 0x0F, 0x0A, 0x0F, 0x14, 0x0F, 0x0A, 0x0A, 0x0A, 0x14, 0x05, 0x1E, 0x05, 0x0A, 0x0F, 0x0A, 0x0A, 0x05, 0x14, 0x1E, 0x0A, 0x1E, 0x0F, 0x0F, 0x0F, 0x0F, 0x1E, 0x0A, 0x14, 0x0F, 0x0A, 0x0A, 0x14, 0x0F, 0x05, 0x05, 0x0F, 0x0F, 0x05, 0x0A, 0x05, 0x14, 0x05, 0x0F, 0x14, 0x05, 0x14, 0x14, 0x14, 0x14, 0x0A, 0x14, 0x0A, 0x0F, 0x14, 0x0F, 0x0A, 0x0A, 0x05, 0x0A, 0x05, 0x05, 0x0A, 0x05, 0x05, 0x0A, 0x05, 0x05, 0x05 }

function rand(seed)
	return (0x4e6d*(seed%65536)+((0x41c6*(seed%65536)+0x4e6d*math.floor(seed/65536))%65536)*65536+0x6073)%4294967296
end

function getBattleOffset(game)
    local battleOffset = 0

    if game == "DP" then
        battleOffset = memory.readdword(memory.readdword(memory.readdword(0x021C4D28) + 0x1C) + 0xC0)
    elseif game == "PT" then
        battleOffset = memory.readdword(memory.readdword(0x021BF680) + 0x68)
    elseif game == "HGSS" then
        battleOffset = memory.readdword(memory.readdword(0x021D1110) + 0x68)
    elseif game == "BW" then
        battleOffset = memory.readdword(0x02000024) + 0x4EF3C
    elseif game == "B2W2" then
        battleOffset = memory.readdword(0x02000024) + 0x530A8
    end

    return battleOffset
end

function getPartyOffset(game)
    local partyOffset = 0

    if game == "DP" then
        partyOffset = memory.readdword(memory.readdword(0x021C4D28) + 0x04) + 0x2FC
    elseif game == "PT" then
        partyOffset = memory.readdword(0x02101D40) + 0xAC
    elseif game == "HGSS" then
        partyOffset = memory.readdword(0x02111880) + 0xA0
    elseif game == "BW" then
        partyOffset = memory.readdword(0x02000024) + 0x196BC
    elseif game == "B2W2" then
        partyOffset = memory.readdword(0x02000024) + 0x19720
    end

    return partyOffset
end

function getSeenOffset(game)
    local seenOffset = 0

    if game == "DP" then
        seenOffset = memory.readdword(memory.readdword(0x021C4D28) + 0x04) + 0x158C
    elseif game == "PT" then
        seenOffset = memory.readdword(0x02101D40) + 0x1380
    elseif game == "HGSS" then
        seenOffset = memory.readdword(0x02111880) + 0x130C
    elseif game == "BW" then
        seenOffset = memory.readdword(0x02000024) + 0x21F18
    elseif game == "B2W2" then
        seenOffset = memory.readdword(0x02000024) + 0x21D7C
    end

    return seenOffset
end

function getOwnOffset(game)
    local ownOffset = 0

    if game == "DP" then
        ownOffset = memory.readdword(memory.readdword(0x021C4D28) + 0x04) + 0x154C
    elseif game == "PT" then
        ownOffset = memory.readdword(0x02101D40) + 0x1340
    elseif game == "HGSS" then
        ownOffset = memory.readdword(0x02111880) + 0x12CC
    elseif game == "BW" then
        ownOffset = memory.readdword(0x02000024) + 0x21EC4
    elseif game == "B2W2" then
        ownOffset = memory.readdword(0x02000024) + 0x21D28
    end

    return ownOffset
end

function getBadgeData1(game)
    local badgedata = 0

    if game == "DP" then
        badgedata = memory.readbyte(memory.readdword(memory.readdword(0x021C4D28) + 0x04) + 0x2EA)
    elseif game == "PT" then
        badgedata = memory.readbyte(memory.readdword(0x02101D40) + 0x96)
    elseif game == "HGSS" then
        badgedata = memory.readbyte(memory.readdword(0x02111880) + 0x8E)
    elseif game == "BW" then
        badgedata = memory.readbyte(memory.readdword(0x02000024) + 0x21AC0)
    elseif game == "B2W2" then
        badgedata = memory.readbyte(memory.readdword(0x02000024) + 0x21A24)
    end

    return badgedata
end

function getBadgeData2(game)
    local badgeData = 0

    if game == "HGSS" then
        badgeData = memory.readbyte(memory.readdword(0x02111880) + 0x93)
    end

    return badgeData
end

function readseen(offset)
	local seen = 0
	for i = 1, 0x3E, 1 do
		if bit.band(memory.readbyte(offset), 0x01) == 0x01 then
			seen = seen + 1
		end

		if bit.band(memory.readbyte(offset), 0x02) == 0x02 then
			seen = seen + 1
		end

		if bit.band(memory.readbyte(offset), 0x04) == 0x04 then
			seen = seen + 1
		end

		if bit.band(memory.readbyte(offset), 0x08) == 0x08 then
			seen = seen + 1
		end

		if bit.band(memory.readbyte(offset), 0x10) == 0x10 then
			seen = seen + 1
		end

		if bit.band(memory.readbyte(offset), 0x20) == 0x20 then
			seen = seen + 1
		end

		if bit.band(memory.readbyte(offset), 0x40) == 0x40 then
			seen = seen + 1
		end

		if bit.band(memory.readbyte(offset), 0x80) == 0x80 then
			seen = seen + 1
		end
		
		offset = offset + 1
	end	

    return seen
end

function readown(offset)
	local own = 0
	for i = 1, 0x3E, 1 do
		if bit.band(memory.readbyte(offset), 0x01) == 0x01 then
			own = own + 1
		end

		if bit.band(memory.readbyte(offset), 0x02) == 0x02 then
			own = own + 1
		end

		if bit.band(memory.readbyte(offset), 0x04) == 0x04 then
			own = own + 1
		end

		if bit.band(memory.readbyte(offset), 0x08) == 0x08 then
			own = own + 1
		end

		if bit.band(memory.readbyte(offset), 0x10) == 0x10 then
			own = own + 1
		end

		if bit.band(memory.readbyte(offset), 0x20) == 0x20 then
			own = own + 1
		end

		if bit.band(memory.readbyte(offset), 0x40) == 0x40 then
			own = own + 1
		end

		if bit.band(memory.readbyte(offset), 0x80) == 0x80 then
			own = own + 1
		end
		
		offset = offset + 1
	end

    return own
end

function readBadges(badgeData1, badgeData2)
    local b = {}

    b[1] = bit.band(badgeData1, 0x01) == 0x01
    b[2] = bit.band(badgeData1, 0x02) == 0x02
    b[3] = bit.band(badgeData1, 0x04) == 0x04
    b[4] = bit.band(badgeData1, 0x08) == 0x08
    b[5] = bit.band(badgeData1, 0x10) == 0x10
    b[6] = bit.band(badgeData1, 0x20) == 0x20
    b[7] = bit.band(badgeData1, 0x40) == 0x40
    b[8] = bit.band(badgeData1, 0x80) == 0x80
    b[9] = bit.band(badgeData2, 0x01) == 0x01
    b[10] = bit.band(badgeData2, 0x02) == 0x02
    b[11] = bit.band(badgeData2, 0x04) == 0x04
    b[12] = bit.band(badgeData2, 0x08) == 0x08
    b[13] = bit.band(badgeData2, 0x10) == 0x10
    b[14] = bit.band(badgeData2, 0x20) == 0x20
    b[15] = bit.band(badgeData2, 0x40) == 0x40
    b[16] = bit.band(badgeData2, 0x80) == 0x80

    return b
end

function unshuffleBlock_A()
	DecryptedOffset = 0x09;
	for i = 1, 32, 1 do
		DecryptedPKMData[DecryptedOffset] = EncryptedPKMData[EncryptedOffset]
		EncryptedOffset = EncryptedOffset + 1
		DecryptedOffset = DecryptedOffset + 1
	end
end

function unshuffleBlock_B()
	DecryptedOffset = 0x29;
	for i = 1, 32, 1 do
		DecryptedPKMData[DecryptedOffset] = EncryptedPKMData[EncryptedOffset]
		EncryptedOffset = EncryptedOffset + 1
		DecryptedOffset = DecryptedOffset + 1
	end
end

function unshuffleBlock_C()
	DecryptedOffset = 0x49;
	for i = 1, 32, 1 do
		DecryptedPKMData[DecryptedOffset] = EncryptedPKMData[EncryptedOffset]
		EncryptedOffset = EncryptedOffset + 1
		DecryptedOffset = DecryptedOffset + 1
	end
end

function unshuffleBlock_D()
	DecryptedOffset = 0x69;
	for i = 1, 32, 1 do
		DecryptedPKMData[DecryptedOffset] = EncryptedPKMData[EncryptedOffset]
		EncryptedOffset = EncryptedOffset + 1
		DecryptedOffset = DecryptedOffset + 1
	end
end

function determineBlockOrder()
    if BlockOrder == 0 then
        unshuffleBlock_A()
        unshuffleBlock_B()
        unshuffleBlock_C()
        unshuffleBlock_D()
    elseif BlockOrder == 1 then
        unshuffleBlock_A()
        unshuffleBlock_B()
        unshuffleBlock_D()
        unshuffleBlock_C()
    elseif BlockOrder == 2 then
        unshuffleBlock_A()
        unshuffleBlock_C()
        unshuffleBlock_B()
        unshuffleBlock_D()
    elseif BlockOrder == 3 then
        unshuffleBlock_A()
        unshuffleBlock_C()
        unshuffleBlock_D()
        unshuffleBlock_B()
    elseif BlockOrder == 4 then
        unshuffleBlock_A()
        unshuffleBlock_D()
        unshuffleBlock_B()
        unshuffleBlock_C()
    elseif BlockOrder == 5 then
        unshuffleBlock_A()
        unshuffleBlock_D()
        unshuffleBlock_C()
        unshuffleBlock_B()
    elseif BlockOrder == 6 then
        unshuffleBlock_B()
        unshuffleBlock_A()
        unshuffleBlock_C()
        unshuffleBlock_D()
    elseif BlockOrder == 7 then
        unshuffleBlock_B()
        unshuffleBlock_A()
        unshuffleBlock_D()
        unshuffleBlock_C()
    elseif BlockOrder == 8 then
        unshuffleBlock_B()
        unshuffleBlock_C()
        unshuffleBlock_A()
        unshuffleBlock_D()
    elseif BlockOrder == 9 then
        unshuffleBlock_B()
        unshuffleBlock_C()
        unshuffleBlock_D()
        unshuffleBlock_A()
    elseif BlockOrder == 10 then
        unshuffleBlock_B()
        unshuffleBlock_D()
        unshuffleBlock_A()
        unshuffleBlock_C()
    elseif BlockOrder == 11 then
        unshuffleBlock_B()
        unshuffleBlock_D()
        unshuffleBlock_C()
        unshuffleBlock_A()
    elseif BlockOrder == 12 then
        unshuffleBlock_C()
        unshuffleBlock_A()
        unshuffleBlock_B()
        unshuffleBlock_D()
    elseif BlockOrder == 13 then
        unshuffleBlock_C()
        unshuffleBlock_A()
        unshuffleBlock_D()
        unshuffleBlock_B()
    elseif BlockOrder == 14 then
        unshuffleBlock_C()
        unshuffleBlock_B()
        unshuffleBlock_A()
        unshuffleBlock_D()
    elseif BlockOrder == 15 then
        unshuffleBlock_C()
        unshuffleBlock_B()
        unshuffleBlock_D()
        unshuffleBlock_A()
    elseif BlockOrder == 16 then
        unshuffleBlock_C()
        unshuffleBlock_D()
        unshuffleBlock_A()
        unshuffleBlock_B()
    elseif BlockOrder == 17 then
        unshuffleBlock_C()
        unshuffleBlock_D()
        unshuffleBlock_B()
        unshuffleBlock_A()
    elseif BlockOrder == 18 then
        unshuffleBlock_D()
        unshuffleBlock_A()
        unshuffleBlock_B()
        unshuffleBlock_C()
    elseif BlockOrder == 19 then
        unshuffleBlock_D()
        unshuffleBlock_A()
        unshuffleBlock_C()
        unshuffleBlock_B()
    elseif BlockOrder == 20 then
        unshuffleBlock_D()
        unshuffleBlock_B()
        unshuffleBlock_A()
        unshuffleBlock_C()
    elseif BlockOrder == 21 then
        unshuffleBlock_D()
        unshuffleBlock_B()
        unshuffleBlock_C()
        unshuffleBlock_A()
    elseif BlockOrder == 22 then
        unshuffleBlock_D()
        unshuffleBlock_C()
        unshuffleBlock_A()
        unshuffleBlock_B()
    elseif BlockOrder == 23 then
        unshuffleBlock_D()
        unshuffleBlock_C()
        unshuffleBlock_B()
        unshuffleBlock_A()
    end
end

function readNickname(nick, i)
    local c = DecryptedPKMData[i]
    if c == 0xFF then
        return nick
    elseif c < 0x2B then
        -- Number
		readNickname(nick .. string.char(c + 0x0F), i + 2)
    elseif c < 0x45 then
        -- Uppercase
        readNickname(nick .. string.char(c + 0x16), i + 2)
	elseif c < 0x7A then
        -- Lowercase
        readNickname(nick .. string.char(c + 0x1C), i + 2)
    elseif c == 0xAB then
        readNickname(nick .. "!", i + 2)
    elseif c == 0xAC then
        readNickname(nick .. "?", i + 2)
    elseif c == 0xAD then
        readNickname(nick .. ",", i + 2)
    elseif c == 0xAE then
        readNickname(nick .. ".", i + 2)
    elseif c == 0xAF then
        readNickname(nick .. "\u2026", i + 2) -- Elipses
    elseif c == 0xB0 then
        readNickname(nick .. "\u00B7", i + 2) -- Center Dot
    elseif c == 0xB1 then
        readNickname(nick .. "/", i + 2)
    elseif c == 0xB2 then
        readNickname(nick .. "\u2018", i + 2) -- Left Single Quote
    elseif c == 0xB3 then
        readNickname(nick .. "\u2019", i + 2) -- Right Single Quote
    elseif c == 0xB4 then
        readNickname(nick .. "\u201C", i + 2) -- Left Double Quote
    elseif c == 0xB5 then
        readNickname(nick .. "\u201D", i + 2) -- Right Double Quote
    elseif c == 0xB9 then
        readNickname(nick .. "(", i + 2)
    elseif c == 0xBA then
        readNickname(nick .. ")", i + 2)
    elseif c == 0xBB then
        readNickname(nick .. "\u2642", i + 2)
    elseif c == 0xBC then
        readNickname(nick .. "\u2640", i + 2)
    elseif c == 0xBD then
        readNickname(nick .. "+", i + 2)
    elseif c == 0xBE then
        readNickname(nick .. "-", i + 2)
    elseif c == 0xBF then
        readNickname(nick .. "*", i + 2)
    elseif c == 0xC0 then
        readNickname(nick .. "#", i + 2)
    elseif c == 0xC1 then
        readNickname(nick .. "=", i + 2)
    elseif c == 0xC3 then
        readNickname(nick .. "~", i + 2)
    elseif c == 0xC4 then
        readNickname(nick .. ":", i + 2)
    elseif c == 0xC5 then
        readNickname(nick .. ";", i + 2)
    elseif c == 0xC6 then
        readNickname(nick .. "\u2660", i + 2) -- Spade
    elseif c == 0xC7 then
        readNickname(nick .. "\u2663", i + 2) -- Club
    elseif c == 0xC8 then
        readNickname(nick .. "\u2665", i + 2) -- Heart
    elseif c == 0xC9 then
        readNickname(nick .. "\u29EB", i + 2) -- Diamond
    elseif c == 0xCA then
        readNickname(nick .. "\u2605", i + 2) -- Star
    elseif c == 0xCB then
        readNickname(nick .. "\u2609", i + 2) -- Dot Circle
    elseif c == 0xCC then
        readNickname(nick .. "O", i + 2)
    elseif c == 0xCD then
        readNickname(nick .. "\u2B1C", i + 2) -- Square
    elseif c == 0xCE then
        readNickname(nick .. "\u25B2", i + 2) -- Triangle
    elseif c == 0xCF then
        readNickname(nick .. "\u2662", i + 2) -- White Diamond
    elseif c == 0xD0 then
        readNickname(nick .. "@", i + 2)
    elseif c == 0xD1 then
        readNickname(nick .. "\u266A", i + 2) -- Eighth Note
    elseif c == 0xD2 then
        readNickname(nick .. "%", i + 2)
    elseif c == 0xD3 then
        readNickname(nick .. "\u2600", i + 2) -- Sun
    elseif c == 0xD4 then
        readNickname(nick .. "\u273F", i + 2) -- ?
    elseif c == 0xD5 then
        readNickname(nick .. "\u277D", i + 2) -- 8?
    elseif c == 0xD6 then
        readNickname(nick .. "\u2602", i + 2) -- Umbrella
    elseif c == 0xD7 then
        readNickname(nick .. "\u263A", i + 2) -- Smile
    elseif c == 0xD8 then
        readNickname(nick .. "\u263B", i + 2) -- Laugh
    elseif c == 0xD9 then
        readNickname(nick .. "\u2639", i + 2) -- Frown
    elseif c == 0xDA then
        readNickname(nick .. "\u2620", i + 2) -- Angry
    elseif c == 0xDB then
        readNickname(nick .. "\u2934", i + 2) -- Curved Up
    elseif c == 0xDC then
        readNickname(nick .. "\u2935", i + 2) -- Curved Down
    elseif c == 0xDD then
        readNickname(nick .. "Zz", i + 2)
    elseif c == 0xDE then
        readNickname(nick .. " ", i + 2)
    end
end

function readParty(offset)
    local party = {}

	for CurrentPokemon = 1, 6, 1 do
		for i = 1, 236, 1 do
			EncryptedPKMData[i] = memory.readbyte(offset)
			offset = offset + 1
		end
		
        for i = 0x00, 0x08, 0x01 do
            DecryptedPKMData[i] = EncryptedPKMData[i]
        end

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
		determineBlockOrder()

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
			party[CurrentPokemon].nickname = readNickname("", 0x49)
			party[CurrentPokemon].form = DecryptedPKMData[0x41]
		end
	end

    return party
end

readData = function (game)
    player = Trainer:new(nil)

    -- Read memory for data
    battleOffset = getBattleOffset(game)
    partyOffset = getPartyOffset(game)
    seenOffset = getSeenOffset(game)
    ownOffset = getOwnOffset(game)
    badgeData1 = getBadgeData1(game)
    badgeData2 = getBadgeData2(game)

    if battleOffset ~= 0x00 then
        if memory.readdword(battleOffset) == 0x06 then
            player.party = readParty(battleOffset + 0x08)
        elseif partyOffset ~= 0x00 then
            if memory.readdword(partyOffset) == 0x06 then
                player.party = readParty(partyOffset + 0x08)
            end
        end
    end

    if seenOffset ~= 0x00 then
        player.seen = readseen(seenOffset)
    end

    if ownOffset ~= 0x00 then
        player.own = readown(ownOffset)
    end

    player.badges = readBadges(badgeData1, badgeData2)

    return player
end