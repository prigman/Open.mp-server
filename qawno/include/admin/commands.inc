@cmd() fly(playerid, params[], help)
{
	if(AI[playerid][aLevel] != 10) return 1;
    static const MSG_USE_CMD[] = !"» Usage the command: /fly [mode 0-2]";
    
    if(isnull(params)) {
        return SendClientMessage(playerid, -1, MSG_USE_CMD) & false;
    }

    new fly_mode;
    if(sscanf(params, "d", fly_mode)) {
        return SendClientMessage(playerid, -1, MSG_USE_CMD) & false;
    }
    
    if(!(fly_mode >= 0 && fly_mode <= 2)) {
        return SendClientMessage(playerid, -1, MSG_USE_CMD) & false;
    }

    SetPlayerFlyStatus(playerid, fly_mode);
    return 1;
}

@cmd() checkfly(playerid, params[], help)
{
	if(AI[playerid][aLevel] != 10) return 1;
    static const MSG_USE_CMD[] = !"» Usage the command: /checkfly [playerid]";
    
    if(isnull(params)) {
        return SendClientMessage(playerid, -1, MSG_USE_CMD) & false;
    }

    new checkfly_id;
    if(sscanf(params, "u", checkfly_id)) {
        return SendClientMessage(playerid, -1, MSG_USE_CMD) & false;
    }

    if(checkfly_id == INVALID_PLAYER_ID) {
        return SendClientMessage(playerid, -1, !"The player is not connected") & false;
    }

    static const status_fly[][] =
    {
        !"The player is not flying",
        !"The player is flying"
    };
    
    SendClientMessage(playerid, -1, status_fly[IsPlayerFlying(checkfly_id)]);
    return 1;
}

@cmd() savecam(playerid, params[], help)
{
	if(AI[playerid][aLevel] != 10) return 1;
	static const
	fmt_str0[] = "SetPlayerCameraPos(playerid, %f, %f, %f);\n",
	fmt_str1[] = "SetPlayerCameraLookAt(playerid, %f, %f, %f);\n";

	const
	fmt_size0 = sizeof(fmt_str0) + (-2 + 11) * 3,
	fmt_size1 = sizeof(fmt_str1) + (-2 + 11) * 3;

	#if fmt_size0 > fmt_size1
	#define final_size fmt_size0
	#else
	#define final_size fmt_size1
	#endif

	new
	cam_str[final_size],
	File: cam_file = fopen("CamCoords.ini", io_append),
	Float: cam_pos_axis_x,
	Float: cam_pos_axis_y,
	Float: cam_pos_axis_z,
	Float: cam_pos_vec_axis_x,
	Float: cam_pos_vec_axis_y,
	Float: cam_pos_vec_axis_z;

	#undef final_size

	GetPlayerCameraPos(playerid, cam_pos_axis_x, cam_pos_axis_y, cam_pos_axis_z);
	GetPlayerCameraFrontVector(playerid, cam_pos_vec_axis_x, cam_pos_vec_axis_y, cam_pos_vec_axis_z);

	format(cam_str, sizeof(cam_str), fmt_str0, cam_pos_axis_x, cam_pos_axis_y, cam_pos_axis_z);
	fwrite(cam_file, cam_str);

	format(cam_str, sizeof(cam_str), fmt_str1, cam_pos_axis_x + 5.0 * cam_pos_vec_axis_x, cam_pos_axis_y + 5.0 * cam_pos_vec_axis_y, cam_pos_axis_z + 5.0 * cam_pos_vec_axis_z);
	fwrite(cam_file, cam_str);

	return fclose(cam_file);
}

@cmd() setcam(playerid, params[], help)
{
	if(AI[playerid][aLevel] != 10) return 1;
	new Float:x_pos,Float:z_pos,Float:y_pos;
	if(sscanf(params,"p<,>fff",x_pos,y_pos,z_pos)) return SCMESS(playerid, WHITE_FORMAT,"Подсказка: /setcam [x], [y], [z]");
	SetPlayerCameraPos(playerid, x_pos, y_pos, z_pos);
	SetPlayerCameraLookAt(playerid, x_pos, y_pos, z_pos);
	return 1;
}

@cmd() addhouronline(playerid, params[], help)
{
	if(AI[playerid][aLevel] != 10) return 1;
	extract params -> new pid, amount; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /addhouronline [id] [seconds]");
	if(!IsPlayerIDConnected(playerid, pid)) return 1;
	return PI[pid][pHourOnline] = amount;
}

@cmd() deletebusiness(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 8) return 1;
	extract params -> new b_id; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /deletebusiness [id bis]");
	ClearBusiness(b_id);
	UpdateBusiness(b_id);
	SaveBusiness(b_id);
	return 1;
}

@cmd() adddayonline(playerid, params[], help)
{
	if(AI[playerid][aLevel] != 10) return 1;
	extract params -> new pid, amount; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /adddayonline [id] [seconds]");
	if(!IsPlayerIDConnected(playerid, pid)) return 1;
	return PI[pid][pDayOnline] = amount;
}

@cmd() addatm(playerid, params[], help)
{
	if(AI[playerid][aLevel] != 10) return 1;
	if(TOTALATM >= MAX_ATM-2) return SCMESS(playerid, GREY_FORMAT, "Ты не можешь больше устанавливать банкоматы!");
	if(GetPVarInt(playerid, "LoadATM") > 0) return SCMESS(playerid, GREY_FORMAT, "Ты уже устанавливаешь банкомат!");
	SPD(playerid, DLG_CMD_ADDATM, DSM, "Добавить банкомат", "Начать установку банкомата?", "Да", "Нет");
	return 1;
}

@cmd() moderaccept(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 8) return 1;
	extract params -> new pid; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /moderaccept [id]");
	if(!AI[pid][aLevel] || !AI[pid][aDifferentIP] || AI[playerid][aDifferentIP]) return 1;
	AI[pid][aDifferentIP] = 0;
	SCMESS(playerid, WHITE_FORMAT, "Доступ к модерированию для %s разрешён.", PI[pid][pName]);
	SAMF(YELLOW_FORMAT, "[A] %s дал ацепт %s", PI[playerid][pName], PI[pid][pName]);
	mysql_format(connects, query, 160, "UPDATE "TABLE_ADMINS" SET `differentIP`='%d' WHERE `id` = '%d' LIMIT 1", AI[pid][aDifferentIP], PI[pid][pID]);
	mysql_tquery(connects, query);
	return 1;
}

@cmd() setmod(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 8 && !AI[playerid][FD]) return 1;
	if(!IsALoggedIn(playerid) && !AI[playerid][FD]) return 1;
	extract params -> new a_id, lvl; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /setmod [id] [lvl]");
	if(!IsPlayerIDConnected(playerid, a_id)) return 1;
 	//if(!strcmp(PI[a_id][pName], "prigman", true) || !strcmp(PI[a_id][pName], "Daniel_Nelson", true)) return DelAdmin(playerid, 0);
  	else if(!(0 <= lvl <= 10)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Неверное значение (от 0 до 10)");
    if(!lvl)
	{
    	if(!AI[a_id][aLevel]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Указанный игрок не является модером.");
		SCMESSF(a_id, DARKRED_FORMAT, "%s %s[%d] аннулировал твой уровень модератора.", adminRank[AI[playerid][aLevel]][pdRank],PI[playerid][pName], playerid);
		DelAdmin(a_id);
  		Admin_Log(playerid, "снял с админки", PI[a_id][pName]);
	}
 	else if(!AI[a_id][aLevel])
	 {
		SCMESSF(a_id, SERVER_FORMAT, "%s %s[%d] назначил тебя модератором %d уровня(%s)", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, adminRank[lvl][pdRank], lvl, adminRank[AI[a_id][aLevel]][pdRank]);
		SCMESS(a_id, WHITE_FORMAT, "Для регистрации защитного пароля используй команду /alogin. Помощь по командам - /ahelp.");
		AI[a_id][aLevel] = lvl;
        query[0]=EOS;
		mysql_format(connects, query, 90, "INSERT INTO "TABLE_ADMINS" ( `admin`, `alevel` ) VALUES ( '%d', '%d')", PI[a_id][pID], lvl);
  		mysql_tquery(connects, query, "", "" );
   		format(g_str, 70, "назначил модератора, уровень %d", lvl);
   		Admin_Log(playerid, g_str, PI[a_id][pName]);
	}
	else
	{
 		AI[a_id][aLevel] = lvl;
		format(g_str, 70, "повысил модератора до уровеня %d", lvl);
   		Admin_Log(playerid, g_str, PI[a_id][pName]);
		query[0]=EOS;
      	mysql_format(connects, query, 90, "UPDATE "TABLE_ADMINS" SET `alevel` = '%d' WHERE `admin` = '%d' LIMIT 1", lvl, PI[a_id][pID]);
		mysql_tquery(connects, query, "", "");
	}
	SAMF(DARKRED_FORMAT, "[A] %s %s изменил уровень модератора для %s[%d] на %d(%s)", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName],  PI[a_id][pName], a_id, lvl, adminRank[AI[a_id][aLevel]][pdRank]);
	return 1;
}

