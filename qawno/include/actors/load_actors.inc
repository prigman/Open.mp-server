enum ACTOR_DATA
{
        Text3D:ActorsText,
        aTimer,
		Float:aPosX,
		Float:aPosY,
		Float:aPosZ,
		Float:aPosR
};
 
new ActorInfo[MAX_ACTORS][ACTOR_DATA],
	clothesShopActor_intid_15[2],
	clotherShopActor_intid_5,
	questActor_LV,
	questActor_LS,
	questActor_SF,
	minerActor_HQ;

stock SetActorChatBubble(actorid, const text[], color, Float:drawdistance, expiretime)
{
	Delete3DTextLabel(ActorInfo[actorid][ActorsText]), KillTimer(ActorInfo[actorid][aTimer]);
	ActorInfo[actorid][ActorsText] = Create3DTextLabel(text, color, ActorInfo[actorid][aPosX], ActorInfo[actorid][aPosY], ActorInfo[actorid][aPosZ]+1.1, drawdistance, GetActorVirtualWorld(actorid));
	ActorInfo[actorid][aTimer] = SetTimerEx("ClearActorChatBubble", expiretime, false, "d", actorid);
}

stock PlayerToActor(Float:radi, playerid, actorid)
{
	GetDynamicActorPos(actorid, ActorInfo[actorid][aPosX], ActorInfo[actorid][aPosY], ActorInfo[actorid][aPosZ]);
	if(IsPlayerInRangeOfPoint(playerid, radi, ActorInfo[actorid][aPosX], ActorInfo[actorid][aPosY], ActorInfo[actorid][aPosZ])) return 1;
	return 0;
}

hook OnGameModeInit()
{
    clothesShopActor_intid_15[0] = CreateDynamicActor(93, 208.8252,-98.7053,1005.2578,181.0014, .worldid = 8, .interiorid = 15); // магазин одежды
	GetDynamicActorPos(clothesShopActor_intid_15[0], ActorInfo[clothesShopActor_intid_15[0]][aPosX], ActorInfo[clothesShopActor_intid_15[0]][aPosY], ActorInfo[clothesShopActor_intid_15[0]][aPosZ]);
	//
	clothesShopActor_intid_15[1] = CreateDynamicActor(93, 206.3619,-98.7052,1005.2578,178.7036, .worldid = 8, .interiorid = 15);
	GetDynamicActorPos(clothesShopActor_intid_15[1], ActorInfo[clothesShopActor_intid_15[1]][aPosX], ActorInfo[clothesShopActor_intid_15[1]][aPosY], ActorInfo[clothesShopActor_intid_15[1]][aPosZ]);
	//
	clotherShopActor_intid_5 = CreateDynamicActor(93, 204.8536,-8.2196,1001.2109,268.5477, .worldid = 7, .interiorid = 5); // второй магазин
	GetDynamicActorPos(clotherShopActor_intid_5, ActorInfo[clotherShopActor_intid_5][aPosX], ActorInfo[clotherShopActor_intid_5][aPosY], ActorInfo[clotherShopActor_intid_5][aPosZ]);
	//
	questActor_SF = CreateDynamicActor(3,-1977.8505,133.4897,27.6940,268.5416, .worldid = 0, .interiorid = 0);
	GetDynamicActorPos(questActor_SF, ActorInfo[questActor_SF][aPosX], ActorInfo[questActor_SF][aPosY], ActorInfo[questActor_SF][aPosZ]);
	CreateDynamic3DTextLabel(!"Андрэ\n"WHITE_HEX"Квестовый персонаж\n\n"LIGHTBLUE_HEX"ALT чтобы поговорить", GOLDORANGE_FORMAT, ActorInfo[questActor_SF][aPosX], ActorInfo[questActor_SF][aPosY], ActorInfo[questActor_SF][aPosZ]+0.4, 15.0, .worldid = 0, .interiorid = 0);
	//
	questActor_LS = CreateDynamicActor(292,2020.6821,-2028.2499,13.5708,271.6508, .worldid = 0, .interiorid = 0);
	GetDynamicActorPos(questActor_LS, ActorInfo[questActor_LS][aPosX], ActorInfo[questActor_LS][aPosY], ActorInfo[questActor_LS][aPosZ]);
	CreateDynamic3DTextLabel(!"Джеффри\n"WHITE_HEX"Квестовый персонаж\n\n"LIGHTBLUE_HEX"ALT чтобы поговорить", GOLDORANGE_FORMAT, ActorInfo[questActor_LS][aPosX], ActorInfo[questActor_LS][aPosY], ActorInfo[questActor_LS][aPosZ]+0.4, 15.0, .worldid = 0, .interiorid = 0);
	//
	questActor_LV = CreateDynamicActor(290,2824.3574,1290.5966,10.7640,268.5840, .worldid = 0, .interiorid = 0);
	GetDynamicActorPos(questActor_LV, ActorInfo[questActor_LV][aPosX], ActorInfo[questActor_LV][aPosY], ActorInfo[questActor_LV][aPosZ]);
	CreateDynamic3DTextLabel(!"Генри\n"WHITE_HEX"Квестовый персонаж\n\n"LIGHTBLUE_HEX"ALT чтобы поговорить", GOLDORANGE_FORMAT, ActorInfo[questActor_LV][aPosX], ActorInfo[questActor_LV][aPosY], ActorInfo[questActor_LV][aPosZ]+0.4, 15.0, .worldid = 0, .interiorid = 0);
	//
	minerActor_HQ = CreateDynamicActor(260,694.8371,899.3973,-39.0117,98.5682, .worldid = 0, .interiorid = 0);
	GetDynamicActorPos(minerActor_HQ, ActorInfo[minerActor_HQ][aPosX], ActorInfo[minerActor_HQ][aPosY], ActorInfo[minerActor_HQ][aPosZ]);
	CreateDynamic3DTextLabel(!"Заведующий шахтой\n\n"LIGHTBLUE_HEX"ALT чтобы поговорить", GOLDORANGE_FORMAT, ActorInfo[minerActor_HQ][aPosX], ActorInfo[minerActor_HQ][aPosY], ActorInfo[minerActor_HQ][aPosZ]+0.4, 15.0, .worldid = 0, .interiorid = 0);
}

hook OnGameModeExit()
{
	for(new i = 0; i < sizeof(clothesShopActor_intid_15); i++) DestroyDynamicActor(clothesShopActor_intid_15[i]);
	return 1;
}

function: ClearActorChatBubble(actorid) Delete3DTextLabel(ActorInfo[actorid][ActorsText]), KillTimer(ActorInfo[actorid][aTimer]);