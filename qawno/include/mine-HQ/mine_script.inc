enum MINE_ROCKS_DATA
{
    objid,
    Float:posX,
    Float:posY,
    Float:posZ,
    Float:posRX,
    Float:posRY,
    Float:posRZ,
    riseTimer,
    count
};
new mineRocks_HQ_id[MAX_MINE_ROCKS], miningTimer_HQ[MAX_PLAYERS], mineRocks_HQ[MAX_MINE_ROCKS][MINE_ROCKS_DATA] =
{
    {905, 696.9150,878.1437,-40.3565, 0.000000, 0.000000, 0.000000},
    {905, 694.3902,905.5249,-40.1026, 0.000000, 0.000000, 0.000000},
    {905, 669.0320,915.1703,-41.6644, 0.000000, 0.000000, 0.000000},
    {905, 665.1032,906.9207,-41.3984, 0.000000, 0.000000, 0.000000},
    {905, 667.9155,882.0687,-41.4329, 0.000000, 0.000000, 0.000000},
    {905, 650.9626,882.0038,-42.8139, 0.000000, 0.000000, 0.000000},
    {905, 660.4732,901.4296,-41.5609, 0.000000, 0.000000, 0.000000},
    {905, 646.9702,925.3887,-41.0482, 0.000000, 0.000000, 0.000000},
    {905, 614.6152,940.3497,-39.1895, 0.000000, 0.000000, 0.000000},
    {905, 695.5544,861.6091,-43.6612, 0.000000, 0.000000, 0.000000},
    {905, 697.8726,874.6206,-40.9108, 0.000000, 0.000000, 0.000000}
};

function: MinedRock_HQ(playerid, mined_rock_HQ_id)
{
    if(mineRocks_HQ_id[mined_rock_HQ_id] != INVALID_OBJECT_ID)
    {
        if(IsPlayerInRangeOfPoint(playerid, 1.5, mineRocks_HQ[mined_rock_HQ_id][posX], mineRocks_HQ[mined_rock_HQ_id][posY], mineRocks_HQ[mined_rock_HQ_id][posZ]))
        {
            if(IsPlayerAnim(playerid, "BASEBALL", "Bat_4"))
            {
                new randomNum = 300000 + random(60000);
                DestroyDynamicObject(mineRocks_HQ_id[mined_rock_HQ_id]);
                mineRocks_HQ_id[mined_rock_HQ_id] = INVALID_OBJECT_ID;
                ClearAnimationsEx(playerid);
                AddNewItem(playerid, PI[playerid][pRawMaterials], 1);
                DeletePVar(playerid, "is_mining_HQ");
                mineRocks_HQ[mined_rock_HQ_id][riseTimer] = SetTimerEx("MinedRockRiseTimer_HQ", randomNum, true, "i", mined_rock_HQ_id);
                return 1;
            }
        }
    }
    if(GetPlayerAnimationIndex(playerid)) ClearAnimationsEx(playerid);
    DeletePVar(playerid, "is_mining_HQ");
    return SendErrorMess(playerid, "Ресурс не был добыт.");
}

function: MinedRockRiseTimer_HQ(rise_rock_HQ_id)
{
    if(mineRocks_HQ_id[rise_rock_HQ_id] == INVALID_OBJECT_ID)
    {
        mineRocks_HQ_id[rise_rock_HQ_id] = CreateDynamicObject(mineRocks_HQ[rise_rock_HQ_id][objid], mineRocks_HQ[rise_rock_HQ_id][posX],mineRocks_HQ[rise_rock_HQ_id][posY],mineRocks_HQ[rise_rock_HQ_id][posZ], mineRocks_HQ[rise_rock_HQ_id][posRX], mineRocks_HQ[rise_rock_HQ_id][posRY], mineRocks_HQ[rise_rock_HQ_id][posRZ], 0, 0, -1, 100.0, 100.0, -1, -1);
    }
    KillTimer(mineRocks_HQ[rise_rock_HQ_id][riseTimer]);
    return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
    if(GetPVarInt(playerid, "is_mining_HQ")) DeletePVar(playerid, "is_mining_HQ");
    if(miningTimer_HQ[playerid]) KillTimer(miningTimer_HQ[playerid]);
    return 1;
}

hook OnPlayerKeyStateChange(playerid, KEY:newkeys, KEY:oldkeys)
{
    if(RELEASED(KEY_WALK))
	{
        if(!GetPVarInt(playerid, "is_mining_HQ"))
        {
            if(GetPlayerMapZone(playerid) == ZONE_HUNTER_QUARRY)
            {
                for(new i; i < MAX_MINE_ROCKS; i++)
                {
                    if(mineRocks_HQ_id[i] != INVALID_OBJECT_ID)
                    {
                        if(IsPlayerInRangeOfPoint(playerid, 1.5, mineRocks_HQ[i][posX], mineRocks_HQ[i][posY], mineRocks_HQ[i][posZ]) && mineRocks_HQ_id[i] != INVALID_OBJECT_ID)
                        {
                            if(!PI[playerid][pDefaultPickaxe]) return SendErrorMess(playerid, "У тебя нет кирки!");
                            ApplyAnimationEx(playerid, "BASEBALL", "Bat_4", 4.1, true, false, false, true, 10000, 1);
                            SetPVarInt(playerid, "is_mining_HQ", 1);
                            miningTimer_HQ[playerid] = SetTimerEx("MinedRock_HQ", 10000, false, "ii", playerid, i);
                        }
                    }
                }
            }
        }
    }
    return 1;
}