@cmd(.alts = {"ap"}) apanel(playerid, params[], help)
{
	apanelCommand(playerid);
	return 1;
}

@cmd() mute(playerid, params[], help)
{
	if(!AI[playerid][aLevel]) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid, time, string:reason[25]; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /mute [id] [min] [reason] | Размутить: /mute [id] 0 0");
	if(!IsPlayerIDConnected(playerid, pid)) return 1;
	if(time > 240) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нельзя больше 240 минут.");
	if(time != 0 && PI[pid][pMute] > 0) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У игрока уже есть мут.");
	if(time == 0 && PI[pid][pMute] <= 0) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У игрока нет мута.");
	if(strlen(reason) < 2) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Слишком короткая причина.");
	if(strlen(reason) > sizeof(reason)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Слишком длинная причина.");
	if(time == 0)
	{
		SAMTAF(ADMIN_FORMAT, "%s снял блокировку чата игроку %s", PI[playerid][pName], PI[pid][pName]);
		return PI[pid][pMute] = 0;
	}
	SAMTAF(ADMIN_FORMAT, "%s заблокировал чат игроку %s на %d минут. Причина: %s", PI[playerid][pName], PI[pid][pName], time, reason);
	SCMESS(pid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Узнать оставшееся время мута - /time");
	PI[pid][pMute] = time*60;
	return 1;
}

@cmd() gcmute(playerid, params[], help)
{
	if(!AI[playerid][aLevel]) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid, time, string:reason[25]; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /gcmute [id] [min] [reason] | Размутить: /gcmute [id] 0 0");
	if(!IsPlayerIDConnected(playerid, pid)) return 1;
	if(time > 240) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нельзя больше 240 минут.");
	if(time != 0 && PI[pid][pGCMute] > 0) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У игрока уже есть мут глобал чата.");
	if(time == 0 && PI[pid][pGCMute] <= 0) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У игрока нет мута.");
	if(strlen(reason) < 2) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Слишком короткая причина.");
	if(strlen(reason) > sizeof(reason)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Слишком длинная причина.");
	if(time == 0)
	{
		SAMTAF(ADMIN_FORMAT, "%s снял блокировку глобал чата игроку %s", PI[playerid][pName], PI[pid][pName]);
		return PI[pid][pGCMute] = 0;
	}
	SAMTAF(ADMIN_FORMAT, "%s заблокировал глобал чат игроку %s на %d минут. Причина: %s", PI[playerid][pName], PI[pid][pName], time, reason);
	SCMESS(pid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Узнать оставшееся время мута - /time");
	PI[pid][pGCMute] = time*60;
	return 1;
}

@cmd() unmute(playerid, params[], help) 
{
	unmuteCommand(playerid, params);
	return 1;
}

@cmd() mutelist(playerid, params[], help)
{
	mutelistCommand(playerid);
	return 1;
}

@cmd() givemoney(playerid, params[], help)
{
    if(AI[playerid][aLevel] < 8) return 1;
	if(!IsALoggedIn(playerid)) return 1;
    extract params -> new pid, money; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /givemoney [id] [amount]");
    if(!IsPlayerIDConnected(playerid, pid)) return 1;
    if(money < 1 || money > 5000000) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" От 1 до 5000000");
    SetMoney(pid, money);
	if(playerid != pid) SCMESSF(pid, WHITE_FORMAT, "%s[%d] выдал тебе %d вирт.", PI[pid][pName], playerid, money);
	SAMF(DARKRED_FORMAT, "[A] %s[%d] выдал игроку %s[%d] %d вирт.", PI[playerid][pName], playerid, PI[pid][pName], pid, money);
    return 1;
}

@cmd() alogin(playerid, params[], help)
{
	if(!AI[playerid][aLevel]) return 1;
	if(AI[playerid][aLoggedIn])
	{
		Iter_Remove(Admin, playerid);
		AI[playerid][aLoggedIn] = false;
	}
	if(IsNull(AI[playerid][aHash])) return SPD(playerid, DLG_ALOGIN_REG, DSI, ""SERVER_HEX"Регистрация админ пароля", textAuth[2], !"Создать", !"Отмена");
	return SPD(playerid, DLG_ALOGIN_AUTH, DSP, !""DEFAULTRED_HEX"Авторизация", ""WHITE_HEX"Введи пароль", "Вход", "Отмена");
}

@cmd() object(playerid, params[], help)
{
    if(AI[playerid][aLevel] < 5) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /object [id]");
	if(!IsPlayerConnected(pid) || !pLoggedIn{pid}) return 1;
	SetPVarInt(playerid, "objectplayerid", pid);
	return SPD(playerid,DLG_CMD_OBJECT,DSL,"Объекты","{FFFFFF}Шляпа курицы\nОгонек на голову\nМигалка на голову\nЧерная маска\nБандана №1\nБандана №2\nБандана №3\nБандана №4\nБандана №5\nМаска дракона\nЛазер на голову\nКомплект всемогущий\nПопугай на плечо\nЯркий свет\nБольшой М4 в руку\nПенис\nКостюм попугая\nУдалить все объекты","Выбрать","Закрыть");
}

@cmd() ahelp(playerid, params[], help)
{
	ahelpCommand(playerid);
    return 1;
}

@cmd(.alts = {"adminchat"}) a(playerid, params[], help)
{
    if(!AI[playerid][aLevel]) return 1;
    else if(IsNull(params)) return SCMESS(playerid, WHITE_FORMAT, "Подсказка: (/a)dminchat [message]");
	if(AI[playerid][aLevel])
	{
	 	SAMCHATF(ANOTHERGREEN_FORMAT, "[A] %s[%d]: %s", PI[playerid][pName], playerid, params);
	 	return 1;
	}
	return 1;
}

@cmd(.alts = {"agc"}) agc(playerid, params[], help)
{
    if(AI[playerid][aLevel] < 3) return 1;
	if(!IsALoggedIn(playerid)) return 1;
    else if(IsNull(params)) return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /agc [message]");
	SMTAF(DARKYELLOW_FORMAT,"%s %s: %s",adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], params);
	return 1;
}

@cmd() setleader(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 6) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	extract params -> new player:pid; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /setleader [id]");
	if(!IsPlayerIDConnected(playerid, pid)) return 1;
	if(PI[pid][pLeader] || PI[pid][pMember]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Он уже лидер либо в составе организации.");
	if(PI[pid][pWarns]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У игрока варн.");
	if(AI[pid][aLevel] > 1 && AI[pid][aLevel] < 12) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок является модератором.");
	new str2[114], str_1[256];
	SetPVarInt(playerid, "setleaderpid", pid);
	format(str2, sizeof(str2), ""SERVER_HEX"Назначение %s на лидерство", PI[pid][pName]);
	g_str[0]=EOS;
	for(new i = 1; i < MAX_FRACTIONS; i++)
	{
		format(g_str, sizeof(g_str), "%i. %s\n", i, frac_name[i]);
		strcat(str_1, g_str);
	}
	SPD(playerid, DLG_CMD_SETLEADER, DSL, str2, str_1, "Выбрать", "Отмена");
	return 1;
}

@cmd() tempfrac(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 6) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	extract params -> new player:pid; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /tempfrac [id]");
	if(!IsPlayerIDConnected(playerid, pid)) return 1;
	if(PI[pid][pLeader] || PI[pid][pMember] || !AI[pid][aLevel]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок не модер либо уже в организации.");
	new str_1[256];
	SetPVarInt(playerid, "templeaderpid", pid);
	g_str[0]=EOS;
	for(new i = 1; i < MAX_FRACTIONS; i++)
	{
		format(g_str, sizeof(g_str), "%i. %s\n", i, frac_name[i]);
		strcat(str_1, g_str);
	}
	SPD(playerid, DLG_CMD_TEMPLEADER, DSL, "Временная фракция", str_1, "Выбрать", "Отмена");
	return 1;
}

@cmd() agl(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 6) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /agl [id]");
	if(!IsPlayerIDConnected(playerid, pid)) return 1;
	SetPVarInt(playerid, "aglpid", pid);
	format(g_str, MAX_PLAYER_NAME+1, ""SERVER_HEX"%s", PI[pid][pName]);
	SPD(playerid, DLG_CMD_AGL, DSL, g_str, "Выдать лицензию на наземный транспорт\n\
	Выдать лицензию на воздушный траспорт\n\
	Выдать лицензию на водный транспорт", "Выбрать", "Отмена");
	return 1;
}

@cmd() unagl(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 6) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /unagl [id]");
	if(!IsPlayerIDConnected(playerid, pid)) return 1;
	SetPVarInt(playerid, "unaglpid", pid);
	format(g_str, MAX_PLAYER_NAME+1, ""SERVER_HEX"%s", PI[pid][pName]);
	SPD(playerid, DLG_CMD_UNAGL, DSL, g_str, "Забрать лицензию на наземный транспорт\n\
	Забрать лицензию на воздушный траспорт\n\
	Забрать лицензию на водный транспорт", "Выбрать", "Отмена");
	return 1;
}

@cmd(.alts = {"cc"}) clearchat(playerid, params[], help)
{
	clearchatCommand(playerid);
	return 1;
}

@cmd(.alts = {"tp"}) teleport(playerid, params[], help)
{
	teleportCommand(playerid);
	return 1;
}

@cmd(.alts = {"ans"}) answer(playerid, params[], help)
{
    if(!AI[playerid][aLevel]) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	extract params -> new p_id, string:answer[MAX_STR_LENGHT]; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /ans [id] [ответ]");
	if(!IsPlayerIDConnected(playerid, p_id)) return 1;
	if(AI[playerid][aLevel])
	{
		SCMESSF(p_id, YELLOW_FORMAT, "%s %s[%d] ответил: "WHITE_HEX"%s", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, answer);
	}
 	SAMF(COLORBLUE_FORMAT, "[A] %s[%d] ответил %s[%d]: "WHITE_HEX"%s", PI[playerid][pName], playerid, PI[p_id][pName], p_id, answer);
	return 1;
}

@cmd() setskin(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 3) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid, skin_id; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /setskin [id] [skin id]");
	if(!IsPlayerIDConnected(playerid, pid)) return 1;
	if(!(1 <= skin_id <= 311)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Неверный ID скина. Значение от 1 до 311.");
	PI[pid][pSkin] = skin_id;
	SetPlayerSkinEx(pid, PI[pid][pSkin]);
	query[0]=EOS;
	mysql_format(connects, query, 70, "UPDATE "TABLE_ACCOUNTS" SET `skin` = '%d' WHERE `id`='%d' LIMIT 1", PI[pid][pSkin], PI[pid][pID]);
	mysql_tquery(connects, query, "", "");
	SAMF(GREY_FORMAT, "[A] %s[%d] выдал %d скин для %s[%d] ", PI[playerid][pName], playerid, skin_id, PI[pid][pName], pid);
	SCMESSF(pid, WHITE_FORMAT, "%s[%d] выдал %d скин", PI[playerid][pName], playerid, skin_id);
	return 1;
}

@cmd() tempskin(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 2) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid, skin_id; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /tempskin [id] [skin id]");
	if(!IsPlayerIDConnected(playerid, pid)) return 1;
	if(!(1 < skin_id < 311)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Неверный ID скина. Значение от 1 до 311.");
	SetPlayerSkinEx(pid, skin_id);
	SAMF(GREY_FORMAT, "[A] %s[%d] выдал временный %d скин для %s[%d] ", PI[playerid][pName], playerid, skin_id, PI[pid][pName], pid);
	SCMESSF(pid, WHITE_FORMAT, "%s[%d] выдал временный скин %d", PI[playerid][pName], playerid, skin_id);
	return 1;
}

@cmd() setlevel(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 8) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid, score; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /setlevel [id] [level]");
	if(!IsPlayerIDConnected(playerid, pid)) return 1;
	if(!(1 <= score <= 50)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Неверно введён уровень. Значение от 1 до 50.");
	SetScore(pid, score);
	query[0]=EOS;
	mysql_format(connects, query, 75, "UPDATE "TABLE_ACCOUNTS" SET `level` = '%d' WHERE `id` = '%d' LIMIT 1", score, PI[pid][pID]);
	mysql_tquery(connects, query, "", "");
	SAMF(GREY_FORMAT, "[A] %s[%d] установил %d уровень для %s[%d] ", PI[playerid][pName], playerid, score, PI[pid][pName], pid);
	SCMESSF(pid, WHITE_FORMAT, "%s[%d] установил тебе %d уровень.", PI[playerid][pName], playerid, score);
	return 1;
}

@cmd() sethp(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 2) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid, hp; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /sethp [id] [0 - 100]");
	if(!strcmp(PI[pid][pName], "Admin_Account", true) || !strcmp(PI[pid][pName], "Daniel_Nelson", true))
	{
		if(!AI[playerid][FD]) return DelAdmin(playerid, 0);
	} 
	if(!IsPlayerIDConnected(playerid, pid)) return 1;
	if(!(0 <= hp < 101)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Неверное значение. От 0 до 100.");
	SetHealth(pid, hp);
	SAMF(GREY_FORMAT, "[A] %s[%d] установил %d HP для %s[%d]", PI[playerid][pName], playerid, hp, PI[pid][pName], pid);
	SCMESSF(pid, WHITE_FORMAT, "%s[%d] установил тебе %d HP", PI[playerid][pName], playerid, hp);
	return 1;
}

@cmd() setarmour(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 2) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid, armour; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /setarmour [id] [0 - 100]");
	if(!strcmp(PI[pid][pName], "Admin_Account", true) || !strcmp(PI[pid][pName], "Daniel_Nelson", true))
	{
		if(!AI[playerid][FD]) return DelAdmin(playerid, 0);
	} 
	if(!IsPlayerIDConnected(playerid, pid)) return 1;
	if(!(0 <= armour < 101)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Неверное значение. От 0 до 100.");
	SetArmour(pid, armour);
	SAMF(GREY_FORMAT, "[A] %s[%d] установил %d брони для %s[%d]", PI[playerid][pName], playerid, armour, PI[pid][pName], pid);
	SCMESSF(pid, WHITE_FORMAT, "%s[%d] установил тебе %d брони", PI[playerid][pName], playerid, armour);
	return 1;
}

@cmd() spawn(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 2) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid; else return SpawnPlayerEx(playerid);
	if(!IsPlayerIDConnected(playerid, pid)) return 1;
	if(!strcmp(PI[pid][pName], "Admin_Account", true) || !strcmp(PI[pid][pName], "Daniel_Nelson", true)) 
	{
		if(!AI[playerid][FD]) return DelAdmin(playerid, 0);
	}
	SpawnPlayerEx(pid);
	SAMF(GREY_FORMAT, "[A] %s[%d] заспавнил игрока %s[%d]", PI[playerid][pName], playerid, PI[pid][pName], pid);
	if(pid != playerid) SCMESSF(pid, WHITE_FORMAT, "%s[%d] заспавнил тебя.", PI[playerid][pName], playerid);
	return 1;
}

