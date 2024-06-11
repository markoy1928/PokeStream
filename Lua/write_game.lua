writeGame = function (game, player)
    if game == "DP" or game == "PT" then
        gameName = "DPPT"
    else
        gameName = game
    end

    file = io.open("game_data.json", "w")
    io.output(file)

    io.write("{\n")
    io.write(string.format("\"game\":\"%s\",\n", gameName))

    io.write("\"badges\":[")
    for i = 1, 16, 1 do
        if player.badges[i] then
            io.write("true")
        else
            io.write("false")
        end

        if i < 16 then
            io.write(",")
        end
    end
    io.write("],\n")

    io.write(string.format("\"money\":%d,\n", player.money))
    io.write(string.format("\"seen\":%d,\n", player.seen))
    io.write(string.format("\"own\":%d,\n", player.own))

    io.write("\"party\":[")
    for i = 1, 6, 1 do
        io.write("{\n")
        io.write(string.format("\"pid\":%d,\n", player.party[i].pid))
        io.write(string.format("\"dex\":%d,\n", player.party[i].dex))
        io.write(string.format("\"gender\":%d,\n", player.party[i].gender))
        io.write(string.format("\"hp\":%d,\n", player.party[i].hp))
        io.write(string.format("\"maxHP\":%d,\n", player.party[i].maxhp))
        io.write(string.format("\"level\":%d,\n", player.party[i].lvl))
        io.write(string.format("\"status\":%d,\n", player.party[i].status))
        io.write(string.format("\"item\":%d,\n", player.party[i].item))
        io.write(string.format("\"nickname\":\"%s\",\n", player.party[i].nickname))
        io.write(string.format("\"form\":%d,\n", player.party[i].form))

        if player.party[i].egg == 0 then
            io.write("\"egg\":false,\n")
        else
            io.write("\"egg\":true,\n")
        end

        io.write("\"moves\":[\n")
        for j = 1, 4, 1 do
            io.write("{\n")
            io.write(string.format("\"move\":%d,\n", player.party[i].moves[j].move))
            io.write(string.format("\"pp\":%d,\n", player.party[i].moves[j].pp))
            io.write(string.format("\"maxPP\":%d\n", player.party[i].moves[j].maxpp))
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
end