local game

-- Determine what the game is
if memory ~= nil then
    game = memory.readdword(0x02FFFE0C)
end

-- Gen 1
if false then
    dofile("Lua\\G1Read.lua")
-- Gen 2
elseif false then
    dofile("Lua\\G2Read.lua")
-- Gen 3
elseif false then
    dofile("Lua\\G3Read.lua")
-- Gen 4
elseif game == 0x45414441 or game == 0x45415041 or game == 0x45555043 or game == 0x454B5049 or game == 0x45475049 then
    dofile("Lua\\G4Read.lua")
-- Gen 5
elseif game == 0x4F425249 or game == 0x4F415249 or game == 0x4F455249 or game == 0x4F445249 then
    dofile("Lua\\G5Read.lua")
end