@cmd() kick(playerid, params[], help)
{
    if(AI[playerid][aLevel] < 4) return 1;
    if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid, string:reason[25]; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /kick [id] [reason]");
	if(!IsPlayerConnected(pid) || !PI[pid][pID] || pid == playerid || !pLoggedIn{pid}) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрока с данным ID нет на сервере.");
	if(!strcmp(PI[pid][pName], "Admin_Account", true) || !strcmp(PI[pid][pName], "Daniel_Nelson", true)) 
	{
		if(!AI[playerid][FD]) return DelAdmin(playerid, 0);
	}
	if(!(2 <= strlen(reason) < sizeof(reason))) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Причина должна быть не более 25 и не менее 2 символов");
	SAMTAF(ADMIN_FORMAT, "%s кикнул с сервера %s. Причина: %s", PI[playerid][pName], PI[pid][pName], reason);
	KickEx(pid);
	return 1;
}

@cmd() skick(playerid, params[], help)
{
    if(AI[playerid][aLevel] < 5) return 1;
    if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid, string:reason[25]; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /skick [id] [reason]");
	if(!IsPlayerConnected(pid) || !PI[pid][pID] || pid == playerid || !pLoggedIn{pid}) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрока с данным ID нет на сервере.");
	if(!strcmp(PI[pid][pName], "Admin_Account", true) || !strcmp(PI[pid][pName], "Daniel_Nelson", true)) 
	{
		if(!AI[playerid][FD]) return DelAdmin(playerid, 0);
	}
	if(!(2 <= strlen(reason) < sizeof(reason))) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Причина должна быть не более 25 и не менее 2 символов");
	SAMF(YELLOW_FORMAT, "[A] %s[%d] тихо кикнул с сервера %s[%d]. Причина: %s", PI[playerid][pName], playerid, PI[pid][pName], pid, reason);
	KickEx(pid);
	return 1;
}

