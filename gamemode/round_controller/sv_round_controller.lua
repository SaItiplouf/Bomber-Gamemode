local round_status = 0
local iTeamRedScore = 0
local iTeamBlueScore = 0

util.AddNetworkString("UpdateRoundStatus")
util.AddNetworkString("UpdateTeamScore")


local function UpdateClientScore()
    net.Start("UpdateTeamScore")
    net.WriteInt(iTeamRedScore, 4)
    net.WriteInt(iTeamBlueScore, 4)
    net.Broadcast()
end

local function UpdateClientRoundStatus()
    net.Start("UpdateRoundStatus")
     net.WriteInt(round_status, 4)
    net.Broadcast()
end

local function EndRound()
    round_status = 0
    iTeamRedScore = 0
    iTeamBlueScore = 0
    updateClientRoundStatus()
    updateClientScore()
    for _, ply in ipairs(player.GetAll()) do
        ply:KillSilent()
        GetTeamPerks(ply)
    end
end


function BeginRound()
    round_status = 1
    UpdateClientRoundStatus()
end

function GetRoundStatus()
    return round_status
end


function IncrementScore(ply)
    if ply:Team() == TEAM_RED then
        iTeamRedScore = iTeamRedScore + 1
    elseif ply:Team() == TEAM_BLUE then
        iTeamBlueScore = iTeamBlueScore + 1
    end
    if iTeamRedScore == 10 or iTeamBlueScore == 10 then
        EndRound()
        return
    end
    UpdateClientScore()

end


