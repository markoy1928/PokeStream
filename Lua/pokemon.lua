Move = {
    move,
    pp,
    maxpp
}

function Move:new (o)
    o = o or {}   -- create object if user does not provide one
    setmetatable(o, self)
    self.__index = self
    return o
end

Pokemon = {
    pid,
    dex,
    hp,
    maxhp,
    lvl,
    moves = {},
    status,
    gender,
    egg,
    item,
    nickname,
    form
}

function Pokemon:new (o)
    o = o or {}   -- create object if user does not provide one
    setmetatable(o, self)
    self.__index = self
    return o
end

Trainer = {
    trainerName,
    money,
    seen,
    own,
    badges = {},
    party = {}
}

function Trainer:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end