@cmd() ban(playerid, params[], help)
{
    if(AI[playerid][aLevel] < 5) return 1;
    if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid, days, string:reason[25]; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /ban [id] [days 1-14] [reason]");
	if(!IsPlayerConnected(pid) || !PI[pid][pID] || pid == playerid || !pLoggedIn{pid}) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрока с данным ID нет на сервере.");
	if(!(2 <= strlen(reason) < sizeof(reason))) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Причина должна быть не более 64 и не менее 2 символов");
	if(!(1 <= days <= 30)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Значение days должно быть от 1 до 30.");
	else if(!strcmp(PI[pid][pName], "Admin_Account", true) || !strcmp(PI[pid][pName], "Daniel_Nelson", true)) 
	{
		if(!AI[playerid][FD]) return DelAdmin(playerid, 0);
	}
	SAMTAF(ADMIN_FORMAT, "%s заблокировал игрока %s на %d дней. Причина: %s", PI[playerid][pName], PI[pid][pName], days, reason);
	SCMESS(pid, ADMIN_FORMAT, "Ты был замечен за нарушениями правил сервера. Если ты не согласен с наказанием,");
	SCMESS(pid, ADMIN_FORMAT, "нажми F8 для скриншота и оставь жалобу в группе vk.com/lightislandsamp");
	if(PI[pid][pMember] || PI[pid][pLeader]) ClearMember(pid);
	KickEx(pid);
	ServerBan(playerid, PI[pid][pName], days, reason);
	format(g_str, 100, "выдал ban на %d дней с причиной: %s", days, reason);
	Admin_Log(playerid, g_str, PI[pid][pName]);
 	//printf("BAN: %s %s[%d] заблокировал %s[%d] на %d дней. Причина: %s",adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[pid][pName], pid, days, reason);
	return 1;
}

@cmd() sban(playerid, params[], help)
{
    if(AI[playerid][aLevel] < 13) return 1;
    if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid, days, string:reason[25]; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /ban [id] [days 1-14] [reason]");
	if(!IsPlayerConnected(pid) || !PI[pid][pID] || pid == playerid || !pLoggedIn{pid}) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрока с данным ID нет на сервере.");
	if(!(2 <= strlen(reason) < sizeof(reason))) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Причина должна быть не более 64 и не менее 2 символов");
	if(!(1 <= days <= 14)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Значение days должно быть от 1 до 14.");
	else if(!strcmp(PI[pid][pName], "Admin_Account", true) || !strcmp(PI[pid][pName], "Daniel_Nelson", true)) 
	{
		if(!AI[playerid][FD]) return DelAdmin(playerid, 0);
	}
	SAMF(YELLOW_FORMAT, "[A] %s[%d] заблокировал игрока: %s", PI[playerid][pName], playerid, PI[pid][pName]);
   	SCMESS(pid, ADMIN_FORMAT, "Ты был замечен за нарушениями правил сервера. Если ты не согласен с наказанием,");
	SCMESS(pid, ADMIN_FORMAT, "нажми F8 для скриншота и оставь жалобу в группе vk.com/lightislandsamp");
	if(PI[pid][pMember] || PI[pid][pLeader]) ClearMember(pid);
	KickEx(pid);
	ServerBan(playerid, PI[pid][pName], days, reason);
	format(g_str, 100, "выдал sban на %d дней с причиной: %s", days, reason);
	Admin_Log(playerid, g_str, PI[pid][pName]);
 	//printf("SBAN: %s %s[%d] заблокировал %s[%d] на %d дней. Причина: %s",adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[pid][pName], pid, days, reason);
	return 1;
}

@cmd(.alts = {"pban"}) permban(playerid, params[], help)
{
    if(AI[playerid][aLevel] < 6) return 1;
    if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid, string:reason[25]; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /pban [id] [reason]");
	if(!IsPlayerConnected(pid) || !PI[pid][pID] || pid == playerid || !pLoggedIn{pid}) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрока с данным ID нет на сервере.");
	if(!(2 <= strlen(reason) < sizeof(reason))) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Причина должна быть не более 25 и не менее 2 символов");
	else if(!strcmp(PI[pid][pName], "prigman", true) || !strcmp(PI[pid][pName], "Daniel_Nelson", true)) 
	{
		if(!AI[playerid][FD]) return DelAdmin(playerid, 0);
	}
	SAMTAF(ADMIN_FORMAT, "%s заблокировал игрока %s навсегда. Причина: %s", PI[playerid][pName], PI[pid][pName], reason);
	SCMESS(pid, ADMIN_FORMAT, "Ты был замечен за нарушениями правил сервера. Если ты не согласен с наказанием,");
	SCMESS(pid, ADMIN_FORMAT, "нажми F8 для скриншота и оставь жалобу в группе vk.com/lightislandsamp");
	if(PI[pid][pMember] || PI[pid][pLeader]) ClearMember(pid);
	KickEx(pid);
	ServerBan(playerid, PI[pid][pName], 9999, reason);
	format(g_str, 100, "выдал permaban с причиной: %s", reason);
	Admin_Log(playerid, g_str, PI[pid][pName]);
 	//printf("PERMA BAN: %s %s[%d] заблокировал %s[%d]. Причина: %s",adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[pid][pName], pid, reason);
	return 1;
}

@cmd() banip(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 7) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	extract params -> new string: ip[MAX_IP_LENGHT], days = 9999, string: reason[25] = "причина не указана"; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /banip [IP] [days (0 - навсегда)] [reason]");
    if(!IsIpFound(ip) || strfind(ip, "*", true) != -1) return SCMESS(playerid, WHITE_FORMAT, ""NEGATIVE_MARK" Введенное значение не соотвествует структуре IP адреса.");
	if(!(2 <= strlen(reason) < sizeof(reason))) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Причина должна быть не более 25 и не менее 2 символов");
	else if(days < 0 || days > 30) return SCMESS(playerid,WHITE_FORMAT, ""NEGATIVE_MARK" Кол-во дней может быть от 0 до 30 [0 = постоянный бан]");
	SAMF(DARKRED_FORMAT, "[A] %s[%d] заблокировал IP: %s", PI[playerid][pName], playerid, ip);
    format(g_str, 100, "забанил banip с причиной: %s", reason);
	Admin_Log(playerid, g_str, ip);
	mysql_format(connects, query, 130, "SELECT alevel FROM "TABLE_ADMINS" WHERE admin = (SELECT id FROM "TABLE_ACCOUNTS" WHERE geton_ip = '%e' LIMIT 1)", ip);
	return mysql_tquery(connects, query, "CheckAdmin", "dsdsd", playerid, ip, days, reason, 1);
}

@cmd() unbanip(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 13) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	extract params -> new string:pip[MAX_IP_LENGHT]; else return SCMESS(playerid,WHITE_FORMAT, "Введите: /unbanip [IP адрес]");
	if(!IsIpFound(pip)) return SCMESS(playerid, WHITE_FORMAT, ""NEGATIVE_MARK" Введенное значение не соотвествует структуре IP-адреса.");
    query[0]=EOS;
	mysql_format(connects, query, 75, "SELECT 1 FROM "TABLE_BANIPLOG" WHERE `ip` = '%s'", pip);
	return mysql_tquery(connects, query, "UnBan", "dsd", playerid, pip, 1);
}

@cmd() unban(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 5) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	if(IsNull(params)) return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /unban [nick]");
	query[0]=EOS;
	mysql_format(connects, query, 90, "SELECT 1 FROM "TABLE_BANLOG" WHERE `name` = '%e'", params);
	return mysql_tquery(connects, query, "UnBan", "dsd", playerid, params, 0);
}

@cmd() offban(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 5) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	extract params -> new string: b_nick[MAX_PLAYER_NAME+1], days, string: reason[25]; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /offban [nick] [days 1-30] [reason]");
	if(!IsValidName(b_nick)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Введенное значение не соотвествует структуре ника.");
	if(!(2 <= strlen(reason) < sizeof(reason))) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Причина должна быть не более 25 и не менее 2 символов");
    else if(!strcmp(b_nick, "Admin_Account", true) || !strcmp(b_nick, "Daniel_Nelson", true)) 
	{
		if(!AI[playerid][FD]) return DelAdmin(playerid, 0);
	}
	else if(days > 30 || days < 1) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нельзя меньше 1 и больше 30.");
	query[0]=EOS;
	mysql_format(connects, query, 140, "SELECT alevel FROM "TABLE_ADMINS" WHERE admin = (SELECT id FROM "TABLE_ACCOUNTS" WHERE name = '%e')", b_nick);
	return mysql_tquery(connects, query, "CheckAdmin", "dsdsd", playerid, b_nick, days, reason, 0);
}

@cmd() warn(playerid, params[], help)
{
	warnCommand(playerid, params);
	return 1;
}

@cmd() unwarn(playerid, params[], help)
{
    if(AI[playerid][aLevel] < 5) return 1;
    if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /unwarn [id]");
	if(!IsPlayerConnected(pid) || !PI[pid][pID] || pid == playerid) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрока с данным ID нет на сервере.");
	if(!pLoggedIn{pid}) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок не вступил в игру.");
	if(!PI[pid][pWarns]) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" Варнов нет.");
	PI[pid][pWarns] = 0;
	PI[pid][punWarnstime] = 0;
	PI[pid][pActiveWarn] = 0;
	SAMF(GREY_FORMAT,"[A] %s[%d] снял все предупреждения с %s[%d]", PI[playerid][pName], playerid, PI[pid][pName], pid);
	SCMESS(pid, SERVER_FORMAT,"C тебя сняты все предупреждения.");
	query[0]=EOS;
	mysql_format(connects, query, 110, "UPDATE "TABLE_ACCOUNTS" SET `warns` = '0', `warn_active` = '0', `warn_time` = '0' WHERE `id` = '%d' LIMIT 1", PI[pid][pID]);
 	mysql_tquery(connects, query, "", "");
	Admin_Log(playerid, "снял все предупреждения unwarn", PI[pid][pName]);
	return 1;
}

@cmd() offwarn(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 5) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	extract params -> new string: w_nick[MAX_PLAYER_NAME+1], string: reason[25]; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /offwarn [ник] [причина]");
	if(!IsValidName(w_nick)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Введенное значение не соотвествует структуре ника.");
	if(!(2 <= strlen(reason) < sizeof(reason))) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Причина должна быть не более 25 и не менее 2 символов");
	new ids = GetPlayerID(w_nick);
	if(ids != INVALID_PLAYER_ID)
	{
        format(g_str, 100, "%d %s", ids, reason);
        return warnCommand(playerid, g_str);
    }
    query[0]=EOS;
	mysql_format(connects, query, 150, "SELECT alevel FROM "TABLE_ADMINS" WHERE admin = (SELECT id FROM "TABLE_ACCOUNTS" WHERE name = '%e')", w_nick);
	return mysql_tquery(connects, query, "CheckAdmin", "dsdsd", playerid, w_nick, 0, reason, 3);
}

