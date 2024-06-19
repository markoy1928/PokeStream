writeGame = function (game, player)
    if game == "DP" or game == "PT" then
        gameName = "DPPT"
    else
        gameName = game
    end

    file = io.open("game_data.json", "w")
    io.output(file)

    io.write("{\n")

    io.write(string.format("\"game\": \"%s\",\n", gameName))

    -- Badges
    io.write("\"badges\": [")
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

    io.write(string.format("\"money\": %d,\n", player.money))
    io.write(string.format("\"seen\": %d,\n", player.seen))
    io.write(string.format("\"own\": %d,\n", player.own))

    io.write("\"party\":[")
    for i = 1, 6, 1 do
        io.write("{\n")

        local pk = player.party[i]

        -- PID
        if pk ~= nil and pk.pid ~= nil then
            io.write(string.format("\"pid\": %d,\n", pk.pid))
        else
            io.write(string.format("\"pid\": %d,\n", 0))
        end

        -- Dex
        if pk ~= nil and pk.dex ~= nil then
            io.write(string.format("\"dex\": %d,\n", pk.dex))
        else
            io.write(string.format("\"dex\": %d,\n", 0))
        end

        -- Gender
        if pk ~= nil and pk.gender ~= nil then
            io.write(string.format("\"gender\": %d,\n", pk.gender))
        else
            io.write(string.format("\"gender\": %d,\n", -1))
        end

        -- HP
        if pk ~= nil and pk.hp ~= nil then
            io.write(string.format("\"hp\": %d,\n", pk.hp))
        else
            io.write(string.format("\"hp\": %d,\n", 0))
        end

        -- MaxHP
        if pk ~= nil and pk.maxhp ~= nil then
            io.write(string.format("\"maxHP\": %d,\n", pk.maxhp))
        else
            io.write(string.format("\"maxHP\": %d,\n", 0))
        end

        -- Level
        if pk ~= nil and pk.lvl ~= nil then
            io.write(string.format("\"level\": %d,\n", pk.lvl))
        else
            io.write(string.format("\"level\": %d,\n", 0))
        end

        -- Status
        if pk ~= nil and pk.status ~= nil then
            io.write(string.format("\"status\": %d,\n", pk.status))
        else
            io.write(string.format("\"status\": %d,\n", 0))
        end

        -- Item
        if pk ~= nil and pk.item ~= nil then
            io.write(string.format("\"item\": %d,\n", pk.item))
        else
            io.write(string.format("\"item\": %d,\n", 0))
        end

        -- Nickname
        if pk ~= nil and pk.nickname ~= nil then
            io.write(string.format("\"nickname\": \"%s\",\n", pk.nickname))
        else
            io.write(string.format("\"nickname\": \"%s\",\n", ""))
        end

        -- Form
        if pk ~= nil and pk.form ~= nil then
            io.write(string.format("\"form\": %d,\n", pk.form))
        else
            io.write(string.format("\"form\": %d,\n", 0))
        end

        -- Egg
        if pk ~= nil and pk.egg ~= nil then
            if pk.egg == 0 then
                io.write("\"egg\": false,\n")
            else
                io.write("\"egg\": true,\n")
            end
        else
            io.write("\"egg\": false,\n")
        end

        io.write("\"moves\":[\n")
        for j = 1, 4, 1 do
            io.write("{\n")
            
            -- Move
            if pk ~= nil and pk.move ~= nil then
                io.write(string.format("\"move\": %d,\n", pk.moves[j].move))
            else
                io.write(string.format("\"move\": %d,\n", 0))
            end

            -- PP
            if pk ~= nil and pk.pp ~= nil then
                io.write(string.format("\"pp\": %d,\n", pk.moves[j].pp))
            else
                io.write(string.format("\"pp\": %d,\n", 0))
            end

            -- MaxPP
            if pk ~= nil and pk.maxpp ~= nil then
                io.write(string.format("\"maxPP\": %d\n", pk.moves[j].maxpp))
            else
                io.write(string.format("\"maxPP\": %d\n", 0))
            end

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