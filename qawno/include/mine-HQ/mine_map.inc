for(new i; i < MAX_MINE_ROCKS; i++)
{
    mineRocks_HQ_id[i] = CreateDynamicObject(mineRocks_HQ[i][objid], mineRocks_HQ[i][posX],mineRocks_HQ[i][posY],mineRocks_HQ[i][posZ], mineRocks_HQ[i][posRX], mineRocks_HQ[i][posRY], mineRocks_HQ[i][posRZ], 0, 0, -1, 100.0, 100.0, -1, -1);
}