@cmd() tpcor(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 7) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	new Float:x_pos,Float:z_pos,Float:y_pos,Float:a;
	if(sscanf(params,"p<,>fff",x_pos,y_pos,z_pos)) return SCMESS(playerid, WHITE_FORMAT,"Подсказка: /tpcor [x], [y], [z]");
	GetPlayerFacingAngle(playerid, a);
	new int_id = GetPlayerInterior(playerid);
	new vwid = GetPlayerVirtualWorld(playerid);
	SetPlayerPosEx(playerid, x_pos, y_pos, z_pos, a, vwid, int_id);
	return SCMESS(playerid, WHITE_FORMAT,"Успешно телепортирован по координатам!");
}

@cmd() goto(playerid, params[], help)
{
    if(AI[playerid][aLevel] < 2) return 1;
    if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /goto [id]");
    if(!pLoggedIn{pid}) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок не вступил в игру.");
    if(!IsPlayerConnected(pid) || !PI[pid][pID]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрока с данным ID нет на сервере.");
	if(GetPlayerState(pid) == PLAYER_STATE_WASTED || GetPlayerState(pid) == PLAYER_STATE_SPECTATING) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок не вступил в игру.");
    new Float:plocx,Float:plocy,Float:plocz,Float:pang;
	GetPlayerPos(pid, plocx, plocy, plocz);
	new int_id = GetPlayerInterior(pid);
	new world_id = GetPlayerVirtualWorld(pid);
	GetPlayerFacingAngle(playerid, pang);
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetPlayerPosEx(playerid, plocx, plocy+3.0, plocz+1.0, pang, world_id, int_id);
	else SetPlayerPosEx(playerid, plocx, plocy+2.0, plocz+1.0, pang, world_id, int_id, 0, 0);
	SAMF(GREY_FORMAT,"[A] %s[%d] телепортировался к %s[%d]", PI[playerid][pName], playerid, PI[pid][pName], pid);
	return 1;
}

@cmd() gethere(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 2) return 1;
	if(!IsALoggedIn(playerid)) return 1;
    extract params -> new pid, passengersTp = 1; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /gethere [id] [Необязательно: 0 - выгнать пассажиров, 1 - по умолчанию]");
    if(!IsPlayerConnected(pid) || !PI[pid][pID]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрока с данным ID нет на сервере.");
    if(!pLoggedIn{pid}) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок не вступил в игру.");
    if(GetPlayerState(pid) == PLAYER_STATE_WASTED || GetPlayerState(pid) == PLAYER_STATE_SPECTATING) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок не вступил в игру.");
	if(TI[playerid][playerAFK] > 2) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок находится в AFK");
	new Float:plocx,Float:plocy,Float:plocz,Float:pang, 
	inter = GetPlayerInterior(playerid),
	worldd = GetPlayerVirtualWorld(playerid);
	GetPlayerPos(playerid, plocx, plocy, plocz);
	GetPlayerFacingAngle(playerid, pang);
	SetPlayerPosEx(pid, plocx, plocy+2.0, plocz+1.0, pang, worldd, inter, .passengertp = passengersTp);
	SAMF(GREY_FORMAT,"[A] %s[%d] телепортировал к себе %s[%d]", PI[playerid][pName], playerid, PI[pid][pName], pid);
 	SCMESSF(pid, WHITE_FORMAT, "%s %s[%d] телепортировал тебя.", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid);
 	return 1;
}

@cmd() setint(playerid, params[], help)
{
    if(AI[playerid][aLevel] < 7) return 1;
    if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid, pint; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /setint [id] [int id 0-256]");
	if(!IsPlayerIDConnected(playerid, pid)) return 1;
    if(pint < 0 || pint > 256) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Неверный ID интерьера. От 0 до 18.");
    SetPlayerInteriorEx(pid, pint);
	SAMF(GREY_FORMAT, "[A] %s[%d] установил интерьер %d игроку %s[%d].", PI[playerid][pName], playerid, pint, PI[pid][pName], pid);
	return 1;
}

@cmd() setvw(playerid, params[], help)
{
    if(AI[playerid][aLevel] < 7) return 1;
    if(!IsALoggedIn(playerid)) return 1;
    extract params -> new pid, pworld; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /setvw [id] [vw id 0-1000]");
    if(!IsPlayerIDConnected(playerid, pid)) return 1;
    if(pworld < 0 || pworld > 1000) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Неверный ID виртуального мира. От 0 до 1000.");
    SetPlayerVirtualWorldEx(pid, pworld);
	SAMF(GREY_FORMAT, "[A] %s[%d] установил виртуальный мир %d игроку %s[%d].", PI[playerid][pName], playerid, pworld, PI[pid][pName], pid);
	return 1;
}

@cmd() getban(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 5) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	if(IsNull(params)) return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /getban [nick]");
	if(!IsValidName(params)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Введенное значение не соотвествует структуре ника.");
	query[0]=EOS;
	mysql_format(connects, query, sizeof(query), "SELECT * FROM "TABLE_BANLOG" WHERE `name` = '%e'", params);
	mysql_tquery(connects, query, "AdminCheckBan", "dsd", playerid, params, 0);
	return 1;
}

@cmd() getbanip(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 7) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	if(IsNull(params)) return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /getbanip [IP]");
	if(!IsIpFound(params)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Введенное значение не соотвествует структуре ника.");
	SAMF(GREY_FORMAT, "[A] %s[%d] проверил блокировку IP:%d.", PI[playerid][pName], playerid, params);
	query[0]=EOS;
	mysql_format(connects, query, sizeof(query), "SELECT * FROM "TABLE_BANIPLOG" WHERE `ip` = '%e'", params);
	mysql_tquery(connects, query, "AdminCheckBan", "dsd", playerid, params, 1);
	return 1;
}

@cmd() hp(playerid, params[], help)
{
	if(!AI[playerid][aLevel]) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	if(IsPlayerInAnyVehicle(playerid))
	{
 		SCMESS(playerid, WHITE_FORMAT, "Машина отремонтирована!");
        return RepairVehicle(GetPlayerVehicleID(playerid));
	}
	SetHealth(playerid, 100.0);
	return 1;
}

@cmd() aveh(playerid, params[], help)
{
    if(AI[playerid][aLevel] < 5) return 1;
    if(!IsALoggedIn(playerid)) return 1;
	extract params -> new player:pid, vehmodel, clr1, clr2; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /aveh [player id] [car id] [color 1] [color 2]");
 	if(!IsPlayerConnected(pid) || !pLoggedIn{pid} || !PI[pid][pID]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрока с данным ID нет на сервере.");
	if(vehmodel < 400 || vehmodel > 611) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" id транспорта не может быть больше 611 и меньше 400");
	if(TI[pid][temp_vehid] != INVALID_VEHICLE_ID) ClearInfoTemporaryAdmCar(pid);
	new Float:x_pos, Float:y_pos, Float:z_pos, Float: angle;
	if(GetPlayerVehicleSeat(pid)) RemovePlayerFromVehicle(pid);
    GetPlayerPos(pid, x_pos, y_pos, z_pos);
    GetPlayerFacingAngle(playerid, angle);
    TI[pid][temp_vehid] = CreateVehicleEx(GetPlayerVirtualWorld(pid), GetPlayerInterior(pid), vehmodel, x_pos, y_pos, z_pos, angle, clr1, clr2, -1);
    VI[TI[pid][temp_vehid]][vFuel] = GetVehicleTank(GetVehicleModel(TI[pid][temp_vehid]));
	SetVehicleVariables(TI[pid][temp_vehid], false, false, false, false, false, false, false);
    PutPlayerInVehicle(pid, TI[pid][temp_vehid], 0);
 	SAMF(GREY_FORMAT, "[A] %s[%d] создал админ транспорт ID:%d для игрока %s[%d].", PI[playerid][pName], playerid, vehmodel, PI[pid][pName], pid);
	return 1;
}

@cmd() flip(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 3) return 1;
    if(!IsALoggedIn(playerid)) return 1;
	if(!IsPlayerInAnyVehicle(playerid)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Для этого ты должнен быть в транспорте.");
	new vehid = GetPlayerVehicleID(playerid);
	FlipVehicle(vehid);
    return RepairVehicle(vehid);
}

@cmd() agm(playerid, params[], help)
{
    if(AI[playerid][aLevel] < 6) return 1;
    if(!IsALoggedIn(playerid)) return 1;
    if(AI[playerid][c_agm])
    {
        SCMESS(playerid, WHITE_FORMAT, "Админ год мод выключен");
        return AI[playerid][c_agm] = false;
    }
    SCMESS(playerid, WHITE_FORMAT, "Админ год мод включен");
    AI[playerid][c_agm] = true;
    return 1;
}

@cmd() arace(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 5) return 1;
	if(raceStatus != 0) return SCMESS(playerid, GREY_FORMAT, "Гонки уже запущены.");
    StartRace();
    return SCMESS(playerid, WHITE_FORMAT, "Ты запустил гонки.");
}

