dofile("Lua\\pokemon")
dofile("Lua\\read_game.lua")
dofile("Lua\\write_game.lua")

local game

-- Determine what the game is
if memory ~= nil then
    gameID = memory.readdword(0x02FFFE0C)

    if gameID == 0x45414441 or gameID == 0x45415041 or gameID == 0x45555043 then
        game = "DPPT"
    elseif gameID == 0x454B5049 or gameID == 0x45475049 then
        game = "HGSS"
    elseif gameID == 0x4F425249 or gameID == 0x4F415249 then
        game = "BW"
    elseif gameID == 0x4F455249 or gameID == 0x4F445249 then
        game = "B2W2"
    end
end

while true do
    emu.frameadvance()
    read_game(game)
    emu.frameadvance()
    write_game(game)
    emu.frameadvance()
end