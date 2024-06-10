dofile("Lua\\pokemon.lua")
dofile("Lua\\read_game.lua")
dofile("Lua\\write_game.lua")

local game

-- Determine what the game is
if memory ~= nil then
    gameID = memory.readdword(0x02FFFE0C)

    if gameID == 0x45414441 or gameID == 0x45415041 then
        game = "DP"
    elseif gameID == 0x45555043 then
        game = "PT"
    elseif gameID == 0x454B5049 or gameID == 0x45475049 then
        game = "HGSS"
    elseif gameID == 0x4F425249 or gameID == 0x4F415249 then
        game = "BW"
    elseif gameID == 0x4F455249 or gameID == 0x4F445249 then
        game = "B2W2"
    end
end

while true do
    local player

    emu.frameadvance()

    if emu.framecount() % 60 == 1 then
        player = readData(game)
        writeGame(game, player)
    end
end