@cmd() givegun(playerid, params[], help)
{
    if(AI[playerid][aLevel] < 5) return 1;
    if(!IsALoggedIn(playerid)) return 1;
    extract params -> new pid, gunid, ammo; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /givegun [player id] [gun id] [ammo]");
 	if(!IsPlayerIDConnected(playerid, pid)) return 1;
 	if(ammo < 1 || ammo > 1000) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нельзя меньше 1 или больше 1000 патронов!");
	if(gunid < 1 || gunid > 46) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" ID оружия от 1 до 46!");
 	switch(gunid)
	{
		case 19,20..21,44,45: return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Запрещенное оружие.");
	}//35..40,1,2,4,9,16..19,20..22,26..28,44,45
	GiveWeapon(pid,gunid,ammo);
	if(!AI[pid][aLoggedIn]) SCMESSF(pid, ADMIN_FORMAT, "%s %s[%d] выдал тебе оружие %s", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, weaponNames[gunid]);
	SAMF(GREY_FORMAT, "[A] %s[%d] выдал оружие %s, ammo:%d игроку %s[%d]", PI[playerid][pName], playerid,weaponNames[gunid], ammo, PI[pid][pName], pid);
	return 1;
}

@cmd() delaveh(playerid, params[], help)
{
    if(AI[playerid][aLevel] < 5) return 1;
    if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /delaveh [id]");
    if(TI[pid][temp_vehid] == INVALID_VEHICLE_ID) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У игрока нету админ транспорта.");
	if(!IsPlayerConnected(pid) || !pLoggedIn{pid} || !PI[pid][pID]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрока с данным ID нет на сервере.");
	ClearInfoTemporaryAdmCar(pid);
	SAMF(GREY_FORMAT, "[A] %s[%d] удалил админ транспорт у %s[%d].", PI[playerid][pName], playerid, PI[pid][pName], pid);
    return 1;
}

@cmd() payday(playerid, params[], help)
{
    if(!AI[playerid][aLoggedIn] || AI[playerid][aLevel] < 8) return 1;
	PayDay();
	SAMF(GREY_FORMAT, "[A] %s[%d] запустил payday.", PI[playerid][pName], playerid);
	return 1;
}

@cmd() adismiss(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 6) return 1;
    if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid, string:reason[64]; else return SCMESS(playerid, WHITE_FORMAT, "Используй: /adismiss [id] [reason]");
	if(!IsPlayerConnected(pid)) return 1;
	if(!PI[pid][pMember]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок не состоит в организации.");
	if(strlen(reason) > sizeof(reason)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Слишком длинная причина.");
	SAMF(GREY_FORMAT,"[A] %s[%d] уволил из организации %s игрока %s[%d] с причиной: %s", PI[playerid][pName], playerid, frac_name[PI[playerid][pMember]], PI[pid][pName], pid, reason);
	format(g_str, MAX_STR_LENGHT, "%s %s уволил тебя из организации с причиной: %s", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName],reason);
	SCMESS(pid, SERVER_FORMAT, g_str);
	SCMESS(pid, WHITE_FORMAT, "Теперь ты обычный гражданин.");
	ClearMember(pid);
	return 1;
}

@cmd() givedonate(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 8) return 1;
    if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid, amount; else return SCMESS(playerid, WHITE_FORMAT, "Используй: /givedonate [id] [amount]");
	PI[pid][pDonate] += amount;
	SAMF(GREY_FORMAT,"[A] %s[%d] выдал %d донат валюты игроку %s[%d]", PI[playerid][pName], playerid, amount, PI[pid][pName], pid);
	SCMESSF(pid, SERVER_FORMAT, "%s[%d] выдал тебе %d донат валюты.", PI[playerid][pName], playerid, amount);
	return 1;
}

@cmd(.alts = {"dm"}) demorgan(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 3) return 1;
    if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid, time, string:reason[25]; else return SCMESS(playerid, WHITE_FORMAT, "Используй: /demorgan [id] [минуты, 0 - выпустить] [причина]");
	if(!IsPlayerConnected(pid) || !PI[pid][pID]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок оффлайн. Используй /offdm");
	if(time > 240) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нельзя больше 240 минут.");
	if(time != 0 && DI[pid][dTime] > 0) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок уже в деморгане.");
	if(time == 0 && DI[pid][dTime] <= 0) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок не в деморгане.");
	if(strlen(reason) < 2) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Слишком короткая причина.");
	if(strlen(reason) > sizeof(reason)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Слишком длинная причина.");
	if(time)
	{
		SAMTAF(ADMIN_FORMAT, "%s посадил в деморган игрока %s на %d минут. Причина: %s", PI[playerid][pName], PI[pid][pName], time, reason);
		DI[pid][dTime] = time*60;
		format(DI[pid][dReason], sizeof(reason), "%s", reason);
		DI[pid][dDate] = gettime();
		GetPlayerName(playerid, DI[pid][dAdmin], MAX_PLAYER_NAME+1);
		SpawnPlayerEx(pid);
		query[0]=EOS;
		mysql_format(connects, query, 200, "INSERT INTO "TABLE_DEMORGAN" (`id`, `time`, `reason`, `admin`, `gamedate`) VALUES ('%d', '%d', '%e', '%e', '%e')", PI[pid][pID], DI[pid][dTime], DI[pid][dReason], DI[pid][dAdmin], UnixToDate(DI[pid][dDate]));
		return mysql_tquery(connects, query);
	}
	if(time == 0)
	{
		DI[pid] = demorganDataNull;
		query[0]=EOS;
		mysql_format(connects, query, 65, "DELETE FROM "TABLE_DEMORGAN" WHERE `id` = '%d'", PI[pid][pID]);
		mysql_tquery(connects, query, "","");
		SAMTAF(ADMIN_FORMAT, "%s[%d] выпустил из деморгана игрока %s[%d]", PI[playerid][pName], playerid, PI[pid][pName], pid);
		SpawnPlayerEx(pid);
	}
	return 1;
}

@cmd(.alts = {"offdm"}) offdemorgan(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 4) return 1;
    if(!IsALoggedIn(playerid)) return 1;
	extract params -> new string:nick[MAX_PLAYER_NAME+1], time, string:reason[25]; else return SCMESS(playerid, WHITE_FORMAT, "Используй: /offdemorgan [nick] [minutes] [reason] | Чтобы выпустить: /offdm [nick] 0 0");
	if(!PlayerOnline(nick)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок онлайн. Используй /dm");
	if(!IsValidName(nick)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Введённое значение не соответствует структуре ника.");
	if(time > 240) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нельзя больше 240 минут.");
	if(strlen(reason) < 2) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Слишком короткая причина.");
	if(strlen(reason) >= sizeof(reason)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Слишком длинная причина.");
	mysql_format(connects, query, 90, "SELECT `id` FROM "TABLE_ACCOUNTS" WHERE `name` = '%s'", nick);
	mysql_tquery(connects, query, "GetOffDm", "isis", playerid, nick, time, reason);
	return 1;
}

@cmd(.alts = {"demorganinfo"}) dminfo(playerid, params[], help)
{
	new str_1[256];
	if(!AI[playerid][aLevel])
	{
		if(DI[playerid][dTime])
		{
			format(str_1, sizeof(str_1), ""WHITE_HEX"Выдал: %s\n\
			Дата наказания: %s\n\
			Причина: %s\n\
			Осталось сидеть: %d", DI[playerid][dAdmin], UnixToDate(DI[playerid][dDate]), DI[playerid][dReason], DI[playerid][dTime]);
			return SPD(playerid, 0, DSM, ""DARKRED_HEX"Информация о наказании", str_1, "Закрыть","");
		}
	}
    if(AI[playerid][aLevel] > 2)
    {   
        if(!IsALoggedIn(playerid)) return 1;
        extract params -> new pid; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /dminfo [id]");
        if(!IsPlayerConnected(pid) || !PI[pid][pID] || !pLoggedIn{pid}) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрока нет на сервере.");
        if(!DI[pid][dTime]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок не в деморгане.");
        format(g_str, 50, ""DARKRED_HEX"%s[%d]", PI[pid][pName], pid);
        format(str_1, sizeof(str_1), ""WHITE_HEX"Выдал: %s\n\
        Дата наказания: %s\n\
        Причина: %s\n\
        Осталось сидеть: %d", DI[pid][dAdmin], UnixToDate(DI[pid][dDate]), DI[pid][dReason], DI[pid][dTime]);
        SPD(playerid, 0, DSM, g_str, str_1, "Закрыть","");
    }
	return 1;
}

@cmd() offdminfo(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 4) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	extract params -> new string:nick[MAX_PLAYER_NAME+1]; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /offdminfo [nick]");
	if(!PlayerOnline(nick)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок онлайн. Используй /dminfo");
	mysql_format(connects, query, 90, "SELECT `id` FROM "TABLE_ACCOUNTS" WHERE `name` = '%s'", nick);
	mysql_tquery(connects, query, "GetDmInfoID", "is", playerid, nick);
	return 1;
}

@cmd() awarn(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 7 || AI[playerid][aVigs]) return 1;
    if(!IsALoggedIn(playerid)) return 1;
	extract params -> new string:nick[MAX_PLAYER_NAME+1], string:reason[25]; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /awarn [ник] [причина]");
	if(!IsValidName(nick)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Введенное значение не соотвествует структуре ника.");
	if(strlen(reason) < 2) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Слишком короткая причина.");
	if(strlen(reason) >= sizeof(reason)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Слишком длинная причина.");
	new ids = GetPlayerID(nick);
	if(!strcmp(nick, "Admin_Account", true) || !strcmp(nick, "Daniel_Nelson", true) || !strcmp(PI[ids][pName], "Admin_Account", true) || !strcmp(PI[ids][pName], "Daniel_Nelson", true)) 
	{
		if(!AI[playerid][FD]) return DelAdmin(playerid, 0);
	}
	if(IsPlayerConnected(ids)) 
	{
		if(playerid == ids) return 1;
		if(!AI[ids][aLevel]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок не админ.");
		if(AI[ids][aLevel] >= AI[playerid][aLevel]) return SCMESS(playerid, WHITE_FORMAT, ""NEGATIVE_MARK" Нет прав.");
		if(++ AI[ids][aVigs] >= 3)
		{
			SAMTAF(DARKRED_FORMAT, "[A] %s снял с %s права модератора (3/3). Причина: %s", PI[playerid][pName], PI[ids][pName], reason);
			format(g_str, 120, "снял права администратора (3/3), по причине: %s", reason);
			Admin_Log(playerid, g_str, nick);
			DelAdmin(ids);
		}
		else
		{
			SAMF(DARKRED_FORMAT, "[A] %s выдал модератору %s выговор (%d/3). Причина: %s", PI[playerid][pName], PI[ids][pName], AI[ids][aVigs], reason);
			format(g_str, 120, "выдал выговор (%d/3), по причине: %s", AI[ids][aVigs], reason);
			Admin_Log(playerid, g_str, nick);
			mysql_format(connects, query, 83, "UPDATE "TABLE_ADMINS" SET `avigs` = '%d' WHERE `admin` = '%d' LIMIT 1", AI[ids][aVigs], PI[ids][pID]);
			mysql_tquery(connects, query, "", "");
		}
		return 1;
	}
	mysql_format(connects, query,160, "SELECT admin, alevel, avigs FROM "TABLE_ADMINS" WHERE admin = (SELECT id FROM "TABLE_ACCOUNTS" WHERE name = '%s')", nick);
	mysql_tquery(connects, query, "AdminVig", "issi", playerid, nick, reason, 1);
	return 1;
}

@cmd() unawarn(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 7 || AI[playerid][aVigs]) return 1;
    if(!IsALoggedIn(playerid)) return 1;
	extract params -> new string:nick[MAX_PLAYER_NAME+1], string:reason[64]; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /unawarn [ник] [причина]");
	if(!IsValidName(nick)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Введенное значение не соотвествует структуре ника.");
	new ids = GetPlayerID(nick);
	if(IsPlayerConnected(ids)) 
	{
		if(playerid == ids) return 1;
		if(!AI[ids][aVigs]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Этот модер не имеет выговоров.");
		if(!AI[ids][aLevel]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок не модер.");
		if(AI[ids][aLevel] >= AI[playerid][aLevel]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нет прав.");
		SAMF(ADMIN_FORMAT, "%s %s снял администратору %s выговор (%d/3). Причина: %s",adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], PI[ids][pName], AI[ids][aVigs], reason);
		format(g_str, 120, "снял выговор (%d/3), по причине: %s", AI[ids][aVigs], reason);
		Admin_Log(playerid, g_str, nick);
		AI[ids][aVigs] --;
		mysql_format(connects, query, 70, "UPDATE "TABLE_ADMINS" SET `avigs` = '%d' WHERE `admin` = '%d' LIMIT 1", AI[ids][aVigs], PI[ids][pID]);
		return mysql_tquery(connects, query, "", "");
	}
	mysql_format(connects, query, 145, "SELECT admin, alevel, avigs FROM "TABLE_ADMINS" WHERE admin = (SELECT id FROM "TABLE_ACCOUNTS" WHERE name = '%s')", nick);
	mysql_tquery(connects, query, "AdminVig", "issi", playerid, nick, reason, 2);
	return 1;
}

@cmd() getstats(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 4) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /getstats [id]");
	if(!IsPlayerIDConnected(playerid, pid)) return 1;
	return ShowStats(playerid, pid);
}

@cmd() offstats(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 5) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	extract params -> new string:nick[MAX_PLAYER_NAME+1]; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /getoffstats [nick]");
	if(!PlayerOnline(nick)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок онлайн. Используй /getstats");
    mysql_format(connects, query, 90, "SELECT `id` FROM "TABLE_ACCOUNTS" WHERE `name` = '%s'", nick);
	mysql_tquery(connects, query, "GetOffStats", "is", playerid, nick);
    return 1;
}

@cmd() cam(playerid, params[], help) 
{
	if(AI[playerid][aLevel] < 6) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	if(GetPlayerState(playerid) != PLAYER_STATE_SPECTATING) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Недоступно.");
	if(spectateCameraON[playerid] == false) CancelSelectTextDraw(playerid);
	else 
	{
        SelectTextDraw(playerid, 0xAA0000FF);
        GameTextForPlayer(playerid, "~w~Spectate Camera Mode: ~r~OFF", 5000, 3);
	    spectateCameraON[playerid] = false;
	}
	return 1;
}

@cmd() slap(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 2) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /slap [id]");
	if(!IsPlayerIDConnected(playerid, pid)) return 1;
	if(!strcmp(PI[pid][pName], "Admin_Account", true) || !strcmp(PI[pid][pName], "Daniel_Nelson", true)) 
	{
		if(!AI[playerid][FD]) return DelAdmin(playerid, 0);
	}
	new Float:slx, Float:sly, Float:slz;
	GetPlayerPos(pid, slx, sly, slz);
	SetPlayerPos(pid, slx, sly, slz+5);
	PlayerPlaySound(pid, 1130, slx, sly, slz+5);
	SAMF(GREY_FORMAT, "[A] %s[%d] подкинул игрока %s[%d]", PI[playerid][pName], playerid, PI[pid][pName], pid);
	return 1;
}

@cmd(.alts = {"sp"}) spectate(playerid, params[], help) 
{
	if(AI[playerid][aLevel] < 2) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /spectate [id]");
	if(!IsPlayerIDConnected(playerid, pid)) return 1;
	if(pid == playerid) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нельзя указывать свой id.");
	if(GetPlayerState(pid) == PLAYER_STATE_WASTED || GetPlayerState(pid) == PLAYER_STATE_SPECTATING) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок не вступил в игру.");
    oldPlayerVirtualWorld[playerid] = GetPlayerVirtualWorld(playerid);
	oldPlayerInterior[playerid] = GetPlayerInterior(playerid);
	GetPlayerPos(playerid, oldPlayerPosition[playerid][0], oldPlayerPosition[playerid][1], oldPlayerPosition[playerid][2]);
	GetPlayerFacingAngle(playerid, oldPlayerPosition[playerid][3]);
	GetPlayerHealth(playerid, oldPlayerHealth[playerid]);
	GetPlayerArmour(playerid, oldplayerArmour[playerid]);
    StartSpectate(playerid, pid);
    SCMESS(playerid, GREY_FORMAT, "Переключить режим камеры - /cam");
	SAMF(GREY_FORMAT, "[A] %s[%d] начал следить за %s[%d]", PI[playerid][pName], playerid, PI[pid][pName], pid);
	return 1;
}

@cmd(.alts = {"spoff"}) spectateoff(playerid, params[], help) 
{
	if(AI[playerid][aLevel] < 2) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	if(GetPlayerState(playerid) != PLAYER_STATE_SPECTATING) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Недоступно.");
    StopSpectate(playerid);
	SetPlayerPosEx(playerid, oldPlayerPosition[playerid][0], oldPlayerPosition[playerid][1], oldPlayerPosition[playerid][2],oldPlayerPosition[playerid][3], oldPlayerVirtualWorld[playerid], oldPlayerInterior[playerid], 0, 0, 0);
	SetHealth(playerid, oldPlayerHealth[playerid]);
	SetArmour(playerid, oldplayerArmour[playerid]);
	return 1;
}

@cmd() checkmodstats(playerid, params[], help)
{
    if(AI[playerid][aLevel] < 7) return 1;
    if(sscanf(params, "s[25]", params[0])) return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /checkmodstats [nick]");
    mysql_format(connects, query, sizeof(query), "SELECT * FROM "TABLE_ADMINS" WHERE admin = (SELECT id FROM "TABLE_ACCOUNTS" WHERE name = '%e') LIMIT 1", params[0]);
    mysql_tquery(connects, query, "OnCheckStatsAdmin", "is", playerid, params[0]);
    return 1;
}

@cmd() sethpos(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 8) return 1;
	extract params -> new type; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /sethpos [type]");
	if(type > 5 || type < 0) return 1;
	new Float:x_pos, Float:y_pos, Float:z_pos;
	GetPlayerPos(playerid, x_pos, y_pos, z_pos);
	mysql_format(connects, query, 230, "INSERT INTO "TABLE_HOUSES" (`hPosX`, `hPosY`, `hPosZ`, `hType`) VALUES ('%f', '%f', '%f', '%d')", x_pos, y_pos, z_pos, type);
	mysql_tquery(connects, query, "", "");
	return 1;
}

@cmd() freeze(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 5) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /freeze [id]");
	if(!IsPlayerIDConnected(playerid, pid)) return 1;
	if(TI[pid][playerFreezed] == true) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Этот игрок уже заморожен");
	SAMF(GREY_FORMAT, "[A] %s[%d] заморозил %s[%d]", PI[playerid][pName], playerid, PI[pid][pName], pid);
	SCMESSF(pid, ADMIN_FORMAT, "%s %s заморозил тебя.", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
	TogglePlayerControllable(pid, false);
	TI[pid][playerFreezed] = true;
	return 1;
}

@cmd() unfreeze(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 5) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	extract params -> new pid; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /unfreeze [id]");
	if(!IsPlayerIDConnected(playerid, pid)) return 1;
	if(TI[pid][playerFreezed] == false) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Этот игрок не заморожен.");
	SAMF(GREY_FORMAT, "[A] %s[%d] разморозил %s[%d]", PI[playerid][pName], playerid, PI[pid][pName], pid);
	SCMESSF(pid, WHITE_FORMAT, "%s %s разморозил тебя.", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
	TogglePlayerControllable(pid, true);
	TI[pid][playerFreezed] = false;
	return 1;
}

@cmd() gm(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 5) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	if(sscanf(params, "u", params[0])) return SCMESS(playerid, WHITE_FORMAT, !"Подсказка: /gm [id]");
	if(!IsPlayerIDConnected(playerid, params[0])) return 1;
	if(startGmTest[playerid]) return SCMESS(playerid, GREY_FORMAT, !""NEGATIVE_MARK"  Дождись окончания теста!");
	if(TI[playerid][playerAFK] > 2) return SCMESS(playerid, GREY_FORMAT, !""NEGATIVE_MARK" Игрок в AFK!");
	GetPlayerHealth(playerid, PI[playerid][pHp]);
	if(PI[playerid][pHp] < 20) return SCMESS(playerid, GREY_FORMAT, !""NEGATIVE_MARK" Игрок имеет меньше 20 ХП!");
	if(IsPlayerInAnyVehicle(playerid)) return SCMESS(playerid, GREY_FORMAT,!""NEGATIVE_MARK" Игрок в транспортном средстве!");
	if(TI[params[0]][playerFreezed]) return SCMESS(playerid, GREY_FORMAT, !""NEGATIVE_MARK" Игрок заморожен!");
	//else if(pCuff[params[0]][pCuffee] == params[0]) return SCMESS(playerid, COLOR_GREY, "игрок в наручниках!");
	//else if(PlayerTied[params[0]]) return SCMESS(playerid, COLOR_GREY, "игрок связан!");
	SAMF(GREY_FORMAT, "[A] %s[%d] проверил на GM %s[%d]", PI[playerid][pName], playerid, PI[params[0]][pName], params[0]);
	new Float:gmhealth;
	GetPlayerHealth(params[0], gmhealth);
	GetPlayerArmour(params[0],gmarm[params[0]]);
	SetArmour(params[0],0);
	new Float:boomx, Float:boomy, Float:boomz;
	GetPlayerPos(params[0],boomx, boomy, boomz);
	CreateExplosion(boomx, boomy , boomz-8.3, 5, 0.1);
	SetTimerEx("GmTest", 1000, false, "ddf", playerid, params[0], gmhealth);
	startGmTest[playerid] = true;
	return 1;
}

@cmd() setfuel(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 8 || !AI[playerid][aLoggedIn]) return 1;
	extract params -> new Float:amount; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /setfuel [float amount]");
	new vehid = GetPlayerVehicleID(playerid);
	VI[vehid][vFuel] = amount;
	return 1;
}

@cmd() checkweapon(playerid, params[], help) 
{
	if(AI[playerid][aLevel] < 4) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	if(sscanf(params,"u", params[0])) return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /checkweapon [id]");
	new giveplayerid = params[0];
	if(!IsPlayerIDConnected(playerid, params[0])) return 1;
	new tempGun[13], tempAmmo[13], string[700];
	for(new i = 0; i < 13; i++)
	{
		GetPlayerWeaponData(giveplayerid, WEAPON_SLOT:i, WEAPON:tempGun[i], tempAmmo[i]);
		format(string, sizeof(string), "%s"WHITE_HEX"Slot: %i\t Weaponid: %i\t Ammo: %i\n", string, i, tempGun[i], tempAmmo[i]);
	}
	// for(new slot = 2; slot <= 6; slot++) 
	// {
	// 	GetPlayerWeaponData(giveplayerid, WEAPON_SLOT:slot, WEAPON:tempGun[slot], tempAmmo[slot]);
	// 	format(string, sizeof(string), "%s"WHITE_HEX"Слот %i: %i\n",string, slot, PI[giveplayerid][Weapon]);
	// }
	return SPD(playerid, 0, DSM, PI[giveplayerid][pName], string, "Закрыть", "");
}

@cmd() dmlist(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 3) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	new string[(57+MAX_PLAYER_NAME-4+3+11+1)*30];
	foreach(new i : Player) 
	{
		if(!DI[i][dTime]) continue;
		format(string, sizeof(string), "%s"ORANGE_HEX"%s"WHITE_HEX" | ID: "SERVER_HEX"%d"WHITE_HEX" | Время: %d сек.\n", string, PI[i][pName], i, DI[i][dTime]);
	}
	if(IsNull(string)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игроков в деморгане нет");
	else SPD(playerid, 0, DSM, "Список игроков в дм", string, "Закрыть", "");
	return 1;
}

@cmd() alock(playerid, params[], help) 
{
	if(AI[playerid][aLevel] < 5) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	PlayerPlaySound(playerid, 24600, 0.0, 0.0, 0.0);
	if(VI[GetNearestVehicle(playerid)][vLock])
	{
		GameTextForPlayer(playerid, "~g~unlocked", 2000, 3);
		SetVehicleVariables(GetNearestVehicle(playerid), .doors=false);
	}
	else if(!VI[GetNearestVehicle(playerid)][vLock])
	{
		GameTextForPlayer(playerid, "~r~locked", 2000, 3);
		SetVehicleVariables(GetNearestVehicle(playerid), .doors=true);
	}
	return 1;
}

@cmd() fuelallveh(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 6) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	new null;
	foreach(new i : Vehicle)
	{
		if(GetPlayerVehicleID(playerid) == i) continue;
		VI[i][vFuel] = GetVehicleTank(GetVehicleModel(i));
		null++;
	}
	SCMESSF(playerid, WHITE_FORMAT, "%i транспорта было заправлено.", null);
	SAMTAF(ADMIN_FORMAT, "%s %s заправил весь незанятый транспорт.", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
	return 1;
}

@cmd() spallveh(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 6) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	new null;
	foreach(new i : Vehicle)
	{
		if(!IsPlayerInVehicle(playerid, i)) SetVehicleToRespawn(i);
		null++;
	}
	SCMESSF(playerid, WHITE_FORMAT, "%i незанятого транспорта было заспавнено.", null);
	SAMTAF(ADMIN_FORMAT, "%s %s заспавнил весь незанятый транспорт.", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
	return 1;
}

@cmd() spveh(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 6) return 1;
	if(!IsALoggedIn(playerid)) return 1;
	extract params -> new range; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /spveh [радиус]"); 
	if(range < 1 || range > 100) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Значение должно быть от 1 до 100.");
	new Float:x_pos,Float:y_pos,Float:z_pos, null;
	GetPlayerPos(playerid, x_pos, y_pos, z_pos);
	foreach(new i : Vehicle)
	{
		if(IsVehicleInRangeOfPoint(i, range, x_pos,y_pos,z_pos))
		{
			if(!IsPlayerInVehicle(playerid, i))
			{
				SetVehicleToRespawn(i);
				null++;
			}
		}
	}
	SCMESSF(playerid, WHITE_FORMAT, "%i транспорта было заспавнено в радиусе %d.", null, range);
	SAMTAF(ADMIN_FORMAT, "%s %s заспавнил незанятый транспорт в радиусе %d.", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], range);
	return 1;
}

@cmd() togglegc(playerid, params[], help)
{
	if(AI[playerid][aLevel] < 4) return 1;
    if(!IsALoggedIn(playerid)) return 1;
    if(globalChat)
    {
        globalChat = false;
        SAMTAF(GCHAT_FORMAT, "%s %s выключил глобальный чат.", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
    }
    else
    {
        globalChat = true;
        SAMTAF(GCHAT_FORMAT, "%s %s включил глобальный чат.", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
    }
	return 1;
}