//#pragma warning disable 239
//#pragma warning disable 213
//#pragma warning disable 234
#pragma warning disable 240
//#pragma warning disable 204
//#pragma warning disable 252

#include <open.mp>

#include <plugins\crashdetect>
//#include <other\profiler>

#include <YSI-Includes\YSI_Data\y_iterate>
#include <YSI-Includes\YSI_Visual\y_commands>

#include <plugins\sscanf2>
#include <plugins\bcrypt>
#include <plugins\profiler>
//#include <plugins\Pawn.RakNet>
//#include <plugins\weapon-config>
#include <plugins\streamer>
#include <plugins\Pawn.Regex>
#include <plugins\a_mysql>

#include <scripts\time_t>
#include <scripts\map-zones>
#include <scripts\fly>


main()
{
	print("\n\nLight Island open.mp project created by @prigman\n");
}

#define SPD 	ShowPlayerDialog
#define SCMESS 	SendClientMessage
#define SMTA	SendMessageToAllLoggedPlayers
#define SAM     SendAdminMessage
#define SAMTA 	SendAdminMessageToAll
#define STM		SendTeamMessage

#define DSI 	DIALOG_STYLE_INPUT
#define DSM 	DIALOG_STYLE_MSGBOX
#define DSL 	DIALOG_STYLE_LIST
#define DSP 	DIALOG_STYLE_PASSWORD
#define DST 	DIALOG_STYLE_TABLIST
#define DSTH 	DIALOG_STYLE_TABLIST_HEADERS

#define HOUSE_COST_TYPE_0		500000
#define HOUSE_COST_TYPE_1		3000000
#define HOUSE_COST_TYPE_2		5500000
#define HOUSE_COST_TYPE_3		8000000
#define HOUSE_COST_TYPE_4		10500000
#define MAX_FRACTIONS			6
#define MAX_FRACSKINS			14
#define MAX_HOUSES				600
#define MAX_BUSINESS			50
#define CHAT_SMILE_COUNT		5
#define MAX_ATM					51
#define PRODS_PRICE				20
#define MAX_PASSWORD_LENGHT 	22
#define MIN_PASSWORD_LENGHT 	6
#define MAX_IP_LENGHT			16
#define MAX_EMAIL_LENGHT		40
#define MAX_STR_LENGHT			145
#define MAX_DATE_LENGHT			22
#define SPECTATE_TYPE_PLAYER  	0
#define SPECTATE_TYPE_VEHICLE 	1
#define BCRYPT_COST 			12
#define MAX_MINE_ROCKS			11

#define TEAM_MAYOR 		1
#define TEAM_SAPD  		2
#define TEAM_FBI   		3
#define TEAM_NEWS  		4
#define TEAM_HOSPITAL 	5

#define SERVER_NAME_FULL 		""SERVER_HEX"Light Island RPG"WHITE_HEX""
#define SERVER_NAME_SHORT 		"LIS"

#define POSITIVE_MARK  			"»" //"•"
#define NEGATIVE_MARK			"*"
#define ERROR_MARK				"[Ошибка]"
#define INFO_MARK				"[Инфо]"
#define CLUE_MARK				"[Подсказка]"
#define TooFarFromPlayer		""NEGATIVE_MARK" Игрок слишком далеко."

#define MYSQL_HOST 	"127.0.0.1"
#define MYSQL_USER  "prigman"
#define MYSQL_PASS  "prigman"
#define MYSQL_BASE  "projectdb"

#define SERVER_FORMAT 			0x0577FFFF
#define LIGHTBLUE_FORMAT		0x6AB1FFFF//0x61AFEFFF 0x6ab1ffFF 
#define DARKBLUE_FORMAT			0x8298d4FF 
#define SOFTBLUE_FORMAT			0xA8BBEBFF
#define COLORBLUE_FORMAT		0x748fb9FF
#define ADMIN_FORMAT 			0xFF6347FF
#define DEFAULTRED_FORMAT 		0xED4337FF 
#define ERROR_FORMAT			0xBE2D2DFF//0xff4848FF //#B20000 #c13a3a #891f18 #ab2920
#define BROWN_FORMAT 			0x873e23FF
#define WHITE_FORMAT 			0xFFFFFFFF
#define GREY_FORMAT     		0xAFAFAFFF
#define DARKRED_FORMAT      	0xAA3333FF 
#define DARKYELLOW_FORMAT   	0xFFD700FF 
#define YELLOW_FORMAT   		0xFFFF00FF
#define CYAN_FORMAT         	0x00FFFFFF
#define CYANLIGHT_FORMAT		0x77EBF3FF 
#define CONTRASTORANGE_FORMAT   0xFF5C00FF
#define GOLDORANGE_FORMAT		0xEEAD08FF
#define ORANGE_FORMAT			0xFF9900FF
#define LIGHTGREEN_FORMAT   	0x00FF00FF
#define ANOTHERGREEN_FORMAT		0x90e1a7FF
#define GREEN_FORMAT        	0x008040FF
#define SOFTGREEN_FORMAT		0x7AAF3BFF
#define ACTION_FORMAT			0xFAEBD7FF
#define DEPARTMENT_FORMAT 		0xF37C7CFF
#define DARKGREEN_FORAMT		0x0AD505FF

#define SERVER_HEX				"{0577FF}"//"{#2757CF}"//"{#0577FF}" 
#define LIGHTBLUE_HEX			"{6AB1FF}"//"{#61AFEF}"//"{#5EA3FF}"//"{#4D97FA}"
#define DARKBLUE_HEX			"{8298d4}"
#define SOFTBLUE_HEX			"{A8BBEB}"//"{#91C0FF}"
#define COLORBLUE_HEX			"{748fb9}"
#define ADMIN_HEX 				"{FF6347}"
#define WHITE_HEX 				"{FFFFFF}"
#define GREY_HEX				"{AFAFAF}"
#define DARKRED_HEX         	"{AA3333}"//"{#AA3333}"
#define YELLOW_HEX  			"{FFFF00}"
#define CYAN_HEX        		"{00FFFF}"
#define CYANLIGHT_HEX			"{77EBF3}"
#define CONTRASTORANGE_HEX      "{FF5C00}"
#define GOLDORANGE_HEX			"{EEAD08}"
#define ORANGE_HEX				"{FF9900}"
#define LIGHTGREEN_HEX      	"{00FF00}"
#define ANOTHERGREEN_HEX		"{90e1a7}"
#define DARKYELLOW_HEX      	"{FFD700}"
#define DEFAULTRED_HEX          "{ED4337}"
#define ERROR_HEX				"{BE2D2D}"
#define BROWN_HEX				"{873e23}"
#define GREEN_HEX        		"{008040}"
#define SOFTGREEN_HEX			"{7AAF3B}"
#define ACTION_HEX				"{FAEBD7}"
#define DARKGREEN_HEX			"{0AD505}"
#define CHATCOLOR_HEX			"{CCCC99}"

#define function:%0(%1) \
	forward %0(%1); \
	public %0(%1)

#define SendPositiveMess(%1,%2) \
	SendClientMessage(%1,CYANLIGHT_FORMAT,""POSITIVE_MARK""WHITE_HEX" "%2)

#define SendPositiveMessF(%1,%2) \
	format(g_str,MAX_STR_LENGHT,""POSITIVE_MARK""WHITE_HEX" "%2),\
	SendClientMessage(%1,CYANLIGHT_FORMAT,g_str)

#define SendNegativeMess(%1,%2) \
	SendClientMessage(%1,GREY_FORMAT,""NEGATIVE_MARK" "%2)

#define SendNegativeMessF(%1,%2) \
	format(g_str,MAX_STR_LENGHT,""NEGATIVE_MARK" "%2),\
	SendClientMessage(%1,GREY_FORMAT,g_str)

#define SendErrorMess(%1,%2) \
	SendClientMessage(%1,ERROR_FORMAT,""ERROR_MARK""WHITE_HEX" "%2)

#define SendErrorMessF(%1,%2) \
	format(g_str,MAX_STR_LENGHT,""ERROR_MARK""WHITE_HEX" "%2),\
	SendClientMessage(%1,ERROR_FORMAT,g_str)

#define SendInfoMess(%1,%2) \
	SendClientMessage(%1,YELLOW_FORMAT,""INFO_MARK""WHITE_HEX" "%2)

#define SendInfoMessF(%1,%2) \
	format(g_str,MAX_STR_LENGHT,""INFO_MARK""WHITE_HEX" "%2),\
	SendClientMessage(%1,YELLOW_FORMAT,g_str)

#define SendClueMess(%1,%2) \
	SendClientMessage(%1,GREEN_FORMAT,""CLUE_MARK""WHITE_HEX" "%2)

#define SendClueMessF(%1,%2) \
	format(g_str,MAX_STR_LENGHT,""CLUE_MARK""WHITE_HEX" "%2),\
	SendClientMessage(%1,GREEN_FORMAT,g_str)

#define SCMESSF(%1,%2,%3) \
	format(g_str,MAX_STR_LENGHT,%3),\
	SendClientMessage(%1,%2,g_str)

#define SAMF(%1,%2) \
	format(g_str,MAX_STR_LENGHT,%2),\
	SendAdminMessage(%1,g_str)

#define SAMCHATF(%1,%2) \
	format(g_str,MAX_STR_LENGHT,%2),\
	SendAdminChatMessage(%1,g_str)

#define SAMTAF(%1,%2) \
	format(g_str,MAX_STR_LENGHT,%2),\
	SendAdminMessageToAll(%1,g_str)

#define SMTAF(%1,%2) \
	format(g_str,MAX_STR_LENGHT,%2),\
	SendMessageToAllLoggedPlayers(%1,g_str)

#define GLMESSF(%1,%2) \
	format(g_str,MAX_STR_LENGHT,%2),\
	SendMessageToAllGC(%1,g_str)

#define RELEASED(%0) (((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))
#define PRESSED(%0) (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
#define FreezePlayer(%0,%1) TogglePlayerControllable(%0, false), SetTimerEx("PlayerToggle", %1, false, "i", %0)
#define IsLeapYear(%1)     ((%1 % 4 == 0 && %1 % 100 != 0) || %1 % 400 == 0)

#define ADMIN_RANK_HELPER				1
#define ADMIN_RANK_JUNIOR_MODER			2
#define ADMIN_RANK_MODER				3
#define ADMIN_RANK_SENIOR_MODER			4
#define ADMIN_RANK_JUNIOR_ADMIN			5
#define ADMIN_RANK_ADMIN				6
#define ADMIN_RANK_SPEC_ADMIN			7
#define ADMIN_RANK_CURATOR				8
#define ADMIN_RANK_SENIOR_ADMIN			9
#define ADMIN_RANK_PROJECT_ADMIN		10

#define ADMIN_RANK_MODER_FORMAT			0x00B571FF
#define ADMIN_RANK_SENIOR_MODER_FORMAT	0x00B571FF
#define ADMIN_RANK_JUNIOR_ADMIN_FORMAT	0xEEAD08FF
#define ADMIN_RANK_ADMIN_FORMAT			0xFF5C00FF
#define ADMIN_RANK_SPEC_ADMIN_FORMAT	0x77EBF3FF
#define ADMIN_RANK_CURATOR_FORMAT		0x443A91FF
#define ADMIN_RANK_SENIOR_ADMIN_FORMAT	0x2757CFFF
#define ADMIN_RANK_PROJECT_ADMIN_FORMAT	0x0577FFFF

#define ADMIN_RANK_MODER_HEX			"{00B571}"
#define ADMIN_RANK_SENIOR_MODER_HEX		"{00B571}"
#define ADMIN_RANK_JUNIOR_ADMIN_HEX		"{FF5C00}"
#define ADMIN_RANK_ADMIN_HEX			"{FF5C00}"
#define ADMIN_RANK_SPEC_ADMIN_HEX		"{00FFFF}"
#define ADMIN_RANK_CURATOR_HEX			"{443A91}"
#define ADMIN_RANK_SENIOR_ADMIN_HEX		"{2757CF}"
#define ADMIN_RANK_PROJECT_ADMIN_HEX	"{0577FF}"

// цвета чатов фракций
#define TEAM_RADIO_COLOR    	0x9A92FDFF
#define TEAM_FAM_COLOR			0x00FFFFFF

// цвета игроков format
#define PLAYER_COLOR			0xFFFFFF20
#define MAYOR_COLOR				0x0093F3AA
#define LSPD_COLOR				0x0000FFAA
#define FBI_COLOR				0x00000020
#define NEWS_COLOR 				0xFF8040AA
#define HOSPITAL_COLOR 			0xFF6F72AA

// цвета игроков hex
#define PLAYER_COLOR_CHAT		"FFFFFF"
#define MAYOR_COLOR_CHAT		"0093F3"
#define LSPD_COLOR_CHAT			"0000FF"
#define FBI_COLOR_CHAT			"000000"
#define NEWS_COLOR_CHAT 		"FF8040"
#define HOSPITAL_COLOR_CHAT 	"FF6F72"

#define RPCHAT_FORMAT_GRAD1 	0xB4B5B700
#define RPCHAT_FORMAT_GRAD2 	0xBFC0C200
#define RPCHAT_FORMAT_GRAD3 	0xCBCCCE00
#define RPCHAT_FORMAT_GRAD4 	0xD8D8D800
#define RPCHAT_FORMAT_GRAD5 	0xE3E3E300
#define RPCHAT_FORMAT_GRAD6 	0xF0F0F0FF
#define RPCMD_FORMAT     		0x045FCCFF
#define	GCHAT_FORMAT 			0xF0FFF0FF
#define DOCMD_FORMAT			0x045FCCFF
#define GOV_FORMAT				0x3F48A7FF
#define NONRP_FORMAT			0xCCCC99FF
#define	GCHAT_HEX 				"{F0FFF0}"

// mysql таблицы
#define TABLE_ACCOUNTS		"`accounts`"
#define TABLE_ADMINS		"`admins`"
#define TABLE_BANLOG		"`banlog`"
#define TABLE_BANIPLOG		"`baniplog`"
#define TABLE_MATERIALS 	"`materials`"
#define TABLE_DEMORGAN		"`demorgan`"
#define TABLE_HOUSES		"`houses`"
#define TABLE_ATM			"`atm_pos`"
#define TABLE_BUSINESS		"`business`"

enum PLAYER_DATA
{
	pID,
    pName[MAX_PLAYER_NAME+1],
	pPass[MAX_PASSWORD_LENGHT+1],
	pHash[BCRYPT_HASH_LENGTH],
	pEmail[MAX_EMAIL_LENGHT+1],
	pSkin,
	pGender,
	pLevel,
	pExp,
	pMoney,
	pAge,
	pAuthTick,
	pDonate,
	pTempPayment,
	Float:pHp,
	Float:pArmour,
	// personal vehicle system
	Float:pVehX,
	Float:pVehY,
	Float:pVehZ,
	Float:pVehA,
	Float:pVehFuel,
	Float:pVehHP,
	pVehModel,
	pVehID,
	pVehColorP, // primary vehicle colour
	pVehColorS, // secondary vehicle colour
	pEngine,
	//
	isEmail,
	pIP[MAX_IP_LENGHT],
	pRegIp[MAX_IP_LENGHT],
	pGetonIP[MAX_IP_LENGHT],
	pRegDate[MAX_DATE_LENGHT],
	pGetonDate[MAX_DATE_LENGHT],
	pRifleSling,
	pHolster,
	pShowGun,
	pBankCard,
	Cache:Cache_ID,
	pWarns,
	pActiveWarn,
	punWarnstime,
	pLeader,
	pModel,
	pMember,
	pRank,
	pUseGPS,
	pVigs,
	pDuty,
	pDutyTimer,
	Weapon[13],
	pWeaponsDB[64],
	Ammo[13],
	pAmmoDB[64],
	pMedics,
	pIdCard,
	pIdNumber,
	pIdSeria,
	pAdminMess,
	pGchatMess,
	pZakon,
	pMute,
	pGCMute,
	pHourOnline,
	pAllOnline,
	pDayOnline,
	pAFKDayTime,
	pTimer,
	pInt,
	pVW,
	pHouse,
	pBusiness,
	pVehs,
	pHeal,
	pMats,
	pLicCar,
	pLicBoat,
	pLicPlane,
	pDrugs,
	pPhone,
	pPhoneNum,
	pPhoneBook,
	pBook,
	pBank,
	pLockpick,
	pRope,
	pMask,
	pGPS,
	//
	pDefaultPickaxe,
	pRawMaterials
};
new PI[MAX_PLAYERS][PLAYER_DATA],
	pLoggedIn[MAX_PLAYERS char];
new const playerDataNull[PLAYER_DATA];

enum MATERIALS_DATA
{
	mMayor,
	mLSPD,
	mFBI,
	mNews
};
new materials[MATERIALS_DATA];

enum ADMIN_DATA
{
	bool:aLoggedIn,
	aHash[BCRYPT_HASH_LENGTH],
	aLevel,
	FD,
	aVigs,
	bool:c_agm,
	aOnlineDay,
	aOnlineMonday,
	aOnlineTuesday,
	aOnlineWednesday,
	aOnlineThursday,
	aOnlineFriday,
	aOnlineSaturday,
	aOnlineSunday,
	aDifferentIP
};
new AI[MAX_PLAYERS][ADMIN_DATA],
	Iterator:Admin<MAX_PLAYERS>;
new const adminDataNull[ADMIN_DATA];
	
enum PREFIXES_DATA 
{
	pdRank[22],
    pdColor[9]
};

enum DEMORGAN_DATA
{
	dID,
	dReason[64],
	dTime,
	dAdmin[MAX_PLAYER_NAME+1],
	dDate
};
new DI[MAX_PLAYERS][DEMORGAN_DATA];
new const demorganDataNull[DEMORGAN_DATA];

enum VEHICLE_DATA
{
	Float:vX,
	Float:vY,
	Float:vZ,
	Float:vA,
	bool:vEngine,
	bool:vLights,
	bool:vLock,
	bool:vAlarm,
	bool:vBoot,
	bool:vBonnet,
	bool:vObjective,
	Float:vFuel,
	vFuelTimer,
	vUnEngine
};
new VI[MAX_VEHICLES][VEHICLE_DATA];

enum
{
    DLG_NONE,
	DLG_FIRST_CONNECT_INFO,
	DLG_FIRST_CONNECT_INFO_2,
	DLG_FIRST_CONNECT,
	DLG_FIRST_CONNECT_RULES,
    DLG_REGISTER,
    DLG_REG_EMAIL,
	DLG_REG_GENDER,
	DLG_LOGIN,
	DLG_MENU_SETTINGS,
	DLG_MENU_STATS,
	DLG_MENU_CMD,
	DLG_MENU_CMD_SHOW,
	DLG_MENU_REPORT,
	DLG_CMD_MN,
	DLG_CMD_GPS,
 	DLG_CMD_GPS_ITEM_1,
	DLG_CMD_GPS_ITEM_2,
	DLG_CMD_GPS_ITEM_3,
	DLG_CMD_GPS_ITEM_4,
	DLG_CMD_GPS_ITEM_5,
	DLG_CMD_GPS_ITEM_6,
	DLG_CMD_GPS_ITEM_7,
	DLG_CMD_GPS_ITEM_8,
	DLG_CMD_APANEL,
	DLG_CMD_TP,
	DLG_CMD_INVITE,
	DLG_CMD_SETLEADER,
	DLG_CMD_TEMPLEADER,
	DLG_CMD_CHANGESKIN,
	DLG_CMD_HMENU,
	DLG_CMD_BMENU,
	DLG_CMD_AGL,
	DLG_CMD_UNAGL,
	DLG_CMD_MUTELIST_PLAYER,
	DLG_CMD_MUTELIST,
	DLG_CMD_ANIMLIST,
	DLG_CMD_ADDATM,
	DLG_CMD_BUYBUSINESS,
	DLG_CMD_FILL,
	DLG_CMD_BMENU_FUEL,
	DLG_CMD_OBJECT,
	DLG_LEADERSKIN,
	DLG_TEMPLEADERSKIN,
	DLG_TP_ITEM_1,
	DLG_TP_ITEM_2,
	DLG_TP_ITEM_3,
	DLG_ALOGIN_REG,
	DLG_ALOGIN_AUTH,
	DLG_AREP,
	DLG_AREP_ITEM,
	DLG_CHANGE_EMAIL,
	DLG_ADD_EMAIL,
	DLG_IDCARD,
	DLG_IDCARD_DATE,
	DLG_IDCARD_GENDER,
	DLG_ONDUTY,
	DLG_MATERIALS_MAYOR,
	DLG_MATERIALS_LSPD,
	DLG_MATERIALS_FBI,
	DLG_MATERIALS_NEWS,
	DLG_INVITESKIN,
	DLG_RACE_REG,
	DLG_RACE_CANCEL,
	DLG_PRODSMENU,
	DLG_GETINHOUSE,
	DLG_BUYHOUSE,
	DLG_CHANGENAMEBIS,
	DLG_BANK_BUSINESS,
	DLG_CHANGEPRICEBIS,
	DLG_BUSINESS_PRODS,
	DLG_SELLBUSINESS,
	DLG_SELLBUSINESSPLAYER,
	DLG_SELLBUSINESSPLAYER_MONEY,
	DLG_SELLBUSINESSPLAYER_ACCEPT,
	DLG_SELLHOUSE,
	DLG_SELLHOUSEPLAYER,
	DLG_SELLHOUSEPLAYER_MONEY,
	DLG_SELLHOUSEPLAYER_ACCEPT,
	DLG_HOUSEUPGRADE,
	DLG_BUYSAFE,
	DLG_BUYSIGNAL,
	DLG_BUYCLOTHES,
	DLG_SAFE,
	DLG_SAFE_MONEY,
	DLG_SAFE_MONEY_GET,
	DLG_SAFE_MONEY_PUT,
	DLG_SAFE_HEAL,
	DLG_SAFE_HEAL_GET,
	DLG_SAFE_HEAL_PUT,
	DLG_SAFE_MATS,
	DLG_SAFE_MATS_GET,
	DLG_SAFE_MATS_PUT,
	DLG_SAFE_DRUGS, 
	DLG_SAFE_DRUGS_GET,
	DLG_SAFE_DRUGS_PUT,
	DLG_SAFE_DEAGLE,
	DLG_SAFE_AK47,
	DLG_SAFE_RIFLE,
	DLG_SAFE_SDPISTOL,
	DLG_SAFE_SHOTGUN,
	DLG_SAFE_M4,
	DLG_SAFE_MP5,
	DLG_BANK,
	DLG_BANK_PUT,
	DLG_BANK_GET,
	DLG_BANK_HOUSE,
	DLG_BANK_TRANSFER,
	DLG_BANK_TRANSFER_PLAYER,
	DLG_APANEL_ESTATE,
	DLG_APANEL_EXTRA,
	DLG_CHANGEINT,
	DLG_CHANGEINT_1,
	DLG_CHANGEINT_2,
	DLG_CHANGEINT_3,
	DLG_CHANGEINT_4,
	DLG_CHANGEINT_5,
	DLG_CHANGEINT_6,
	DLG_CHANGEINT_7,
	DLG_CHANGEINT_8,
	DLG_CHANGEINT_9,
	DLG_ATM,
	DLG_ATM_GET,
	DLG_BUSINESS_MONEY,
	DLG_AMMOLIST,
	DLG_AMMOLIST_AMMO,
	DLG_CHOOSESLOTCLOTHES,
	DLG_BUYCUPBOARD,
	DLG_SELECTCAR,
	DLG_MINE_ACTOR
};

enum TEMP_DATA
{
	temp_vehid,
	bool:personalVehFirst,
	bool:playerFreezed,
	changeSkinCount,
	isRefueling,
	refuelingTimer,
	selectCar,
	selectCarCount,
	playerAFK
};
new TI[MAX_PLAYERS][TEMP_DATA];
new const tempInfoNull[TEMP_DATA];

enum HOUSE_DATA
{
	hID,
	Float:hPosX,
	Float:hPosY,
	Float:hPosZ,
	Float:hEnterIntX,
	Float:hEnterIntY,
	Float:hEnterIntZ,
	Float:hCarx,
	Float:hCary,
	Float:hCarz,
	Float:hCara,
	hOwner[MAX_PLAYER_NAME+1],
	hType,
	hDice,
	hDays,
	hCost,
	hInt,
	hLock,
	hSafe,
	hMats,
	hMoney,
	hHeal,
	hDrugs,
	hDeagle,
	hAK47,
	hShotgun,
	hM4,
	hSdpistol,
	hRifle,
	hMP5,
	hSignal,
	hCupboardBought,
	hCupboard[3],
	hIcon,
	hPick
};
new HI[MAX_HOUSES][HOUSE_DATA],
	TOTALHOUSE;

enum HOUSE_TYPE_DATA 
{
	htType[15],
    htColor[8]
};

enum FRACTION_DATA
{
	fdFrac[12],
	fdColor[8]
};

enum BUSINESS_DATA
{
	bID,
	bType,
	Float:bPosX,
	Float:bPosY,
	Float:bPosZ,
	Float:bEnterIntX,
	Float:bEnterIntY,
	Float:bEnterIntZ,
	Float:bPickExitX,
	Float:bPickExitY,
	Float:bPickExitZ,
	Float:bCPposX,
	Float:bCPposY,
	Float:bCPposZ,
	Float:bFuelPosX,
	Float:bFuelPosY,
	Float:bFuelPosZ,
	Float:bDressingX,
	Float:bDressingY,
	Float:bDressingZ,
	Float:bDressingA,
	bInt,
	bName[30],
	bOwner[MAX_PLAYER_NAME+1],
	bLock,
	bDice,
	bDays,
	bProdsPrice,
	bFuelPrice,
	bProds,
	bMoney,
	bIncomeDay,
	bCost,
	bMenuPick,
	bExitPick,
	Text3D:b3DText,
	Text3D:b3DTextFuel
};
new BI[MAX_BUSINESS][BUSINESS_DATA],
	TOTALBUSINESS;

enum CHAT_SMILE_DATA
{
	smInput[5],
	smOutput_M[40],
	smOutput_F[40]
};

enum AMMO_DATA
{
    adName[20],
    adGunID,
	adCost
};

enum ATM_DATA
{
	aID,
	Float:aX,
	Float:aY,
	Float:aZ,
	Float:arX,
	Float:arY,
	Float:arZ
};
new ATMInfo[MAX_ATM][ATM_DATA],
	ATM[MAX_ATM], 
	TOTALATM,
	Text3D:LABELATM[MAX_ATM];

new MySQL:connects;

// глобальные переменные
new query[1024], g_str[512];

// регулярные
new Regex:rIP,
	Regex:rMail;
//

// таймеры
new serverTimer;
new playerAuthTimer[MAX_PLAYERS];
//

// проверки
new bool:gIsRequestClassCalled[MAX_PLAYERS], // проверка на PLAYER_STATE_SPAWNED (обход регистрации/авторизации)
	g_MysqlRaceCheck[MAX_PLAYERS]; // синхронизация сессии и клиента
//

// server doors
new hospital_door1_opened, hospital_door1_closed;
//

// server objects
new server_static_objects;

// speedometr system
new Text:textVelocimetro[5],
	PlayerText:textPlayerVelocimetro[4][MAX_PLAYERS],
	bool:playerVelocimetro[MAX_PLAYERS],
	playerVelocimetroTimer[MAX_PLAYERS];
//

// clothes shop TDE
new Text:changeskin_TD[4],
	PlayerText:changeskin_PTD[MAX_PLAYERS][1];
//

// home cupboard TDE
new PlayerText:cupboard_home_PTD[MAX_PLAYERS][6];
//

// animation TDE
new Text:animDraw;
//

// car shop TDE
new Text:chooseCar_TD[17],
	PlayerText:chooseCar_PTD[MAX_PLAYERS][5];
//

// anti-cheats
new bool:startGmTest[MAX_PLAYERS],
	Float:gmarm[MAX_PLAYERS],
 	player_shot_count[MAX_PLAYERS char],
 	aimbotWarnings[MAX_PLAYERS];
	//Float:ac_hp_health[MAX_PLAYERS],
	//Float:ac_arm_armour[MAX_PLAYERS];
//

// armed body system
static armedbody_pTick[MAX_PLAYERS];
//

//spectate system
new Iterator:spectatePlayers<MAX_PLAYERS>,
	spectateID[MAX_PLAYERS],
	spectateType[MAX_PLAYERS],
	bool:spectateCameraON[MAX_PLAYERS],
	oldPlayerVirtualWorld[MAX_PLAYERS],
	oldPlayerInterior[MAX_PLAYERS],
	Float:oldPlayerPosition[MAX_PLAYERS][4],
	Float:oldPlayerHealth[MAX_PLAYERS],
	Float:oldplayerArmour[MAX_PLAYERS],
	Text:playerInfoFrameTD[6],
	Text:playerInfoTD[7],
	Text:vehicleInfoFrameTD[2],
	Text:vehicleInfoTD[4],
	PlayerText:playerInfoPTD[MAX_PLAYERS][8],
	PlayerText:vehicleInfoPTD[MAX_PLAYERS][5];

#define BUTTON_PREVIOUS playerInfoFrameTD[1]
#define BUTTON_NEXT playerInfoFrameTD[2]
//

/* ДОБАВЛЕНИЕ НОВОЙ ФРАКЦИИ:
1. макс кол-во фракций,скинов -> фрак цвета игроков MAX_FRACTIONS
2. frac_name[MAX_FRACTIONS][26]
3. frac_rankname[MAX_FRACTIONS][15][30]
4. frac_skin[MAX_FRACTIONS][MAX_FRACSKINS]
5. SetLeaderGiveRank();
6. SetPlayerTeamColor();
7. IsAbleToInvite();
8. SetSpawnInfoEx();
9. SetPlayerSpawn();
10. IsAbleToGov
11. IsAGov, @cmd() members
*/

// pickups
new mayor_pic_enter,mayor_pic_exit,mayor_pic_enter_reception,mayor_pic_exit_reception,lspd_pic_enter,lspd_pic_exit,hospital_pic_enter,hospital_pic_exit,hospital_pic_meds,fbi_pic_enter,fbi_pic_exit,news_pic_enter,news_pic_exit_1,news_pic_exit_2,race_pic,bank_pic_enter,bank_pic_exit,recruit_pic_enter,recruit_pic_exit,auto_pic_enter,auto_pic_exit,auto_pic_select; // lspd_pic_enter_garage, lspd_pic_enter_garage
//

// server cars
new lspd_car[27], stand_cars[19];
//

// server time
new ghour = 0, gminute = 0, gsecond = 0;
//

//
new bool:globalChat;
//

// server logo
new Text:Logo[2];
//

// race system
new raceFinishPlayerID,
	racePlayerReg[MAX_PLAYERS char],
	raceVehiclePlayer[MAX_PLAYERS],
	raceMarkPlayer[MAX_PLAYERS],
	raceStatus = 0,
	raceTime = 0,
	raceReward[] = { 1500, 1000, 500 };
#define MAX_RACE_PLAYERS sizeof(raceVehiclePos)
//

static const playerExperience = 8;

// {skin id, skin price}
static const skinMen[62][2] =
{
	{66,100},{15,100},{36,100},{50,100},{95,100},{96,100},{136,100},{143,100},{155,100},{2,500},{14,500},{24,500},{58,1000},{262,1000},{241,1000},{242,1000},{7,3000},{23,3000},{33,3000},{60,5000},{67,5000},{73,5000},{184,5000},{21,7000},{22,7000},{30,7000},{183,7000},{255,7000},{17,10000},{45,10000},{82,10000},{83,10000},{185,10000},{290,10000},{291,10000},{28,12000},{29,12000},{247,12000},{248,12000},{254,12000},{249,12000},{18,15000},{19,15000},{47,15000},{48,15000},{101,15000},{299,15000},{61,20000},{121,20000},{227,20000},{228,20000},{292,20000},{293,20000},{297,20000},{122,20000},{117,35000},{118,35000},{296,40000},{295,45000},{46,50000},{208,50000},{294,50000}
};

static const skinWomen[14][2] =
{
	{192,100},{216,100},{193,200},{194,300},{11,1000},{219,1000},{93,2000},{211,2000},{233,2000},{148,3000},{169,4000},{141,5000},{76,5000},{150,5000}
};

new const ammoInfo[18][AMMO_DATA] = 
{
	{"Deagle\t\t\t",24,100},
	{"SD-Pistol\t\t",23,70},
	{"Country Rifle\t\t",33,150},
	{"ShotGun\t\t",25,130},
	{"MP5\t\t\t",29,110},
	{"AK-47\t\t\t",30,140},
	{"M4A1\t\t\t",31,140},
	{"Перцовый баллончик\t",41,40},
	{"Клюшка для гольфа\t",2,20},
	{"Бейсбольная бита\t",5,20},
	{"Лопата\t\t\t",6,20},
	{"Кий\t\t\t",7,20},
	{"Катана\t\t\t",8,20},
	{"Дилдо\t\t\t",10,20},
	{"Трость\t\t\t",15,20},
	{"Парашют\t\t",46,20},
	{"Кобура\t\t\t",100,50},
	{"Оружейный ремень\t",101,50}
};

new const BisTypesNames[][20] =
{
	{"Отсутствует"},
	{"Магазин 24/7"},
	{"АЗС"},
	{"Ammo San Andreas"},
	{"Магазин Одежды"}
};

new const adminRank[][PREFIXES_DATA] = 
{
    {"Игрок", "FFFFFF"},
	{"Хелпер", ""ADMIN_RANK_MODER_HEX""},
	{"Младший Модератор", ""ADMIN_RANK_MODER_HEX""},
	{"Модератор", ""ADMIN_RANK_MODER_HEX""},
	{"Старший Модератор", ""ADMIN_RANK_SENIOR_MODER_HEX""},
	{"Младший Администратор", ""ADMIN_RANK_ADMIN_HEX""},
	{"Администратор", ""ADMIN_RANK_ADMIN_HEX""},
	{"Спец. Администратор", ""ADMIN_RANK_SPEC_ADMIN_HEX""},
	{"Куратор", ""ADMIN_RANK_CURATOR_HEX""},
	{"Старший Администратор", ""ADMIN_RANK_SENIOR_ADMIN_HEX""},
	{"Администратор проекта", ""ADMIN_RANK_PROJECT_ADMIN_HEX""}
};

static const SI[CHAT_SMILE_COUNT][CHAT_SMILE_DATA] = 
{
	{")", "улыбается", "улыбается"},
	{"))", "смеётся", "смеётся"},
	{"(", "расстроился", "расстроилась"},
	{"((", "сильно расстроился", "сильно расстроилась"},
	{"=0", "удивился", "удивилась"}
};

// классы домов
new const house_type[][HOUSE_TYPE_DATA] =
{
	{"Эконом", "F57118"},
	{"Комфорт", "008080"},
	{"Премиум", "0080FF"},
	{"Элитный", "FF80FF"},
	{"Престиж", "FF00FF"}
};

new const frac_name[MAX_FRACTIONS][FRACTION_DATA] =
{
	{"Нет",""PLAYER_COLOR_CHAT""},
	{"Мэрия",""MAYOR_COLOR_CHAT""},
	{"SAPD",""LSPD_COLOR_CHAT""},
	{"FBI",""FBI_COLOR_CHAT""},
	{"SA News",""NEWS_COLOR_CHAT""},
	{"SA Hospital",""HOSPITAL_COLOR_CHAT""}
};

new const frac_rankname[MAX_FRACTIONS][15][30] =
{
	{"Нет","","","","","","","","","","","","","",""},
	{"","Охранник","Начальник охраны","Секретарь","Адвокат","Министр","Вице-Мэр","Мэр","","","","","","",""}, //mayor
	{"","Рядовой","Капрал","Сержант","Ст. Сержант","Мл. Лейтенант","Лейтенант","Ст. Лейтенант","Капитан","Майор","Подполковник","Полковник","Генерал полиции","",""}, //lspd
	{"","Стажёр","Младший агент","Агент","Старший агент","Специальный агент","Агент безопасности","Начальник агентуры", "Глава Академии", "Заместитель директора", "Директор", "", "", "", ""},//fbi
	{"", "Стажёр","Начинающий редактор","Светотехник","Оператор","Ведущий","Старший редактор","Заместитель директора","Директор","","","","","",""}, // news
	{"", "Стажёр","Интерн","Фельдшер","Врач-Терапевт","Врач-Инфекционист","Врач-Нарколог","Старший мед. работник","Заместитель Гл. врача","Главный врач","","","","",""}// ls hospital
};

new const frac_pay[MAX_FRACTIONS][13] = 
{
	{0,0,0,0,0,0,0,0,0,0,0,0},
	{0,3000,5000,7000,9000,15000,35000,40000,0,0,0}, // Мэрия LS
	{0,5000,7000,9000,11000,13000,15000,17000,19000,21000,22000,25000,30000}, // SAPD
	{0,10000,13000,16000,19000,22000,25000,28000,31000,34000,40000,0}, // FBI
	{0,3000,4000,5000,6000,7000,8000,10000,15000,0,0,0}, // News
	{0,3000,8000,13000,18000,23000,28000,33000,38000,43000,0,0} // ls hospital
};

new const frac_skin[MAX_FRACTIONS][MAX_FRACSKINS] = 
{
	{0}, // Гражданский
	{71,165,171,187,164,227,295,76,141,172,148,150,219}, // Мэрия
	{266,280,281,267,283,288,303,306,309}, // lspd
	{165,166,286,76,141},// fbi
	{60,98,170,188,185,221,216,93},
	{98,276,275,274,221,119,70,76,211,219}//ls hospital
};

new const serverVehicle[212][] =
{
    "Landstalker","Bravura","Buffalo","Linerunner","Perrenial","Sentinel","Dumper","Firetruck","Trashmaster","Stretch","Manana","Infernus","Voodoo","Pony","Mule","Cheetah","Ambulance","Leviathan","Moonbeam","Esperanto","Taxi","Washington","Bobcat","Mr Whoopee","BF Injection","Hunter","Premier","Enforcer","Securicar","Banshee","Predator","Bus","Rhino","Barracks","Hotknife","Trailer 1","Previon","Coach","Cabbie","Stallion","Rumpo","RC Bandit","Romero","Packer","Monster","Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer 2","Turismo","Speeder","Reefer","Tropic","Flatbed","Yankee","Caddy","Solair","Berkley's RC Van","Skimmer","PCJ-600","Faggio","Freeway","RC Baron","RC Raider","Glendale","Oceanic","Sanchez","Sparrow","Patriot","Quad","Coastguard","Dinghy","Hermes","Sabre","Rustler","ZR-350","Walton","Regina","Comet","BMX","Burrito","Camper","Marquis","Baggage","Dozer","Maverick","News Chopper","Rancher","FBI Rancher","Virgo","Greenwood","Jetmax","Hotring","Sandking","Blista Compact","Police Maverick","Boxville","Benson","Mesa","RC Goblin","Hotring Racer A","Hotring Racer B","Bloodring Banger","Rancher","Super GT","Elegant","Journey","Bike","Mountain Bike","Beagle","Cropdust","Stunt","Tanker","Roadtrain","Nebula","Majestic","Buccaneer","Shamal","Hydra","FCR-900","NRG-500","HPV1000","Cement Truck","Tow Truck","Fortune","Cadrona","FBI Truck","Willard","Forklift","Tractor","Combine","Feltzer","Remington","Slamvan","Blade","Freight","Streak","Vortex","Vincent","Bullet","Clover","Sadler","Firetruck LA","Hustler","Intruder","Primo","Cargobob","Tampa","Sunrise","Merit","Utility","Nevada","Yosemite","Windsor","Monster A","Monster B","Uranus","Jester","Sultan","Stratum","Elegy","Raindance","RC Tiger","Flash","Tahoma","Savanna","Bandito","Freight Flat","Streak Carriage","Kart","Mower","Duneride","Sweeper","Broadway","Tornado","AT-400","DFT-30","Huntley","Stafford","BF-400","Newsvan","Tug","Trailer 3","Emperor","Wayfarer","Euros","Hotdog","Club","Freight Carriage","Trailer 3","Andromada","Dodo","RC Cam","Launch","Police Car (SAPD)","Police Car (SFPD)","Police Car (LVPD)","Police Ranger","Picador","S.W.A.T. Van","Alpha","Phoenix","Glendale","Sadler","Luggage Trailer A","Luggage Trailer B","Stair Trailer","Boxville","Farm Plow","Utility Trailer"
};

// static const autoCars[69][2] =
// {
// 	{404,50000},{436,50000},{410,50000},{400,100000},{401,100000},{516,100000},{405,100000},{422,100000},{526,100000},{543,100000},{545,100000},{558,100000},{600,100000},{458,100000},{546,100000},{547,100000},{549,100000},{551,100000},{527,100000},{412,150000},{585,150000},{561,150000},{466,150000},{419,150000},{467,150000},{518,150000},{529,150000},{550,150000},{540,150000},{445,150000},{480,150000},{426,200000},{479,200000},{482,200000},{421,200000},{459,200000},{533,200000},{542,200000},{555,200000},{567,200000},{474,200000},{566,200000},{507,200000},{517,200000},{491,200000},{492,200000},{439,250000},{536,300000},{418,300000},{534,300000},{402,300000},{535,350000},{475,400000},{434,500000},{489,600000},{496,600000},{579,600000},{565,650000},{602,700000},{589,750000},{554,750000},{477,800000},{587,800000},{559,900000},{603,950000},{415,1000000},{429,1000000},{541,3000000},{451,5000000}
// };


static const registerWomenSkins[] = {12,41,65,93,192,211};

static const registerMenSkins[] = {3,21,23,119};

new const weaponNames[][] = 
{
	"Fist", // 0
	"Brass Knuckles", // 1
	"Golf Club", // 2
	"Night Stick", // 3
	"Knife", // 4
	"Baseball Bat", // 5
	"Shovel", // 6
	"Pool Cue", // 7
	"Katana", // 8
	"Chainsaw", // 9
	"Purple Dildo", // 10
	"Big White Vibrator", // 11
	"Medium White Vibrator", // 12
	"Small White Vibrator", // 13
	"Flowers", // 14
	"Cane", // 15
	"Grenade", // 16
	"Teargas", // 17
	"Molotov", // 18
	" ", // 19
	" ", // 20
	" ", // 21
	"Colt 45", // 22
	"Colt 45 (Silenced)", // 23
	"Desert Eagle", // 24
	"Normal Shotgun", // 25
	"Sawnoff Shotgun", // 26
	"Combat Shotgun", // 27
	"Micro Uzi (Mac 10)", // 28
	"MP5", // 29
	"AK-47", // 30
	"M4A1", // 31
	"Tec-9", // 32
	"Country Rifle", // 33
	"Sniper Rifle", // 34
	"Rocket Launcher", // 35
	"Heat-Seeking Rocket Launcher", // 36
	"Flamethrower", // 37
	"Minigun", // 38
	"Satchel Charge", // 39
	"Detonator", // 40
	"Spray Can", // 41
	"Fire Extinguisher", // 42
	"Camera", // 43
	"Night Vision Goggles", // 44
	"Infrared Vision Goggles", // 45
	"Parachute", // 46
	"Fake Pistol" // 47
};

static const Float:raceMarkPos[][] =
{
    {-1114.4619,1121.5197,37.1398,314.0969},
	{-1034.7781,1179.2618,36.9024,273.3868},
	{-967.0256,1103.8157,28.4861,207.0159},
	{-907.5537,928.7330,18.4413,192.9352},
	{-888.4263,834.8553,19.1295,193.2459},
	{-799.2986,722.2106,18.1416,237.0365},
	{-518.4153,603.4280,16.6029,249.9206},
	{-79.2931,592.9561,13.9470,284.8033},
	{206.1241,730.8741,5.8043,298.5439},
	{537.6929,693.6741,3.0433,247.0384},
	{818.1970,687.6343,11.3248,292.2063}
};

static const Float:raceVehiclePos[][] =
{
	{-1883.9927,55.5958,37.9693,353.9538},
	{-1889.2037,56.1477,37.9693,353.9538},
	{-1896.7168,56.9435,37.9693,353.9538},
	{-1902.3264,57.5377,37.9693,353.9538},
	{-1903.5938,45.5736,37.9693,353.9538},
	{-1898.3928,45.0227,37.9693,353.9538},
	{-1890.9285,44.2321,37.9693,353.9538},
	{-1885.2791,43.6337,37.9693,353.9538},
	{-1886.3143,33.8604,37.9693,353.9538},
	{-1890.9335,34.3497,37.9693,353.9538},
	{-1898.5609,35.1575,37.9693,353.9538},
	{-1904.5038,35.7870,37.9693,353.9538},
	{-1905.4319,27.0246,37.9693,353.9538},
	{-1899.4885,26.3983,37.9693,353.9539},
	{-1892.4875,25.6568,37.9693,353.9539},
	{-1886.2473,24.9958,37.9693,353.9539}
};

static const textServerCommands[][] =
{
    !""SERVER_HEX"1. "WHITE_HEX"Команды чата\n"SERVER_HEX"2. "WHITE_HEX"Команды сервера\n"SERVER_HEX"3. "WHITE_HEX"Мои команды\n"SERVER_HEX"4. "WHITE_HEX"Команды администратора\n"SERVER_HEX"5. "WHITE_HEX"Команды транспорта",

    !""WHITE_HEX"/n - неролевой чат(nonrp)\n\
				/(s)hout - выкрикивать\n\
				/(w)hisper - говорить шепотом\n\
				/me - действия персонажа от 3-го лица\n\
				/do - описание событий игрового мира в настоящем времени\n\
				/try - случайная вероятность действия",
    
    !""WHITE_HEX"/lock - закрыть автомобиль\n\
	/engine - завести двигатель\n\
	/light - включить фары",

	!""WHITE_HEX"/mn - меню сервера\n\
	/help - узнать доступные команды\n\
	/stats - статистика аккаунта\n\
	/report - жалоба/вопрос модерации\n\
	/moders - модераторы в сети\n\
	/gps - навигатор\n\
	/time - узнать время и свой онлайн\n\
	/pay - передать деньги другому игроку"
};

new const textAuth[][] =
{
    !"\n"WHITE_HEX"Для начала игры требуется пройти регистрацию.\n\
	Придумай надёжный пароль от своего аккаунта.\n\n\
	"#CYANLIGHT_HEX"Внимание! "#WHITE_HEX"Использовать можно только латинские буквы и символы.\n\
	Пароль должен быть не менее "#MIN_PASSWORD_LENGHT" и не более "#MAX_PASSWORD_LENGHT" символов.",
        
	!""WHITE_HEX"Введи элетронную почту в поле ниже.\n\
	Она понадобится для восстановления аккаунта в случае потери доступа.",

	!""#WHITE_HEX"Длина пароля от "#MIN_PASSWORD_LENGHT" до "#MAX_PASSWORD_LENGHT" символов.\nВ пароле должна присутстовать заглавная буква.\nПароль может состоять из латинских, кириллических букв.\n\n"#DEFAULTRED_HEX"Ни в коем случае не ставь одинаковый пароль с аккаунтом!",

	!""#WHITE_HEX"Приветствуем на "#SERVER_NAME_FULL".\nТы впервые на сервере и для начала игры требуется пройти регистрацию.\n\n"#CYANLIGHT_HEX"Желаешь узнать больше о жанре RPG? Это не займёт много времени.",

	!"\n"WHITE_HEX"Жанр данного сервера — "CYANLIGHT_HEX"Role Play Game (RPG)"WHITE_HEX".\nЭто означает, что ты как в реальной жизни можешь отыгрывать свою роль: строить карьеру,\nразвивать персонажа и достигать собственных целей.\n\n"SOFTBLUE_HEX"Ты можешь зарабатывать игровую валюту, опыт, выполнять задания, быть участником\nгосударственных или же нелегальных организаций, либо вовсе создать свою семью,\nуправлять ею, и налаживать выгодные для тебя отношения с другими семьями.\nУ тебя также есть возможность соревноваться с другими игроками в гонках, дуэлях,\nDeathMatch аренах, в битвах семей и остальных мини-играх.\n\n"WHITE_HEX"Со временем, зарабывая всё больше денег, у тебя появиться возможность тороговать с игроками,\nприобретать дома, транспорт и начать развивать предпринимательскую деятельность,\nчтобы зарабатывать еще больше и быть самым богатым на сервере!\nЛибо если тебе это наскучит, можешь принять на себя важную должность лидера\nодной из организаций и развивать её по своему желанию.\n\n"SOFTBLUE_HEX"Зарабатывая доверие у игроков, ты оставишь за собой положительное впечатление\nдля администрации сервера, что даст тебе шанс попасть в его руководство\nв качестве модератора игрового процесса.\nВозможностей масса, как играть — выбирать тебе.\n\n"CYANLIGHT_HEX"Для продолжения нажми \"Далее\".",

	!"\n"CYANLIGHT_HEX"Правила"WHITE_HEX" — скучная, но крайне полезная и неотъемлемая часть всех проектов,\nсоздающая порядок и равенство друг перед другом.\n\n"SOFTBLUE_HEX"Это та цель, которую преследует проект — предоставить интересные игровые механики\nи создать комфорт для игроков Light Island.\n\n"WHITE_HEX"Но для этого требуется соблюдение принятых проектом условий от всех его игроков.\nРекомендуем ознакомиться с основными терминами далее,\nесли не хочешь случайно получить ограничение от модератора.",

	"\n\n"SOFTBLUE_HEX"1. Читы\n  "WHITE_HEX"Использовать сторонние програмы, дающие игровое преимущество,\n  нарушающие общий порядок на сервере и создающие помеху остальным игрокам.\n\n"SOFTBLUE_HEX"2. Никнейм\n  "WHITE_HEX"Ставить фейк-никнейм руководства сервера,\n  использовать в никах нецензурные выражения или бессмысленный набор букв/цифр.\n\n"SOFTBLUE_HEX"3. DeathMatch(DM)\n  "WHITE_HEX"Без причины убивать или наносить урон игрокам вне DM-зон.\n\n"SOFTBLUE_HEX"4. DriveBy(DB)\n  "WHITE_HEX"Наносить урон игрокам транспортом с водительского места.\n\n"SOFTBLUE_HEX"5. Багоюз\n  "WHITE_HEX"Пользоваться багами сервера и игры.\n  Список запрещенных багов игры находится на форуме.\n\n"SOFTBLUE_HEX"6. Махинации над игровым имуществом\n  "WHITE_HEX"Покупать/продавать/обменивать игровую валюту,\n  имущество и аккаунт на реальные средства.\n\n"SOFTBLUE_HEX"7. Caps Lock\n  "WHITE_HEX"Писать слова преимущественно заглавными буквами.\n\n"SOFTBLUE_HEX"8. Флуд\n  "WHITE_HEX"Три и более схожих сообщений в чате.\n\n Также присоединяйся к нам на форум "CYANLIGHT_HEX"forum.lightisland-rpg.com\n"
};

#include <actors\load_actors>
#include <mine-HQ\mine_script>

stock SaveAccount(playerid)
{
	format(PI[playerid][pWeaponsDB],64,"%i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i",PI[playerid][Weapon][0], PI[playerid][Weapon][1], PI[playerid][Weapon][2], PI[playerid][Weapon][3], PI[playerid][Weapon][4], PI[playerid][Weapon][5], PI[playerid][Weapon][6], PI[playerid][Weapon][7], PI[playerid][Weapon][8], PI[playerid][Weapon][9], PI[playerid][Weapon][10], PI[playerid][Weapon][11], PI[playerid][Weapon][12]);
	format(PI[playerid][pAmmoDB],64,"%i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i, %i",PI[playerid][Ammo][0], PI[playerid][Ammo][1], PI[playerid][Ammo][2], PI[playerid][Ammo][3], PI[playerid][Ammo][4], PI[playerid][Ammo][5], PI[playerid][Ammo][6], PI[playerid][Ammo][7], PI[playerid][Ammo][8], PI[playerid][Ammo][9], PI[playerid][Ammo][10], PI[playerid][Ammo][11], PI[playerid][Ammo][12]);
	if(AI[playerid][aLevel])
	{
		query[0]=EOS;
		switch(getDay())
		{
			case 0:
			{
				AI[playerid][aOnlineSaturday] += AI[playerid][aOnlineDay];
				mysql_format(connects, query, 120, "UPDATE "TABLE_ADMINS" SET `online_saturday` = '%d' WHERE `admin` = '%d' LIMIT 1", AI[playerid][aOnlineSaturday], PI[playerid][pID]);
			}
			case 1:
			{
				AI[playerid][aOnlineSunday] += AI[playerid][aOnlineDay];
				mysql_format(connects, query, 120, "UPDATE "TABLE_ADMINS" SET `online_sunday` = '%d' WHERE `admin` = '%d' LIMIT 1", AI[playerid][aOnlineSunday], PI[playerid][pID]);
			}
			case 2:
			{
				AI[playerid][aOnlineMonday] += AI[playerid][aOnlineDay]; 
				mysql_format(connects, query, 120, "UPDATE "TABLE_ADMINS" SET `online_monday` = '%d' WHERE `admin` = '%d' LIMIT 1", AI[playerid][aOnlineMonday], PI[playerid][pID]);
			}
			case 3:
			{
				AI[playerid][aOnlineTuesday] += AI[playerid][aOnlineDay];
				mysql_format(connects, query, 120, "UPDATE "TABLE_ADMINS" SET `online_tuesday` = '%d' WHERE `admin` = '%d' LIMIT 1", AI[playerid][aOnlineTuesday], PI[playerid][pID]);
			}
			case 4:
			{
				AI[playerid][aOnlineWednesday] += AI[playerid][aOnlineDay];
				mysql_format(connects, query, 120, "UPDATE "TABLE_ADMINS" SET `online_wednesday` = '%d' WHERE `admin` = '%d' LIMIT 1", AI[playerid][aOnlineWednesday], PI[playerid][pID]);
			}
			case 5:
			{
				AI[playerid][aOnlineThursday] += AI[playerid][aOnlineDay];
				mysql_format(connects, query, 120, "UPDATE "TABLE_ADMINS" SET `online_thursday` = '%d' WHERE `admin` = '%d' LIMIT 1", AI[playerid][aOnlineThursday], PI[playerid][pID]);
			}
			case 6:
			{
				AI[playerid][aOnlineFriday] += AI[playerid][aOnlineDay];
				mysql_format(connects, query, 120, "UPDATE "TABLE_ADMINS" SET `online_friday` = '%d' WHERE `admin` = '%d' LIMIT 1", AI[playerid][aOnlineFriday], PI[playerid][pID]);
			}
		}
		mysql_tquery(connects, query, "", "");
	}
	new dbsrc[120];
	if(DI[playerid][dTime])
	{
		query[0]=EOS;
		format(query,sizeof(query), "UPDATE "TABLE_DEMORGAN" SET ");
		format(dbsrc,sizeof(dbsrc), "time=%d", DI[playerid][dTime]);
		strcat(query,dbsrc,sizeof(query));
		format(dbsrc,sizeof(dbsrc)," WHERE id=%d LIMIT 1", PI[playerid][pID]);
		mysql_tquery(connects,query);
	}
	query[0]=EOS;
	format(query,sizeof(query),"UPDATE "TABLE_ACCOUNTS" SET ");
	format(dbsrc,sizeof(dbsrc),"skin=%d, ",PI[playerid][pSkin]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"level=%d, ",PI[playerid][pLevel]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"exp=%d, ",PI[playerid][pExp]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"money=%d, ",PI[playerid][pMoney]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"house=%d, ",PI[playerid][pHouse]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"business=%d, ",PI[playerid][pBusiness]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"warns=%d, ",PI[playerid][pWarns]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"warn_active=%d, ",PI[playerid][pActiveWarn]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"warn_time=%d, ",PI[playerid][punWarnstime]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"idcard=%d, ",PI[playerid][pIdCard]);
	strcat(query,dbsrc,sizeof(query));
	/*format(dbsrc,sizeof(dbsrc),"age=%d, ",PI[playerid][pAge]);
	strcat(query,dbsrc,sizeof(query));*/
	format(dbsrc,sizeof(dbsrc),"showgun=%d, ",PI[playerid][pShowGun]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"holster=%d, ",PI[playerid][pHolster]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"riflesling=%d, ",PI[playerid][pRifleSling]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"cardseria=%d, ",PI[playerid][pIdSeria]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"adminMessages=%d, ",PI[playerid][pAdminMess]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"gChatMessages=%d, ",PI[playerid][pGchatMess]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"cardnumber=%d, ",PI[playerid][pIdNumber]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"phone=%d, ",PI[playerid][pPhone]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"phonenum=%d, ",PI[playerid][pPhoneNum]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"book=%d, ",PI[playerid][pBook]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"phonebook=%d, ",PI[playerid][pPhoneBook]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"lockpick=%d, ",PI[playerid][pLockpick]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"rope=%d, ",PI[playerid][pRope]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"mask=%d, ",PI[playerid][pMask]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"mask=%d, ",PI[playerid][pGPS]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"bank=%d, ",PI[playerid][pBank]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"donate=%d, ",PI[playerid][pDonate]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"houronline=%d, ",PI[playerid][pHourOnline]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"allonline=%d, ",PI[playerid][pAllOnline]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"dayonline=%d, ",PI[playerid][pDayOnline]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"afkdayonline=%d, ",PI[playerid][pAFKDayTime]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"`hp`='%f', ",PI[playerid][pHp]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"`armour`='%f', ",PI[playerid][pArmour]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"`weapons`='%s', ",PI[playerid][pWeaponsDB]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"`ammos`='%s', ",PI[playerid][pAmmoDB]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"mats=%d, ",PI[playerid][pMats]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"heals=%d, ",PI[playerid][pHeal]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"licCar=%d, ",PI[playerid][pLicCar]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"licBoat=%d, ",PI[playerid][pLicBoat]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"licPlane=%d, ",PI[playerid][pLicPlane]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"zakonp=%d, ",PI[playerid][pZakon]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"mute=%d, ",PI[playerid][pMute]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"GCmute=%d, ",PI[playerid][pGCMute]);
	strcat(query,dbsrc,sizeof(query));
	if(!AI[playerid][aLevel])
	{
		format(dbsrc,sizeof(dbsrc),"leader=%d, ",PI[playerid][pLeader]);
		strcat(query,dbsrc,sizeof(query));
		format(dbsrc,sizeof(dbsrc),"model=%d, ",PI[playerid][pModel]);
		strcat(query,dbsrc,sizeof(query));
		format(dbsrc,sizeof(dbsrc),"member=%d, ",PI[playerid][pMember]);
		strcat(query,dbsrc,sizeof(query));
		format(dbsrc,sizeof(dbsrc),"rank=%d, ",PI[playerid][pRank]);
		strcat(query,dbsrc,sizeof(query));
		format(dbsrc,sizeof(dbsrc),"vigs=%d, ",PI[playerid][pVigs]);
		strcat(query,dbsrc,sizeof(query));
	}
	format(dbsrc,sizeof(dbsrc),"pVehModel=%d, ",PI[playerid][pVehModel]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"`pVehX`='%f', ",PI[playerid][pVehX]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"`pVehY`='%f', ",PI[playerid][pVehY]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"`pVehZ`='%f', ",PI[playerid][pVehZ]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"`pVehA`='%f', ",PI[playerid][pVehA]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"`pVehFuel`='%f', ",PI[playerid][pVehFuel]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"`pVehHP`='%f', ",PI[playerid][pVehHP]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"pVehColorP=%d, ",PI[playerid][pVehColorP]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc),"pVehColorS=%d",PI[playerid][pVehColorS]);
	strcat(query,dbsrc,sizeof(query));
	format(dbsrc,sizeof(dbsrc)," WHERE id=%d LIMIT 1",PI[playerid][pID]);
	strcat(query,dbsrc,sizeof(query));
	return mysql_tquery(connects,query);
}

stock OnPlayerRegister(playerid)
{
	PI[playerid][pMoney] 		= 500;
	PI[playerid][pLevel] 		= 1;
	PI[playerid][pHouse] 		= -1;
	PI[playerid][pBusiness] 	= -1;
	PI[playerid][pRegDate] 		= UnixToDate(gettime());
	PI[playerid][pAdminMess] 	= 1;
	PI[playerid][pGchatMess] 	= 1;
	pLoggedIn{playerid}  		= 1;
	PI[playerid][pHp]			= 100.0;
	query[0]=EOS;
	mysql_format(connects, query, 800, "INSERT INTO "TABLE_ACCOUNTS" (`adminMessages`, `gChatMessages`, `name`, `salt`, `email`, `isemail`, `level`, `money`, `gender`, `skin`, `hp`, `house`, `business`, `regip`, `geton_ip`, `geton_date`, `game_reg_date`) VALUES ('%d','%d','%e','%e','%e','%d','%d','%d','%d','%d','%f','%d','%d','%e','%e', '%e', '%e')", PI[playerid][pAdminMess], PI[playerid][pGchatMess], PI[playerid][pName], PI[playerid][pHash], PI[playerid][pEmail], PI[playerid][isEmail], PI[playerid][pLevel], PI[playerid][pMoney], PI[playerid][pGender], PI[playerid][pSkin], PI[playerid][pHp], PI[playerid][pHouse], PI[playerid][pBusiness], PI[playerid][pIP], PI[playerid][pIP], PI[playerid][pRegDate], PI[playerid][pRegDate]);
	mysql_tquery(connects, query, "OnAccountCreated", "d", playerid);
	PI[playerid][pTimer] = SetTimerEx("PlayerTimer", 1000, true, "i", playerid);
	SendPositiveMess(playerid, "Успешная регистрация аккаунта.");
	SendPositiveMess(playerid, "Дополнительную информацию можно найти в /menu. Приятной игры!");
	TogglePlayerSpectating(playerid, false);
	switch(GetPlayerMapZone(playerid))
	{
		case ZONE_SAN_FIERRO: SCMESS(playerid, GOLDORANGE_FORMAT, "У Андрэ есть несколько поручений для тебя. Он находится на вокзале.");
		case ZONE_LOS_SANTOS: SCMESS(playerid, GOLDORANGE_FORMAT, "У Джеффри есть несколько поручений для тебя. Он находится на вокзале.");
		case ZONE_LAS_VENTURAS: SCMESS(playerid, GOLDORANGE_FORMAT, "У Генри есть несколько поручений для тебя. Он находится на вокзале.");
	}
	return 1;
}

stock GetNearestVehicle(playerid)
{
	new Float:x_nearest_vehicle,Float:y_nearest_vehicle,Float:z_nearest_vehicle;
	foreach(new i : Vehicle)
	{
		GetVehiclePos(i,x_nearest_vehicle,y_nearest_vehicle,z_nearest_vehicle);
		if(IsPlayerInRangeOfPoint(playerid, 3.0, x_nearest_vehicle, y_nearest_vehicle, z_nearest_vehicle)) return i;
	}
	return -1;
}

stock SetVehicleVariables(vehicle_id_vars, bool:engine = undefined, bool:lights = undefined, bool:alarm = undefined, bool:doors = undefined, bool:bonnet = undefined, bool:boot = undefined, bool:objective = undefined)
{
	if(engine == true)
	{
		SetVehicleParamsEx(vehicle_id_vars, engine, VI[vehicle_id_vars][vLights], VI[vehicle_id_vars][vAlarm], VI[vehicle_id_vars][vLock], VI[vehicle_id_vars][vBonnet], VI[vehicle_id_vars][vBoot], VI[vehicle_id_vars][vObjective]);
		VI[vehicle_id_vars][vEngine] = engine;
		VI[vehicle_id_vars][vFuelTimer] = SetTimerEx("UpdateVehicleFuel", 200, true, "i", vehicle_id_vars);
	}
	if(engine == false)
	{
		SetVehicleParamsEx(vehicle_id_vars, engine, VI[vehicle_id_vars][vLights], VI[vehicle_id_vars][vAlarm], VI[vehicle_id_vars][vLock], VI[vehicle_id_vars][vBonnet], VI[vehicle_id_vars][vBoot], VI[vehicle_id_vars][vObjective]);
		VI[vehicle_id_vars][vEngine] = engine;
		KillTimer(VI[vehicle_id_vars][vFuelTimer]);
	}
	if(lights == true || lights == false)
	{
		SetVehicleParamsEx(vehicle_id_vars, VI[vehicle_id_vars][vEngine], lights, VI[vehicle_id_vars][vAlarm], VI[vehicle_id_vars][vLock], VI[vehicle_id_vars][vBonnet], VI[vehicle_id_vars][vBoot], VI[vehicle_id_vars][vObjective]);
		VI[vehicle_id_vars][vLights] = lights;
	}
	if(alarm == true || alarm == false)
	{
		SetVehicleParamsEx(vehicle_id_vars, VI[vehicle_id_vars][vEngine], VI[vehicle_id_vars][vLights], alarm, VI[vehicle_id_vars][vLock], VI[vehicle_id_vars][vBonnet], VI[vehicle_id_vars][vBoot], VI[vehicle_id_vars][vObjective]);
		VI[vehicle_id_vars][vAlarm] = alarm;
	}
	if(doors == true || doors == false)
	{
		SetVehicleParamsEx(vehicle_id_vars, VI[vehicle_id_vars][vEngine], VI[vehicle_id_vars][vLights], VI[vehicle_id_vars][vAlarm], doors, VI[vehicle_id_vars][vBonnet], VI[vehicle_id_vars][vBoot], VI[vehicle_id_vars][vObjective]);
		VI[vehicle_id_vars][vLock] = doors;
	}
	if(bonnet == true || bonnet == false)
	{
		SetVehicleParamsEx(vehicle_id_vars, VI[vehicle_id_vars][vEngine], VI[vehicle_id_vars][vLights], VI[vehicle_id_vars][vAlarm], VI[vehicle_id_vars][vLock], bonnet, VI[vehicle_id_vars][vBoot], VI[vehicle_id_vars][vObjective]);
		VI[vehicle_id_vars][vBonnet] = bonnet;
	}
	if(boot == true || boot == false) 
	{
		SetVehicleParamsEx(vehicle_id_vars, VI[vehicle_id_vars][vEngine], VI[vehicle_id_vars][vLights], VI[vehicle_id_vars][vAlarm], VI[vehicle_id_vars][vLock], VI[vehicle_id_vars][vBonnet], boot, VI[vehicle_id_vars][vObjective]);
		VI[vehicle_id_vars][vBoot] = boot;
	}
	if(objective == true || objective == false) 
	{
		SetVehicleParamsEx(vehicle_id_vars, VI[vehicle_id_vars][vEngine], VI[vehicle_id_vars][vLights], VI[vehicle_id_vars][vAlarm], VI[vehicle_id_vars][vLock], VI[vehicle_id_vars][vBonnet], VI[vehicle_id_vars][vBoot], objective);
		VI[vehicle_id_vars][vObjective] = objective;
	}
	return 1;
}

stock GetVehicleTank(vehicleModel)
{
	switch(vehicleModel)
	{
		case 400,422,404,442: return 45;
		case 401,411,415,424,451,461,463,473,480,500,532,541,542,545,549,555,558,559,562,587,589,600,602,603,605: return 30;
		case 521..523,581,586: return 25;
		case 402,410,429,434,439,475,477,496,506,527,529,533,540,543,546,547,550,551,567,575,585: return 35;
		case 403,425,548,553,592: return 100;
		case 405,409,412,419,420,421,426,436,438,445,458,466,467,474,478,479,486,491,492,494,502..504,507,516..518,526,528,534,535,536,554,560,561,565,566,576,580,582,588,604,609: return 40;
		case 406,407,417,430,432,443,447,453,454,469,476,484,487,488,497,511..513,514,515,519,520,563,577,596..598: return 90;
		case 455,573,593: return 70;
		case 413,414,416,418,423,427,428,431,437,440,444,446,449,452,456,459,460,464,470,472,482,483,489,490,493,495,498,499,505,508,524,525,544,552,556,557,578,579,595,599,601: return 50;
		case 433: return 80;
		case 441,465,501,564,571: return 5;
		case 448,462: return 10;
		case 457,468,471,485,530,531,568,572,574: return 15;
		case 509,510,537,538,570,584,590,591,594,606,607,608,610,611: return 0;
		case 539,583: return 20;
	}
	return 0;
}

stock BuySkin(playerid)
{
	switch(PI[playerid][pGender])
	{
		case 0:
		{
			SetMoney(playerid, -skinWomen[TI[playerid][changeSkinCount]][1] * BI[GetPVarInt(playerid, "clothesbusinessid")][bProdsPrice]);
			BI[GetPVarInt(playerid, "clothesbusinessid")][bMoney] += skinWomen[TI[playerid][changeSkinCount]][1] * BI[GetPVarInt(playerid, "clothesbusinessid")][bProdsPrice];
			BI[GetPVarInt(playerid, "clothesbusinessid")][bIncomeDay] += skinWomen[TI[playerid][changeSkinCount]][1] * BI[GetPVarInt(playerid, "clothesbusinessid")][bProdsPrice];
		}
		case 1:
		{
			SetMoney(playerid, -skinMen[TI[playerid][changeSkinCount]][1] * BI[GetPVarInt(playerid, "clothesbusinessid")][bProdsPrice]);
			BI[GetPVarInt(playerid, "clothesbusinessid")][bMoney] += skinMen[TI[playerid][changeSkinCount]][1] * BI[GetPVarInt(playerid, "clothesbusinessid")][bProdsPrice];
			BI[GetPVarInt(playerid, "clothesbusinessid")][bIncomeDay] += skinMen[TI[playerid][changeSkinCount]][1] * BI[GetPVarInt(playerid, "clothesbusinessid")][bProdsPrice];
		}
	}
	new Float:x_pos,Float:y_pos,Float:z_pos;
	TogglePlayerControllable(playerid, true);
	SetCameraBehindPlayer(playerid);
	GetPlayerPos(playerid, x_pos, y_pos, z_pos);
	SetPlayerPos(playerid,x_pos,y_pos,z_pos);
	BI[GetPVarInt(playerid, "clothesbusinessid")][bProds] -= 50;
	PI[playerid][pSkin] = GetPlayerSkin(playerid);
	SetPlayerSkin(playerid,PI[playerid][pSkin]);
	SaveBusinessInts(GetPVarInt(playerid, "clothesbusinessid"), "bMoney", BI[GetPVarInt(playerid, "clothesbusinessid")][bMoney], "bProds", BI[GetPVarInt(playerid, "clothesbusinessid")][bProds]);
	DeletePVar(playerid, "clothesbusinessid");
	for(new i=0; i < sizeof(changeskin_TD); i++)
	{
		TextDrawHideForPlayer(playerid, changeskin_TD[i]);
		CancelSelectTextDraw(playerid);
	}
	SCMESS(playerid,YELLOW_FORMAT,"- Продавщица: "WHITE_HEX"Спасибо за покупку. Вы сделали хороший выбор! Приходите еще!");
	SetActorChatBubble(clothesShopActor_intid_15[0], "Спасибо за покупку. Вы сделали хороший выбор! Приходите еще!", GREY_FORMAT, 20.0, 10000);
	ApplyDynamicActorAnimation(clothesShopActor_intid_15[1], "PED", "IDLE_CHAT", 8.1, false, false, false, false, 0);
	return PlayerTextDrawHide(playerid, changeskin_PTD[playerid][0]);
}

stock ClearMember(playerid)
{
	new dbsrc[120];
	query[0]=EOS;
	format(query,100,"UPDATE "TABLE_ACCOUNTS" SET ");
	if(PI[playerid][pLeader])
	{
		PI[playerid][pLeader] = 0;
		format(dbsrc,sizeof(dbsrc),"leader=%d, ", PI[playerid][pLeader]);
		strcat(query,dbsrc,100);
	}
	if(PI[playerid][pVigs])
	{
		PI[playerid][pVigs] = 0;
		format(dbsrc,sizeof(dbsrc),"vigs=%d, ", PI[playerid][pVigs]);
		strcat(query,dbsrc,100);
	}
	if(IsAGov(playerid))
	{
		if(PI[playerid][pArmour]) SetPlayerArmour(playerid, 0.0);
		ResetWeapons(playerid);
		PI[playerid][pDuty]		 = 0;
		PI[playerid][pDutyTimer] = 0;
	}
	PI[playerid][pRank] 	= 0;
	PI[playerid][pMember] 	= 0;
	PI[playerid][pModel]  	= 0;
	SetPlayerTeamColor(playerid);
	SetPlayerSkinEx(playerid, PI[playerid][pSkin]);
	format(dbsrc,sizeof(dbsrc),"member=%d, ", PI[playerid][pMember]);
	strcat(query,dbsrc,100);
	format(dbsrc,sizeof(dbsrc),"model=%d ", PI[playerid][pModel]);
	strcat(query,dbsrc,100);
	format(dbsrc,sizeof(dbsrc),"WHERE `id` = '%d' LIMIT 1", PI[playerid][pID]);
	strcat(query,dbsrc,100);
	return mysql_tquery(connects, query);
}

stock HouseUpgradeList(playerid)
{
	new str_1[256];
	format(str_1, sizeof(str_1), ""WHITE_HEX"1. Домашний сейф\t|\t%s\n\
	2. Сигнализация\t|\t%s\n\
	3. Шкаф для одежды\t|\t%s", (HI[PI[playerid][pHouse]][hSafe] == 1) ? (""GREEN_HEX"Приобретено"WHITE_HEX"") : (""DARKRED_HEX"Отсутствует"WHITE_HEX""), (HI[PI[playerid][pHouse]][hSignal] == 1) ? (""GREEN_HEX"Приобретено"WHITE_HEX"") : (""DARKRED_HEX"Отсутствует"WHITE_HEX""), (HI[PI[playerid][pHouse]][hCupboardBought] == 1) ? (""GREEN_HEX"Приобретено"WHITE_HEX"") : (""DARKRED_HEX"Отсутствует"WHITE_HEX""));
	return SPD(playerid, DLG_HOUSEUPGRADE, DSL, ""SERVER_HEX"Улучшения для дома", str_1, "Выбрать", "Назад");
}

stock GetPlayerID(const name[]) 
{
	new ids;
    sscanf(name, "?<MATCH_NAME_PARTIAL=0>r", ids);
    return ids;
}

stock PlayerOnline(const name[])
{
	new player_name[MAX_PLAYER_NAME+1];
	foreach(new i : Player)
	{
		if(!pLoggedIn{i} || !IsPlayerConnected(i)) continue;
		GetPlayerName(i, player_name, MAX_PLAYER_NAME+1);
		if(strcmp(player_name, name)) continue;
		else return i;
	}
	return INVALID_PLAYER_ID;
}

stock KickEx(playerid)
{
	return SetTimerEx("PlayerKick", 250, false, "i", playerid);
}

stock ClearRegisterData(playerid)
{
    PI[playerid] = playerDataNull;
	if(GetPVarInt(playerid, "wrongPass")) DeletePVar(playerid, "wrongPass");
	if(GetPVarInt(playerid, "player_register_password")) DeletePVar(playerid, "player_register_password");
	if(playerAuthTimer[playerid]) KillTimer(playerAuthTimer[playerid]);
	if(GetPVarInt(playerid, "authTimerTick")) DeletePVar(playerid, "authTimerTick");
 	return 1;
}

stock ShowPlayerInfo(playerid, targetid_info)
{
	TextDrawSetPreviewModel(playerInfoTD[1], GetPlayerSkin(targetid_info));
	new name[MAX_PLAYER_NAME], string[MAX_STR_LENGHT];
	GetPlayerName(targetid_info, name, MAX_PLAYER_NAME);
	PlayerTextDrawSetString(playerid, playerInfoPTD[playerid][0], name);
	PlayerTextDrawColour(playerid, playerInfoPTD[playerid][0], ((GetPlayerColor(targetid_info) & ~0xFF) | 0xFF));
	format(string, sizeof(string), "ID: %i", targetid_info);
	PlayerTextDrawSetString(playerid, playerInfoPTD[playerid][1], string);
	for(new i = 0; i < sizeof(playerInfoPTD[]); i++) PlayerTextDrawShow(playerid, playerInfoPTD[playerid][i]);
	for(new i = 0; i < sizeof(playerInfoFrameTD); i++) TextDrawShowForPlayer(playerid, playerInfoFrameTD[i]);
	for(new i = 0; i < sizeof(playerInfoTD); i++) TextDrawShowForPlayer(playerid, playerInfoTD[i]);
}

stock HidePlayerInfo(playerid) 
{
	for(new i = 0; i < sizeof(playerInfoPTD[]); i++) PlayerTextDrawHide(playerid, playerInfoPTD[playerid][i]);
	for(new i = 0; i < sizeof(playerInfoFrameTD); i++) TextDrawHideForPlayer(playerid, playerInfoFrameTD[i]);
	for(new i = 0; i < sizeof(playerInfoTD); i++) TextDrawHideForPlayer(playerid, playerInfoTD[i]);
}

stock Float:GetSpeed(Float:GSvx, Float:GSvy, Float:GSvz) return floatsqroot(floatpower(GSvx, 2.0) + floatpower(GSvy, 2.0) + floatpower(GSvz, 2.0)) * 180.0;

stock FormatNumber(number) 
{
	new numOfPeriods = 0;
	new tmp = number;
	new ret[32];
	while(tmp > 1000) 
	{
		tmp = floatround(tmp / 1000, floatround_floor);
		++numOfPeriods;
	}
	valstr(ret, number);
	new slen = strlen(ret);
	for(new i = 1; i != (numOfPeriods + 1); ++i) 
	{
		strins(ret, ",", (slen - 3 * i));
	}
	return ret;
}

stock UpdatePlayerInfo(playerid, targetid_player_info) 
{
	new Float:amount,
		Float:barLength = ((clamp(floatround(amount), 0, 100) / 100.0) * 64.0), 
		Float:velo_x, 
		Float:velo_y, 
		Float:velo_z, 
		string[MAX_STR_LENGHT],
		index;
	GetPlayerHealth(targetid_player_info, amount);
	format(string, sizeof(string), "HEALTH: ~w~%i", floatround(amount));
	PlayerTextDrawSetString(playerid, playerInfoPTD[playerid][2], string);
	TextDrawTextSize(playerInfoTD[3], barLength, 3.0000);
 	TextDrawShowForPlayer(playerid, playerInfoTD[3]);
	GetPlayerArmour(targetid_player_info, amount);
	format(string, sizeof(string), "ARMOUR: ~w~%i", floatround(amount));
	PlayerTextDrawSetString(playerid, playerInfoPTD[playerid][3], string);
	barLength = ((clamp(floatround(amount), 0, 100) / 100.0) * 64.0);
	TextDrawTextSize(playerInfoTD[5], barLength, 3.0000);
 	TextDrawShowForPlayer(playerid, playerInfoTD[5]);
	if(!GetPlayerWeapon(targetid_player_info)) string = "WEAPON: ~w~Unarmed";
	else
	{
		GetWeaponName(GetPlayerWeapon(targetid_player_info), string, sizeof(string));
		format(string, sizeof(string), "WEAPON: ~w~%s (%i)", string, GetPlayerAmmo(targetid_player_info));
	}
	PlayerTextDrawSetString(playerid, playerInfoPTD[playerid][4], string);
	format(string, sizeof(string), "MONEY: ~g~$~w~%s", FormatNumber(GetPlayerMoney(targetid_player_info)));
	PlayerTextDrawSetString(playerid, playerInfoPTD[playerid][5], string);
	if(IsPlayerInAnyVehicle(targetid_player_info)) format(string, sizeof(string), "SPEED: ~w~%0.1f", GetVehicleSpeed(GetPlayerVehicleID(targetid_player_info)));
	else
	{
		GetPlayerVelocity(targetid_player_info, velo_x, velo_y, velo_z);
		format(string, sizeof(string), "SPEED: ~w~%0.1f", (GetSpeed(velo_x, velo_y, velo_z) / 1.609344));
	}
	PlayerTextDrawSetString(playerid, playerInfoPTD[playerid][6], string);
	foreach(new i : spectatePlayers) 
	{
		++index;
		if (i == targetid_player_info)
		{
			break;
		} 
 	}
	format(string, sizeof(string), "SPECS: %i/%i", index, Iter_Count(spectatePlayers));
	PlayerTextDrawSetString(playerid, playerInfoPTD[playerid][7], string);
}


stock ShowVehicleInfo(playerid, vehicle_id_info) 
{
	new model_id = GetVehicleModel(vehicle_id_info);
	TextDrawSetPreviewModel(vehicleInfoTD[1], model_id);
	PlayerTextDrawSetString(playerid, vehicleInfoPTD[playerid][0], GetVehicleName(vehicle_id_info));
	format(g_str, 60, "MODELID: %i", model_id);
	PlayerTextDrawSetString(playerid, vehicleInfoPTD[playerid][1], g_str);
	for(new i = 0; i < sizeof(vehicleInfoPTD[]); i++) PlayerTextDrawShow(playerid, vehicleInfoPTD[playerid][i]);
	for(new i = 0; i < sizeof(vehicleInfoFrameTD); i++) TextDrawShowForPlayer(playerid, vehicleInfoFrameTD[i]);
	for(new i = 0; i < sizeof(vehicleInfoTD); i++) TextDrawShowForPlayer(playerid, vehicleInfoTD[i]);
}

stock HideVehicleInfo(playerid) 
{
	for(new i = 0; i < sizeof(vehicleInfoPTD[]); i++) PlayerTextDrawHide(playerid, vehicleInfoPTD[playerid][i]);
	for(new i = 0; i < sizeof(vehicleInfoFrameTD); i++) TextDrawHideForPlayer(playerid, vehicleInfoFrameTD[i]);
	for(new i = 0; i < sizeof(vehicleInfoTD); i++) TextDrawHideForPlayer(playerid, vehicleInfoTD[i]);
}

stock UpdateVehicleInfo(playerid, vehicle_id_info_update) 
{
	new Float:amount,
		Float:barLength = ((clamp(floatround(amount), 0, 1000) / 1000.0) * 94.5), 
		string[MAX_STR_LENGHT];
	GetVehicleHealth(vehicle_id_info_update, amount);
	format(string, sizeof(string), "HEALTH: ~w~%i/1000", floatround(amount));
	PlayerTextDrawSetString(playerid, vehicleInfoPTD[playerid][2], string);
	TextDrawTextSize(vehicleInfoTD[3], barLength, 3.0000);
	TextDrawShowForPlayer(playerid, vehicleInfoTD[3]);
	format(string, sizeof(string), "SPEED: ~w~%02d KM/H", GetVehicleSpeed(vehicle_id_info_update));
	PlayerTextDrawSetString(playerid, vehicleInfoPTD[playerid][3], string);
}

stock GetNextPlayer(current)
{
	new next = INVALID_PLAYER_ID;
	if(Iter_Count(spectatePlayers) > 1) 
	{
		if(Iter_Contains(spectatePlayers, current)) 
		{
			next = Iter_Next(spectatePlayers, current);
			if(next == Iter_End(spectatePlayers)) 
			{
			    next = Iter_First(spectatePlayers);
			}
		}
	}
	return next;
}

stock GetPreviousPlayer(current) 
{
	new prev = INVALID_PLAYER_ID;
	if(Iter_Count(spectatePlayers) > 1) 
	{
		if(Iter_Contains(spectatePlayers, current)) 
		{
			prev = Iter_Prev(spectatePlayers, current);
			if(prev == Iter_Begin(spectatePlayers)) 
			{
			    prev = Iter_Last(spectatePlayers);
			}
		}
	}
	return prev;
}

stock StartSpectate(playerid, targetid_start_sp) 
{
	TogglePlayerSpectating(playerid, true);
    SetPlayerInteriorEx(playerid, GetPlayerInterior(targetid_start_sp));
	SetPlayerVirtualWorldEx(playerid, GetPlayerVirtualWorld(targetid_start_sp));
	new vehicle_id_sp = GetPlayerVehicleID(targetid_start_sp);
	if(vehicle_id_sp != 0)
	{
		PlayerSpectateVehicle(playerid, vehicle_id_sp, SPECTATE_MODE_NORMAL);
		ShowPlayerInfo(playerid, targetid_start_sp);
		ShowVehicleInfo(playerid, vehicle_id_sp);
	}
	else 
	{
	    PlayerSpectatePlayer(playerid, targetid_start_sp, SPECTATE_MODE_NORMAL);
		ShowPlayerInfo(playerid, targetid_start_sp);
		HideVehicleInfo(playerid);
	}
    spectateID[playerid] = targetid_start_sp;
    spectateType[playerid] = (vehicle_id_sp != 0) ? SPECTATE_TYPE_VEHICLE : SPECTATE_TYPE_PLAYER;
	return SelectTextDraw(playerid, 0xAA0000FF);
}

stock UpdateHouse(house_id_update)
{
	if(!HI[house_id_update][hOwner])
	{
		Streamer_SetIntData(STREAMER_TYPE_PICKUP, HI[house_id_update][hPick], E_STREAMER_MODEL_ID, 1273);
		Streamer_SetIntData(STREAMER_TYPE_MAP_ICON, HI[house_id_update][hIcon], E_STREAMER_TYPE, 31);
	}
	Streamer_SetIntData(STREAMER_TYPE_PICKUP, HI[house_id_update][hPick], E_STREAMER_MODEL_ID, 1272);
	Streamer_SetIntData(STREAMER_TYPE_MAP_ICON, HI[house_id_update][hIcon], E_STREAMER_TYPE, 32);
	return 1;
}

stock RemoveBuilding(playerid)
{
	//airport ls
	RemoveBuildingForPlayer(playerid, 3769, 1961.4453, -2216.1719, 14.9844, 0.250);
	RemoveBuildingForPlayer(playerid, 3664, 1960.6953, -2236.4297, 19.2813, 0.250);
	RemoveBuildingForPlayer(playerid, 1412, 1959.8984, -2227.4453, 13.7266, 0.250);
	RemoveBuildingForPlayer(playerid, 3625, 1961.4453, -2216.1719, 14.9844, 0.250);
	// mayor
	// RemoveBuildingForPlayer(playerid, 4024, 1479.8672, -1790.3984, 56.0234, 0.25);
	// RemoveBuildingForPlayer(playerid, 4044, 1481.1875, -1785.0703, 22.3828, 0.25);
	// RemoveBuildingForPlayer(playerid, 4045, 1479.3359, -1802.2891, 12.5469, 0.25);
	// RemoveBuildingForPlayer(playerid, 4046, 1479.5234, -1852.6406, 24.5156, 0.25);
	// RemoveBuildingForPlayer(playerid, 4047, 1531.6328, -1852.6406, 24.5156, 0.25);
	// RemoveBuildingForPlayer(playerid, 1527, 1448.2344, -1755.8984, 14.5234, 0.25);
	// RemoveBuildingForPlayer(playerid, 4217, 1449.2500, -1852.5703, 22.3672, 0.25);
	// RemoveBuildingForPlayer(playerid, 713, 1407.1953, -1749.3125, 13.0938, 0.25);
	// RemoveBuildingForPlayer(playerid, 1266, 1482.0859, -1859.9688, 25.0391, 0.25);
	// RemoveBuildingForPlayer(playerid, 713, 1405.2344, -1821.1172, 13.1016, 0.25);
	// RemoveBuildingForPlayer(playerid, 620, 1417.9766, -1832.5313, 11.9844, 0.25);
	// RemoveBuildingForPlayer(playerid, 673, 1405.5781, -1831.6953, 12.3984, 0.25);
	// RemoveBuildingForPlayer(playerid, 1265, 1465.4766, -1848.2500, 12.9922, 0.25);
	// RemoveBuildingForPlayer(playerid, 1372, 1466.9453, -1847.8438, 12.6641, 0.25);
	// RemoveBuildingForPlayer(playerid, 1372, 1419.7344, -1846.5469, 12.6641, 0.25);
	// RemoveBuildingForPlayer(playerid, 1265, 1420.4297, -1845.3438, 12.9844, 0.25);
	// RemoveBuildingForPlayer(playerid, 1372, 1419.6953, -1844.2031, 12.6641, 0.25);
	// RemoveBuildingForPlayer(playerid, 1220, 1420.4922, -1842.4375, 12.9297, 0.25);
	// RemoveBuildingForPlayer(playerid, 1220, 1419.7266, -1842.8516, 12.9297, 0.25);
	// RemoveBuildingForPlayer(playerid, 1230, 1419.6719, -1842.0313, 12.9766, 0.25);
	// RemoveBuildingForPlayer(playerid, 4170, 1433.9531, -1844.4063, 21.4219, 0.25);
	// RemoveBuildingForPlayer(playerid, 700, 1447.1016, -1832.5000, 12.9141, 0.25);
	// RemoveBuildingForPlayer(playerid, 1231, 1432.3047, -1832.9141, 15.2891, 0.25);
	// RemoveBuildingForPlayer(playerid, 4174, 1435.7656, -1823.6641, 15.1797, 0.25);
	// RemoveBuildingForPlayer(playerid, 620, 1456.3984, -1832.5313, 11.9844, 0.25);
	// RemoveBuildingForPlayer(playerid, 673, 1464.0938, -1831.8828, 12.3984, 0.25);
	// RemoveBuildingForPlayer(playerid, 1260, 1482.0859, -1859.9688, 25.0391, 0.25);
	// RemoveBuildingForPlayer(playerid, 4004, 1479.5234, -1852.6406, 24.5156, 0.25);
	// RemoveBuildingForPlayer(playerid, 1357, 1487.6953, -1848.1094, 12.8125, 0.25);
	// RemoveBuildingForPlayer(playerid, 1372, 1486.2109, -1848.1250, 12.6641, 0.25);
	// RemoveBuildingForPlayer(playerid, 1372, 1468.0625, -1847.7891, 12.6641, 0.25);
	// RemoveBuildingForPlayer(playerid, 1230, 1488.9219, -1848.2734, 12.9766, 0.25);
	// RemoveBuildingForPlayer(playerid, 1231, 1480.0313, -1832.9141, 15.2891, 0.25);
	// RemoveBuildingForPlayer(playerid, 3997, 1479.3359, -1802.2891, 12.5469, 0.25);
	// RemoveBuildingForPlayer(playerid, 4171, 1503.3984, -1848.3359, 21.4609, 0.25);
	// RemoveBuildingForPlayer(playerid, 620, 1504.8438, -1832.5313, 11.9844, 0.25);
	// RemoveBuildingForPlayer(playerid, 673, 1499.0469, -1832.2734, 12.8828, 0.25);
	// RemoveBuildingForPlayer(playerid, 1265, 1515.3828, -1850.0547, 12.9844, 0.25);
	// RemoveBuildingForPlayer(playerid, 1265, 1514.4219, -1850.0391, 12.9922, 0.25);
	// RemoveBuildingForPlayer(playerid, 700, 1512.9453, -1832.3516, 13.4688, 0.25);
	// RemoveBuildingForPlayer(playerid, 1372, 1516.6875, -1850.0547, 12.6641, 0.25);
	// RemoveBuildingForPlayer(playerid, 700, 1404.9141, -1765.2656, 12.9141, 0.25);
	// RemoveBuildingForPlayer(playerid, 4173, 1427.2734, -1756.1797, 15.0000, 0.25);
	// RemoveBuildingForPlayer(playerid, 673, 1415.3125, -1748.5625, 12.3984, 0.25);
	// RemoveBuildingForPlayer(playerid, 620, 1429.5313, -1748.4219, 12.9063, 0.25);
	// RemoveBuildingForPlayer(playerid, 700, 1438.0313, -1747.9375, 13.4453, 0.25);
	// RemoveBuildingForPlayer(playerid, 620, 1447.9063, -1748.2266, 12.9063, 0.25);
	// RemoveBuildingForPlayer(playerid, 4002, 1479.8672, -1790.3984, 56.0234, 0.25);
	// RemoveBuildingForPlayer(playerid, 3980, 1481.1875, -1785.0703, 22.3828, 0.25);
	// RemoveBuildingForPlayer(playerid, 4003, 1481.0781, -1747.0313, 33.5234, 0.25);
	// RemoveBuildingForPlayer(playerid, 620, 1516.0000, -1748.6016, 13.0078, 0.25);
	// RemoveBuildingForPlayer(playerid, 4048, 1531.6328, -1852.6406, 24.5156, 0.25);
	// RemoveBuildingForPlayer(playerid, 1372, 1538.9453, -1849.2734, 12.6641, 0.25);
	// RemoveBuildingForPlayer(playerid, 1230, 1538.8359, -1847.6250, 13.6719, 0.25);
	// RemoveBuildingForPlayer(playerid, 1220, 1538.3906, -1847.9297, 12.9297, 0.25);
	// RemoveBuildingForPlayer(playerid, 1220, 1539.1016, -1847.2969, 12.9297, 0.25);
	// RemoveBuildingForPlayer(playerid, 1231, 1529.2891, -1832.9141, 15.2891, 0.25);
	// RemoveBuildingForPlayer(playerid, 620, 1549.5313, -1832.3125, 12.8828, 0.25);
	// RemoveBuildingForPlayer(playerid, 673, 1555.6641, -1830.5938, 13.0234, 0.25);
	// RemoveBuildingForPlayer(playerid, 4175, 1524.4141, -1823.8516, 15.1797, 0.25);
	// RemoveBuildingForPlayer(playerid, 700, 1554.8203, -1816.1563, 13.4766, 0.25);
	// RemoveBuildingForPlayer(playerid, 673, 1553.2578, -1764.8125, 12.7969, 0.25);
	// RemoveBuildingForPlayer(playerid, 4172, 1534.7656, -1756.1797, 15.0000, 0.25);
	// RemoveBuildingForPlayer(playerid, 620, 1533.2656, -1749.0234, 12.8047, 0.25);
	// RemoveBuildingForPlayer(playerid, 673, 1522.1641, -1748.5703, 13.0234, 0.25);
	// RemoveBuildingForPlayer(playerid, 700, 1553.7031, -1747.9375, 13.4063, 0.25);
	// 2 
	RemoveBuildingForPlayer(playerid, 4024, 1479.867, -1790.398, 56.023, 0.250);
	RemoveBuildingForPlayer(playerid, 4044, 1481.187, -1785.070, 22.382, 0.250);
	RemoveBuildingForPlayer(playerid, 4045, 1479.335, -1802.289, 12.546, 0.250);
	RemoveBuildingForPlayer(playerid, 4046, 1479.523, -1852.640, 24.515, 0.250);
	RemoveBuildingForPlayer(playerid, 4047, 1531.632, -1852.640, 24.515, 0.250);
	RemoveBuildingForPlayer(playerid, 1527, 1448.234, -1755.898, 14.523, 0.250);
	RemoveBuildingForPlayer(playerid, 4217, 1449.250, -1852.570, 22.367, 0.250);
	RemoveBuildingForPlayer(playerid, 713, 1407.195, -1749.312, 13.093, 0.250);
	RemoveBuildingForPlayer(playerid, 1266, 1482.085, -1859.968, 25.039, 0.250);
	RemoveBuildingForPlayer(playerid, 713, 1405.234, -1821.117, 13.101, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1417.976, -1832.531, 11.984, 0.250);
	RemoveBuildingForPlayer(playerid, 673, 1405.578, -1831.695, 12.398, 0.250);
	RemoveBuildingForPlayer(playerid, 1265, 1465.476, -1848.250, 12.992, 0.250);
	RemoveBuildingForPlayer(playerid, 1372, 1466.945, -1847.843, 12.664, 0.250);
	RemoveBuildingForPlayer(playerid, 1372, 1419.734, -1846.546, 12.664, 0.250);
	RemoveBuildingForPlayer(playerid, 1265, 1420.429, -1845.343, 12.984, 0.250);
	RemoveBuildingForPlayer(playerid, 1372, 1419.695, -1844.203, 12.664, 0.250);
	RemoveBuildingForPlayer(playerid, 1220, 1420.492, -1842.437, 12.929, 0.250);
	RemoveBuildingForPlayer(playerid, 1220, 1419.726, -1842.851, 12.929, 0.250);
	RemoveBuildingForPlayer(playerid, 1230, 1419.671, -1842.031, 12.976, 0.250);
	RemoveBuildingForPlayer(playerid, 4170, 1433.953, -1844.406, 21.421, 0.250);
	RemoveBuildingForPlayer(playerid, 700, 1447.101, -1832.500, 12.914, 0.250);
	RemoveBuildingForPlayer(playerid, 1231, 1432.304, -1832.914, 15.289, 0.250);
	RemoveBuildingForPlayer(playerid, 4174, 1435.765, -1823.664, 15.179, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1456.398, -1832.531, 11.984, 0.250);
	RemoveBuildingForPlayer(playerid, 673, 1464.093, -1831.882, 12.398, 0.250);
	RemoveBuildingForPlayer(playerid, 1260, 1482.085, -1859.968, 25.039, 0.250);
	RemoveBuildingForPlayer(playerid, 4004, 1479.523, -1852.640, 24.515, 0.250);
	RemoveBuildingForPlayer(playerid, 1357, 1487.695, -1848.109, 12.812, 0.250);
	RemoveBuildingForPlayer(playerid, 1372, 1486.210, -1848.125, 12.664, 0.250);
	RemoveBuildingForPlayer(playerid, 1372, 1468.062, -1847.789, 12.664, 0.250);
	RemoveBuildingForPlayer(playerid, 1230, 1488.921, -1848.273, 12.976, 0.250);
	RemoveBuildingForPlayer(playerid, 1231, 1480.031, -1832.914, 15.289, 0.250);
	RemoveBuildingForPlayer(playerid, 3997, 1479.335, -1802.289, 12.546, 0.250);
	RemoveBuildingForPlayer(playerid, 4171, 1503.398, -1848.335, 21.460, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1504.843, -1832.531, 11.984, 0.250);
	RemoveBuildingForPlayer(playerid, 673, 1499.046, -1832.273, 12.882, 0.250);
	RemoveBuildingForPlayer(playerid, 1265, 1515.382, -1850.054, 12.984, 0.250);
	RemoveBuildingForPlayer(playerid, 1265, 1514.421, -1850.039, 12.992, 0.250);
	RemoveBuildingForPlayer(playerid, 700, 1512.945, -1832.351, 13.468, 0.250);
	RemoveBuildingForPlayer(playerid, 1372, 1516.687, -1850.054, 12.664, 0.250);
	RemoveBuildingForPlayer(playerid, 700, 1404.914, -1765.265, 12.914, 0.250);
	RemoveBuildingForPlayer(playerid, 4173, 1427.273, -1756.179, 15.000, 0.250);
	RemoveBuildingForPlayer(playerid, 673, 1415.312, -1748.562, 12.398, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1429.531, -1748.421, 12.906, 0.250);
	RemoveBuildingForPlayer(playerid, 700, 1438.031, -1747.937, 13.445, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1447.906, -1748.226, 12.906, 0.250);
	RemoveBuildingForPlayer(playerid, 4002, 1479.867, -1790.398, 56.023, 0.250);
	RemoveBuildingForPlayer(playerid, 3980, 1481.187, -1785.070, 22.382, 0.250);
	RemoveBuildingForPlayer(playerid, 4003, 1481.078, -1747.031, 33.523, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1516.000, -1748.601, 13.007, 0.250);
	RemoveBuildingForPlayer(playerid, 4048, 1531.632, -1852.640, 24.515, 0.250);
	RemoveBuildingForPlayer(playerid, 1372, 1538.945, -1849.273, 12.664, 0.250);
	RemoveBuildingForPlayer(playerid, 1230, 1538.835, -1847.625, 13.671, 0.250);
	RemoveBuildingForPlayer(playerid, 1220, 1538.390, -1847.929, 12.929, 0.250);
	RemoveBuildingForPlayer(playerid, 1220, 1539.101, -1847.296, 12.929, 0.250);
	RemoveBuildingForPlayer(playerid, 1231, 1529.289, -1832.914, 15.289, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1549.531, -1832.312, 12.882, 0.250);
	RemoveBuildingForPlayer(playerid, 673, 1555.664, -1830.593, 13.023, 0.250);
	RemoveBuildingForPlayer(playerid, 4175, 1524.414, -1823.851, 15.179, 0.250);
	RemoveBuildingForPlayer(playerid, 700, 1554.820, -1816.156, 13.476, 0.250);
	RemoveBuildingForPlayer(playerid, 673, 1553.257, -1764.812, 12.796, 0.250);
	RemoveBuildingForPlayer(playerid, 4172, 1534.765, -1756.179, 15.000, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1533.265, -1749.023, 12.804, 0.250);
	RemoveBuildingForPlayer(playerid, 673, 1522.164, -1748.570, 13.023, 0.250);
	RemoveBuildingForPlayer(playerid, 700, 1553.703, -1747.937, 13.406, 0.250);

	// Военкомат
	/*RemoveBuildingForPlayer(playerid, 1297, 892.250, -1673.010, 16.234, 0.250);
	RemoveBuildingForPlayer(playerid, 1297, 881.296, -1673.010, 16.234, 0.250);
	RemoveBuildingForPlayer(playerid, 1297, 869.546, -1673.010, 16.234, 0.250);
	RemoveBuildingForPlayer(playerid, 6045, 862.351, -1682.199, 18.398, 0.250);
	RemoveBuildingForPlayer(playerid, 1297, 891.359, -1654.199, 16.234, 0.250);
	RemoveBuildingForPlayer(playerid, 6204, 880.601, -1653.770, 14.179, 0.250);
	RemoveBuildingForPlayer(playerid, 1297, 881.453, -1654.199, 16.234, 0.250);
	RemoveBuildingForPlayer(playerid, 1297, 869.085, -1654.199, 16.234, 0.250);
	RemoveBuildingForPlayer(playerid, 712, 871.882, -1642.800, 20.898, 0.250);
	RemoveBuildingForPlayer(playerid, 712, 881.781, -1642.800, 20.898, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 884.203, -1641.920, 12.796, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 875.804, -1641.920, 12.437, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 870.046, -1641.920, 12.796, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 897.429, -1641.920, 12.796, 0.250);
	RemoveBuildingForPlayer(playerid, 759, 901.539, -1641.910, 12.273, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 898.265, -1644.699, 8.210, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 906.765, -1644.699, 4.968, 0.250);
	RemoveBuildingForPlayer(playerid, 634, 901.250, -1642.660, 11.921, 0.250);
	RemoveBuildingForPlayer(playerid, 634, 887.171, -1642.660, 11.921, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 886.867, -1644.170, 8.210, 0.250);
	RemoveBuildingForPlayer(playerid, 634, 868.343, -1642.660, 11.671, 0.250);
	RemoveBuildingForPlayer(playerid, 1506, 892.898, -1635.290, 13.921, 0.250);
	RemoveBuildingForPlayer(playerid, 6041, 879.789, -1611.920, 20.710, 0.250);
	RemoveBuildingForPlayer(playerid, 6079, 879.789, -1611.920, 20.710, 0.250);
	RemoveBuildingForPlayer(playerid, 1297, 879.898, -1606.699, 15.781, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 872.046, -1596.380, 11.117, 0.250);
	RemoveBuildingForPlayer(playerid, 712, 866.484, -1603.859, 21.812, 0.250);
	RemoveBuildingForPlayer(playerid, 712, 879.648, -1587.949, 21.906, 0.250);
	//
	// parkovka_NEW
	RemoveBuildingForPlayer(playerid, 4083, 1334.976, -1644.187, 11.789, 0.250);
	RemoveBuildingForPlayer(playerid, 1530, 1332.132, -1722.304, 14.187, 0.250);
	RemoveBuildingForPlayer(playerid, 4220, 1370.640, -1643.445, 33.179, 0.250);
	RemoveBuildingForPlayer(playerid, 4106, 1342.968, -1652.265, 15.203, 0.250);
	RemoveBuildingForPlayer(playerid, 4011, 1334.976, -1644.187, 11.789, 0.250);
	RemoveBuildingForPlayer(playerid, 4121, 1336.015, -1604.734, 25.632, 0.250);

	// // автошкола outside
	// RemoveBuildingForPlayer(playerid, 11083, -2053.906, -180.835, 37.327, 0.250);
	// RemoveBuildingForPlayer(playerid, 11153, -2053.906, -180.835, 37.327, 0.250);
	// RemoveBuildingForPlayer(playerid, 11371, -2028.131, -111.273, 36.131, 0.250);
	// RemoveBuildingForPlayer(playerid, 11372, -2076.437, -107.929, 36.967, 0.250);
	// RemoveBuildingForPlayer(playerid, 11099, -2056.991, -184.546, 34.414, 0.250);
	// RemoveBuildingForPlayer(playerid, 1497, -2029.015, -120.061, 34.256, 0.250);
	// RemoveBuildingForPlayer(playerid, 11015, -2028.131, -111.273, 36.131, 0.250);
	// RemoveBuildingForPlayer(playerid, 11014, -2076.437, -107.929, 36.967, 0.250);
	// RemoveBuildingForPlayer(playerid, 1532, -2025.828, -102.468, 34.272, 0.250);
	//

	//lva
	RemoveBuildingForPlayer(playerid, 3366, 276.656, 2023.757, 16.632, 0.250);
	RemoveBuildingForPlayer(playerid, 3366, 276.656, 1989.546, 16.632, 0.250);
	RemoveBuildingForPlayer(playerid, 3366, 276.656, 1955.765, 16.632, 0.250);
	RemoveBuildingForPlayer(playerid, 16619, 199.335, 1943.875, 18.203, 0.250);
	RemoveBuildingForPlayer(playerid, 16093, 211.648, 1810.156, 20.734, 0.250);
	RemoveBuildingForPlayer(playerid, 16638, 211.726, 1809.187, 18.984, 0.250);
	RemoveBuildingForPlayer(playerid, 3279, 262.093, 1807.671, 16.820, 0.250);
	RemoveBuildingForPlayer(playerid, 1411, 347.195, 1799.265, 18.757, 0.250);
	RemoveBuildingForPlayer(playerid, 1411, 342.937, 1796.289, 18.757, 0.250);
	RemoveBuildingForPlayer(playerid, 16670, 330.789, 1813.218, 17.828, 0.250);
	RemoveBuildingForPlayer(playerid, 3279, 113.382, 1814.453, 16.820, 0.250);
	RemoveBuildingForPlayer(playerid, 3279, 165.953, 1849.992, 16.820, 0.250);
	RemoveBuildingForPlayer(playerid, 1697, 220.382, 1835.343, 23.234, 0.250);
	RemoveBuildingForPlayer(playerid, 1697, 228.796, 1835.343, 23.234, 0.250);
	RemoveBuildingForPlayer(playerid, 1697, 236.992, 1835.343, 23.234, 0.250);
	RemoveBuildingForPlayer(playerid, 16095, 279.132, 1829.781, 16.632, 0.250);
	RemoveBuildingForPlayer(playerid, 16094, 191.140, 1870.039, 21.476, 0.250);
	RemoveBuildingForPlayer(playerid, 3279, 103.890, 1901.101, 16.820, 0.250);
	RemoveBuildingForPlayer(playerid, 3279, 161.906, 1933.093, 16.820, 0.250);
	RemoveBuildingForPlayer(playerid, 16323, 199.335, 1943.875, 18.203, 0.250);
	RemoveBuildingForPlayer(playerid, 16671, 193.953, 2051.796, 20.179, 0.250);
	RemoveBuildingForPlayer(playerid, 3279, 233.429, 1934.843, 16.820, 0.250);
	RemoveBuildingForPlayer(playerid, 3279, 267.062, 1895.296, 16.820, 0.250);
	RemoveBuildingForPlayer(playerid, 3268, 276.656, 2023.757, 16.632, 0.250);
	RemoveBuildingForPlayer(playerid, 3268, 276.656, 1989.546, 16.632, 0.250);
	RemoveBuildingForPlayer(playerid, 3268, 276.656, 1955.765, 16.632, 0.250);
	RemoveBuildingForPlayer(playerid, 16669, 380.257, 1914.959, 17.429, 0.250);
	RemoveBuildingForPlayer(playerid, 16668, 357.937, 2049.419, 16.843, 0.250);
	RemoveBuildingForPlayer(playerid, 3279, 161.906, 1933.089, 16.820, 0.250);
	// //sfa
    RemoveBuildingForPlayer(playerid, 968, -1526.437, 481.382, 6.906, 0.250);
	RemoveBuildingForPlayer(playerid, 966, -1526.390, 481.382, 6.179, 0.250);
	RemoveBuildingForPlayer(playerid, 10829, -1523.257, 486.796, 6.156, 0.250);
	RemoveBuildingForPlayer(playerid, 10825, -1412.290, 351.445, 13.710, 0.250);
	RemoveBuildingForPlayer(playerid, 10826, -1407.000, 390.960, 13.101, 0.250);
	RemoveBuildingForPlayer(playerid, 10898, -1407.000, 390.960, 13.101, 0.250);
	RemoveBuildingForPlayer(playerid, 10824, -1409.900, 389.476, 8.179, 0.250);
	RemoveBuildingForPlayer(playerid, 10900, -1409.900, 389.476, 8.179, 0.250);

	// //АШ
	RemoveBuildingForPlayer(playerid, 6491, 717.484, -1357.304, 20.296, 0.250);
	RemoveBuildingForPlayer(playerid, 1689, 650.835, -1377.664, 21.757, 0.250);
	RemoveBuildingForPlayer(playerid, 1689, 650.835, -1356.585, 21.757, 0.250);
	RemoveBuildingForPlayer(playerid, 1689, 650.835, -1338.242, 21.757, 0.250);
	RemoveBuildingForPlayer(playerid, 1635, 677.195, -1328.875, 25.109, 0.250);
	RemoveBuildingForPlayer(playerid, 1689, 745.585, -1381.109, 25.875, 0.250);
	RemoveBuildingForPlayer(playerid, 1689, 751.335, -1368.031, 25.875, 0.250);
	RemoveBuildingForPlayer(playerid, 6490, 717.484, -1357.304, 20.296, 0.250);
	RemoveBuildingForPlayer(playerid, 6516, 717.687, -1357.281, 18.046, 0.250);
	RemoveBuildingForPlayer(playerid, 1635, 696.195, -1328.875, 25.109, 0.250);
	RemoveBuildingForPlayer(playerid, 1635, 702.234, -1328.875, 25.109, 0.250);
	RemoveBuildingForPlayer(playerid, 1635, 721.210, -1328.875, 25.109, 0.250);
	RemoveBuildingForPlayer(playerid, 1415, 732.851, -1332.898, 12.687, 0.250);
	RemoveBuildingForPlayer(playerid, 1439, 732.726, -1341.773, 12.632, 0.250);
	//farm
	RemoveBuildingForPlayer(playerid, 3376, -96.0859, 3.1953, 6.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 3375, -96.0859, 3.1953, 6.6953, 0.25);*/
	//post
	RemoveBuildingForPlayer(playerid, 17002, 52.890, -1532.031, 7.742, 0.250);

	// parkovka mayor
	/*RemoveBuildingForPlayer(playerid, 4057, 1479.554, -1693.140, 19.578, 0.250);
	RemoveBuildingForPlayer(playerid, 4210, 1479.562, -1631.453, 12.078, 0.250);
	RemoveBuildingForPlayer(playerid, 713, 1457.937, -1620.695, 13.453, 0.250);
	RemoveBuildingForPlayer(playerid, 713, 1496.867, -1707.820, 13.406, 0.250);
	RemoveBuildingForPlayer(playerid, 1283, 1430.171, -1719.468, 15.625, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 1451.625, -1727.671, 16.421, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 1467.984, -1727.671, 16.421, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 1485.171, -1727.671, 16.421, 0.250);
	RemoveBuildingForPlayer(playerid, 1280, 1468.984, -1713.507, 13.453, 0.250);
	RemoveBuildingForPlayer(playerid, 1231, 1479.695, -1716.703, 15.625, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 1505.179, -1727.671, 16.421, 0.250);
	RemoveBuildingForPlayer(playerid, 1280, 1488.765, -1713.703, 13.453, 0.250);
	RemoveBuildingForPlayer(playerid, 1289, 1504.750, -1711.882, 13.593, 0.250);
	RemoveBuildingForPlayer(playerid, 1258, 1445.007, -1704.765, 13.695, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 1433.710, -1702.359, 16.421, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 1433.710, -1676.687, 16.421, 0.250);
	RemoveBuildingForPlayer(playerid, 1258, 1445.007, -1692.234, 13.695, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 1433.710, -1656.250, 16.421, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 1433.710, -1636.234, 16.421, 0.250);
	RemoveBuildingForPlayer(playerid, 712, 1445.812, -1650.023, 22.257, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 1433.710, -1619.054, 16.421, 0.250);
	RemoveBuildingForPlayer(playerid, 673, 1457.726, -1710.062, 12.398, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1461.656, -1707.687, 11.835, 0.250);
	RemoveBuildingForPlayer(playerid, 1280, 1468.984, -1704.640, 13.453, 0.250);
	RemoveBuildingForPlayer(playerid, 700, 1463.062, -1701.570, 13.726, 0.250);
	RemoveBuildingForPlayer(playerid, 1231, 1479.695, -1702.531, 15.625, 0.250);
	RemoveBuildingForPlayer(playerid, 673, 1457.554, -1697.289, 12.398, 0.250);
	RemoveBuildingForPlayer(playerid, 1280, 1468.984, -1694.046, 13.453, 0.250);
	RemoveBuildingForPlayer(playerid, 1231, 1479.382, -1692.390, 15.632, 0.250);
	RemoveBuildingForPlayer(playerid, 4186, 1479.554, -1693.140, 19.578, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1461.125, -1687.562, 11.835, 0.250);
	RemoveBuildingForPlayer(playerid, 700, 1463.062, -1690.648, 13.726, 0.250);
	RemoveBuildingForPlayer(playerid, 641, 1458.617, -1684.132, 11.101, 0.250);
	RemoveBuildingForPlayer(playerid, 625, 1457.273, -1666.296, 13.695, 0.250);
	RemoveBuildingForPlayer(playerid, 1280, 1468.984, -1682.718, 13.453, 0.250);
	RemoveBuildingForPlayer(playerid, 712, 1471.406, -1666.179, 22.257, 0.250);
	RemoveBuildingForPlayer(playerid, 1231, 1479.382, -1682.312, 15.632, 0.250);
	RemoveBuildingForPlayer(playerid, 625, 1458.257, -1659.257, 13.695, 0.250);
	RemoveBuildingForPlayer(playerid, 712, 1449.851, -1655.937, 22.257, 0.250);
	RemoveBuildingForPlayer(playerid, 1231, 1477.937, -1652.726, 15.632, 0.250);
	RemoveBuildingForPlayer(playerid, 1280, 1479.609, -1653.250, 13.453, 0.250);
	RemoveBuildingForPlayer(playerid, 625, 1457.351, -1650.570, 13.695, 0.250);
	RemoveBuildingForPlayer(playerid, 625, 1454.421, -1642.492, 13.695, 0.250);
	RemoveBuildingForPlayer(playerid, 1280, 1467.851, -1646.593, 13.453, 0.250);
	RemoveBuildingForPlayer(playerid, 1280, 1472.898, -1651.507, 13.453, 0.250);
	RemoveBuildingForPlayer(playerid, 1280, 1465.937, -1639.820, 13.453, 0.250);
	RemoveBuildingForPlayer(playerid, 1231, 1466.468, -1637.960, 15.632, 0.250);
	RemoveBuildingForPlayer(playerid, 625, 1449.593, -1635.046, 13.695, 0.250);
	RemoveBuildingForPlayer(playerid, 1280, 1467.710, -1632.890, 13.453, 0.250);
	RemoveBuildingForPlayer(playerid, 1232, 1465.890, -1629.976, 15.531, 0.250);
	RemoveBuildingForPlayer(playerid, 1280, 1472.664, -1627.882, 13.453, 0.250);
	RemoveBuildingForPlayer(playerid, 1280, 1479.468, -1626.023, 13.453, 0.250);
	RemoveBuildingForPlayer(playerid, 3985, 1479.562, -1631.453, 12.078, 0.250);
	RemoveBuildingForPlayer(playerid, 4206, 1479.554, -1639.609, 13.648, 0.250);
	RemoveBuildingForPlayer(playerid, 1232, 1465.835, -1608.375, 15.375, 0.250);
	RemoveBuildingForPlayer(playerid, 1229, 1466.484, -1598.093, 14.109, 0.250);
	RemoveBuildingForPlayer(playerid, 1280, 1488.765, -1704.593, 13.453, 0.250);
	RemoveBuildingForPlayer(playerid, 700, 1494.210, -1694.437, 13.726, 0.250);
	RemoveBuildingForPlayer(playerid, 1280, 1488.765, -1693.734, 13.453, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1496.976, -1686.851, 11.835, 0.250);
	RemoveBuildingForPlayer(playerid, 641, 1494.140, -1689.234, 11.101, 0.250);
	RemoveBuildingForPlayer(playerid, 1280, 1488.765, -1682.671, 13.453, 0.250);
	RemoveBuildingForPlayer(playerid, 712, 1480.609, -1666.179, 22.257, 0.250);
	RemoveBuildingForPlayer(playerid, 712, 1488.226, -1666.179, 22.257, 0.250);
	RemoveBuildingForPlayer(playerid, 1280, 1486.406, -1651.390, 13.453, 0.250);
	RemoveBuildingForPlayer(playerid, 1280, 1491.367, -1646.382, 13.453, 0.250);
	RemoveBuildingForPlayer(playerid, 1280, 1493.132, -1639.453, 13.453, 0.250);
	RemoveBuildingForPlayer(playerid, 1280, 1486.179, -1627.765, 13.453, 0.250);
	RemoveBuildingForPlayer(playerid, 1280, 1491.218, -1632.679, 13.453, 0.250);
	RemoveBuildingForPlayer(playerid, 1232, 1494.414, -1629.976, 15.531, 0.250);
	RemoveBuildingForPlayer(playerid, 1232, 1494.359, -1608.375, 15.375, 0.250);
	RemoveBuildingForPlayer(playerid, 1229, 1498.054, -1598.093, 14.109, 0.250);
	RemoveBuildingForPlayer(playerid, 1288, 1504.750, -1705.406, 13.593, 0.250);
	RemoveBuildingForPlayer(playerid, 1287, 1504.750, -1704.468, 13.593, 0.250);
	RemoveBuildingForPlayer(playerid, 1286, 1504.750, -1695.054, 13.593, 0.250);
	RemoveBuildingForPlayer(playerid, 1285, 1504.750, -1694.039, 13.593, 0.250);
	RemoveBuildingForPlayer(playerid, 673, 1498.960, -1684.609, 12.398, 0.250);
	RemoveBuildingForPlayer(playerid, 625, 1504.164, -1662.015, 13.695, 0.250);
	RemoveBuildingForPlayer(playerid, 625, 1504.718, -1670.921, 13.695, 0.250);
	RemoveBuildingForPlayer(playerid, 620, 1503.187, -1621.125, 11.835, 0.250);
	RemoveBuildingForPlayer(playerid, 673, 1501.281, -1624.578, 12.398, 0.250);
	RemoveBuildingForPlayer(playerid, 673, 1498.359, -1616.968, 12.398, 0.250);
	RemoveBuildingForPlayer(playerid, 712, 1508.445, -1668.742, 22.257, 0.250);
	RemoveBuildingForPlayer(playerid, 625, 1505.695, -1654.835, 13.695, 0.250);
	RemoveBuildingForPlayer(playerid, 625, 1508.515, -1647.859, 13.695, 0.250);
	RemoveBuildingForPlayer(playerid, 625, 1513.273, -1642.492, 13.695, 0.250);
	RemoveBuildingForPlayer(playerid, 1258, 1510.890, -1607.312, 13.695, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 1524.828, -1721.632, 16.421, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 1524.828, -1705.273, 16.421, 0.250);
	RemoveBuildingForPlayer(playerid, 1229, 1524.218, -1693.968, 14.109, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 1524.828, -1688.085, 16.421, 0.250);
	RemoveBuildingForPlayer(playerid, 1229, 1524.218, -1673.710, 14.109, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 1524.828, -1668.078, 16.421, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 1524.828, -1647.640, 16.421, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 1524.828, -1621.960, 16.421, 0.250);
	RemoveBuildingForPlayer(playerid, 1226, 1525.382, -1611.156, 16.421, 0.250);
	RemoveBuildingForPlayer(playerid, 1283, 1528.953, -1605.859, 15.625, 0.250);*/
	//


	//ЖДЛВ
	//RemoveBuildingForPlayer(playerid, 8577, 2809.320, 1303.187, 10.546, 0.250);
	//RemoveBuildingForPlayer(playerid, 8740, 2798.632, 1246.664, 17.109, 0.250);
	// RemoveBuildingForPlayer(playerid, 8741, 2842.578, 1290.789, 16.140, 0.250);
	//RemoveBuildingForPlayer(playerid, 8743, 2809.320, 1303.187, 10.546, 0.250);
	//RemoveBuildingForPlayer(playerid, 710, 2819.710, 1299.000, 25.421, 0.250);
	//RemoveBuildingForPlayer(playerid, 710, 2819.710, 1281.156, 25.421, 0.250);
	//RemoveBuildingForPlayer(playerid, 8578, 2798.632, 1246.664, 17.109, 0.250);
	// RemoveBuildingForPlayer(playerid, 963, 2842.000, 1252.546, 11.445, 0.250);
	// RemoveBuildingForPlayer(playerid, 963, 2855.812, 1267.039, 11.445, 0.250);
	// RemoveBuildingForPlayer(playerid, 963, 2842.000, 1276.304, 11.445, 0.250);
	//RemoveBuildingForPlayer(playerid, 647, 2819.218, 1284.812, 11.335, 0.250);
	//RemoveBuildingForPlayer(playerid, 647, 2819.218, 1277.617, 11.335, 0.250);
	// RemoveBuildingForPlayer(playerid, 8575, 2842.578, 1290.789, 16.140, 0.250);
	//RemoveBuildingForPlayer(playerid, 647, 2819.218, 1291.476, 11.335, 0.250);
	//RemoveBuildingForPlayer(playerid, 956, 2845.726, 1295.046, 10.789, 0.250);
	//RemoveBuildingForPlayer(playerid, 647, 2819.218, 1300.304, 11.335, 0.250);
	//RemoveBuildingForPlayer(playerid, 647, 2819.218, 1296.390, 11.335, 0.250);
	//RemoveBuildingForPlayer(playerid, 647, 2819.218, 1304.781, 11.335, 0.250);
	// RemoveBuildingForPlayer(playerid, 962, 2855.812, 1314.625, 11.445, 0.250);
	// RemoveBuildingForPlayer(playerid, 962, 2842.000, 1324.039, 11.445, 0.250);
	//RemoveBuildingForPlayer(playerid, 962, 2842.000, 1303.976, 11.445, 0.250);

	
	//ЖДСФ
	// RemoveBuildingForPlayer(playerid, 11311, -1968.562, 139.109, 31.867, 0.250);
	// RemoveBuildingForPlayer(playerid, 11352, -1972.484, 136.375, 30.828, 0.250);
	// RemoveBuildingForPlayer(playerid, 625, -1961.757, 114.195, 27.523, 0.250);
	// RemoveBuildingForPlayer(playerid, 1256, -1970.445, 129.460, 27.343, 0.250);
	// RemoveBuildingForPlayer(playerid, 1256, -1967.984, 129.460, 27.343, 0.250);
	// RemoveBuildingForPlayer(playerid, 1256, -1970.445, 123.875, 27.343, 0.250);
	// RemoveBuildingForPlayer(playerid, 1256, -1967.984, 123.875, 27.343, 0.250);
	// RemoveBuildingForPlayer(playerid, 11305, -1968.562, 139.109, 31.867, 0.250);
	// RemoveBuildingForPlayer(playerid, 11324, -1969.671, 137.859, 34.460, 0.250);
	// RemoveBuildingForPlayer(playerid, 1256, -1970.445, 140.640, 27.343, 0.250);
	// RemoveBuildingForPlayer(playerid, 1256, -1967.984, 140.640, 27.343, 0.250);
	// RemoveBuildingForPlayer(playerid, 1256, -1970.445, 135.046, 27.343, 0.250);
	// RemoveBuildingForPlayer(playerid, 1256, -1967.984, 135.046, 27.343, 0.250);
	// RemoveBuildingForPlayer(playerid, 1264, -1980.914, 149.562, 27.039, 0.250);
	// RemoveBuildingForPlayer(playerid, 1264, -1980.914, 148.078, 27.039, 0.250);
	// RemoveBuildingForPlayer(playerid, 1264, -1981.437, 148.921, 27.039, 0.250);
	// RemoveBuildingForPlayer(playerid, 955, -1980.789, 142.664, 27.070, 0.250);
	// RemoveBuildingForPlayer(playerid, 1256, -1970.445, 151.812, 27.343, 0.250);
	// RemoveBuildingForPlayer(playerid, 1256, -1967.984, 151.812, 27.343, 0.250);
	// RemoveBuildingForPlayer(playerid, 1256, -1970.445, 146.226, 27.343, 0.250);
	// RemoveBuildingForPlayer(playerid, 1256, -1967.984, 146.226, 27.343, 0.250);
	// RemoveBuildingForPlayer(playerid, 1264, -1977.320, 162.570, 27.039, 0.250);
	// RemoveBuildingForPlayer(playerid, 10932, -1941.460, 138.000, 32.640, 0.250);
	// RemoveBuildingForPlayer(playerid, 11217, -1941.460, 138.000, 32.640, 0.250);
	// RemoveBuildingForPlayer(playerid, 11354, -1921.890, 137.882, 29.757, 0.250);
	// RemoveBuildingForPlayer(playerid, 11353, -1921.890, 137.882, 29.757, 0.250);

	
	//ЖДЛС

	//	RemoveBuildingForPlayer(playerid, 4961, 1745.199, -1882.849, 26.140, 0.250);
	// RemoveBuildingForPlayer(playerid, 5033, 1745.199, -1882.849, 26.140, 0.250);
	// RemoveBuildingForPlayer(playerid, 5055, 1745.199, -1882.849, 26.140, 0.250);
	// RemoveBuildingForPlayer(playerid, 5024, 1748.8438, -1883.0313, 14.1875, 0.25);
	

	// JD ls 2 (spawn)
	RemoveBuildingForPlayer(playerid, 5199, 1982.640, -2038.164, 14.789, 0.250);
	RemoveBuildingForPlayer(playerid, 5201, 1988.140, -2003.421, 15.773, 0.250);
	RemoveBuildingForPlayer(playerid, 5313, 2043.992, -2016.867, 25.054, 0.250);
	RemoveBuildingForPlayer(playerid, 5316, 2043.992, -2016.867, 25.054, 0.250);
	RemoveBuildingForPlayer(playerid, 5346, 2016.312, -1968.921, 17.625, 0.250);
	RemoveBuildingForPlayer(playerid, 5337, 1995.437, -2066.148, 18.531, 0.250);
	RemoveBuildingForPlayer(playerid, 5375, 1995.437, -2066.148, 18.531, 0.250);
	RemoveBuildingForPlayer(playerid, 1532, 1977.054, -2035.890, 12.539, 0.250);
	RemoveBuildingForPlayer(playerid, 5140, 1982.640, -2038.164, 14.789, 0.250);
	RemoveBuildingForPlayer(playerid, 1306, 2001.023, -2024.289, 19.750, 0.250);
	RemoveBuildingForPlayer(playerid, 5136, 1988.140, -2003.421, 15.773, 0.250);
	RemoveBuildingForPlayer(playerid, 5312, 2068.960, -2013.476, 24.156, 0.250);
	RemoveBuildingForPlayer(playerid, 1412, 1989.085, -1982.476, 13.820, 0.250);
	RemoveBuildingForPlayer(playerid, 1412, 1983.812, -1982.476, 13.820, 0.250);
	RemoveBuildingForPlayer(playerid, 1412, 1978.531, -1982.476, 13.820, 0.250);
	RemoveBuildingForPlayer(playerid, 3567, 1986.570, -1974.492, 13.257, 0.250);
	RemoveBuildingForPlayer(playerid, 5153, 1975.710, -1974.507, 13.117, 0.250);
	RemoveBuildingForPlayer(playerid, 3567, 2004.492, -1974.492, 13.257, 0.250);
	RemoveBuildingForPlayer(playerid, 3567, 2008.625, -1974.546, 15.023, 0.250);
	RemoveBuildingForPlayer(playerid, 5152, 1997.765, -1974.468, 14.875, 0.250);
	RemoveBuildingForPlayer(playerid, 3286, 2042.195, -1986.085, 38.328, 0.250);
	RemoveBuildingForPlayer(playerid, 5169, 2016.312, -1968.921, 17.625, 0.250);
	RemoveBuildingForPlayer(playerid, 1308, 1971.460, -1980.609, 12.640, 0.250);
	RemoveBuildingForPlayer(playerid, 3744, 2072.546, -1967.601, 15.117, 0.250);
	RemoveBuildingForPlayer(playerid, 3574, 2072.546, -1967.601, 15.117, 0.250);
}

stock FormatInt(number, const separator[] = ",")
{
    new output[15];
    format(output, sizeof(output), "%d", number);
    for(new i = strlen(output) - 3; i > 0 && output[i-1] != '-'; i -= 3)
    {
        strins(output, separator, i);
    }
    return output;
}

stock UpdateBusiness(business_id_update)
{
	new biztext[320];
	if(!BI[business_id_update][bOwner])
	{
		format(biztext, sizeof(biztext), ""CONTRASTORANGE_HEX"%s"WHITE_HEX"\n\
		"SERVER_HEX"Номер: "WHITE_HEX"%d\n\
		"SERVER_HEX"Статус: "WHITE_HEX"%s\n\
		Чтобы войти используй "YELLOW_HEX"\"ALT\"\n\n\
		"SERVER_HEX"Стоимость: "GREEN_HEX"%d$\n\
		"SERVER_HEX"Стоимость оплаты аренды: "GREEN_HEX"%d$\n\
		"SERVER_HEX"Чтобы приобрести используй "YELLOW_HEX"/buybusiness", BI[business_id_update][bName], BI[business_id_update][bID], (BI[business_id_update][bLock] == 1) ? (""DEFAULTRED_HEX"Закрыто"WHITE_HEX"") : (""GREEN_HEX"Открыто"WHITE_HEX""), BI[business_id_update][bCost], BI[business_id_update][bDice]);
	}
	if(BI[business_id_update][bOwner])
	{
		format(biztext, sizeof(biztext), ""CONTRASTORANGE_HEX"%s"WHITE_HEX"\n\
		"SERVER_HEX"Номер: "WHITE_HEX"%d\n\
		"SERVER_HEX"Статус: "WHITE_HEX"%s\n\
		"SERVER_HEX"Владелец: "WHITE_HEX"%s\n\
		Чтобы войти используй "YELLOW_HEX"ALT", BI[business_id_update][bName], BI[business_id_update][bID], (BI[business_id_update][bLock] == 1) ? (""DEFAULTRED_HEX"Закрыто"WHITE_HEX"") : (""GREEN_HEX"Открыто"WHITE_HEX""), BI[business_id_update][bOwner]);
	}
	if(!BI[business_id_update][b3DText])
	{
		BI[business_id_update][b3DText] = CreateDynamic3DTextLabel(biztext, WHITE_FORMAT, BI[business_id_update][bPosX], BI[business_id_update][bPosY], BI[business_id_update][bPosZ], 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0, 0);
	}
	UpdateDynamic3DTextLabelText(BI[business_id_update][b3DText], WHITE_FORMAT, biztext);
	if(BI[business_id_update][bType] == 2)
	{
		format(biztext, sizeof(biztext), ""CONTRASTORANGE_HEX"%s"WHITE_HEX"\n\
		"SERVER_HEX"Номер: "WHITE_HEX"%d\n\
		"SERVER_HEX"Статус: "WHITE_HEX"%s\n\
		Чтобы заправить транспорт используй команду "YELLOW_HEX"/fill", BI[business_id_update][bName], BI[business_id_update][bID], (BI[business_id_update][bLock] == 1) ? (""DEFAULTRED_HEX"Закрыто"WHITE_HEX"") : (""GREEN_HEX"Открыто"WHITE_HEX""));
		if(!BI[business_id_update][b3DTextFuel])
		{
			BI[business_id_update][b3DTextFuel] = CreateDynamic3DTextLabel(biztext, WHITE_FORMAT, BI[business_id_update][bFuelPosX], BI[business_id_update][bFuelPosY], BI[business_id_update][bFuelPosZ]+1.5, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0, 0);
		}
		UpdateDynamic3DTextLabelText(BI[business_id_update][b3DTextFuel], WHITE_FORMAT, biztext);
	}
	return 1;
}

stock ClearBusiness(business_id_clear)
{
	foreach(new i : Player)
	{
		if(!GetPVarInt(i, "inbusiness") || !pLoggedIn{i} || !IsPlayerConnected(i)) continue;
		if(PI[i][pVW] == business_id_clear && PI[i][pInt] == BI[business_id_clear][bInt]) SetPlayerPosEx(i, BI[business_id_clear][bPosX], BI[business_id_clear][bPosY], BI[business_id_clear][bPosZ], 0.0, 0, 0, 0, 0);
	}
	new bizname[30];
	switch(BI[business_id_clear][bType])
	{
		case 1: format(bizname, sizeof(bizname), "Магазин 24/7");
		case 2: 
		{
			format(bizname, sizeof(bizname), "АЗС");
			BI[business_id_clear][bFuelPrice] = 20;
		}
		case 3: format(bizname, sizeof(bizname), "Ammo San Andreas");
		case 4: format(bizname, sizeof(bizname), "Магазин одежды");
	}
	BI[business_id_clear][bProdsPrice] = 50;
	BI[business_id_clear][bIncomeDay]  = 0;
	BI[business_id_clear][bName] 	   = bizname;
	BI[business_id_clear][bProds] 	   = 100000;
	BI[business_id_clear][bMoney] 	   = 0;
	BI[business_id_clear][bDays]  	   = 0;
	BI[business_id_clear][bLock]  	   = 0;
	BI[business_id_clear][bOwner][0]   = EOS;
	return 1;
}

stock ClearHouse(house_id_clear)
{
	foreach(new i : Player)
	{
		if(!pLoggedIn{i} || !IsPlayerConnected(i)) continue;
		if(!GetPVarInt(i, "inhouse")) continue;
		if(PI[i][pVW] == house_id_clear && PI[i][pInt] == HI[house_id_clear][hInt]) SetPlayerPosEx(i, HI[house_id_clear][hPosX], HI[house_id_clear][hPosY], HI[house_id_clear][hPosZ], 0.0, 0, 0, 0, 0);
	}
	HI[house_id_clear][hLock]     		= 1;
	HI[house_id_clear][hMats]     		= 0;
	HI[house_id_clear][hDrugs]    		= 0;
	HI[house_id_clear][hDeagle]   		= 0;
	HI[house_id_clear][hAK47]    	 	= 0;
	HI[house_id_clear][hMoney]    		= 0;
	HI[house_id_clear][hShotgun]  		= 0;
	HI[house_id_clear][hM4]		 		= 0;
	HI[house_id_clear][hSdpistol] 		= 0;
	HI[house_id_clear][hRifle]			= 0;
	HI[house_id_clear][hMP5]		 	= 0;
	HI[house_id_clear][hOwner]    		= 0;
	HI[house_id_clear][hSafe]     		= 0;
	HI[house_id_clear][hSignal]   		= 0;
	HI[house_id_clear][hCupboardBought]	= 0;
	HI[house_id_clear][hDays]     		= 0;
	for(new i=0; i < 3; i++) HI[house_id_clear][hCupboard][i] = 0;
	return 1;
}

stock SaveHouse(house_id_save)
{
	if(HI[house_id_save][hCupboardBought])
	{
		new house_cb[18];
		format(house_cb, sizeof(house_cb), "%d, %d, %d", HI[house_id_save][hCupboard][0], HI[house_id_save][hCupboard][1], HI[house_id_save][hCupboard][2]);
		query[0]=EOS;
		mysql_format(connects, query, 510, "UPDATE "TABLE_HOUSES" SET `id` = '%d', `hOwner` = '%s', `hLock` = '%d', `hSafe` = '%d', `hSignal` = '%d', `hDays` = '%d', `hMats` = '%d', `hMoney` = '%d', `hHeal` = '%d', `hDrugs` = '%d', `hDeagle` = '%d', `hAK47` = '%d', `hShotgun` = '%d', `hM4` = '%d', `hSdpistol` = '%d', `hRifle` = '%d', `hMP5` = '%d', `hCost` = '%d', `hType` = '%d', `hDice` = '%d', `hCupboardBought` = '%d', `hCupboard` = '%s' WHERE `id` = '%d' LIMIT 1", HI[house_id_save][hID], HI[house_id_save][hOwner], HI[house_id_save][hLock], HI[house_id_save][hSafe], HI[house_id_save][hSignal], HI[house_id_save][hDays], HI[house_id_save][hMats], HI[house_id_save][hMoney], HI[house_id_save][hHeal], HI[house_id_save][hDrugs], HI[house_id_save][hDeagle], HI[house_id_save][hAK47], HI[house_id_save][hShotgun], HI[house_id_save][hM4], HI[house_id_save][hSdpistol], HI[house_id_save][hRifle], HI[house_id_save][hMP5], HI[house_id_save][hCost], HI[house_id_save][hType], HI[house_id_save][hDice], HI[house_id_save][hCupboardBought], house_cb, house_id_save);
	}
	else
	{
		query[0]=EOS;
		mysql_format(connects, query, 510, "UPDATE "TABLE_HOUSES" SET `id` = '%d', `hOwner` = '%s', `hLock` = '%d', `hSafe` = '%d', `hSignal` = '%d', `hDays` = '%d', `hMats` = '%d', `hMoney` = '%d', `hHeal` = '%d', `hDrugs` = '%d', `hDeagle` = '%d', `hAK47` = '%d', `hShotgun` = '%d', `hM4` = '%d', `hSdpistol` = '%d', `hRifle` = '%d', `hMP5` = '%d', `hCost` = '%d', `hType` = '%d', `hDice` = '%d' WHERE `id` = '%d' LIMIT 1", HI[house_id_save][hID], HI[house_id_save][hOwner], HI[house_id_save][hLock], HI[house_id_save][hSafe], HI[house_id_save][hSignal], HI[house_id_save][hDays], HI[house_id_save][hMats], HI[house_id_save][hMoney], HI[house_id_save][hHeal], HI[house_id_save][hDrugs], HI[house_id_save][hDeagle], HI[house_id_save][hAK47], HI[house_id_save][hShotgun], HI[house_id_save][hM4], HI[house_id_save][hSdpistol], HI[house_id_save][hRifle], HI[house_id_save][hMP5], HI[house_id_save][hCost], HI[house_id_save][hType], HI[house_id_save][hDice], house_id_save);
	}
	return mysql_tquery(connects, query);
}

stock SaveBusiness(business_id_save)
{
	switch(BI[business_id_save][bType])
	{
		case 2:
		{
			query[0]=EOS;
			mysql_format(connects, query, 300, "UPDATE "TABLE_BUSINESS" SET `id` = '%d', `bOwner` = '%s', `bLock` = '%d', `bName` = '%s', `bDays` = '%d', `bProds` = '%d', `bProdsPrice` = '%d', `bFuelPrice` = '%d', `bDice` = '%d', `bCost` = '%d', `bMoney` = '%d' WHERE `id` = '%d' LIMIT 1", BI[business_id_save][bID], BI[business_id_save][bOwner], BI[business_id_save][bLock], BI[business_id_save][bName], BI[business_id_save][bDays], BI[business_id_save][bProds], BI[business_id_save][bProdsPrice], BI[business_id_save][bFuelPrice], BI[business_id_save][bDice], BI[business_id_save][bCost], BI[business_id_save][bMoney], business_id_save);
		}
		default:
		{
			query[0]=EOS;
			mysql_format(connects, query, 300, "UPDATE "TABLE_BUSINESS" SET `id` = '%d', `bOwner` = '%s', `bLock` = '%d', `bName` = '%s', `bDays` = '%d', `bProds` = '%d', `bProdsPrice` = '%d', `bDice` = '%d', `bCost` = '%d', `bMoney` = '%d' WHERE `id` = '%d' LIMIT 1", BI[business_id_save][bID], BI[business_id_save][bOwner], BI[business_id_save][bLock], BI[business_id_save][bName], BI[business_id_save][bDays], BI[business_id_save][bProds], BI[business_id_save][bProdsPrice], BI[business_id_save][bDice], BI[business_id_save][bCost], BI[business_id_save][bMoney], business_id_save);
		}
	}
	return mysql_tquery(connects, query);
}

stock SaveHouseSafeWeapon(house_id_save_safe_weapon)
{
	query[0]=EOS;
	mysql_format(connects, query, 150, "UPDATE "TABLE_HOUSES" SET `hDeagle` = '%d', `hAK47` = '%d', `hShotgun` = '%d', `hM4` = '%d', `hSdpistol` = '%d', `hRifle` = '%d', `hMP5` = '%d' WHERE `id` = '%d' LIMIT 1", HI[house_id_save_safe_weapon][hDeagle], HI[house_id_save_safe_weapon][hAK47], HI[house_id_save_safe_weapon][hShotgun], HI[house_id_save_safe_weapon][hM4], HI[house_id_save_safe_weapon][hSdpistol], HI[house_id_save_safe_weapon][hRifle], HI[house_id_save_safe_weapon][hMP5], house_id_save_safe_weapon);
	return mysql_tquery(connects, query);
}

stock SaveHouseCupboard(house_save_cb)
{
	new save_cb[30];
	format(save_cb, sizeof(save_cb), "%d, %d, %d", HI[house_save_cb][hCupboard][0], HI[house_save_cb][hCupboard][1], HI[house_save_cb][hCupboard][2]);
	query[0]=EOS;
	mysql_format(connects, query, 120, "UPDATE "TABLE_HOUSES" SET `hCupboard` = '%s', `hCupboardBought` = '%d' WHERE `id` = '%d' LIMIT 1", save_cb, HI[house_save_cb][hCupboardBought], house_save_cb);
	return mysql_tquery(connects, query);
}

stock SaveHouseInt(id, const field[], value)
{
	query[0]=EOS;
	mysql_format(connects, query, 100, "UPDATE "TABLE_HOUSES" SET `%s` = '%d' WHERE `id` = '%d' LIMIT 1", field, value, id);
	return mysql_tquery(connects, query);
}

stock SaveHouseInts(id, const fieldFirst[], valueFirst, const fieldSecond[], valueSecond)
{
	query[0]=EOS;
	mysql_format(connects, query, 120, "UPDATE "TABLE_HOUSES" SET `%s` = '%d', `%s` = '%d' WHERE `id` = '%d' LIMIT 1", fieldFirst, valueFirst, fieldSecond, valueSecond, id);
	return mysql_tquery(connects, query);
}

stock SaveHouseStr(id, const field[], value[])
{
	query[0]=EOS;
	mysql_format(connects, query, 100, "UPDATE "TABLE_HOUSES" SET `%s` = '%s' WHERE `id` = '%d' LIMIT 1", field, value, id);
	return mysql_tquery(connects, query);
}

stock SaveBusinessInt(id, const field[], value)
{
	query[0]=EOS;
	mysql_format(connects, query, 100, "UPDATE "TABLE_BUSINESS" SET `%s` = '%d' WHERE `id` = '%d' LIMIT 1", field, value, id);
	return mysql_tquery(connects, query);
}

stock SaveBusinessInts(id, const fieldFirst[], valueFirst, const fieldSecond[], valueSecond)
{
	query[0]=EOS;
	mysql_format(connects, query, 100, "UPDATE "TABLE_BUSINESS" SET `%s` = '%d', `%s` = '%d' WHERE `id` = '%d' LIMIT 1", fieldFirst, valueFirst, fieldSecond, valueSecond, id);
	return mysql_tquery(connects, query);
}

stock SaveBusinessStr(id, const field[], value[])
{
	query[0]=EOS;
	mysql_format(connects, query, 100, "UPDATE "TABLE_BUSINESS" SET `%s` = '%s' WHERE `id` = '%d' LIMIT 1", field, value, id);
	return mysql_tquery(connects, query);
}

stock StopSpectate(playerid) 
{
	TogglePlayerSpectating(playerid, false);
    HidePlayerInfo(playerid);
    HideVehicleInfo(playerid);
	spectateID[playerid] = INVALID_PLAYER_ID;
	return CancelSelectTextDraw(playerid);
}

stock IsValidEmail(const email_string[])
{
    if(!(3 <= strlen(email_string) <= MAX_EMAIL_LENGHT+1)) return 0;
    return Regex_Check(email_string, rMail);
}

stock IsValidName(const nickname_string[])
{
	if(!(3 <= strlen(nickname_string) <= MAX_PLAYER_NAME+1)) return 0;
	for(new i = 0; i < strlen(nickname_string); i++)
	{
		switch(nickname_string[i])
		{
			case 'A'..'Z', 'a'..'z', '0'..'9': return 1;
			default: return 0;
		}
	}
	return 0;
}

stock IsIpFound(const ip_string[])
{
	if(!strlen(ip_string)) return 0;
    return Regex_Check(ip_string, rIP);
}

stock FlipVehicle(playerid)
{
	new Float:angle_vehicle_flip;
	GetVehicleZAngle(playerid, angle_vehicle_flip); 
	return SetVehicleZAngle(playerid, angle_vehicle_flip);
}

stock ShowStats(playerid, targetid_show_stats)
{
	new string_1[144], string_2[1200], totalExp = PI[targetid_show_stats][pLevel] + playerExperience;
	format(string_1, sizeof(string_1), ""WHITE_HEX"Имя: \t\t\t\t"SERVER_HEX"%s\n", PI[targetid_show_stats][pName]);
	strcat(string_2, string_1);
	format(string_1, sizeof(string_1), ""WHITE_HEX"Уровень: \t\t\t"SERVER_HEX"%d [%d/%d]\n", PI[targetid_show_stats][pLevel], PI[targetid_show_stats][pExp], totalExp);
	strcat(string_2, string_1);
	format(string_1, sizeof(string_1),""WHITE_HEX"Пол: \t\t\t\t"SERVER_HEX"%s \n", (PI[targetid_show_stats][pGender] == 1) ? ("Мужской") : ("Женский"));
	strcat(string_2, string_1);
	format(string_1, sizeof(string_1),""WHITE_HEX"Дом: \t\t\t\t"SERVER_HEX"%s \n", (PI[targetid_show_stats][pHouse] == -1) ? ("Нет") : ("Есть"));
	strcat(string_2, string_1);
	if(PI[targetid_show_stats][pHouse] != -1)
	{
		format(string_1, sizeof(string_1),""WHITE_HEX"Номер дома: \t\t\t"SERVER_HEX"%d \n", PI[targetid_show_stats][pHouse]);
		strcat(string_2, string_1);
		format(string_1, sizeof(string_1),""WHITE_HEX"Класс дома: \t\t\t{%s}%s \n", house_type[HI[PI[targetid_show_stats][pHouse]][hType]][htColor], house_type[HI[PI[targetid_show_stats][pHouse]][hType]][htType]);
		strcat(string_2, string_1);
	}
	format(string_1, sizeof(string_1),""WHITE_HEX"Бизнес: \t\t\t"SERVER_HEX"%s \n", (PI[targetid_show_stats][pBusiness] == -1) ? ("Нет") : ("Есть"));
	strcat(string_2, string_1);
	if(PI[targetid_show_stats][pBusiness] != -1)
	{
		format(string_1, sizeof(string_1),""WHITE_HEX"Номер бизнеса: \t\t"SERVER_HEX"%d \n", BI[PI[targetid_show_stats][pBusiness]][bID]);
		strcat(string_2, string_1);
		format(string_1, sizeof(string_1),""WHITE_HEX"Название бизнеса: \t\t"SERVER_HEX"%s\n", BI[PI[targetid_show_stats][pBusiness]][bName]);
		strcat(string_2, string_1);
		format(string_1, sizeof(string_1),""WHITE_HEX"Тип бизнеса: \t\t\t"SERVER_HEX"%s\n", BisTypesNames[BI[PI[targetid_show_stats][pBusiness]][bType]]);
		strcat(string_2, string_1);
	}
	if(PI[targetid_show_stats][pPhoneNum]) 
	{
		format(string_1, sizeof(string_1),""WHITE_HEX"Номер телефона: \t\t"SERVER_HEX"%d\n", PI[targetid_show_stats][pPhoneNum]);
		strcat(string_2, string_1);
	}
	if(PI[targetid_show_stats][pActiveWarn])
	{
		format(string_1, sizeof(string_1),""DEFAULTRED_HEX"Предупреждений:\t\t%d\n", PI[targetid_show_stats][pWarns]);
		strcat(string_2, string_1);
		format(string_1, sizeof(string_1),""DEFAULTRED_HEX"До снятия предупреждения: %d часов\n", 30 - PI[targetid_show_stats][punWarnstime]);
		strcat(string_2, string_1);
	}
	format(string_1, sizeof(string_1),""WHITE_HEX"Наличные: \t\t\t"SERVER_HEX"%d \n", PI[targetid_show_stats][pMoney]);
	strcat(string_2, string_1);
	format(string_1, sizeof(string_1),""WHITE_HEX"Банк: \t\t\t\t"SERVER_HEX"%d \n", PI[targetid_show_stats][pBank]);
	strcat(string_2, string_1);
	format(string_1, sizeof(string_1),""WHITE_HEX"Законопослушность: \t\t"SERVER_HEX"%d \n\n", PI[targetid_show_stats][pZakon]);
	strcat(string_2, string_1);
	format(string_1, sizeof(string_1),""WHITE_HEX"Организация: \t\t\t"SERVER_HEX"%s \n", frac_name[PI[targetid_show_stats][pMember]]);
	strcat(string_2, string_1);
	if(PI[targetid_show_stats][pMember])
	{
		format(string_1, sizeof(string_1),""WHITE_HEX"Ранг: \t\t\t\t"SERVER_HEX"%s (%d) \n", frac_rankname[PI[targetid_show_stats][pMember]][PI[targetid_show_stats][pRank]], PI[targetid_show_stats][pRank]);
		strcat(string_2, string_1);
		if(PI[targetid_show_stats][pVigs])
		{
			format(string_1, sizeof(string_1),""WHITE_HEX"Выговоров: \t\t\t"SERVER_HEX"%d/3 \n", PI[targetid_show_stats][pVigs]);
			strcat(string_2, string_1);
		}
	}
	if(AI[targetid_show_stats][aLevel])
	{
		format(string_1, sizeof(string_1),"\n"ADMIN_HEX"Админ уровень: \t\t%s%s (%d) \n", adminRank[AI[targetid_show_stats][aLevel]][pdColor],adminRank[AI[targetid_show_stats][aLevel]][pdRank], AI[targetid_show_stats][aLevel]);
		strcat(string_2, string_1);
		if(AI[targetid_show_stats][aVigs])
		{
			format(string_1, sizeof(string_1),""ADMIN_HEX"Выговоров: \t\t\t"SERVER_HEX"%d/3 \n", AI[targetid_show_stats][aVigs]);
			strcat(string_2, string_1);
		}
	}
	format(string_1, sizeof(string_1),"\n"WHITE_HEX"Общее время игры: \t\t"SERVER_HEX"%s", ConvertToTime(PI[targetid_show_stats][pAllOnline]));
	strcat(string_2, string_1);
	format(string_1, sizeof(string_1),"\n"WHITE_HEX"Номер аккаунта: \t\t"SERVER_HEX"%d", PI[targetid_show_stats][pID]);
	strcat(string_2, string_1);
	format(string_1, sizeof(string_1),"\n"WHITE_HEX"Дата регистрации: \t\t"SERVER_HEX"%s \n", PI[targetid_show_stats][pRegDate]);
	strcat(string_2, string_1);
	format(string_1, sizeof(string_1), ""SERVER_HEX"Статистика аккаунта %s",PI[targetid_show_stats][pName]);
	return SPD(playerid, 0, DSM, string_1, string_2, "Закрыть", "");
}

stock SetPlayerPosEx(playerid, Float:x_player_pos, Float:y_player_pos, Float:z_player_pos, Float:angle_player_pos = 0.0, virtualworldid = 0, interiorid = 0, vehicletp = 1, passengertp = 1, freezetime = 0)
{
	if(GetPVarInt(playerid, "inhouse") == 1) DeletePVar(playerid, "inhouse");
	if(GetPVarInt(playerid, "inbusiness") == 1) DeletePVar(playerid, "inbusiness");
    if(!vehicletp || !IsPlayerInAnyVehicle(playerid))
    {
        SetPlayerPos(playerid, x_player_pos, y_player_pos, z_player_pos);
        SetPlayerInteriorEx(playerid, interiorid);
        SetPlayerVirtualWorldEx(playerid, virtualworldid);
        SetPlayerFacingAngle(playerid, angle_player_pos);
        if(freezetime)
        {
            TogglePlayerControllable(playerid, false);
            SetTimerEx(!"@__unfreezeLoadInt", freezetime, false, !"i", playerid);
        }
        return SetCameraBehindPlayer(playerid);
    }
    new vehicle_id_player_pos = GetPlayerVehicleID(playerid);
	foreach(new i : Player)
    {
		if(!pLoggedIn{i} || !IsPlayerConnected(i)) continue;
        if(GetPlayerVehicleID(i) == vehicle_id_player_pos && GetPlayerState(i) == PLAYER_STATE_PASSENGER)
        {
            if(!passengertp) RemovePlayerFromVehicle(i);
            else
			{
				SetPlayerVirtualWorldEx(i, virtualworldid);
				SetPlayerInteriorEx(i, interiorid);
			}
        }
    }
	SetPlayerVirtualWorldEx(playerid, virtualworldid);
	SetPlayerInteriorEx(playerid, interiorid);
    return SetVehiclePosEx(virtualworldid, interiorid, vehicle_id_player_pos, x_player_pos, y_player_pos+1.0, z_player_pos, angle_player_pos); 
}
@__unfreezeLoadInt(playerid);
@__unfreezeLoadInt(playerid) return TogglePlayerControllable(playerid, true); 

stock SetMoney(playerid, money_set = 0)
{
	if(money_set == 0) return 1;
	PI[playerid][pMoney] += money_set;
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, PI[playerid][pMoney]);
	if(money_set < 0)
	{
		if(PI[playerid][pMoney] < money_set) return SendErrorMess(playerid, "Недостаточно средств.");
		format(g_str, 30, "~r~%d$", money_set);
		GameTextForPlayer(playerid, g_str, 2000, 1);
	}
	else if(money_set)
	{
		format(g_str, 30, "~g~%d$", money_set);
		GameTextForPlayer(playerid, g_str, 2000, 1);
	}
	query[0]=EOS;
	mysql_format(connects, query, 95, "UPDATE "TABLE_ACCOUNTS" SET `money`='%d' WHERE `id`='%d' LIMIT 1", PI[playerid][pMoney], PI[playerid][pID]);
	return mysql_tquery(connects, query);
}

stock GiveMoney(playerid, target, amount = 0)
{
	if(!amount) return 1;
	PI[playerid][pMoney] -= amount;
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, PI[playerid][pMoney]);
	PI[target][pMoney] += amount;
	query[0]=EOS;
	mysql_format(connects, query, 95, "UPDATE "TABLE_ACCOUNTS" SET `money`='%d' WHERE `id`='%d' LIMIT 1", PI[playerid][pMoney], PI[playerid][pID]);
	mysql_tquery(connects, query);
	ResetPlayerMoney(target);
	GivePlayerMoney(target, PI[target][pMoney]);
	query[0]=EOS;
	mysql_format(connects, query, 95, "UPDATE "TABLE_ACCOUNTS" SET `money`='%d' WHERE `id`='%d' LIMIT 1", PI[target][pMoney], PI[target][pID]);
	return mysql_tquery(connects, query);
}

stock PlayerToPoint(Float:radi, playerid, Float:x_to_point, Float:y_to_point, Float:z_to_point)
{
	if(!IsPlayerConnected(playerid)) return 1;
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new Float:tempposx, Float:tempposy, Float:tempposz;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	tempposx = (oldposx -x_to_point);
	tempposy = (oldposy -y_to_point);
	tempposz = (oldposz -z_to_point);
	if(((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi))) return 1;
	return 0;
}

stock Slot(w)
{
	switch(w)
	{
	    case 0,1: 		return 0;
	    case 2..9: 		return 1;
	    case 22..24: 	return 2;
	    case 25..27: 	return 3;
	    case 28,29,32: 	return 4;
	    case 30,31: 	return 5;
	    case 33,34: 	return 6;
	    case 35..38: 	return 7;
	    case 16..18,39: return 8;
	    case 41..43: 	return 9;
	    case 10..15: 	return 10;
	    case 44..46: 	return 11;
	    case 40: 		return 12;
	}
	return -1;
}

stock BankMenu(playerid)
{
	return SPD(playerid, DLG_BANK, DSL, ""YELLOW_HEX"Банк San Andreas", "Проверить счёт\n\
					Положить деньги\n\
					Снять деньги\n\
					Перевод денег\n\
					Оплатить дом\n\
					Оплатить аренду помещения\n\
					Снять деньги со счёта бизнеса\n\
					Заказать продукты для своего бизнеса", "Выбрать", "Отмена");
}

stock ATMMenu(playerid)
{
	return SPD(playerid, DLG_ATM, DSL, ""YELLOW_HEX"Банк San Andreas", "Проверить счёт\n\
			Снять деньги", "Выбрать", "Отмена");
}

stock IsVehicleInRangeOfPoint(vehicle_id_range_of_point, Float:range_vehicle_range_point, Float:x_vehicle_range_point, Float:y_vehicle_range_point, Float:z_vehicle_range_point)
{
	new
		Float:vehicle_x,
		Float:vehicle_y,
		Float:vehicle_z;

	if(!GetVehiclePos(vehicle_id_range_of_point, vehicle_x, vehicle_y, vehicle_z)) return 0;

	x_vehicle_range_point = floatsub(x_vehicle_range_point, vehicle_x);
	y_vehicle_range_point = floatsub(y_vehicle_range_point, vehicle_y);
	z_vehicle_range_point = floatsub(z_vehicle_range_point, vehicle_z);

	return VectorSize(x_vehicle_range_point, y_vehicle_range_point, z_vehicle_range_point) < floatpower(range_vehicle_range_point, 2);
}

stock GiveWeapon(p, w, a)
{
    switch(w)
    {
        case 0..15,40,44..46:
		{
			PI[p][Weapon][Slot(w)] = w;
			PI[p][Ammo][Slot(w)] = 1;
			return GivePlayerWeapon(p, WEAPON:w, 1);
		}
        case 39:
        {
            PI[p][Ammo][Slot(w)] += a;
            PI[p][Weapon][Slot(40)] = 40;
        }
		case 100: return PI[p][pHolster] = a;
		case 101: return PI[p][pRifleSling] = a;
        default: PI[p][Ammo][Slot(w)] += a;
    }
    PI[p][Weapon][Slot(w)] = w;
    return GivePlayerWeapon(p, WEAPON:w, a);
}

stock GetWeaponModel(weaponid)
{
	switch(weaponid)
	{
	    case 1: 		return 331;
		case 2..8: 		return weaponid+331;
        case 9:			return 341;
		case 10..15:	return weaponid+311;
		case 16..18:	return weaponid+326;
		case 22..29:	return weaponid+324;
		case 30,31:		return weaponid+325;
		case 32:		return 372;
		case 46:		return 371;
	}
	return 0;
}

/*stock GetDaysInMonth(month, year)
{
    static MonthS[] = {
        31,
        28, 
        31, 
        30,
        31,
        30, 
        31,
        31,
        30,
        31,
        30,
        31  
    };
    return ((month >= 1 && month <= 12) ? (MonthS[month-1] + (IsLeapYear(year) && month == 2 ? 1 : 0)) : 0);
}*/

bool:IsPlayerAimingAtPlayer(playerid, target)
{
	new Float:x_pos_aiming, Float:y_pos_aiming, Float:z_pos_aiming;
	GetPlayerPos(target, x_pos_aiming, y_pos_aiming, z_pos_aiming);
	if(IsPlayerAimingAt(playerid, x_pos_aiming, y_pos_aiming, z_pos_aiming-0.75, 0.25)) return true;
	if(IsPlayerAimingAt(playerid, x_pos_aiming, y_pos_aiming, z_pos_aiming-0.25, 0.25)) return true;
	if(IsPlayerAimingAt(playerid, x_pos_aiming, y_pos_aiming, z_pos_aiming+0.25, 0.25)) return true;
	if(IsPlayerAimingAt(playerid, x_pos_aiming, y_pos_aiming, z_pos_aiming+0.75, 0.25)) return true;
	return false;
}

Float:DistanceCameraTargetToLocation(Float:CamX, Float:CamY, Float:CamZ, Float:ObjX, Float:ObjY, Float:ObjZ, Float:FrX, Float:FrY, Float:FrZ)
{
	new Float:TGTDistance;
	TGTDistance = floatsqroot((CamX - ObjX) * (CamX - ObjX) + (CamY - ObjY) * (CamY - ObjY) + (CamZ - ObjZ) * (CamZ - ObjZ));
	new Float:tmpX, Float:tmpY, Float:tmpZ;
	tmpX = FrX * TGTDistance + CamX;
	tmpY = FrY * TGTDistance + CamY;
	tmpZ = FrZ * TGTDistance + CamZ;
	return floatsqroot((tmpX - ObjX) * (tmpX - ObjX) + (tmpY - ObjY) * (tmpY - ObjY) + (tmpZ - ObjZ) * (tmpZ - ObjZ));
}

Float:GetPointAngleToPoint(Float:x2, Float:y2, Float:x_pos_get_angle, Float:y_pos_get_angle)
{
	new Float:DX, Float:DY;
	new Float:angle;
	DX = floatabs(floatsub(x2,x_pos_get_angle));
	DY = floatabs(floatsub(y2,y_pos_get_angle));
	if (DY == 0.0 || DX == 0.0)
	{
		if(DY == 0 && DX > 0) angle = 0.0;
		else if(DY == 0 && DX < 0) angle = 180.0;
		else if(DY > 0 && DX == 0) angle = 90.0;
		else if(DY < 0 && DX == 0) angle = 270.0;
		else if(DY == 0 && DX == 0) angle = 0.0;
	}
	else
	{
		angle = atan(DX/DY);

		if(x_pos_get_angle > x2 && y_pos_get_angle <= y2) angle += 90.0;
		else if(x_pos_get_angle <= x2 && y_pos_get_angle < y2) angle = floatsub(90.0, angle);
		else if(x_pos_get_angle < x2 && y_pos_get_angle >= y2) angle -= 90.0;
		else if(x_pos_get_angle >= x2 && y_pos_get_angle > y2) angle = floatsub(270.0, angle);
	}
	return floatadd(angle, 90.0);
}

GetXYInFrontOfPoint(&Float:x_front_of_point, &Float:y_front_of_point, Float:angle_front_of_point, Float:distance)
{
	x_front_of_point += (distance * floatsin(-angle_front_of_point, degrees));
	y_front_of_point += (distance * floatcos(-angle_front_of_point, degrees));
}

IsPlayerAimingAt(playerid, Float:x_aiming_at, Float:y_aiming_at, Float:z_aiming_at, Float:radius)
{
	new Float:camera_x,Float:camera_y,Float:camera_z,Float:vector_x,Float:vector_y,Float:vector_z;
	GetPlayerCameraPos(playerid, camera_x, camera_y, camera_z);
	GetPlayerCameraFrontVector(playerid, vector_x, vector_y, vector_z);
	new Float:vertical, Float:horizontal;
	switch(GetPlayerWeapon(playerid))
	{
		case WEAPON_SNIPER,WEAPON_ROCKETLAUNCHER,WEAPON_HEATSEEKER: 
		{
			if(DistanceCameraTargetToLocation(camera_x, camera_y, camera_z, x_aiming_at, y_aiming_at, z_aiming_at, vector_x, vector_y, vector_z) < radius) return 1;
			return 0;
		}
		case WEAPON_AK47,WEAPON_M4: {vertical = 4.0; horizontal = -1.6;}
		case WEAPON_RIFLE: {vertical = 2.7; horizontal = -1.0;}
		default: {vertical = 6.0; horizontal = -2.2;}
	}

	new Float:angle = GetPointAngleToPoint(0, 0, floatsqroot(vector_x*vector_x+vector_y*vector_y), vector_z) - 270.0;
	new Float:resize_x, Float:resize_y, Float:resize_z = floatsin(angle+vertical, degrees);
	GetXYInFrontOfPoint(resize_x, resize_y, GetPointAngleToPoint(0, 0, vector_x, vector_y)+horizontal, floatcos(angle+vertical, degrees));
	if(DistanceCameraTargetToLocation(camera_x, camera_y, camera_z, x_aiming_at, y_aiming_at, z_aiming_at, resize_x, resize_y, resize_z) < radius)return 1;
	return 0;
}

stock DestroyVehicleEx(vehicle_id_destroy)
{
	if(!IsValidVehicle(vehicle_id_destroy)) return 0;
	return DestroyVehicle(vehicle_id_destroy);
}

stock SpawnSetPlayerWeapons(playerid)
{
	for(new i = 0; i < 13; i++) 
	{
	    if(PI[playerid][Weapon][i] > 0 && PI[playerid][Ammo][i] > 0)
		{
			GivePlayerWeapon(playerid, WEAPON:PI[playerid][Weapon][i], PI[playerid][Ammo][i]);
		}
	}
	return 1;
}

stock ResetWeapons(p)
{
    for(new i = 0; i < 13; i++) PI[p][Weapon][i] = 0,PI[p][Ammo][i] = 0;
    return ResetPlayerWeapons(p);
}

stock StartRace()
{
    raceStatus = 1;
    raceTime = 301;
    return raceFinishPlayerID = 0;
}

stock UpdatePlayerRaceMark(playerid)
{
    new mark_id = raceMarkPlayer[playerid], cp_type;
    if(mark_id >= sizeof(raceMarkPos)) return false;
	new Float: x_pos_update_mark = raceMarkPos[mark_id][0],
		Float: y_pos_update_mark = raceMarkPos[mark_id][1],
		Float: z_pos_update_mark = raceMarkPos[mark_id][2],
		Float: x2 = mark_id != sizeof(raceMarkPos) - 1 ? raceMarkPos[mark_id+1][0] : 0.0,
		Float: y2 = mark_id != sizeof(raceMarkPos) - 1 ? raceMarkPos[mark_id+1][1] : 0.0,
		Float: z2 = mark_id != sizeof(raceMarkPos) - 1 ? raceMarkPos[mark_id+1][2] : 0.0;
	if(mark_id != sizeof(raceMarkPos) - 1)
	{
		cp_type = 0;
	}
	else
	{
		cp_type = 1;
	}
	return SetPlayerRaceCheckpoint(playerid, CP_TYPE:cp_type, x_pos_update_mark, y_pos_update_mark, z_pos_update_mark, x2, y2, z2, 5.0);
}

stock PlayerLeaveRace(playerid)
{
	racePlayerReg{playerid} = 0;
	DisablePlayerRaceCheckpoint(playerid);
	if(raceVehiclePlayer[playerid] != INVALID_VEHICLE_ID) DestroyVehicleEx(raceVehiclePlayer[playerid]);
    raceVehiclePlayer[playerid] = INVALID_VEHICLE_ID;
	SCMESS(playerid, DARKRED_FORMAT, ""NEGATIVE_MARK" Дисквалифицирован с гонки!");
	return SpawnPlayerEx(playerid);
}

stock CreateVehicleEx(world_id_create_veh, int_id_create_veh, model_id_create_veh, Float:x_create_vehicle_pos, Float:y_create_vehicle_pos, Float:z_create_vehicle_pos, Float:angle_create_vehicle_pos, color1, color2, respawn_delay, bool:addsiren = false)
{
	new vehicle_id_create_veh = CreateVehicle(model_id_create_veh, x_create_vehicle_pos, y_create_vehicle_pos, z_create_vehicle_pos, angle_create_vehicle_pos, color1, color2, respawn_delay, addsiren);
	SetVehicleVirtualWorld(vehicle_id_create_veh, world_id_create_veh);
	SetVehicleZAngle(vehicle_id_create_veh, angle_create_vehicle_pos);
	LinkVehicleToInterior(vehicle_id_create_veh, int_id_create_veh);
	return vehicle_id_create_veh;
}

stock SetVehiclePosEx(world_id_vehicle_pos, int_id_vehicle_pos, vehicle_id_vehicle_pos, Float:x_vehicle_pos, Float:y_vehicle_pos, Float:z_vehicle_pos, Float:angle_vehicle_pos)
{
	LinkVehicleToInterior(vehicle_id_vehicle_pos, int_id_vehicle_pos);
	SetVehicleVirtualWorld(vehicle_id_vehicle_pos, world_id_vehicle_pos);
	SetVehiclePos(vehicle_id_vehicle_pos, x_vehicle_pos, y_vehicle_pos, z_vehicle_pos);
	return SetVehicleZAngle(vehicle_id_vehicle_pos, angle_vehicle_pos);
}

stock GetRacePlayersAmount()
{
    new var_count_race = 0;
    foreach(new i : Player)
	{
		if(!pLoggedIn{i} || !IsPlayerConnected(i)) continue;
		if(racePlayerReg{i}) var_count_race++;
	}
    return var_count_race;
}

stock SetHealth(playerid, Float: health)
{
	if(!pLoggedIn{playerid}) return 0;
	SetPVarInt(playerid, "ac-hp-ignore", gettime() + 1);
	PI[playerid][pHp] = health;
	SetPlayerHealth(playerid, health);
	return 1;
}

stock SetArmour(playerid, Float: armour)
{
	if(!pLoggedIn{playerid}) return 0;
	SetPVarInt(playerid, "ac-arm-ignore", gettime() + 1);
	PI[playerid][pArmour] = armour;
	SetPlayerArmour(playerid, armour);
	return 1;
}

stock SetScore(playerid, score)
{
	if(!pLoggedIn{playerid}) return 0;
	PI[playerid][pLevel] = score;
	SetPlayerScore(playerid, score);
	return 1;
}

stock SendMessageToAllLoggedPlayers(color, const string[])
{
	foreach(new i : Player)
	{
		if(!pLoggedIn{i} || !IsPlayerConnected(i)) continue;
		SCMESS(i, color, string);
	}
	return 1;
}

stock SendAdminMessage(color, const string[])
{
	foreach(new i : Admin) SCMESS(i, color, string);
	return 1;
}

stock SendAdminChatMessage(color, const string[])
{
	foreach(new i : Player)
	{
		if(!pLoggedIn{i} || !IsPlayerConnected(i) || !AI[i][aLevel]) continue;
		SCMESS(i, color, string);
	}
}

stock SendAdminMessageToAll(color, const string[])
{
	foreach(new i : Player)
	{
		if(!PI[i][pAdminMess] || !pLoggedIn{i} || !IsPlayerConnected(i)) continue;
		SCMESS(i, color, string);
	}
	return 1;
}

stock SendMessageToAllGC(color, const string[])
{
	foreach(new i : Player)
	{
		if(!PI[i][pGchatMess] || !pLoggedIn{i} || !IsPlayerConnected(i)) continue;
		SCMESS(i, color, string);
	}
	return 1;
}

stock LoadVehicle()
{
    lspd_car[0] = AddStaticVehicle(596, 1602.4960, -1683.9705, 5.6106, 89.9966, 1, 152);
	lspd_car[1] = AddStaticVehicle(596, 1602.4961, -1688.1863, 5.6106, 89.9944, 1, 152);
	lspd_car[2] = AddStaticVehicle(596, 1602.4960, -1692.1858, 5.6106, 89.9963, 1, 152);
	lspd_car[3] = AddStaticVehicle(596, 1602.4961, -1696.4399, 5.6106, 89.9965, 1, 152);
	lspd_car[4] = AddStaticVehicle(596, 1602.4961, -1700.4475, 5.6105, 89.9928, 1, 152);
	lspd_car[5] = AddStaticVehicle(596, 1602.4973, -1704.7720, 5.6111, 89.9599, 1, 152);
	lspd_car[6] = AddStaticVehicle(596, 1591.1188, -1710.8458, 5.6106, 359.9953, 1, 152);
	lspd_car[7] = AddStaticVehicle(596, 1587.0615, -1710.8457, 5.6106, 359.9914, 1, 152);
	lspd_car[8] = AddStaticVehicle(596, 1582.9340, -1710.8418, 5.6106, 359.9973, 1, 152);
	lspd_car[9] = AddStaticVehicle(596, 1578.0387, -1710.8459, 5.6106, 359.9960, 1, 152);
	lspd_car[10] = AddStaticVehicle(596, 1574.0431, -1710.8464, 5.6115, 359.9565, 1, 152);
	lspd_car[11] = AddStaticVehicle(596, 1569.6342, -1710.8481, 5.5788, 359.9579, 1, 152);
	lspd_car[12] = AddStaticVehicle(596, 1558.3914, -1710.8352, 5.6231, 359.9962, 1, 152);
	lspd_car[13] = AddStaticVehicle(596, 1584.5720, -1672.3798, 5.6135, 269.9952, 1, 152);
	lspd_car[14] = AddStaticVehicle(596, 1584.5693, -1668.1559, 5.6123, 269.9404, 1, 152);
	lspd_car[15] = AddStaticVehicle(523, 1545.6881, -1684.3760, 5.4628, 89.8548, 1, 152);
	lspd_car[16] = AddStaticVehicle(523, 1545.6832, -1680.3370, 5.4628, 90.0000, 1, 152);
	lspd_car[17] = AddStaticVehicle(523, 1545.6796, -1676.2489, 5.4715, 90.0000, 1, 152);
	lspd_car[18] = AddStaticVehicle(523, 1545.6934, -1672.1342, 5.4719, 90.0000, 1, 152);
	lspd_car[19] = AddStaticVehicle(523, 1545.7043, -1667.6414, 5.4657, 89.5909, 1, 152);
	lspd_car[20] = AddStaticVehicle(523, 1545.6930, -1663.1404, 5.4719, 90.0000, 1, 152);
	lspd_car[21] = AddStaticVehicle(601, 1545.4475, -1659.0334, 5.6477, 89.9272, 1, 152);
	lspd_car[22] = AddStaticVehicle(601, 1545.4456, -1655.0054, 5.6652, 89.9993, 1, 152);
	lspd_car[23] = AddStaticVehicle(427, 1538.1487, -1644.9996, 6.0336, 180.0003, 1, 152);
	lspd_car[24] = AddStaticVehicle(427, 1534.1730, -1644.9996, 6.0335, 180.0002, 1, 152);
	lspd_car[25] = AddStaticVehicle(427, 1529.9532, -1644.9991, 6.0335, 180.0003, 1, 152);
	lspd_car[26] = AddStaticVehicle(497, 1559.2762,-1644.1458,28.5774,90.9602, 0, 152);

	//автосалон
	stand_cars[0] = AddStaticVehicle(400, 1447.7255,708.5169,1087.6510,90.8813, 1, 1);
	stand_cars[1] = AddStaticVehicle(489, 1447.8677,713.8803,1087.6510,90.8813, 1, 1);
	stand_cars[2] = AddStaticVehicle(505, 1447.9550,719.2390,1087.6510,90.8813, 1, 1);
	stand_cars[3] = AddStaticVehicle(579, 1447.9297,724.9246,1087.6510,90.8813, 1, 1);
	stand_cars[4] = AddStaticVehicle(404, 1447.9091,730.7256,1087.6510,90.8813, 1, 1);
	stand_cars[5] = AddStaticVehicle(479, 1448.0667,736.4556,1087.6510,90.8813, 1, 1);
	//
	stand_cars[6] = AddStaticVehicle(451, 1438.3248,738.1924,1087.6510,181.2400, 1, 1);
	//
	stand_cars[7] = AddStaticVehicle(401, 1427.4492,737.6729,1087.6510,270.7977, 1, 1);
	stand_cars[8] = AddStaticVehicle(426, 1427.2711,733.2691,1087.6510,270.7977, 1, 1);
	stand_cars[9] = AddStaticVehicle(507, 1427.3651,729.0331,1087.6510,270.7977, 1, 1);
	stand_cars[10] = AddStaticVehicle(517, 1427.2725,724.8500,1087.6510,270.7977, 1, 1);
	stand_cars[11] = AddStaticVehicle(542, 1427.0956,720.8130,1087.6510,270.7977, 1, 1);
	stand_cars[12] = AddStaticVehicle(562, 1427.1418,716.3480,1087.6510,270.7977, 1, 1);
	stand_cars[13] = AddStaticVehicle(585, 1427.0532,711.8228,1086.6510,270.7977, 1, 1);
	stand_cars[14] = AddStaticVehicle(580, 1427.2556,707.1518,1087.6510,270.7977, 1, 1);
	stand_cars[15] = AddStaticVehicle(550, 1427.3195,702.1699,1087.6510,270.7977, 1, 1);
	stand_cars[16] = AddStaticVehicle(445, 1427.2590,696.9777,1087.6510,270.7977, 1, 1);
	//
	stand_cars[17] = AddStaticVehicle(541, 1438.1774,710.3563,1087.6510,270.7977, 1, 1);
	stand_cars[18] = AddStaticVehicle(506, 1438.1061,723.2407,1087.6510,270.7977, 1, 1);
	for(new i=0; i < sizeof(stand_cars); i++)
	{
		SetVehicleVirtualWorld(stand_cars[i], 7);
		LinkVehicleToInterior(stand_cars[i], 82);
	} 
}

stock SendTeamMessage(member, const string[], type = 0)
{
	foreach(new i : Player)
	{
	    if(!IsPlayerConnected(i) || !pLoggedIn{i}) continue;
		if(PI[i][pMember] == member || PI[i][pLeader] == member)
		{
	        switch(PI[i][pMember])
		    {
			    case TEAM_MAYOR..TEAM_HOSPITAL:
			    {
				    if(!PI[i][pDuty]) continue;
					if(type == 1)
					{ 
						if(IsAbleToInvite(i)) SCMESS(i, GREY_FORMAT, string); 
						continue;
					}
				    SCMESS(i, TEAM_RADIO_COLOR, string);
					continue;
			    }
			    default:
				{
					if(type == 1) 
					{
						if(IsAbleToInvite(i)) SCMESS(i, GREY_FORMAT, string); 
						continue; 
					}
					SCMESS(i, TEAM_FAM_COLOR, string);
					continue;
				}
		    }
		}
	}
	return 1;
}

stock DelAdmin(playerid, type = 2)
{
	if(type == 0) SCMESS(playerid, DEFAULTRED_FORMAT, "Твой уровень модератора аннулирован.");
	AI[playerid] = adminDataNull;
	Iter_Remove(Admin, playerid);
	query[0]=EOS;
    mysql_format(connects, query, 54, "DELETE FROM "TABLE_ADMINS" WHERE `admin` = '%d'", PI[playerid][pID]);
    mysql_tquery(connects, query, "", "");
	if(type == 0) return SAMF(DARKRED_FORMAT, "[A] Модератор %s[%d] снят (код: %d).", PI[playerid][pName], playerid, type);
	if(type == 2) return SAMF(DARKRED_FORMAT, "[A] Модератор %s[%d] снят.", PI[playerid][pName], playerid, type);
    return SAMF(DARKRED_FORMAT, "[A] Модератор %s[%d](код: %d) снят.", PI[playerid][pName], playerid, type);
}

stock Admin_Log(playerid, const type[], const playername[])
{
	query[0]=EOS;
    mysql_format(connects,query,150,"INSERT INTO `admin_log` (`admin_name`, `type`, `player_name`) VALUES ('%s', '%e', '%s')",PI[playerid][pName], type, playername);
    return mysql_tquery(connects, query, "", "");
}

stock Float:GetVehicleHealthEx(vehicle_id_vehicle_health)
{
    new Float:health;
    GetVehicleHealth(vehicle_id_vehicle_health, health);
    if(health > 900.0) return health / 10.0;
    else return (health / 10.0)-(24);
}

stock LoadTextDrawGamemode()
{
	#include <txd\gamemode_txd.inc>
}

stock LoadPlayerTextDraw(playerid)
{
    #include <txd\player_txd.inc>
}

stock ProxDetector(Float:radi, playerid, const string[], color)
{
    new Float:x,Float:y,Float:z,virtualworld = GetPlayerVirtualWorld(playerid),interior = GetPlayerInterior(playerid);
    GetPlayerPos(playerid,x,y,z);
    foreach(new i : Player)
    {
		if(!pLoggedIn{i} || !IsPlayerConnected(i) || virtualworld != GetPlayerVirtualWorld(i) && interior != GetPlayerInterior(i)) continue;
        if(IsPlayerInRangeOfPoint(i,radi,x,y,z)) SCMESS(i,color,string);
    }
}

stock ConvertToTime(number) 
{
    new h = floatround(number / 3600),
        m = floatround((number - h * 3600) / 60),
        s = floatround(number - h * 3600 - m * 60),
        string_1[30];
    if(h > 0) format(string_1, sizeof(string_1), "%d:%02d:%02d", h, m, s);
    else format(string_1, sizeof(string_1), "%d:%02d", m, s);
	return string_1;
}

stock SetPlayerTeamColor(playerid, fraction = 0)
{
	switch(PI[playerid][pDuty])
	{
		case 0:
		{
			SetPlayerColor(playerid, PLAYER_COLOR);
		}
		case 1:
		{
			switch(fraction)
			{
				case 0: SetPlayerColor(playerid, PLAYER_COLOR);
				case 1:	SetPlayerColor(playerid, MAYOR_COLOR);
				case 2: SetPlayerColor(playerid, LSPD_COLOR);
				case 3: SetPlayerColor(playerid, FBI_COLOR);
				case 4: SetPlayerColor(playerid, NEWS_COLOR);
				case 5: SetPlayerColor(playerid, HOSPITAL_COLOR);
				default: SetPlayerColor(playerid, PLAYER_COLOR);
			}
		}
	}
	return 1;
}

stock IsAbleToInvite(playerid)
{
	switch(PI[playerid][pDuty])
	{
		case 0:
		{
			SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Должен быть на работе."); 
			return 0;
		}
		case 1:
		{
			switch(PI[playerid][pMember])
			{
				case TEAM_MAYOR: 	if(PI[playerid][pRank] >= 6) return 1;
				case TEAM_SAPD: 	if(PI[playerid][pRank] >= 11) return 1;
				case TEAM_FBI: 		if(PI[playerid][pRank] >= 9) return 1;
				case TEAM_NEWS: 	if(PI[playerid][pRank] >= 7) return 1;
				case TEAM_HOSPITAL: if(PI[playerid][pRank] >= 8) return 1;
				default: return 0;
			}
		}
	}
	return 0;
}

stock IsAbleToGov(playerid)
{
	switch(PI[playerid][pDuty])
	{
		case 0:
		{
			SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Должен быть в форме организации."); 
			return 0;
		}
		case 1:
		{
			switch(PI[playerid][pMember])
			{
				case TEAM_MAYOR: 	if(PI[playerid][pRank] >= 6) return 1;
				case TEAM_SAPD: 	if(PI[playerid][pRank] >= 11) return 1;
				case TEAM_FBI: 		if(PI[playerid][pRank] >= 9) return 1;
				case TEAM_HOSPITAL: if(PI[playerid][pRank] >= 8) return 1;
				default: return 0;
			}
		}
	}
	return 0;
}

stock IsAGov(playerid)
{
	switch(PI[playerid][pMember])
	{
		case TEAM_MAYOR,TEAM_SAPD,TEAM_FBI,TEAM_HOSPITAL,TEAM_NEWS: return 1;
		default: return 0;
	}
	return 0;
}

stock Float:GetDistanceBetweenPoints(Float:x_pos_distance, Float:y_pos_distance, Float:z_pos_distance, Float:PointX, Float:PointY, Float:PointZ)
{
	new Float:distance = floatabs(floatsub(x_pos_distance, PointX)) + floatabs(floatsub(y_pos_distance, PointY)) + floatabs(floatsub(z_pos_distance, PointZ));
    return distance;
}

stock GPSPlayer_(playerid, Float:x_pos_gps, Float:y_pos_gps, Float:z_pos_gps, locname_gps[])
{
	new Float:VPos[3];
	GetPlayerPos(playerid, VPos[0], VPos[1], VPos[2]);
	PI[playerid][pUseGPS] = true;
	DisablePlayerRaceCheckpoint(playerid);
	SetPlayerRaceCheckpoint(playerid, CP_TYPE:1, x_pos_gps, y_pos_gps, z_pos_gps, 0, 0, 0, 5.0);
	return SendPositiveMessF(playerid, "Место отмечено на карте: %s", locname_gps);
}

stock SetPlayerSkinEx(playerid, skin_id_set)
{
	SetPlayerSkin(playerid, skin_id_set);
 	switch(PI[playerid][pGender])
	{
		case 0: SetPlayerChatBubble(playerid, "Переоделась", RPCMD_FORMAT, 20.0, 5000);
		case 1: SetPlayerChatBubble(playerid, "Переоделся", RPCMD_FORMAT, 20.0, 5000);
	}
	return ClearAnimationsEx(playerid);
}

stock PayDay()
{
    foreach(new i : Player)
    {
		if(!IsPlayerConnected(i)) continue;
        if(!pLoggedIn{i}) 
		{
			SCMESS(i, GREY_FORMAT, ""NEGATIVE_MARK" Не авторизирован для получения зарплаты и уровня.");
			continue;
		}
		if(PI[i][pHourOnline] <= 1200)
		{ 
			SCMESS(i, GREY_FORMAT, ""NEGATIVE_MARK" Ты не отыграл достаточно времени для получения зарплаты и уровня.");
			continue;
		}
		SCMESS(i, WHITE_FORMAT, "--» "SERVER_HEX"PAYDAY"WHITE_HEX" «--\n");
		SCMESS(i, WHITE_FORMAT, "");
		if(IsAllowToGetPayday(i))
		{
			if(PI[i][pIdCard])
			{
				if(PI[i][pDutyTimer] >= 900)
				{
					PI[i][pBank] += frac_pay[PI[i][pMember]][PI[i][pRank]];
					PI[i][pTempPayment] += frac_pay[PI[i][pMember]][PI[i][pRank]];
				}
				else
				{
					SCMESS(i, GREY_FORMAT, "Ты не получил зарплату так как мало работал, но получил уровень.");
				}
			}
			if(PI[i][pDutyTimer]) PI[i][pDutyTimer] = 0;
		}
		SCMESSF(i, GOLDORANGE_FORMAT, "Зарплата: "WHITE_HEX"%d$", PI[i][pTempPayment]);
		if(PI[i][pIdCard]) SCMESSF(i, GOLDORANGE_FORMAT, "Банковский счёт: "WHITE_HEX"%d$", PI[i][pBank]);
		else if(!PI[i][pIdCard] && PI[i][pTempPayment]) SCMESS(i, GREY_FORMAT, "Банковский счёт отсутствует. Ты не получил свою зарплату, но получил уровень.");
		if(PI[i][pActiveWarn] == 1)
		{
			PI[i][punWarnstime] += 1;
			if(PI[i][punWarnstime] < 30)
			{
				SCMESSF(i, CONTRASTORANGE_FORMAT,"До снятия предупреждения: "DEFAULTRED_HEX"%d"WHITE_HEX" часов", 30 - PI[i][punWarnstime]);
			}
			else
			{
				if(PI[i][pWarns] == 1) PI[i][punWarnstime] = 0, PI[i][pActiveWarn] = 0, PI[i][pWarns] -= 1;
				else if(PI[i][pWarns] > 1) PI[i][punWarnstime] = 0, PI[i][pActiveWarn] = 1, PI[i][pWarns] -= 1;
				SCMESS(i, DEFAULTRED_FORMAT, "Предупреждение снято.");
			}
		}
		if(PI[i][pHouse] >= 0)
		{
			if(PI[i][pHouse] == HI[PI[i][pHouse]][hID] && !HI[PI[i][pHouse]][hDays])
			{
				PI[i][pHouse] = -1;
				SCMESS(i, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Ты остался без дома так как он долгое время не оплачивался!");
			}
		}
		if(PI[i][pBusiness] >= 0)
		{
			if(PI[i][pBusiness] == BI[PI[i][pBusiness]][bID] && !BI[PI[i][pBusiness]][bDays])
			{
				PI[i][pBusiness] = -1;
				SCMESS(i, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Ты остался без бизнеса так аренда помещения долго не оплачивалась!");
			}
		}
		PI[i][pTempPayment] = 0;
		PI[i][pHourOnline] = 0;
		GiveExp(i, 1);
		SCMESS(i, WHITE_FORMAT, "");
		SCMESS(i, WHITE_FORMAT, "---------------------------------------------------------------");
    }
	return mysql_tquery(connects, "UPDATE "TABLE_ACCOUNTS" SET `houronline` = '0' WHERE `houronline` != '0'");
}

stock SetPlayerSpawn(playerid)
{
	if(DI[playerid][dTime])
	{
		SCMESSF(playerid, CONTRASTORANGE_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Модератор %s посадил тебя за нарушение правил сервера.", DI[playerid][dAdmin]);
		SCMESS(playerid, CONTRASTORANGE_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Подробная информация: "CONTRASTORANGE_HEX"/dminfo");
		switch(random(7))
		{
			case 0: SetSpawnInfoEx(playerid, 5511.2661,1243.5304,23.1886,89.4156, 1111, 1111);
			case 1: SetSpawnInfoEx(playerid, 5513.9453,1238.6447,23.1886,179.4893, 1111, 1111);
			case 2: SetSpawnInfoEx(playerid, 5518.8906,1244.2731,23.1886,269.5630, 1111, 1111);
			case 3: SetSpawnInfoEx(playerid, 5514.0874,1250.0251,23.1886,0.7857, 1111, 1111);
			case 4: SetSpawnInfoEx(playerid, 5506.8682,1248.6354,23.1886,94.7657, 1111, 1111);
			case 5: SetSpawnInfoEx(playerid, 5520.5425,1234.6953,23.1886,228.7274, 1111, 1111);
			case 6: SetSpawnInfoEx(playerid, 5512.7661,1253.8296,23.1886,5.6762, 1111, 1111);
		}
		return ResetPlayerWeapons(playerid);
	}
	if(PI[playerid][pHouse] != -1)
	{
		new p_id_house = PI[playerid][pHouse];
		SetPVarInt(playerid, "inhouse", 1);
		return SetSpawnInfoEx(playerid, HI[p_id_house][hEnterIntX], HI[p_id_house][hEnterIntY], HI[p_id_house][hEnterIntZ], 0.0, p_id_house, HI[p_id_house][hInt]);
	}
	switch(PI[playerid][pMember])
	{
		case TEAM_MAYOR: SetSpawnInfoEx(playerid, -1845.2922,2687.6885,3.5874,89.3167, 2, 3); // mayor 
		case TEAM_SAPD: SetSpawnInfoEx(playerid, 1373.3751,1060.0710,1626.4896,359.8174, 1, 99); // lspd
		case TEAM_FBI: SetSpawnInfoEx(playerid, 1148.1869,362.9410,1002.1450, 359.2763, 4, 111); // fbi
		case TEAM_NEWS: SetSpawnInfoEx(playerid, 762.9954,-1502.6158,1417.6639,180.4903, 5, 74); // news
		case TEAM_HOSPITAL: SetSpawnInfoEx(playerid, -1322.7672,-26.5677,1501.0859,270.6815, 3); // ls hospital
		default:
		{
			switch(random(3))
			{
				case 0: // sf
				{
					switch(random(4))
					{
						case 0: SetSpawnInfoEx(playerid, -1964.4325,126.5737,27.6875,91.2496);
						case 1: SetSpawnInfoEx(playerid, -1965.1057,132.7743,27.6875,91.5671);
						case 2:	SetSpawnInfoEx(playerid, -1964.4894,139.4250,27.6940,90.2970);
						case 3:	SetSpawnInfoEx(playerid, -1967.8180,137.7723,27.6875,89.8958);
					}
				}
				case 1: // ls
				{
					switch(random(4))
					{
						case 0: SetSpawnInfoEx(playerid, 2043.0313,-2021.5516,14.0345,90.0631);
						case 1: SetSpawnInfoEx(playerid, 2043.1597,-2014.1962,14.0345,90.3807);
						case 2:	SetSpawnInfoEx(playerid, 2043.6091,-2022.4556,14.0345,90.0631);
						case 3:	SetSpawnInfoEx(playerid, 2042.7882,-2021.0101,14.0345,89.1105);
					}
				}
				case 2: // lv
				{
					switch(random(4))
					{
						case 0: SetSpawnInfoEx(playerid, 2855.4688,1290.6979,11.3906,89.8535);
						case 1: SetSpawnInfoEx(playerid, 2852.0168,1290.7540,11.3906,90.4886);
						case 2:	SetSpawnInfoEx(playerid, 2849.2246,1290.8231,11.3906,88.5834);
						case 3:	SetSpawnInfoEx(playerid, 2845.5779,1290.5602,11.3906,88.5834);
					}
				}
			}
		}
	}
	return 1;
}

/*stock UnixToDate(unix_timestamp)
{
	new string[17];
    new year = 1970, day = 1, month = 1, hour = 3, minuit;
    while unix_timestamp >= 86400 do
	{
        unix_timestamp -= 86400;
        day ++;
        if day > GetDaysInMonth(month, year) *then
		{
            day = 1;
            month ++;
			if month > 12 *then
			{
                year++;
                month = 1;
            }
        }
    }
	hour += unix_timestamp / 3600;
	minuit = (unix_timestamp - (hour -3 ) * 3600) / 60;
    if hour >= 24 *then
        hour -= 24, day++;
	format(string, sizeof string, "%02d:%02d %02d.%02d.%d", hour, minuit, day, month, year);
	return string;
}*/

stock UnixToDate(unix_timestamp)
{
	new year, month, day, hour, minute, second;
	gmtime(unix_timestamp + (3600 * 3), year, month, day, hour, minute, second);
	new str_time[22];
	format(str_time, sizeof(str_time), "%02d:%02d:%02d %02d.%02d.%04d", hour, minute, second, day, month, year);
	return str_time;
}

stock ProxDetectorCMD(Float: radius, playerid, targetid_proxd)
{
	if(spectateID[targetid_proxd] != INVALID_PLAYER_ID) return 0;
    new Float: pos_x_proxd,
        Float: pos_y_proxd,
        Float: pos_z_proxd;
    GetPlayerPos(targetid_proxd, pos_x_proxd, pos_y_proxd, pos_z_proxd);
    return (IsPlayerInRangeOfPoint(playerid, radius, pos_x_proxd, pos_y_proxd, pos_z_proxd));
}

stock SpawnPlayerEx(playerid) 
{
	if(GetPlayerVehicleID(playerid))
	{
		new Float:x_pos_spawn,Float:y_pos_spawn,Float:z_pos_spawn;
		GetVehiclePos(GetPlayerVehicleID(playerid), x_pos_spawn,y_pos_spawn,z_pos_spawn),
		SetPlayerPos(playerid, x_pos_spawn,y_pos_spawn,z_pos_spawn);
	}
	SetPlayerSpawn(playerid);
	return SpawnPlayer(playerid);
}

stock IsACop(playerid)
{
	switch(PI[playerid][pMember])
	{
		case TEAM_SAPD: return 1;
		case TEAM_FBI: return 1;
		case TEAM_MAYOR: return 1;
		default: return 0;
	}
	return 0;
}

stock IsAllowToGetPayday(playerid)
{
	switch(PI[playerid][pMember])
	{
		case TEAM_MAYOR..TEAM_HOSPITAL: return 1;
		default: return 0;
	}
	return 0;
}

stock ShowSettings(playerid)
{
	new email[MAX_EMAIL_LENGHT+1], hide_email[12] = "***********", string_1[350];
	switch(PI[playerid][isEmail])
	{
	    case 0: strins(email, ""DARKRED_HEX"\tНе привязана", 0, 27);
	    case 1:
		{
			strins(email, PI[playerid][pEmail], 0);
			strdel(email, 1, 11);
			strins(email, hide_email, 1);
		}
	}
	format(string_1, sizeof(string_1), ""SERVER_HEX"1. "WHITE_HEX"Смена почты: "SERVER_HEX"\t%s\n"SERVER_HEX"2. "WHITE_HEX"Показывать админ-действия \t%s\n"SERVER_HEX"3."WHITE_HEX" Показывать глобальный чат \t%s\n"SERVER_HEX"3. "WHITE_HEX"Отображать оружие на теле \t\t%s", email, (PI[playerid][pAdminMess] == 1) ? (""GREEN_HEX"Да"WHITE_HEX"") : (""DEFAULTRED_HEX"Нет"WHITE_HEX""), (PI[playerid][pGchatMess] == 1) ? (""GREEN_HEX"Да"WHITE_HEX"") : (""DEFAULTRED_HEX"Нет"WHITE_HEX""), (PI[playerid][pShowGun] == 1) ? (""GREEN_HEX"Да"WHITE_HEX"") : (""DEFAULTRED_HEX"Нет"WHITE_HEX""));
	return SPD(playerid, DLG_MENU_SETTINGS, DSL, ""SERVER_HEX"Личные настройки", string_1, "Выбрать", "Назад");
}

stock ServerBan(playerid, name[], time, reason[], type = 0)
{
    new unbandate = gettime() + time*86400;
	query[0]=EOS;
	if(!type)
	{
		mysql_format(connects, query, 230, "INSERT INTO "TABLE_BANLOG" (`name`, `admin`, `date`, `unbandate`, `reason`, `gamedate`) VALUES ('%s', '%s', '%d','%d', '%e', '%e')", name, PI[playerid][pName], time, unbandate, reason, UnixToDate(gettime()));
		return mysql_tquery(connects, query, "", "");
	}
	else 
	{
		mysql_format(connects, query, 230, "INSERT INTO "TABLE_BANIPLOG" (`ip`, `admin`, `date`, `unbandate`, `reason`, `gamedate`) VALUES ('%s', '%s', '%d','%d', '%e', '%e')", name, PI[playerid][pName], time, unbandate, reason, UnixToDate(gettime()));
	}
	return mysql_tquery(connects, query, "", "");
}

// детектить кол-во статик объектов на сервере
stock g_CreateObject(model_id, Float:x_pos_object, Float:y_pos_object, Float:z_pos_object, Float:rX, Float:rY, Float:rZ, Float:DrawDistance = 0.0) 
{
	server_static_objects++;
	return CreateObject(model_id, x_pos_object, y_pos_object, z_pos_object, rX, rY, rZ, DrawDistance); 
}
#if defined _ALS_CreateObject
        #undef CreateObject
#else
        #define _ALS_CreateObject
#endif
#define CreateObject g_CreateObject
//

stock ClearInfoTemporaryAdmCar(playerid)
{
    DestroyVehicleEx(TI[playerid][temp_vehid]);
    return TI[playerid][temp_vehid] = INVALID_VEHICLE_ID;
}

stock ShowPlayerVelocimetro(playerid)
{
	new veh_id_spv = GetPlayerVehicleID(playerid);
	if(playerVelocimetro[playerid] || IsAPlane(veh_id_spv) || IsABoat(veh_id_spv) || IsAScooter(veh_id_spv) || IsAVel(veh_id_spv)) return 0;
    PlayerTextDrawSetString(playerid, textPlayerVelocimetro[0][playerid], GetVehicleName(veh_id_spv));
    for(new text; text != 5; text++) TextDrawShowForPlayer(playerid, textVelocimetro[text]);
    for(new text; text != 4; text++) PlayerTextDrawShow(playerid, textPlayerVelocimetro[text][playerid]);
    playerVelocimetro[playerid] = true;
    return playerVelocimetroTimer[playerid] = SetTimerEx("UpdatePlayerVelocimetro", 200, true, "i", playerid);
}

stock HidePlayerVelocimetro(playerid)
{
    if(!playerVelocimetro[playerid]) return 0;
    for(new text; text != 5; text++) TextDrawHideForPlayer(playerid, textVelocimetro[text]);
    for(new text; text != 4; text++) PlayerTextDrawHide(playerid, textPlayerVelocimetro[text][playerid]);
    playerVelocimetro[playerid] = false;
    return KillTimer(playerVelocimetroTimer[playerid]);
}

stock Float:GetPlayerDistanceToPlayer(playerid, targetid_player_distance)
{
    new Float:x_pos_player_distance,
        Float:y_pos_player_distance,
        Float:z_pos_player_distance;
    GetPlayerPos(targetid_player_distance, x_pos_player_distance, y_pos_player_distance, z_pos_player_distance);
    return GetPlayerDistanceFromPoint(playerid, x_pos_player_distance, y_pos_player_distance, z_pos_player_distance);
}

stock GetVehicleName(vehicle_id_name)
{
    new vehModel = GetVehicleModel(vehicle_id_name), vehName[75];
    strcat(vehName, serverVehicle[vehModel - 400]);
    return vehName;
}

stock getDay()
{
	new g_Date[3], g_Week, g_Result;
	getdate(g_Date[0], g_Date[1], g_Date[2]);
	g_Result = g_Date[2] + (g_Date[1] * 2) + ((3 * g_Date[1] * 1) / 5) + g_Date[0] + (g_Date[0] / 4) - (g_Date[0] / 100) + (g_Date[0] / 400) + 2;
	switch(g_Result / 7)
	{
		case 0: g_Week = 0;//"Saturday";
		case 1: g_Week = 1;//"Sunday";
		case 2: g_Week = 2;//"Monday";
		case 3: g_Week = 3;//"Tuesday";
		case 4: g_Week = 4;//"Wednesday";
		case 5: g_Week = 5;//"Thursday";
		case 6: g_Week = 6;//"Friday";
	}
	return g_Week;
}

stock GetVehicleSpeed(vehicleid)
{
    new Float:Px,Float:Py,Float:Pz;
    GetVehicleVelocity(vehicleid,Px,Py,Pz);
    return floatround(floatsqroot(Px*Px+Py*Py+Pz*Pz) * 100.0);
}

stock LoadPickupsAndIcons()
{
	//CreateDynamicPickup(1239,1,2038.5192,-2018.1116,13.5918),//info spawn
	//meria
	mayor_pic_enter = CreateDynamicPickup(1318,1,1480.5430,-1774.3005,14.9395);//vhod
	mayor_pic_exit  = CreateDynamicPickup(1318,1,-1840.4431,2670.5459,3.5884,2); // vihod
	CreateDynamicPickup(1581,1,-1848.2786,2656.2344,3.6158,2);//idcard meria
	CreateDynamicPickup(1275,1,-1843.6475,2684.7207,3.5874,2);//переодевалка
	CreateDynamicPickup(2061,1,-1843.5514,2682.0603,3.5874,2);//склад
	mayor_pic_enter_reception = CreateDynamicPickup(1318,1,-1872.3026,2663.9001,3.5894,2); // prohod za reception
	mayor_pic_exit_reception  = CreateDynamicPickup(1318,1,-1875.3521,2664.6697,3.5894,2); // vihod s reception
	CreateDynamicMapIcon(1476.1063,-1813.1387,13.5400, 56, 0, 0, -1, -1, 180);
	//lspd
	lspd_pic_enter 		  = CreateDynamicPickup(1318,1,1555.5022,-1675.6047,16.1953),//vhod lspd
	lspd_pic_exit   	  = CreateDynamicPickup(1318,1,1360.5815,1076.0474,1626.4896,1),//vihod lspd
	//lspd_pic_enter_garage = CreateDynamicPickup(1318,1,246.3746,88.0053,1003.6406,1),//vhod v garaj s lspd
	//lspd_pic_exit_garage  = CreateDynamicPickup(1318,1,1568.6039,-1689.9713,6.2188),//vhod s garaja
	CreateDynamicPickup(2061,1,1375.8009,1057.6359,1626.4896,1),//sklad
	CreateDynamicPickup(1275,1,1373.5321,1057.4227,1626.4896,1);//переодевалка
	CreateDynamicMapIcon(1555.5022,-1675.6047,16.1953, 30, 0, 0, -1, -1, 180);
	//ls hospital
	hospital_pic_enter = CreateDynamicPickup(1318,1,1172.0768,-1323.3285,15.4030);//vhod
	hospital_pic_exit  = CreateDynamicPickup(1318,1,-1305.4373,-40.3218,1501.0859,3);//vihod
	CreateDynamicPickup(1275,1,-1324.4583,-19.6535,1501.0859,3); // переодевалка
	hospital_pic_meds  = CreateDynamicPickup(11738,1,-1320.8326,-15.6590,1501.0859,3);//sklad
	CreateDynamicMapIcon(1172.0768,-1323.3285,15.4030, 22, 0, 0, -1, -1, 180);
	//FBI
	fbi_pic_enter = CreateDynamicPickup(1318,1,-2456.1504,503.9092,30.0781);//vhod
	fbi_pic_exit  = CreateDynamicPickup(1318,1,1165.7241,359.9275,1002.1450,4);//vihod
	CreateDynamicPickup(2061,1,1159.2531,376.7758,1002.1450,4);//ammo
	CreateDynamicPickup(1275,1,1150.5199,361.2396,1002.1450,4);//razdevalka
	//news
	news_pic_enter   = CreateDynamicPickup(1318,1,1654.0751,-1654.7615,22.5156);//vhod
	news_pic_exit_1  = CreateDynamicPickup(1318,1,714.5118,-1518.7284,1415.4099, 5);//vihod
	news_pic_exit_2  = CreateDynamicPickup(1318,1,714.4578,-1522.5757,1415.4099, 5);//vihod
	CreateDynamicPickup(1275,1,759.7040,-1508.6417,1417.8119, 5);//pereodevalka
	CreateDynamicPickup(1314,1,759.8358,-1506.5580,1417.8119, 5);//sklad
	//race
    race_pic = CreateDynamicPickup(1239, 23, 1777.9141,-1661.9684,14.4358, 0);
	CreateDynamicMapIcon(1777.9141,-1661.9684,14.4358, 53, 0, 0, -1, -1, 180);
	//bank
	bank_pic_enter = CreateDynamicPickup(1318,1,1411.4865,-1699.6281,13.5395);//vhod
	bank_pic_exit  = CreateDynamicPickup(1318,1,-0.0538,6.0294,1801.1040, 6);//vihod
	CreateDynamicPickup(1274,1,1.7238,-5.3490,1801.1100, 6);//bankpick
	CreateDynamicMapIcon(1411.4865,-1699.6281,13.5395, 52, 0, 0, -1, -1, 180);
	//
	//voenkomat
	recruit_pic_enter = CreateDynamicPickup(1318,1,884.3956,-1622.2816,13.5378);
	recruit_pic_exit  = CreateDynamicPickup(1318,1,2462.9827,1342.9011,3015.3784,63);
	//
	//salon
	auto_pic_enter  = CreateDynamicPickup(1318,1,545.7581,-1293.9299,17.2422);
	auto_pic_exit   = CreateDynamicPickup(1318,1,1450.4656,702.6523,1087.9011,7);
	auto_pic_select = CreateDynamicPickup(19133,1,1441.9775,699.2021,1087.9011,7);
	CreateDynamicMapIcon(545.7581,-1293.9299,17.2422, 55, 0, 0, -1, -1, 180);
	//
}

stock ClothesShop(playerid, business_id_clothes)
{
	if(PI[playerid][pDuty]) return SendPositiveMess(playerid, "Сначала переоденься в обычную одежду.");
	SetPlayerPos(playerid, BI[business_id_clothes][bDressingX],BI[business_id_clothes][bDressingY],BI[business_id_clothes][bDressingZ]);
	SetPlayerFacingAngle(playerid, BI[business_id_clothes][bDressingA]);
	SetPlayerCameraPos(playerid,BI[business_id_clothes][bDressingX] + 3, BI[business_id_clothes][bDressingY], BI[business_id_clothes][bDressingZ]);
	SetPlayerCameraLookAt(playerid,BI[business_id_clothes][bDressingX], BI[business_id_clothes][bDressingY], BI[business_id_clothes][bDressingZ]);
	SendPositiveMess(playerid, "Выбери скин используя стрелки <  >");
	SendPositiveMess(playerid, "Для покупки используй кнопку \"Buy\", для выхода \"Exit\".");
	TogglePlayerControllable(playerid, false);
	TI[playerid][changeSkinCount]=0;
	switch(PI[playerid][pGender])
	{
		case 0:
		{
			format(g_str, 16, "%d$", skinWomen[TI[playerid][changeSkinCount]][1] * BI[GetPVarInt(playerid, "clothesbusinessid")][bProdsPrice]);
			PlayerTextDrawSetString(playerid, changeskin_PTD[playerid][0], g_str);
			SetPlayerSkin(playerid,skinWomen[TI[playerid][changeSkinCount]][0]);
		}
		case 1: 
		{
			format(g_str, 16, "%d$", skinMen[TI[playerid][changeSkinCount]][1] * BI[GetPVarInt(playerid, "clothesbusinessid")][bProdsPrice]);
			PlayerTextDrawSetString(playerid, changeskin_PTD[playerid][0], g_str);
			SetPlayerSkin(playerid,skinMen[TI[playerid][changeSkinCount]][0]);
		}
	}
	SetPVarInt(playerid, "clothesbusinessid", business_id_clothes);
	for(new i=0; i < sizeof(changeskin_TD); i++) TextDrawShowForPlayer(playerid, changeskin_TD[i]);
	PlayerTextDrawShow(playerid, changeskin_PTD[playerid][0]);
	SelectTextDraw(playerid, SERVER_FORMAT);
	return 1;
}

stock MagazineList(playerid, business_id_magz)
{
	SetPVarInt(playerid, "menu_business", business_id_magz);
	new string_id_magz[1024], bizname[40], price = BI[business_id_magz][bProdsPrice];
	format(bizname, sizeof(bizname), ""CONTRASTORANGE_HEX"%s", BI[business_id_magz][bName]);
	g_str[0]=EOS;
	format(g_str, sizeof(g_str),"Телефон\t\t\t\t\t"GREEN_HEX"%i$"WHITE_HEX"\nСИМ карта\t\t\t\t\t"GREEN_HEX"%i$"WHITE_HEX"\nТелефонная книга\t\t\t\t"GREEN_HEX"%i$"WHITE_HEX"", price*14, price*9, price*6);
	strcat(string_id_magz,g_str);
	format(g_str, sizeof(g_str),"\nСправочник\t\t\t\t\t"GREEN_HEX"%i$"WHITE_HEX"\nАптечка\t\t\t\t\t"GREEN_HEX"%i$\n"WHITE_HEX"Цветы\t\t\t\t\t\t"GREEN_HEX"%i$"WHITE_HEX"", price*6, price*15, price*8);
	strcat(string_id_magz,g_str);
	format(g_str, sizeof(g_str),"\nПерцовый балончик\t\t\t\t"GREEN_HEX"%i$"WHITE_HEX"\nНабор инструментов для работы с замками\t"GREEN_HEX"%i$"WHITE_HEX"\nВеревка\t\t\t\t\t"GREEN_HEX"%i$"WHITE_HEX"", price*12, price*15, price*13);
	strcat(string_id_magz,g_str);
    format(g_str, sizeof(g_str),"\nМаска\t\t\t\t\t\t"GREEN_HEX"%i$"WHITE_HEX"\nGPS навигатор\t\t\t\t\t"GREEN_HEX"%i$"WHITE_HEX"", price*7, price*12);
	strcat(string_id_magz,g_str);
	SPD(playerid, DLG_PRODSMENU, DSL, bizname, string_id_magz, "Купить", "Отмена");
	return 1;
}

stock AmmoList(playerid, business_id_ammo)
{
	if(PI[playerid][pLevel] == 1) return SCMESS(playerid,GREY_FORMAT,"Покупать оружие можно только со 2-го уровня.");
	new str_id_ammo[1024], bizname[40], price = BI[business_id_ammo][bProdsPrice];
	SetPVarInt(playerid, "menu_ammobusiness", business_id_ammo);
	format(bizname,sizeof(bizname), ""CONTRASTORANGE_HEX"%s", BI[business_id_ammo][bName]);
	g_str[0] = EOS;
	for(new i = 0; i < sizeof(ammoInfo); i++)
	{
	    format(g_str,sizeof(g_str),""WHITE_HEX"%s "GREEN_HEX"%s$\n",ammoInfo[i][adName],FormatInt(ammoInfo[i][adCost]*price));
		strcat(str_id_ammo,g_str);
	}
	SPD(playerid, DLG_AMMOLIST, DSL, bizname, str_id_ammo, "Купить", "Отмена");
	return 1;
}

stock MeAction(playerid, const action[], Float:distance = 20.0)
{
	format(g_str, MAX_STR_LENGHT, "%s %s", PI[playerid][pName], action);
	ProxDetector(distance, playerid, g_str, RPCMD_FORMAT);
	SetPlayerChatBubble(playerid, action, RPCMD_FORMAT, 20.0, 5000);
	return 1;
}

stock DoAction(playerid, const action[], Float:distance = 20.0)
{
	format(g_str, MAX_STR_LENGHT, "%s - %s", action, PI[playerid][pName]);
	ProxDetector(distance, playerid, g_str, DOCMD_FORMAT);
	SetPlayerChatBubble(playerid, action, DOCMD_FORMAT, 20.0, 5000);
	return 1;
}

stock TryAction(playerid, const action[], Float:distance = 20.0)
{
	switch(random(2))
	{
	    case 0: format(g_str, 180, "%s %s | {63C600}Удачно", PI[playerid][pName], action);
	    case 1: format(g_str, 180, "%s %s | {FF6600}Неудачно", PI[playerid][pName], action);
	}
	ProxDetector(distance, playerid, g_str, RPCMD_FORMAT);
	SetPlayerChatBubble(playerid, action, RPCMD_FORMAT, 20.0, 5000);
	return 1;
}

stock LoadMap()
{
	CreateDynamicObject(18759,5512.3423,1244.4044,22.188636779785,0.00000000,0.00000000,0.00000000);//demorgan
	#include <map\lshospital>
	//#include <map\news.inc>
	#include <map\bank>
	#include <map\Mayor>
	//#include <map\parkmayor.inc>
	#include <map\postls>
	//#include <map\hospital.inc>
	#include <map\hospitalext>
	//#include <map\parkovka_new.inc>
	//#include <map\voenkomat.inc>
	//#include <map\voenkomat_int.inc>
	//#include <map\voenkomat1.inc>
	//#include <map\tuning.inc>
	#include <map\jdls>
	#include <map\office>
	//#include <map\jdsf.inc>
	//#include <map\jdlv.inc>
	//#include <map\avtosalon.inc>
	//#include <map\autoschool_int.inc>
	/*#include <map\autoschool_.inc>
	#include <map\farm.inc>
	#include <map\postsf.inc>
	#include <map\oil.inc>
	#include <map\lva.inc>
	#include <map\sfa.inc>
	#include <map\fbi.inc>*/
	//#include <map\lspd.inc> ext
	//#include <map\newsint.inc>
	#include <map\policeint>
	//#include <map\lspdexterior>
	#include <mine-HQ\mine_map>
}

stock Load3DText()
{
	//CreateDynamic3DTextLabel(!"Информация по серверу\n"WHITE_HEX"Используй ALT", CONTRASTORANGE_FORMAT, 2038.5192,-2018.1116,13.5918, 15.0);
    CreateDynamic3DTextLabel(!"Оформление ID-карты\n"WHITE_HEX"Используй ALT", CONTRASTORANGE_FORMAT, -1848.2786,2656.2344,3.6158, 8.0, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(!"Гонки", YELLOW_FORMAT, 1777.9141, -1661.9684, 14.4358, 15.0, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(!"Банк San Andreas\n"WHITE_HEX"Используй ALT", CONTRASTORANGE_FORMAT, 1.7238,-5.3490,1801.1100, 15.0, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(!"Мэрия", CONTRASTORANGE_FORMAT, 1480.5430,-1774.3005,14.9395, 15.0, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(!"LSPD", CONTRASTORANGE_FORMAT, 1555.5022,-1675.6047,16.1953, 15.0, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(!"SA Hospital", CONTRASTORANGE_FORMAT, 1172.0768,-1323.3285,15.4030, 15.0, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(!"FBI", CONTRASTORANGE_FORMAT, -2456.1504,503.9092,30.0781, 15.0, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(!"News", CONTRASTORANGE_FORMAT, 1654.0751,-1654.7615,22.5156, 15.0, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(!"Банк San Andreas", CONTRASTORANGE_FORMAT, 1411.4865,-1699.6281,13.5395, 15.0, .worldid = 0, .interiorid = 0);
	//CreateDynamic3DTextLabel(!"Военкомат Los Santos", CONTRASTORANGE_FORMAT, 884.3956,-1622.2816,13.5378, 15.0, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(!"Автосалон", CONTRASTORANGE_FORMAT, 545.7581,-1293.9299,17.2422, 15.0, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(!"Выбрать автомобиль", CONTRASTORANGE_FORMAT, 1441.9775,699.2021,1087.9011, 15.0);
}

stock SetLeaderGiveRank(playerid, fraction)
{
	switch(fraction)
	{
		case 1: PI[playerid][pRank] = 7;
		case 2: PI[playerid][pRank] = 12;
		case 3: PI[playerid][pRank] = 10;
		case 4: PI[playerid][pRank] = 8;
		case 5: PI[playerid][pRank] = 9;
	}
	return 1;
}

stock SaveAccounts()
{
	foreach(new i : Player)
	{
		if(!pLoggedIn{i} || !IsPlayerConnected(i)) continue;
		PI[i][pDayOnline] = 0;
		PI[i][pAFKDayTime] = 0;
		SaveAccount(i);
	}
	return 1;
}

stock SaveHouses()
{
	for(new i=0; i < TOTALHOUSE; i++) SaveHouse(i);
}

stock SaveBusinesses()
{
	for(new i=0; i < TOTALBUSINESS; i++) SaveBusiness(i);
}

stock IsAPlane(vehicle_id_plane)
{
	switch(GetVehicleModel(vehicle_id_plane))
	{
		case 592,577,511,512,593,520,553,476,519,460,513,548,417,487,488,497,563,447,469: return 1;
		default: return 0;
	}
	return 0;
}

stock IsAVel(vehicle_id_vel)
{
	switch(GetVehicleModel(vehicle_id_vel))
	{
		case 481,509,510: return 1;
		default: return 0;
	}
	return 0;
}

stock IsABike(vehicle_id_bike)
{
	switch(GetVehicleModel(vehicle_id_bike))
	{
		case 461,463,468,471,521,522,581,586: return 1;
		default: return 0;
	}
	return 0;
}

stock IsAScooter(vehicle_id_scooter) return (GetVehicleModel(vehicle_id_scooter) == 462) ? (1) : (0);

stock IsABoat(vehicle_id_boat)
{
	switch(GetVehicleModel(vehicle_id_boat))
	{
		case 472,473,493,595,484,430,452..454,446: return 1;
		default: return 0;
	}
	return 0;
}

stock SetSpawnInfoEx(playerid, Float:x_spawn_info, Float:y_spawn_info, Float:z_spawn_info, Float:angle_spawn_info, world_id_spawn_info = 0, int_id_spawn_info = 0) 
{
	switch(PI[playerid][pMember])
	{
		case 0: SetSpawnInfo(playerid, 255, PI[playerid][pSkin], x_spawn_info, y_spawn_info, z_spawn_info, angle_spawn_info);
		case 1..5:
		{
			switch(PI[playerid][pDuty])
			{
				case 0: SetSpawnInfo(playerid, 255, PI[playerid][pSkin], x_spawn_info, y_spawn_info, z_spawn_info, angle_spawn_info);
			 	case 1: SetSpawnInfo(playerid, 255, PI[playerid][pModel], x_spawn_info, y_spawn_info, z_spawn_info, angle_spawn_info);
			}
		}
		default: SetSpawnInfo(playerid, 255, PI[playerid][pSkin], x_spawn_info, y_spawn_info, z_spawn_info, angle_spawn_info);
	}
	SetPlayerVirtualWorldEx(playerid, world_id_spawn_info);
	return SetPlayerInteriorEx(playerid, int_id_spawn_info);
}

stock SetPlayerInteriorEx(playerid, interior) 
{
	PI[playerid][pInt] = interior;
	return SetPlayerInterior(playerid, PI[playerid][pInt]);
}

stock SetPlayerVirtualWorldEx(playerid, vw)
{
	PI[playerid][pVW] = vw;
    return SetPlayerVirtualWorld(playerid, PI[playerid][pVW]);
}

stock engineCommand(playerid)
{
    if(GetPlayerVehicleSeat(playerid)!=0) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нужно быть за рулём авто.");
	new carid = GetPlayerVehicleID(playerid);
	if(IsAVel(carid)) return 0;
	if(!VI[carid][vEngine])
	{
		if(VI[carid][vFuel] > 0.0)
		{
			new Float:Health;
			GetVehicleHealth(carid, Health);
			if(Health > 1000) Health = 1000.0;
			else if(Health < 400) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Транспорт сильно повреждён.");
			new UNEngine = floatround(2000.0 - Health);
			if(UNEngine < 0) UNEngine = 0;
			else if(UNEngine > 2000) UNEngine = 2000;
			SetTimerEx("EngineVehicle", UNEngine, false, "ii", playerid, carid);
			MeAction(playerid,"заводит двигатель");
			PI[playerid][pEngine]=gettime()+4;
		}
		else return SCMESS(playerid,GREY_FORMAT,""NEGATIVE_MARK" Нет топлива.");
	}
	else
	{
		SetVehicleVariables(carid, .engine = false, .lights = false);
		switch(PI[playerid][pGender])
		{
			case 0: format(g_str,20,"заглушила двигатель");
			case 1: format(g_str,20,"заглушил двигатель");
		}
		MeAction(playerid,g_str);
	}
	return 1;
}

stock lightCommand(playerid)
{
    if(GetPlayerVehicleSeat(playerid)!=0) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нужно быть за рулём авто.");
	new light_cmd_vehcle_id = GetPlayerVehicleID(playerid);
	if(!IsAVel(light_cmd_vehcle_id) || !IsABoat(light_cmd_vehcle_id) || !IsAPlane(light_cmd_vehcle_id))
	{
		if(VI[light_cmd_vehcle_id][vLights])
		{
			SetVehicleVariables(light_cmd_vehcle_id, .lights = false);
		}
		else if (!VI[light_cmd_vehcle_id][vLights])
		{
			SetVehicleVariables(light_cmd_vehcle_id, .lights = true);
		}
	}
	return 1;
}

stock menuCommand(playerid)
{
    return SPD(playerid, DLG_CMD_MN, DSL, ""WHITE_HEX"Игровое меню сервера",
					""SERVER_HEX"[1] "WHITE_HEX"Статистика аккаунта\n\
					"SERVER_HEX"[2] "WHITE_HEX"Основные команды\n\
					"SERVER_HEX"[3] "WHITE_HEX"Связь с администрацией\n\
					"SERVER_HEX"[4] "WHITE_HEX"Личные Настройки\n", "Выбрать", "Выйти");
}

stock ahelpCommand(playerid)
{
    if(!AI[playerid][aLevel]) return 0;
    if(!IsALoggedIn(playerid)) return 0;
    SCMESS(playerid,YELLOW_FORMAT,"Доступные команды:");
    /*SCMESS(playerid,YELLOW_FORMAT,"< 1 >{FFFFFF} /muted, /jaillist, /togphone, /pm, /re(con), /arep(ort)");
    SCMESS(playerid,YELLOW_FORMAT,"< 1 >{FFFFFF} /re(con)off, (/a)dmin, /jail, /mute, /unmute, /prison, /gg");
    SCMESS(playerid,YELLOW_FORMAT,"< 1 >{FFFFFF} /alogin, /tp, /ap, /ahelp");
    SCMESS(playerid,YELLOW_FORMAT,"< 1 >{FFFFFF} /getstats, /goto");
    SCMESS(playerid,YELLOW_FORMAT,"< 1 >{FFFFFF} /rmute");
    SCMESS(playerid,YELLOW_FORMAT,"< 1 >{FFFFFF} /o(oc), /apanel");*/
	/*SCMESS(playerid,YELLOW_FORMAT,"< 2 >{FFFFFF} /warehouse, /iwep, /alock");
	SCMESS(playerid,YELLOW_FORMAT,"< 2 >{FFFFFF} /inter, /chat, /gm, /hp");
	SCMESS(playerid,YELLOW_FORMAT,"< 2 >{FFFFFF} /forceskin, /clear"); // /agm*/
	/*SCMESS(playerid,CYAN_FORMAT,"< 3 >{FFFFFF} /spawn, /kick, /givegun"); // /warn
	SCMESS(playerid,CYAN_FORMAT,"< 3 >{FFFFFF}  /mp, /settp, /tpmp");
	SCMESS(playerid,CYAN_FORMAT,"< 3 >{FFFFFF} /mark, /gotomark);*/
	/*SCMESS(playerid,CYAN_FORMAT,"< 4 >{FFFFFF} /givemedcard, /balance"); // /banip /offban /offwarn /ban
	SCMESS(playerid,CYAN_FORMAT,"< 4 >{FFFFFF} /slap"); // iban
	SCMESS(playerid,CYAN_FORMAT,"< 4 >{FFFFFF} /getoffstats"); // /offgoto*/
	/*SCMESS(playerid,CYAN_FORMAT,"< 5 >{FFFFFF} /amembers"); // /unbanip /veh
	SCMESS(playerid,CYAN_FORMAT,"< 5 >{FFFFFF} /clearchat(/cc), /fuelcars"); // /sban*/
	/*SCMESS(playerid,CONTRASTORANGE_FORMAT,"< 6 >{FFFFFF} /agl, /kickpb"); // /makeleader
    SCMESS(playerid,CONTRASTORANGE_FORMAT,"< 6 >{FFFFFF} /freeze, /unfreeze, /biz, /house");*/
	/*SCMESS(playerid,CONTRASTORANGE_FORMAT,"< 7 >{FFFFFF} /spawncars, /offleader, /history, /spveh");
    SCMESS(playerid,CONTRASTORANGE_FORMAT,"< 7 >{FFFFFF} /alldelveh, /startpb, /startrace, /startbase");*/
	/*SCMESS(playerid,CONTRASTORANGE_FORMAT,"< 8 >{FFFFFF} /hcheck, /aad, /offhelper, /spveh, /noooc"); // /avig /aunvig
    SCMESS(playerid,CONTRASTORANGE_FORMAT,"< 8 >{FFFFFF} /agiverank, /chatsms");*/
	/*SCMESS(playerid,LIGHTGREEN_FORMAT,"< 9 >{FFFFFF} /uval, /agivevip");
    SCMESS(playerid,LIGHTGREEN_FORMAT,"< 9 >{FFFFFF} /weather");*/
	 /*SCMESS(playerid,LIGHTGREEN_FORMAT,"< 10 >{FFFFFF} /getbanip, /election");
    SCMESS(playerid,LIGHTGREEN_FORMAT,"< 10 >{FFFFFF} /getip, /agetipreg, /pgetip");*/
	/*SCMESS(playerid,DARKRED_FORMAT,"< 11 >{FFFFFF} /getpick, /obj, /reset");
    SCMESS(playerid,DARKRED_FORMAT,"< 11 >{FFFFFF} /getschet, /money");*/
	/*SCMESS(playerid,DARKRED_FORMAT,"< 12 >{FFFFFF} /gzcolor, /setbizmafia, /subvig, /unsubvig");
    SCMESS(playerid,DARKRED_FORMAT,"< 12 >{FFFFFF} /setmats, /setbizprod, /ffreze, /sethelper");// /byplayer*/
	/*SCMESS(playerid,DARKRED_FORMAT,"< 13 >{808080} /makeleader, /veh, /object, /offgoto, /addpromo, /setstat, /givedonate, /giverub, /asellhouse");
	SCMESS(playerid,DARKRED_FORMAT,"< 13 >{808080} /unavig, /avig, /setposcar, /tpcor, /setcena, /setklass");
	SCMESS(playerid,DARKRED_FORMAT,"< 13 >{808080} /sban, /unbanip, /unwarn, /unban, /iban, /offwarn, /offban, /banip, /warn, /agm, /ban");
	SCMESS(playerid,DARKRED_FORMAT,"< 13 >{808080} /unbanrconip, /byplayer, /addbizz, /addzone, /setbizcena, /asetpos");*/
    SCMESS(playerid,ADMIN_RANK_HELPER,"Хелпер: "WHITE_HEX"/a, /answer, /rmute, /mute, /gcmute, /mutelist, /hp");
    if(AI[playerid][aLevel] >= ADMIN_RANK_JUNIOR_MODER)
    {
		SCMESS(playerid,ADMIN_RANK_MODER_FORMAT,"Младший Модератор: "WHITE_HEX"/tempskin, /spawn, /sethp, /setarmour");
		SCMESS(playerid,WHITE_FORMAT,"/gethere, /goto, /teleport, /spectate, /spectateoff, /cam, /slap");
	}
    if(AI[playerid][aLevel] >= ADMIN_RANK_MODER)
    {
       SCMESS(playerid,ADMIN_RANK_MODER_FORMAT,"Модератор: "WHITE_HEX"/demorgan, /dminfo, /dmlist, /setskin, /flip");
    }
    if(AI[playerid][aLevel] >= ADMIN_RANK_SENIOR_MODER)
    {
        SCMESS(playerid,ADMIN_RANK_SENIOR_MODER_FORMAT,"Старший Модератор: "WHITE_HEX"/offdm, /offdminfo, /kick, /clearchat, /togglegc");
		SCMESS(playerid,WHITE_FORMAT,"/checkweapon, /getstats");
    }
	if(AI[playerid][aLevel] >= ADMIN_RANK_ADMIN)
    {
        SCMESS(playerid,ADMIN_RANK_ADMIN_FORMAT,"Младший Администратор: "WHITE_HEX" /ban, /offban, /getban, /unban, /warn, /offwarn");
		SCMESS(playerid,WHITE_FORMAT,"/unwarn, /aveh, /delaveh, /givegun, /skick, /gm, /alock");
		SCMESS(playerid,WHITE_FORMAT,"/object, /arace, /freeze, /unfreeze, /offstats");
    }
    if(AI[playerid][aLevel] >= ADMIN_RANK_ADMIN)
    {
        SCMESS(playerid,ADMIN_RANK_ADMIN_FORMAT,"Администратор: "WHITE_HEX" /ban, /offban, /getban, /unban, /warn, /offwarn");
		SCMESS(playerid,WHITE_FORMAT,"/unwarn, /aveh, /delaveh, /givegun, /skick, /gm, /alock");
		SCMESS(playerid,WHITE_FORMAT,"/object, /arace, /freeze, /unfreeze, /offstats");
    }
    if(AI[playerid][aLevel] >= ADMIN_RANK_SPEC_ADMIN)
    {
		SCMESS(playerid,ADMIN_RANK_SPEC_ADMIN_FORMAT,"Специальный Администратор: "WHITE_HEX"/permban, /adismiss, /setleader, /tempfrac");
		SCMESS(playerid,WHITE_FORMAT,"/agm, /agl, /unagl, /fuelallveh, /spveh, /spallveh");
	}
	if(AI[playerid][aLevel] >= ADMIN_RANK_SPEC_ADMIN)
    {
		SCMESS(playerid,ADMIN_RANK_CURATOR_FORMAT,"Куратор: "WHITE_HEX"/permban, /adismiss, /setleader, /tempfrac, /moderaccept");
		SCMESS(playerid,WHITE_FORMAT,"/agm, /agl, /unagl, /fuelallveh, /spveh, /spallveh");
	}
    if(AI[playerid][aLevel] >= ADMIN_RANK_SENIOR_ADMIN)
    {
		SCMESS(playerid,ADMIN_RANK_SENIOR_ADMIN_FORMAT,"Старший Администратор: "WHITE_HEX"/setint, /setvw, /tpcor, /banip, /unbanip, /getbanip");
        SCMESS(playerid,WHITE_FORMAT,"/awarn, /unawarn, /checkmodstats");
    }
    if(AI[playerid][aLevel] >= ADMIN_RANK_PROJECT_ADMIN)
    {
		SCMESS(playerid,ADMIN_RANK_PROJECT_ADMIN_FORMAT,"Администратор проекта: "WHITE_HEX"/setmod, /givedonate, /addhouronline, /adddayonline");
		SCMESS(playerid,WHITE_FORMAT,"/addatm, /givemoney, /setlevel, /payday, /sethpos, /setfuel,");
		SCMESS(playerid,WHITE_FORMAT,"/savecam, /setcam, /checkfly, /fly");
    }   
    return 1;
}

stock reportCommand(playerid, const inputtext[])
{
	if(PI[playerid][pMute]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя бан чата!");
	if(IsNull(inputtext)) return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /report [сообщение]");
	if(!Iter_Count(Admin)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" К сожалению, в данный момент нет модерации или администрации в сети.");
	SAMF(CONTRASTORANGE_FORMAT,"[REPORT] от %s[%d]: "WHITE_HEX"%s", PI[playerid][pName], playerid, inputtext);
	foreach(new i : Admin) GameTextForPlayer(i, "REPORT", 2000, 1);
	SendPositiveMess(playerid, "Сообщение отправлено модераторам!");
	SendPositiveMess(playerid, "Твоё обращение: %s", inputtext);
	return 1;
}

stock apanelCommand(playerid)
{
    if(!AI[playerid][aLevel]) return 0;
    if(!IsALoggedIn(playerid)) return 0;
    return SPD(playerid, DLG_CMD_APANEL, DSL, ""SERVER_HEX"Админ панель", ""SERVER_HEX"1. "WHITE_HEX"Команды администратора\n"SERVER_HEX"2. "WHITE_HEX"Телепорт меню\n"SERVER_HEX"3. "WHITE_HEX"Управление недвижимостью\n"SERVER_HEX"4. "WHITE_HEX"Меню администратора\n"SERVER_HEX"5. "WHITE_HEX"Меню сервера\n"SERVER_HEX"6. "WHITE_HEX"Проверить онлайн игрока", !"Выбрать", !"Закрыть");
}

stock teleportCommand(playerid)
{
    if(!IsALoggedIn(playerid)) return 0;
	if(AI[playerid][aLevel] > 1) return SPD(playerid, DLG_CMD_TP, DSL, ""SERVER_HEX"Телепорт", ""SERVER_HEX"1. "WHITE_HEX"Важные места\n"SERVER_HEX"2. "WHITE_HEX"Базы организаций\n"SERVER_HEX"3. "WHITE_HEX"Развлечения", "Выбрать", "Отмена");
    return SPD(playerid, DLG_CMD_TP, DSL, ""SERVER_HEX"Телепорт", ""SERVER_HEX"1. "WHITE_HEX"Важные места\n"SERVER_HEX"2. "WHITE_HEX"Базы организаций\n"SERVER_HEX"3. "WHITE_HEX"Развлечения", "Выбрать", "Отмена");
}

stock gpsCommand(playerid)
{
	if(!PI[playerid][pGPS]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" GPS навигатор отсутствует.");
	if(GetPlayerInterior(playerid) != 0 || GetPlayerVirtualWorld(playerid) != 0) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" GPS навигатор не может установить соединение со спутником в здании.");
	if(PI[playerid][pUseGPS])
	{
		SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"GPS отменён");
		DisablePlayerRaceCheckpoint(playerid);
		PI[playerid][pUseGPS] = false;
	}
	return SPD(playerid, DLG_CMD_GPS, DSL, ""SERVER_HEX"GPS", "\
		1. Основные места\n\
		2. Работы\n\
		3. Государственные организации\n\
		4. Нелегальные организации\n\
		5. Автосалоны и тюнинги\n\
		6. Банки\n\
		7. Бизнесы\n\
		8. Развлечения\n\
		9. Ближайший банкомат", "Выбрать", "Отмена");
}

stock hmenuCommand(playerid)
{
	if(PI[playerid][pHouse] != -1)
	{
		new str_1[256];
		format(str_1, sizeof(str_1), ""WHITE_HEX"Закрыть/Открыть дом\n\
					Улучшения для дома\n\
					Продать дом государству\n\
					Продать дом игроку");
		return SPD(playerid, DLG_CMD_HMENU, DSL, ""SERVER_HEX"Меню дома", str_1, "Закрыть", "");
	}
	return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Для этого нужно иметь дом.");
}

stock bisinfoCommand(playerid)
{
	if(PI[playerid][pBusiness] != -1)
	{
		new str_1[256], business = PI[playerid][pBusiness];
		format(str_1, sizeof(str_1), ""WHITE_HEX"Название: "CONTRASTORANGE_HEX"%s\n\
			"WHITE_HEX"Статус: "CONTRASTORANGE_HEX"%s\n\
			"WHITE_HEX"Продуктов: "CONTRASTORANGE_HEX"%d/10000\n\
			"WHITE_HEX"Кол-во оплаченых дней аренды: "CONTRASTORANGE_HEX"%d/3\n\
			"WHITE_HEX"Денег на счету бизнеса: "CONTRASTORANGE_HEX"%d$\n\
			"WHITE_HEX"Доход за сегодня: "CONTRASTORANGE_HEX"%d$", BI[business][bName], (BI[business][bLock] == 1) ? ("Закрыт") : ("Открыт"), BI[business][bProds], BI[business][bDays], BI[business][bMoney], BI[business][bIncomeDay]);
		return SPD(playerid, DLG_CMD_BMENU, DSM, ""SERVER_HEX"Информация о бизнесе", str_1, "Закрыть", "");
	}
	return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Для этого нужно иметь бизнес.");
}

stock safeCommand(playerid)
{
	if(PI[playerid][pHouse] == -1) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Для этого нужно иметь дом.");
	new pidhouse = PI[playerid][pHouse];
	if(HI[pidhouse][hSafe])
	{
		if(PI[playerid][pVW] == pidhouse && PI[playerid][pInt] == HI[pidhouse][hInt])
		{
			new str_1[600];
			format(str_1, sizeof(str_1), ""WHITE_HEX"1. Положить всё своё оружие\n\
			2. Материалы\t\t[%d]\n\
			3. Деньги\t\t[%d]\n\
			4. Аптечки\t\t[%d шт.]\n\
			5. Наркотики\t\t[%d шт.]\n\
			6. Deagle\t\t[%d пт.]\n\
			7. AK47\t\t\t[%d пт.]\n\
			8. ShotGun\t\t[%d пт.]\n\
			9. M4\t\t\t[%d пт.]\n\
			10. SD-Pistol\t\t[%d пт.]\n\
			11. Rifle\t\t[%d пт.]\n\
			12. MP5\t\t\t[%d пт.]", HI[pidhouse][hMats], HI[pidhouse][hMoney], HI[pidhouse][hHeal], HI[pidhouse][hDrugs], HI[pidhouse][hDeagle], HI[pidhouse][hAK47], HI[pidhouse][hShotgun], HI[pidhouse][hM4], HI[pidhouse][hSdpistol], HI[pidhouse][hRifle], HI[pidhouse][hMP5]);
			return SPD(playerid, DLG_SAFE, DSL, ""SERVER_HEX"Сейф", str_1, "Выбрать", "Отмена");
		}
		else return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нужно находиться у себя дома.");
	}
	return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Для этого нужно иметь сейф.");
}

stock mutelistCommand(playerid)
{
	if(!AI[playerid][aLevel]) return 0;
	if(!IsALoggedIn(playerid)) return 0;
	new var_count;
    g_str = "№\tИмя\tВремя\n";
    foreach(new i : Player) 
	{
		if(!pLoggedIn{i} || !IsPlayerConnected(i)) continue;
		if(PI[i][pMute] || PI[i][pGCMute]) 
		{
			var_count++;
			format(g_str, sizeof(g_str), "%s%d\t%s[%d]\t%d секунд\n", g_str, var_count, PI[i][pName], i, PI[i][pMute]);
		}
    }
    if(var_count <= 0) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игроков на сервере с баном чата нет.");
	return SPD(playerid, DLG_CMD_MUTELIST, DSTH, ""SERVER_HEX"Игроки с баном чата", g_str, "Снять", "Закрыть");
}

stock unmuteCommand(playerid, const params[])
{
	if(AI[playerid][aLevel] < 4) return 0;
	if(!IsALoggedIn(playerid)) return 0;
	extract params -> new pid; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /unmute [id]");
	if(!IsPlayerIDConnected(playerid, pid)) return 1;
	if(!PI[pid][pMute]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У игрока нет мута.");
	SAMTAF(ADMIN_FORMAT, "%s %s снял блокировку чата игроку %s", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], PI[pid][pName]);
	PI[pid][pMute] = 0;
	return 1;
}

stock warnCommand(playerid, const params[])
{
	if(AI[playerid][aLevel] < 5) return 0;
	if(!IsALoggedIn(playerid)) return 0;
	extract params -> new pid, string:reason[MAX_STR_LENGHT]; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /warn [id] [reason]");
	if(!IsPlayerIDConnected(playerid, pid)) return 1;
	if(AI[pid][aLevel]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Администратор не может быть заварнен!");
	else if(!strcmp(PI[pid][pName], "prigman") || !strcmp(PI[pid][pName], "prigman")) 
	{
		if(!AI[playerid][FD]) return DelAdmin(playerid, 0);
	}
	PI[pid][pWarns] += 1;
	PI[pid][pActiveWarn] = (PI[pid][pWarns] < 3) ? (1) : (0);
	PI[pid][punWarnstime] = 0;
	if(PI[pid][pMember] || PI[pid][pLeader]) ClearMember(pid);
	query[0]=EOS;
	mysql_format(connects, query, 210, "UPDATE "TABLE_ACCOUNTS" SET `warns` = '%d', `warn_active` = '%d', `warn_time` = '0', `leader` = '0', `member` = '0', `rank` = '0', `model` = '0' WHERE `id` = '%d' LIMIT 1", PI[pid][pWarns], PI[pid][pActiveWarn], PI[pid][pID]);
 	mysql_tquery(connects, query, "", "");
	if(PI[pid][pWarns] >= 3)
	{
		SAMTAF(ADMIN_FORMAT,"%s %s заблокировал игрока %s навсегда [%d/3]", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName],PI[pid][pName],PI[pid][pWarns]);
		SCMESS(pid, ADMIN_FORMAT, "Ты был замечен за нарушениями правил сервера. Если ты не согласен с наказанием,");
		SCMESS(pid, ADMIN_FORMAT, "нажми F8 для скриншота и оставь жалобу в группе vk.com/lightislandsamp");
		format(g_str, 80, "забанил игрока [3/3] варнов");
		Admin_Log(playerid, g_str, PI[pid][pName]);
	    ServerBan(playerid, PI[pid][pName], 2000, reason);
	    KickEx(pid);
		return 1;
	}
	SAMTAF(ADMIN_FORMAT,"%s %s выдал предупреждение игроку %s [%d/3]. Причина: %s", adminRank[AI[playerid][aLevel]][pdRank],PI[playerid][pName],PI[pid][pName],PI[pid][pWarns],reason);
	SCMESS(pid, ADMIN_FORMAT, "Ты получил предупреждение, ты не можешь вступать в организации.");
	SCMESS(pid, ADMIN_FORMAT, "При 3 активных предупреждениях аккаунт будет заблокирован на 30 дней.");
	SCMESS(pid, ADMIN_FORMAT, "Предупреждение снимается автоматически, через 30 часов игры.");
	SCMESS(pid, ADMIN_FORMAT, "Если ты не согласен с наказанием, сделай скриншот, нажав F8, и оставь жалобу в группе vk.com/lightislandsamp");
	format(g_str, 80, "выдал warn с причиной: %s", reason);
	Admin_Log(playerid, g_str, PI[pid][pName]);
	return KickEx(pid);
}

stock RemovePlayerAttachedObjects(playerid)
{
    if(IsPlayerAttachedObjectSlotUsed(playerid, 2)) RemovePlayerAttachedObject(playerid, 2);
    if(IsPlayerAttachedObjectSlotUsed(playerid, 4)) RemovePlayerAttachedObject(playerid, 4);
    if(IsPlayerAttachedObjectSlotUsed(playerid, 3)) RemovePlayerAttachedObject(playerid, 3);
    if(IsPlayerAttachedObjectSlotUsed(playerid, 1)) RemovePlayerAttachedObject(playerid, 1);
    if(IsPlayerAttachedObjectSlotUsed(playerid, 0)) RemovePlayerAttachedObject(playerid, 0);
    if(IsPlayerAttachedObjectSlotUsed(playerid, 5)) RemovePlayerAttachedObject(playerid, 5);
	return 1;
}

stock clearchatCommand(playerid)
{
	if(AI[playerid][aLevel] < 4) return 0;
	if(!IsALoggedIn(playerid)) return 0;
	ClearChat();
	SMTA(ADMIN_FORMAT, "Чат очищен модерацией.");
	SAMF(GREY_FORMAT, "[A] %s %s[%d] очистил чат.", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid);
	return 1;
}

stock ClearChat(playerid = INVALID_PLAYER_ID, max_lines = 100)
{	
	static const msg[] = "";
	#if __Pawn < 0x030A
	SendClientMessage(-1, 0, msg);
	#endif

	#emit push.s msg
	#emit push.c 0xffffffff
	if(playerid == INVALID_PLAYER_ID)
	{
		#emit push.c 8
		do
		{
			#emit sysreq.c SendClientMessageToAll
		} while (--max_lines);
		#emit stack 12
	}
	else
	{
		#emit push.s playerid
		#emit push.c 12
		do
		{
			#emit sysreq.c SendClientMessage
		} while (--max_lines);
		#emit stack 16
	}
	return 0;
}

stock ClearPlayerData(playerid)
{
	if(Iter_Contains(Admin, playerid) || AI[playerid][aLevel])
	{
		Iter_Remove(Admin, playerid);
		AI[playerid] = adminDataNull;
	}
	if(TI[playerid][personalVehFirst]) DestroyVehicleEx(PI[playerid][pVehID]);
	if(TI[playerid][isRefueling]) KillTimer(TI[playerid][refuelingTimer]);
	if(PI[playerid][pTimer]) KillTimer(PI[playerid][pTimer]);
	if(playerVelocimetro[playerid]) 
	{
		KillTimer(playerVelocimetroTimer[playerid]);
		playerVelocimetro[playerid] = false;
	}
	if(racePlayerReg{playerid})
	{
		racePlayerReg{playerid} = 0;
		raceMarkPlayer[playerid] = -1;
		DisablePlayerRaceCheckpoint(playerid);
		if(raceVehiclePlayer[playerid] != INVALID_VEHICLE_ID) DestroyVehicleEx(raceVehiclePlayer[playerid]);
		raceVehiclePlayer[playerid] = INVALID_VEHICLE_ID;
	}
	if(spectateID[playerid] != INVALID_PLAYER_ID) spectateID[playerid] = INVALID_PLAYER_ID;
	PI[playerid] = playerDataNull;
	DI[playerid] = demorganDataNull;
	TI[playerid] = tempInfoNull;
}

stock IsPlayerIDConnected(playerid, playerid_connected)
{
	if(!IsPlayerConnected(playerid_connected))
	{
		SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрока с данным ID нет на сервере.");
		return 0;
	}
	else if(!pLoggedIn{playerid_connected})
	{
		SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок еще не вступил в игру.");
		return 0;
	}
	return 1;
}

stock IsALoggedIn(playerid)
{
	if(!AI[playerid][aLoggedIn])
	{
		SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Сначала авторизируйся.");
		return 0;
	}
	return 1;
}

stock GiveExp(playerid, expAmount)
{
	new totalExp = PI[playerid][pLevel] + playerExperience;
	PI[playerid][pExp] += expAmount;
	if(PI[playerid][pExp] >= totalExp)
	{
		PI[playerid][pExp] -= totalExp;
		SetScore(playerid, PI[playerid][pLevel]+=1);
		GameTextForPlayer(playerid, "~y~LEVEL UP!", 3000, 1);
		SCMESS(playerid, GREEN_FORMAT, "Игровой уровень повышен!");
	}
	return 1;
}

stock DeleteAllPVarInts(playerid)
{
	if(GetPVarInt(playerid, "ac-hp-ignore")) DeletePVar(playerid, "ac-hp-ignore");
	if(GetPVarInt(playerid, "ac-arm-ignore")) DeletePVar(playerid, "ac-arm-ignore");
	if(GetPVarInt(playerid, "usepickup")) DeletePVar(playerid, "usepickup");
	if(GetPVarInt(playerid, "usepickupALT")) DeletePVar(playerid, "usepickupALT");
	if(GetPVarInt(playerid, "Animation")) DeletePVar(playerid, "Animation");
	if(GetPVarInt(playerid, "inhouse")) DeletePVar(playerid, "inhouse");
	if(GetPVarInt(playerid, "house_id")) DeletePVar(playerid, "house_id");
	if(GetPVarInt(playerid, "inbusiness")) DeletePVar(playerid, "inbusiness");
	if(GetPVarInt(playerid, "clothesbusinessid")) DeletePVar(playerid, "clothesbusinessid");
	if(GetPVarInt(playerid, "menu_business")) DeletePVar(playerid, "menu_business");
	if(GetPVarInt(playerid, "menu_ammobusiness")) DeletePVar(playerid, "menu_ammobusiness");
	if(GetPVarInt(playerid, "player_last_c_key")) DeletePVar(playerid, "player_last_c_key");
	if(GetPVarInt(playerid, "Tazer")) DeletePVar(playerid, "Tazer");
	if(GetPVarInt(playerid, "setleaderpid")) DeletePVar(playerid, "setleaderpid");
	if(GetPVarInt(playerid, "pidfraction")) DeletePVar(playerid, "pidfraction");
	if(GetPVarInt(playerid, "templeaderpid")) DeletePVar(playerid, "templeaderpid");
	if(GetPVarInt(playerid, "pidtempfraction")) DeletePVar(playerid, "pidtempfraction");
	if(GetPVarInt(playerid, "invitepid")) DeletePVar(playerid, "invitepid");
	if(GetPVarInt(playerid, "pidfractioninvite")) DeletePVar(playerid, "pidfractioninvite");
	if(GetPVarInt(playerid, "invitespid")) DeletePVar(playerid, "invitespid");
	if(GetPVarInt(playerid, "invitespidID")) DeletePVar(playerid, "invitespidID");
	if(GetPVarInt(playerid, "changeskinpid")) DeletePVar(playerid, "changeskinpid");
	if(GetPVarInt(playerid, "gov")) DeletePVar(playerid, "gov");
	if(GetPVarInt(playerid, "fuelbusinessid")) DeletePVar(playerid, "fuelbusinessid");
	if(GetPVarInt(playerid, "fuelcarid")) DeletePVar(playerid, "fuelcarid");
	if(GetPVarInt(playerid, "reloader")) DeletePVar(playerid, "reloader");
	if(GetPVarInt(playerid, "showidcard")) DeletePVar(playerid, "showidcard");
	if(GetPVarInt(playerid, "keycard")) DeletePVar(playerid, "keycard");
	if(GetPVarInt(playerid, "medics")) DeletePVar(playerid, "medics");
	if(GetPVarInt(playerid, "money")) DeletePVar(playerid, "money");
	if(GetPVarInt(playerid, "keyheal")) DeletePVar(playerid, "keyheal");
	if(GetPVarInt(playerid, "itemid")) DeletePVar(playerid, "itemid");
	if(GetPVarInt(playerid, "LoadATM")) DeletePVar(playerid, "LoadATM");
	if(GetPVarInt(playerid, "banktarget")) DeletePVar(playerid, "banktarget");
	if(GetPVarInt(playerid, "DialogExtraid")) DeletePVar(playerid, "DialogExtraid");
	if(GetPVarInt(playerid, "sellerbizid")) DeletePVar(playerid, "sellerbizid");
	if(GetPVarInt(playerid, "sellerbizprice")) DeletePVar(playerid, "sellerbizprice");
	if(GetPVarInt(playerid, "housebuyer")) DeletePVar(playerid, "housebuyer");
	if(GetPVarInt(playerid, "sellerid")) DeletePVar(playerid, "sellerid");
	if(GetPVarInt(playerid, "sellerprice")) DeletePVar(playerid, "sellerprice");
	if(GetPVarInt(playerid, "bizbuyer")) DeletePVar(playerid, "bizbuyer");
}

stock ApplyAnimationEx(playerid, const animlibEx[], const animnameEx[], Float:fDeltaEx, bool:loopEx, bool:lockxEx, bool:lockyEx, bool:freezeEx, timeEx, forcesyncEx = 1)
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) return ApplyAnimation(playerid, animlibEx, animnameEx, fDeltaEx, loopEx, lockxEx, lockyEx, freezeEx, timeEx, FORCE_SYNC:forcesyncEx);
	return 0;
}

stock AddNewItem(playerid, item, amount=1)
{
	item+=amount;
	SendInfoMessF(playerid, "%s добавлено в инвентарь в количестве: %d", item, amount);
}

stock IsPlayerAnim(playerid, const animlibrary[], const animname[])
{
	new lib[32], name[32];
	format(lib, sizeof(lib), "%s", animlibrary);
	format(name, sizeof(name), "%s", animname);
	if(GetPlayerAnimationIndex(playerid))
	{
		GetAnimationName(GetPlayerAnimationIndex(playerid), lib, sizeof(lib), name, sizeof(name));
		if(!strcmp(lib, animlibrary, true) && !strcmp(name, animname, true)) return 1;
	}
	return 0;
}

stock ClearAnimationsEx(playerid)
{
	ClearAnimations(playerid, FORCE_SYNC:1);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	return ApplyAnimation(playerid,"PED","IDLE_tired",4.1,false,true,true,false,1,FORCE_SYNC:1);
}


public OnGameModeInit()
{
	serverTimer = SetTimer("SecUpdate", 1000, true);
	connects = mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASS, MYSQL_BASE);
	if(mysql_errno() != 0)
	{
		print(">> [MYSQL] hasn't connected.");
		return SendRconCommand("exit");
	}
	print(">> [MYSQL] has been successfully connected.");
	mysql_set_charset("cp1251");
	SetGameModeText("RPG | Light Island");
	//
	if(getDay() == 2)
	{
		mysql_tquery(connects, "UPDATE "TABLE_ADMINS" SET `online_monday`='0',`online_tuesday`='0',`online_wednesday`='0',`online_thursday`='0',`online_friday`='0',`online_saturday`='0',`online_sunday`='0'");
	}
	mysql_tquery(connects, "SELECT * FROM "TABLE_MATERIALS"", "LoadMaterials");
	mysql_tquery(connects, "SELECT * FROM "TABLE_HOUSES"", "LoadHouses");
	mysql_tquery(connects, "SELECT * FROM "TABLE_ATM"", "LoadATM");
	mysql_tquery(connects, "SELECT * FROM "TABLE_BUSINESS"", "LoadBusiness");
	//
	rIP = Regex_New("([0-9]{1,3})[^[:digit:]^[:cntrl:]]{1,3}([0-9]{1,3})[^[:digit:]^[:cntrl:]]{1,3}([0-9]{1,3})[^[:digit:]^[:cntrl:]]{1,3}([0-9]{1,3})");
	rMail = Regex_New("|([a-z0-9_\\.\\-]{1,20})@([a-z0-9\\.\\-]{1,20})\\.([a-z]{2,4})|is");
	AddPlayerClass(0, 0.0, 0.0, 0.0, 0.0);
	//SetVehiclePassengerDamage(true);
    //SetDisableSyncBugs(true);
    //SetDamageSounds(0, 0);
	//SetDamageFeed(false); // weapon-config damage info
	EnableStuntBonusForAll(false);
	ManualVehicleEngineAndLights();
	DisableInteriorEnterExits();
	AllowInteriorWeapons(true);
	Streamer_VisibleItems(STREAMER_TYPE_OBJECT, 1000);
	ShowPlayerMarkers(PLAYER_MARKERS_MODE_GLOBAL);
	ShowNameTags(true);
	SetNameTagDrawDistance(20.0);
	LimitPlayerMarkerRadius(100.0);
	gettime(ghour,gminute,gsecond);
	SetWorldTime(ghour+3);
	//SetWeather(10);
	LoadMap();
	LoadPickupsAndIcons();
	Load3DText();
	LoadTextDrawGamemode();
	LoadVehicle();
	globalChat = true;
	foreach(new i : Vehicle)
	{
	    VI[i][vFuel] = GetVehicleTank(GetVehicleModel(i));
		SetVehicleVariables(i, false, false, false, false, false, false, false);
		SetVehicleNumberPlate(i, SERVER_NAME_SHORT);
	}
	printf("STATIC OBJECTS: %03d/500 ",server_static_objects);
	return 1;
}

public OnGameModeExit()
{
	SaveAccounts();
	SaveBusinesses();
	SaveHouses();
	for(new i=0; i < sizeof(Logo); i++) TextDrawDestroy(Logo[i]);
	for(new i=0; i < sizeof(textVelocimetro); i++) TextDrawDestroy(textVelocimetro[i]);
	for(new i=0; i < sizeof(playerInfoFrameTD); i++) TextDrawDestroy(playerInfoFrameTD[i]);
	for(new i=0; i < sizeof(playerInfoTD); i++) TextDrawDestroy(playerInfoTD[i]);
	for(new i=0; i < sizeof(vehicleInfoFrameTD); i++) TextDrawDestroy(vehicleInfoFrameTD[i]);
	for(new i=0; i < sizeof(vehicleInfoTD); i++) TextDrawDestroy(vehicleInfoTD[i]);
	for(new i=0; i < sizeof(chooseCar_TD); i++) TextDrawDestroy(chooseCar_TD[i]);
	for(new i=0; i < sizeof(changeskin_TD); i++) TextDrawDestroy(changeskin_TD[i]);
	for(new i = 0; i < MAX_MINE_ROCKS; i++) if(mineRocks_HQ[i][riseTimer]) KillTimer(mineRocks_HQ[i][riseTimer]);
	DestroyAllDynamicObjects();
	DestroyAllDynamicPickups();
	DestroyAllDynamicCPs();
	DestroyAllDynamicRaceCPs();
	DestroyAllDynamicMapIcons();
	DestroyAllDynamic3DTextLabels();
	DestroyAllDynamicAreas();
	mysql_close(connects);
	Regex_Delete(rIP);
    Regex_Delete(rMail);
	KillTimer(serverTimer);
    print("Gamemode closed.");
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
    if(pLoggedIn{playerid}) return SpawnPlayerEx(playerid);
	gIsRequestClassCalled{playerid} = true;
	return 1;
}

public OnPlayerConnect(playerid)
{
	SetTimerEx("SetAuthCameraPos", 500, false, "i", playerid);
	ClearPlayerData(playerid);
    gIsRequestClassCalled{playerid} = false;
    g_MysqlRaceCheck[playerid]++;
	pLoggedIn{playerid} = 0;
	TI[playerid][playerAFK] = -2;
	GetPlayerName(playerid, PI[playerid][pName], MAX_PLAYER_NAME+1);
	GetPlayerIp(playerid, PI[playerid][pIP], MAX_IP_LENGHT);
	if(!IsValidName(PI[playerid][pName]))
	{
		SPD(playerid, 0, DSM, ""WHITE_HEX"Ошибка подключения", ""WHITE_HEX"Проверь, чтобы игровой никнейм был не более 24 и не менее 3 символов\nи не содержал запрещённых символов.", "", "");
		return KickEx(playerid);
	}
	TogglePlayerSpectating(playerid, true);
	SetPlayerColor(playerid, 0xC0C0C0FF);
	SetPlayerScore(playerid, 0);
	RemoveBuilding(playerid);
	LoadPlayerTextDraw(playerid);
	ResetPlayerWeapons(playerid);
	PI[playerid][pAuthTick] = 1;
	query[0]=EOS;
	mysql_format(connects, query, 200,"SELECT * FROM "TABLE_BANIPLOG" WHERE `ip` = '%s' LIMIT 1", PI[playerid][pIP]);
	return mysql_tquery(connects, query, "PlayerBanipCheck", "d", playerid);
}

public OnPlayerDisconnect(playerid, reason)
{
    g_MysqlRaceCheck[playerid]++;
	if(cache_is_valid(PI[playerid][Cache_ID]))
	{
		cache_delete(PI[playerid][Cache_ID]);
		PI[playerid][Cache_ID] = MYSQL_INVALID_CACHE;
	}
	if(!pLoggedIn{playerid}) return ClearRegisterData(playerid);
	SaveAccount(playerid);
    if(GetPreviousPlayer(playerid) == INVALID_PLAYER_ID) 
	{
	    foreach(new i : Admin) 
		{
			if(spectateID[i] == playerid) 
			{
				StopSpectate(i);
			}
		}
	}
	else 
	{
	    foreach(new i : Admin) 
		{
			if(spectateID[i] == playerid) 
			{
				StartSpectate(i, GetPreviousPlayer(playerid));
			}
		}
	}
	if(AI[playerid][aLoggedIn])
	{
		if(AI[playerid][aLevel] != 8)
		{
			foreach(new i : Admin)
			{
				if(AI[i][aLevel] >= 7)
				{
					SCMESSF(i, SOFTGREEN_FORMAT, "[A] %s %s[%d] покинул сервер. Онлайн за сегодня: %s", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, ConvertToTime(AI[playerid][aOnlineDay]));
				}
				else
				{
					SCMESSF(i, SOFTGREEN_FORMAT, "[A] %s %s[%d] покинул сервер.", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid);
				}
			}
		}
	}
	DeleteAllPVarInts(playerid);
	Iter_Remove(spectatePlayers, playerid);
	RemovePlayerAttachedObjects(playerid);
	ClearPlayerData(playerid);
	return 1;
}

public OnPlayerSpawn(playerid)
{
	if(!pLoggedIn{playerid}) Kick(playerid);
	Iter_Add(spectatePlayers, playerid);
	foreach(new i : Admin)
	{
		if(spectateID[i] == playerid) 
		{
			StartSpectate(i, playerid);
		}
	}
	StopAudioStreamForPlayer(playerid);
	DisablePlayerCheckpoint(playerid);
	SpawnSetPlayerWeapons(playerid);
	SetPlayerScore(playerid, PI[playerid][pLevel]);
	SetPlayerHealth(playerid, PI[playerid][pHp]);
	if(PI[playerid][pArmour]) SetPlayerArmour(playerid, PI[playerid][pArmour]);
	SetPlayerTeamColor(playerid, PI[playerid][pMember]);
	return 1;
}

public OnPlayerDeath(playerid, killerid, WEAPON:reason)
{
	foreach(new i : Admin)
	{
		if(spectateID[i] == playerid) 
		{
			new Float:x_pos_player_death, Float:y_pos_player_death, Float:z_pos_player_death, Float:cx, Float:cy, Float:cz;
			GetPlayerPos(playerid, x_pos_player_death, y_pos_player_death, z_pos_player_death);
			GetPlayerCameraPos(playerid, cx, cy, cz);
			cz += !GetPlayerInterior(playerid) ? 5.0 : 0.5;
			SetPlayerCameraPos(i, cx, cy, cz);
			SetPlayerCameraLookAt(i, x_pos_player_death, y_pos_player_death, z_pos_player_death);
		}
	}
	if(PI[playerid][pUseGPS]) PI[playerid][pUseGPS] = false;
	if(GetPVarInt(playerid, "Animation"))
	{
		DeletePVar(playerid, "Animation");
		TextDrawHideForPlayer(playerid, animDraw);
	}
	new Float:armour;
	Iter_Remove(spectatePlayers, playerid);
	HidePlayerVelocimetro(playerid);
    DisablePlayerCheckpoint(playerid);
    ResetWeapons(playerid);
    DisablePlayerRaceCheckpoint(playerid);
	SetPVarInt(playerid, "ac-hp-ignore", gettime() + 1);
	PI[playerid][pHp] = 30.0;
	GetPlayerArmour(playerid,armour);
	if(armour) SetArmour(playerid, 0);
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	SetVehicleHealth(vehicleid, 1000);
	SetVehicleVariables(vehicleid, false, false, false, false, false, false, false);
	SetVehicleNumberPlate(vehicleid, SERVER_NAME_SHORT);
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	if(killerid != INVALID_PLAYER_ID && !IsPlayerConnected(killerid)) return 0;
	return 1;
}

public OnPlayerText(playerid, text[])
{
    if(!pLoggedIn{playerid}) return 0;
	if(PI[playerid][pMute])
	{
		SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Тебе запрещено писать в чат.");
		SetPlayerChatBubble(playerid, "Мут чата", DARKRED_FORMAT, 20.0, 5000);
		return 0;
	}
	for(new ids=0; ids < CHAT_SMILE_COUNT; ids++)
	{
		if(strcmp(text, SI[ids][smInput], true) == 0)
		{
			switch(PI[playerid][pGender])
			{
				case 0:
				{
					MeAction(playerid, SI[ids][smOutput_F]);
					SetPlayerChatBubble(playerid, SI[ids][smOutput_F], RPCMD_FORMAT, 20.0, 10000);
				}
				case 1:
				{
					MeAction(playerid, SI[ids][smOutput_M]);
					SetPlayerChatBubble(playerid, SI[ids][smOutput_M], RPCMD_FORMAT, 20.0, 10000);
				}
			}
			return 0;
		}
	}
	if(strcmp(text, "q", true) == 0 || strcmp(text, "qq", true) == 0 || strcmp(text, "й", true) == 0)
	{
		/*if(IsAGang(playerid))
		{
			switch(PI[playerid][pMember])
			{
				case TEAM_GROVE: member = "Grove Street";
				case TEAM_BALLAS: member = "The Ballas";
				case TEAM_RIFA: member = "The Rifa";
				case TEAM_AZTECAS: member = "Varios Los Aztecas";
				case TEAM_VAGOS: member = "Los Santos Vagos";
			}
			if(PI[playerid][pSex] == 1) format(string, sizeof(string), "показал распальцовку %s", member);
			else format(string, sizeof(string), "показала распальцовку %s", member);
			MeAction(playerid, string);
			if(!IsPlayerInAnyVehicle(playerid)) ApplyAnimation(playerid,"GHANDS","gsign1LH",4.0,0,0,0,0,0,1);
			return 0;
		}*/
	}
    // в отдельную функцию
    new i = strlen(text), spaces;
	while(--i != -1)
	{
	    switch(text[i])
	    {
	        case ' ':
	        {
	            spaces++;
	            if(spaces > 1)
	            {
	                spaces--;
	                strdel(text, i, i+1);
	            }
	        }
	        default: spaces = 0;
	    }
	}
	if(text[i-1] == ' ') strdel(text, i-1, i);
	if(text[0] == ' ') strdel(text, 0, 1);
	//
	format(g_str, MAX_STR_LENGHT, "{%s}%s[%d]: "CHATCOLOR_HEX"%s", frac_name[PI[playerid][pMember]][fdColor], PI[playerid][pName], playerid, text);
	ProxDetector(13.0, playerid, g_str, WHITE_FORMAT);
	SetPlayerChatBubble(playerid, text, WHITE_FORMAT, 13.0, 5000);
	if(!GetPVarInt(playerid, "Animation"))
	{
		ApplyAnimation(playerid, "PED", "IDLE_CHAT", 8.1, false, true, true, true, 1, FORCE_SYNC:1);
		SetTimerEx("ClearAnimText", 100 * strlen(text), false, "d", playerid);
	}
	return 0;
}

public e_COMMAND_ERRORS:OnPlayerCommandPerformed(playerid, cmdtext[], e_COMMAND_ERRORS:success)
{
	switch(success) 
	{
        case COMMAND_INVALID_INPUT: 
		{
            Command_ReProcess(playerid, cmdtext, true);
        }
    }
	return COMMAND_OK;
}

public e_COMMAND_ERRORS:OnPlayerCommandReceived(playerid, cmdtext[], e_COMMAND_ERRORS:success)
{
	if(!pLoggedIn{playerid}) return COMMAND_DENIED;
	switch(success)
	{
		case COMMAND_UNDEFINED, COMMAND_DENIED:
		{
			SCMESS(playerid, WHITE_FORMAT, ""DEFAULTRED_HEX""NEGATIVE_MARK" "WHITE_HEX"Неизвестная команда. /help - узнать доступные команды.");
		}
	}
	return COMMAND_OK;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(vehicleid >= stand_cars[0] && vehicleid <= stand_cars[18])
	{
		new Float:plocx,Float:plocy,Float:plocz;
		GetPlayerPos(playerid, plocx, plocy, plocz);
		SetPlayerPos(playerid, plocx, plocy, plocz);
	}
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
    if(!IsValidVehicle(vehicleid) || !pLoggedIn{playerid}) return Kick(playerid);
	if(TI[playerid][temp_vehid] != INVALID_VEHICLE_ID) ClearInfoTemporaryAdmCar(playerid);
	return 1;
}

public OnPlayerStateChange(playerid, PLAYER_STATE:newstate, PLAYER_STATE:oldstate)
{
    if(!gIsRequestClassCalled{playerid} && newstate == PLAYER_STATE_ONFOOT && oldstate == PLAYER_STATE_NONE)
	{
		return Kick(playerid);
	}
	if(newstate == PLAYER_STATE_DRIVER)
	{
		new vehid_state = GetPlayerVehicleID(playerid);
		if(IsAPlane(vehid_state))
		{
			if(!PI[playerid][pLicPlane])
			{
				RemovePlayerFromVehicle(playerid);
	            return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя нет лицензии на управление воздушным транспортом. Получить её можно в автошколе.");
			}
		}
		if(IsABoat(vehid_state))
		{
			if(!PI[playerid][pLicPlane])
			{
				RemovePlayerFromVehicle(playerid);
	            return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя нет лицензии на управление водным транспортом. Получить её можно в автошколе.");
			}
		}
		if(!PI[playerid][pLicCar])
		{
			RemovePlayerFromVehicle(playerid);
			return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя нет лицензии на управление наземным транспортом. Получить её можно в автошколе");
		}
		foreach(new i : Admin)
		{
			if(spectateID[i] == playerid) 
			{
				PlayerSpectateVehicle(i, GetPlayerVehicleID(playerid), SPECTATE_MODE_NORMAL);
				ShowVehicleInfo(i, GetPlayerVehicleID(playerid));
    			spectateType[i] = SPECTATE_TYPE_VEHICLE;
			}
		}
		if(vehid_state >= lspd_car[0] && vehid_state <= lspd_car[26])
		{
			if(PI[playerid][pMember] != TEAM_SAPD)
			{
	            RemovePlayerFromVehicle(playerid);
	            return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Данный транспорт принадлежит организации SAPD");
	        }
		}
		if(IsAVel(vehid_state) || IsABoat(vehid_state) || IsAPlane(vehid_state))
		{
			SetVehicleVariables(vehid_state, .engine=true);
			HidePlayerVelocimetro(playerid);
		}
		ShowPlayerVelocimetro(playerid);
		SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Для заводки двигателя используй "DEFAULTRED_HEX"CTRL");
		SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Чтобы включить/выключить фары используй "DEFAULTRED_HEX"N");
	}
	if(newstate == PLAYER_STATE_PASSENGER)
	{
		foreach(new i : Admin)
		{
			if(spectateID[i] == playerid) 
			{
    			PlayerSpectateVehicle(i, GetPlayerVehicleID(playerid), SPECTATE_MODE_NORMAL);
				ShowVehicleInfo(i, GetPlayerVehicleID(playerid));
    			spectateType[i] = SPECTATE_TYPE_VEHICLE;
			}
		}
	}
	if(oldstate == PLAYER_STATE_DRIVER)
	{
		if(racePlayerReg{playerid}) PlayerLeaveRace(playerid);
	}
	if(newstate == PLAYER_STATE_ONFOOT)
	{
		HidePlayerVelocimetro(playerid);
		foreach(new i : Admin) 
		{
			if(spectateID[i] == playerid) 
			{
    			PlayerSpectatePlayer(i, playerid, SPECTATE_MODE_NORMAL);
				HideVehicleInfo(i);
    			spectateType[i] = SPECTATE_TYPE_PLAYER;
			}
		}
	}
	if(newstate == PLAYER_STATE_SPECTATING)
	{
        if (GetPreviousPlayer(playerid) == INVALID_PLAYER_ID) 
		{
		    foreach(new i : Admin)
			{
				if(spectateID[i] == playerid) StopSpectate(i);
			}
		}
		else 
		{
		    foreach(new i : Admin) 
			{
				if(spectateID[i] == playerid) 
				{
					StartSpectate(i, GetPreviousPlayer(playerid));
				}
			}
		}
    	Iter_Remove(spectatePlayers, playerid);
	}
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	for(new i=0; i < TOTALBUSINESS; i++)
	{
		if(IsPlayerInDynamicCP(playerid, BI[i][bMenuPick]))
		{
		    if(BI[i][bLock]) return SCMESS(playerid,GREY_FORMAT,""NEGATIVE_MARK" Бизнес закрыт.");
			if(BI[i][bProds] < 50) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У бизнеса недостаточно продукции.");
			switch(BI[i][bType])
			{
				case 1: return MagazineList(playerid, i);
				case 3: return AmmoList(playerid, i);
				case 4: return ClothesShop(playerid, i);
				default: return MagazineList(playerid, i);
			}
		}
	}
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
    if(PI[playerid][pUseGPS])
	{
		DisablePlayerRaceCheckpoint(playerid);
		PI[playerid][pUseGPS] = false;
		return SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Место назначения достигнуто.");
	}
	if(raceMarkPlayer[playerid] != -1)
	{
	    raceMarkPlayer[playerid]++;
		if(raceMarkPlayer[playerid] >= sizeof(raceMarkPos))
		{
		    raceFinishPlayerID++;
		    format(g_str, 96, "[Мероприятие] "WHITE_HEX"%s[%d] финишировал, место: %d", PI[playerid][pName], playerid, raceFinishPlayerID);
            foreach(new i : Player) 
			{
				if(!pLoggedIn{i} || !IsPlayerConnected(i)) continue;
				if(racePlayerReg{i}) SCMESS(i, YELLOW_FORMAT, g_str);
			}
		    if(1 <= raceFinishPlayerID <= 3)
		    {
		        SendPositiveMess(playerid, "Твой приз: "GREEN_HEX"%d$", raceReward[raceFinishPlayerID - 1]);
		        SetMoney(playerid, raceReward[raceFinishPlayerID - 1]);
		    }
			DisablePlayerRaceCheckpoint(playerid);
			DestroyVehicleEx(raceVehiclePlayer[playerid]);
			raceVehiclePlayer[playerid] = INVALID_VEHICLE_ID;
		    SetPlayerPos(playerid,1772.8226,-1666.2528,14.4235);
		    SetPlayerInteriorEx(playerid, 0);
		    SetPlayerVirtualWorldEx(playerid, 0);
		    racePlayerReg{playerid} = 0;
            if(GetRacePlayersAmount() == 0) SMTA(YELLOW_FORMAT, "[Мероприятие] "WHITE_HEX"Гонки окончены, все игроки финишировали.");
		}
		else UpdatePlayerRaceMark(playerid);
	}
	
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpDynamicPickup(playerid, pickupid)
{
	if(GetPVarInt(playerid,"usepickup") > gettime()) return 1;
	SetPVarInt(playerid,"usepickup", gettime()+5);
	for(new i=0; i < TOTALHOUSE; i++)
	{
		if(pickupid == HI[i][hPick] && GetPlayerVirtualWorld(playerid) == 0 && GetPlayerInterior(playerid) == 0)
		{
			if(!HI[i][hOwner])
			{
				SetPVarInt(playerid, "house_id", i);
				format(g_str, 200, ""WHITE_HEX"Номер дома: \t\t%d\n\
				Класс: \t\t\t{%s}%s"WHITE_HEX" \n\
				Квартплата: \t\t%d\n\
				Стоимость: \t\t%d\n\n\
				"GREEN_HEX"Дом доступен для приобретения", HI[i][hID], house_type[HI[i][hType]][htColor],house_type[HI[i][hType]][htType], HI[i][hDice], HI[i][hCost]);
				SPD(playerid, DLG_BUYHOUSE, DSM, ""SERVER_HEX"Информация о доме", g_str, "Купить", "Отмена");
			}
			if(HI[i][hOwner])
			{
				SetPVarInt(playerid, "house_id", i);
				format(g_str, 200, ""WHITE_HEX"Номер дома: \t\t%d\n\
				Класс: \t\t\t{%s}%s"WHITE_HEX" \n\
				Статус: \t\t%s\n\
				Владелец: \t\t%s", HI[i][hID], house_type[HI[i][hType]][htColor],house_type[HI[i][hType]][htType], (HI[i][hLock] == 1) ? (""DEFAULTRED_HEX"Закрыт"WHITE_HEX"") : (""GREEN_HEX"Открыт"WHITE_HEX""), HI[i][hOwner]);
				SPD(playerid, DLG_GETINHOUSE, DSM, ""SERVER_HEX"Информация о доме", g_str, "Войти", "Закрыть");
			}
		}
	}
	if(pickupid == mayor_pic_enter) SetPlayerPosEx(playerid,-1843.5764,2670.4414,3.5884,89.4159, 2, 3, 0, 0, 1500);
	if(pickupid == mayor_pic_exit) SetPlayerPosEx(playerid,1480.4884,-1767.6519,13.4231,0.9691, 0, 0, 0, 0, 1500);
	if(pickupid == mayor_pic_enter_reception) if(IsAGov(playerid)) SetPlayerPos(playerid, -1876.8004,2665.3264,3.5894);
	if(pickupid == mayor_pic_exit_reception) if(IsAGov(playerid)) SetPlayerPos(playerid, -1871.4976,2664.4531,3.5894);
	if(pickupid == lspd_pic_enter) SetPlayerPosEx(playerid,1360.6910,1074.1508,1626.4896,179.5368, 1, 99, 0, 0, 1500);
	if(pickupid == lspd_pic_exit) SetPlayerPosEx(playerid, 1552.9117,-1675.5043,16.1953, 89.3847, 0, 0, 0, 0);
	//if(pickupid == lspd_pic_enter_garage) SetPlayerPosEx(playerid, 1568.5568,-1692.8260,5.8906, 181.3445, 0, 0, 0, 0);
	//if(pickupid == lspd_pic_exit_garage) SetPlayerPosEx(playerid, 246.3551,86.0135,1003.6406, 180.2781, 1, 6, 0, 0);
	if(pickupid == hospital_pic_enter) SetPlayerPosEx(playerid, -1308.2208,-40.2933,1501.0859, 89.6801, 3, 0, 0, 0, 1500);
	if(pickupid == hospital_pic_exit) SetPlayerPosEx(playerid, 1177.9800,-1323.8992,14.0975, 271.4682, 0, 0, 0, 0);
	if(pickupid == fbi_pic_enter) SetPlayerPosEx(playerid, 1165.9230, 362.0963, 1002.1450, 358.7522, 4, 111, 0, 0, 1500);
	if(pickupid == fbi_pic_exit) SetPlayerPosEx(playerid, -2450.4526,503.8878,30.0854, 269.9503, 0, 0, 0, 0);
	if(pickupid == news_pic_enter) SetPlayerPosEx(playerid, 2578.5171,1249.6771,2944.2271,87.8533, 5, 74, 0, 0, 1500);
	if(pickupid == news_pic_exit_1 || pickupid == news_pic_exit_2) SetPlayerPosEx(playerid, 1653.9774,-1659.1458,22.5156,179.9955, 0, 0, 0, 0);
	if(pickupid == hospital_pic_meds)
	{
		if(PI[playerid][pMember] != TEAM_HOSPITAL) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Доступно только членам организации SA Hospital");
		if(!PI[playerid][pDuty]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нужно быть в форме организации.");
		if(PI[playerid][pRank] < 2) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Доступно только со 2-го ранга.");
		if(PI[playerid][pMedics]) return SendPositiveMess(playerid, "У тебя уже есть медикаменты. Медикаментов: %d", PI[playerid][pMedics]);
		PI[playerid][pMedics] += 10;
		SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Ты взял 10 медикаментов со склада.");
	}
	if(pickupid == race_pic)
	{
		if(raceStatus != 1) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" В данный момент регистрация закрыта.");
		if(racePlayerReg{playerid}) return SPD(playerid, DLG_RACE_CANCEL, DSM, !"Гонки", ""WHITE_HEX"Отменить участие в гонках?", "Да", "Нет");
		SPD(playerid, DLG_RACE_REG, DSM, !"Гонки", ""WHITE_HEX"Принять участие в гонках?\n\
		Участие в гонках обойдётся в "GREEN_HEX"25.000$", "Да", "Нет");
	}
	if(pickupid == bank_pic_enter) SetPlayerPosEx(playerid, -0.0884,2.6448,1800.9940,181.3619, 6, 111, 0, 0, 1500);
	if(pickupid == bank_pic_exit) SetPlayerPosEx(playerid, 1414.5117,-1701.8341,13.5395,235.7546, 0, 0, 0, 0);
	if(pickupid == recruit_pic_enter) SetPlayerPosEx(playerid, 2465.4143,1342.9261,3015.3784,268.3273, 63, 84, 0, 0, 0);
	if(pickupid == recruit_pic_exit) SetPlayerPosEx(playerid, 886.0886,-1624.6377,13.5378,206.8525, 0, 0, 0, 0);
	if(pickupid == auto_pic_enter) SetPlayerPosEx(playerid, 1447.3235,702.5633,1087.9011,90.7898, 7, 82, 0, 0, 1500);
	if(pickupid == auto_pic_exit) SetPlayerPosEx(playerid, 546.2559,-1290.0461,17.2482,358.6481, 0, 0, 0, 0);
	if(pickupid == auto_pic_select) SPD(playerid, DLG_SELECTCAR, DSM, ""SERVER_HEX"Выбор автомобиля", "Посмотреть каталог автомобилей?", "Да", "Отмена");
	return 1;
}

public OnPlayerEnterDynamicArea(playerid, areaid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	foreach(new i : Admin)
	{
		if(spectateID[i] == playerid) 
		{
			SetPlayerInteriorEx(i, newinteriorid);
  		}
	}
	return 1;
}

public OnPlayerKeyStateChange(playerid, KEY:newkeys, KEY:oldkeys)
{
	if(!pLoggedIn{playerid}) return 1;
	if(RELEASED(KEY_WALK))
	{
		/*if(IsPlayerInRangeOfPoint(playerid, 2.0,2038.5192,-2018.1116,13.5918))
		{
			format(g_str, sizeof(g_str), ""YELLOW_HEX"Добро пожаловать!\n\n "WHITE_HEX"Text.\n");
			SPD(playerid, 0, DSM, ""SERVER_HEX"Информация по серверу", g_str, "Закрыть","");
		}*/
		if(PlayerToActor(2.0, playerid, questActor_SF) || PlayerToActor(2.0, playerid, questActor_LS) || PlayerToActor(2.0, playerid, questActor_LV))
        {
            return SPD(playerid, 0, DSL, ""GOLDORANGE_HEX"Квесты", ""SERVER_HEX"[1] "WHITE_HEX"Квест", "Выбрать","Закрыть");
        }
        if(PlayerToActor(2.0, playerid, minerActor_HQ))
        {
            return SPD(playerid, DLG_MINE_ACTOR, DSL, ""GOLDORANGE_HEX"Заведующий шахтой", "\
            "SERVER_HEX"[1] "WHITE_HEX"Узнать о работе\
            \n"SERVER_HEX"[2] "WHITE_HEX"Купить обычную кирку", "Выбрать","Закрыть");
        }
		if(IsPlayerInRangeOfPoint(playerid, 2.0, -1848.2786,2656.2344,3.6158) && GetPlayerVirtualWorld(playerid) == 2)
		{
			if(GetPVarInt(playerid,"usepickupALT") > gettime()) return 1;
			SetPVarInt(playerid,"usepickupALT", gettime()+5);
			if(PI[playerid][pIdCard]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя уже есть ID карта.");
		    // new string_id[256];
			// format(string_id, sizeof(string_id), ""WHITE_HEX"Правительство штата Light Island приветствует Вас в административном здании.\n\n\
			// Так как Вы недавно прилетели в штат, необходимо оформить идентификационную карту гражданина.\nЖелаете оформить её прямо сейчас?");
			// SPD(playerid, DLG_IDCARD_GENDER, DSM, ""SERVER_HEX"Оформление ID-карты", string_id, "Далее","Отмена");
			PI[playerid][pIdNumber] = 100000 + random(900000);
			PI[playerid][pIdSeria] = 1000 + random(9000);
			PI[playerid][pIdCard] = 1;
			SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Идентификационная карта успешно получена! Чтобы показать используй команду "SERVER_HEX"/idcard");
			SendPositiveMess(playerid, "Банковский счёт автоматически открыт! "CONTRASTORANGE_HEX"Не забудь купить телефон и симкарту, чтобы банк уведомлял тебя о денежных переводах.");
		}
		if(IsPlayerInRangeOfPoint(playerid, 2.0, -1843.6475,2684.7207,3.5874) && GetPlayerVirtualWorld(playerid) == 2)
		{
			if(GetPVarInt(playerid,"usepickupALT") > gettime()) return 1;
			SetPVarInt(playerid,"usepickupALT", gettime()+5);
			if(PI[playerid][pMember] != TEAM_MAYOR) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Доступно только членам организации Мэрия");
			if(PI[playerid][pDuty]) return SPD(playerid, DLG_ONDUTY, DSM, ""SERVER_HEX"Рабочий день", ""WHITE_HEX"Переодеться и закончить свой рабочий день?", "Да","Отмена");
			SPD(playerid, DLG_ONDUTY, DSM, ""SERVER_HEX"Рабочий день", ""WHITE_HEX"Переодеться и начать рабочий день?", "Да","Отмена");
		}
		if(IsPlayerInRangeOfPoint(playerid, 2.0, -1843.5514,2682.0603,3.5874) && GetPlayerVirtualWorld(playerid) == 2)
		{
			if(GetPVarInt(playerid,"usepickupALT") > gettime()) return 1;
			SetPVarInt(playerid,"usepickupALT", gettime()+5);
			if(PI[playerid][pMember] != TEAM_MAYOR) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Доступно только членам организации Мэрия");
			if(!PI[playerid][pDuty]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нужно быть в форме организации.");
			format(g_str, 80, ""SERVER_HEX"Склад Мэрии: %d материалов", materials[mMayor]);
			SPD(playerid, DLG_MATERIALS_MAYOR, DSL, g_str, ""WHITE_HEX"Комплект оружия 1\t[50]\n\
																	 Комплект оружия 2\t[100]", "Да","Отмена");
		}
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1373.5321,1057.4227,1626.4896) && GetPlayerVirtualWorld(playerid) == 1)
		{
			if(GetPVarInt(playerid,"usepickupALT") > gettime()) return 1;
			SetPVarInt(playerid,"usepickupALT", gettime()+5);
			if(PI[playerid][pMember] != TEAM_SAPD) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Доступно только членам организации SAPD");
			if(PI[playerid][pDuty]) return SPD(playerid, DLG_ONDUTY, DSM, ""SERVER_HEX"Рабочий день", ""WHITE_HEX"Переодеться и закончить свой рабочий день?", "Да","Отмена");
			SPD(playerid, DLG_ONDUTY, DSM, ""SERVER_HEX"Рабочий день", ""WHITE_HEX"Переодеться и начать рабочий день?", "Да","Отмена");
		}
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1375.8009,1057.6359,1626.4896) && GetPlayerVirtualWorld(playerid) == 1)
		{
			if(GetPVarInt(playerid,"usepickupALT") > gettime()) return 1;
			SetPVarInt(playerid,"usepickupALT", gettime()+5);
			if(PI[playerid][pMember] != TEAM_SAPD) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Доступно только членам организации SAPD");
			if(!PI[playerid][pDuty]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нужно быть в форме организации.");
			format(g_str, 80, ""SERVER_HEX"Склад SAPD: %d материалов", materials[mLSPD]);
			SPD(playerid, DLG_MATERIALS_LSPD, DSL, g_str, ""WHITE_HEX"Комплект оружия 1\t[70]\n\
																	 Комплект оружия 2\t[350]", "Да","Отмена");
		}
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1150.5199,361.2396,1002.1450) && GetPlayerVirtualWorld(playerid) == 4)
		{
			if(GetPVarInt(playerid,"usepickupALT") > gettime()) return 1;
			SetPVarInt(playerid,"usepickupALT", gettime()+5);
			if(PI[playerid][pMember] != TEAM_FBI) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Доступно только членам организации FBI");
			if(PI[playerid][pDuty]) return SPD(playerid, DLG_ONDUTY, DSM, ""SERVER_HEX"Рабочий день", ""WHITE_HEX"Переодеться и закончить свой рабочий день?", "Да","Отмена");
			SPD(playerid, DLG_ONDUTY, DSM, ""SERVER_HEX"Рабочий день", ""WHITE_HEX"Переодеться и начать рабочий день?", "Да","Отмена");
		}
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1159.2531,376.7758,1002.1450) && GetPlayerVirtualWorld(playerid) == 4)
		{
			if(GetPVarInt(playerid,"usepickupALT") > gettime()) return 1;
			SetPVarInt(playerid,"usepickupALT", gettime()+5);
			if(PI[playerid][pMember] != TEAM_FBI) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Доступно только членам организации FBI");
			if(!PI[playerid][pDuty]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нужно быть в форме организации.");
			format(g_str, 80, ""SERVER_HEX"Склад FBI: %d материалов", materials[mFBI]);
			SPD(playerid, DLG_MATERIALS_FBI, DSL, g_str, ""WHITE_HEX"Комплект оружия 1\t[70]\n\
																	 Комплект оружия 2\t[350]", "Да","Отмена");
		}
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 759.7040,-1508.6417,1417.8119) && GetPlayerVirtualWorld(playerid) == 5)
		{
			if(GetPVarInt(playerid,"usepickupALT") > gettime()) return 1;
			SetPVarInt(playerid,"usepickupALT", gettime()+5);
			if(PI[playerid][pMember] != TEAM_NEWS) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Доступно только членам организации SA News");
			if(PI[playerid][pDuty]) return SPD(playerid, DLG_ONDUTY, DSM, ""SERVER_HEX"Рабочий день", ""WHITE_HEX"Переодеться и закончить свой рабочий день?", "Да","Отмена");
			SPD(playerid, DLG_ONDUTY, DSM, ""SERVER_HEX"Рабочий день", ""WHITE_HEX"Переодеться и начать рабочий день?", "Да","Отмена");
		}
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 759.8358,-1506.5580,1417.8119) && GetPlayerVirtualWorld(playerid) == 5)
		{
			if(GetPVarInt(playerid,"usepickupALT") > gettime()) return 1;
			SetPVarInt(playerid,"usepickupALT", gettime()+5);
			if(PI[playerid][pMember] != TEAM_NEWS) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Доступно только членам организации SA News");
			if(!PI[playerid][pDuty]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Должен быть в форме организации.");
			format(g_str, 80, ""SERVER_HEX"Склад SA News: %d материалов", materials[mNews]);
			SPD(playerid, DLG_MATERIALS_NEWS, DSL, g_str, ""WHITE_HEX"Камера\t[15]", "Да","Отмена");
		}
		if(IsPlayerInRangeOfPoint(playerid, 2.0, -1324.4583,-19.6535,1501.0859) && GetPlayerVirtualWorld(playerid) == 3)
		{
			if(GetPVarInt(playerid,"usepickupALT") > gettime()) return 1;
			SetPVarInt(playerid,"usepickupALT", gettime()+5);
			if(PI[playerid][pMember] != TEAM_HOSPITAL) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Доступно только членам организации SA Hospital");
			if(PI[playerid][pDuty]) return SPD(playerid, DLG_ONDUTY, DSM, ""SERVER_HEX"Рабочий день", ""WHITE_HEX"Переодеться и закончить свой рабочий день?", "Да","Отмена");
			SPD(playerid, DLG_ONDUTY, DSM, ""SERVER_HEX"Рабочий день", ""WHITE_HEX"Переодеться и начать рабочий день?", "Да","Отмена");
		}
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1.7238,-5.3490,1801.1100) && GetPlayerVirtualWorld(playerid) == 6)
		{
			if(GetPVarInt(playerid,"usepickupALT") > gettime()) return 1;
			SetPVarInt(playerid,"usepickupALT", gettime()+5);
			if(!PI[playerid][pIdCard]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Для этого нужно иметь ID карту.");
			BankMenu(playerid);
		}
		for(new i = 1; i < TOTALATM; i++)
		{
			if(GetPVarInt(playerid,"usepickupALT") > gettime()) continue;
			if(PlayerToPoint(2.0, playerid, ATMInfo[i][aX], ATMInfo[i][aY], ATMInfo[i][aZ]))
			{
				SetPVarInt(playerid,"usepickupALT", gettime()+5);
				if(!PI[playerid][pBankCard]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Для этого нужно иметь карту банка.");
				ATMMenu(playerid);
			} 
		}
		if(IsPlayerInRangeOfPoint(playerid, 2.0, -1317.656982, -29.058000, 1500.086059) && GetPlayerVirtualWorld(playerid) == 3)
		{
			if(PI[playerid][pMember] == TEAM_HOSPITAL)
			{
				/*if(!hospital_door)
				{
					hospital_door = 1;
					return MoveDynamicObject(hospital_door1_closed, -1317.656982, -30.393999, 1500.086059, 0.005, 0.0, 0.0, 0.0);
				}
				else if(hospital_door)
				{
					hospital_door = 0;
					return MoveDynamicObject(hospital_door1_closed, -1317.656982, -29.058000, 1500.086059, 0.005, 0.0, 0.0, 0.0);
				} */
			}
			else
			{
				return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя нет ключей от этой двери.");
			}
		}
		if(!GetPVarInt(playerid, "inbusiness"))
		{
			if(GetPVarInt(playerid,"usepickupALT") > gettime()) return 1;
			for(new i=0; i < TOTALBUSINESS; i++)
			{
				if(IsPlayerInRangeOfPoint(playerid, 2.0, BI[i][bPosX], BI[i][bPosY], BI[i][bPosZ]) && GetPlayerVirtualWorld(playerid) == 0 && GetPlayerInterior(playerid) == 0)
				{
					if(BI[i][bLock]) return GameTextForPlayer(playerid, "~r~CLOSED", 2000, 1);
					SetPVarInt(playerid,"usepickupALT", gettime()+5);
					SetPlayerPosEx(playerid, BI[i][bEnterIntX], BI[i][bEnterIntY], BI[i][bEnterIntZ], 0.0, i, BI[i][bInt], 0, 0);
					SetPVarInt(playerid, "inbusiness", 1);
				}
			}
		}
		if(GetPVarInt(playerid, "inbusiness") == 1)
		{
			if(GetPVarInt(playerid,"usepickupALT") > gettime()) return 1;
			for(new i=0; i < TOTALBUSINESS; i++)
			{
				if(IsPlayerInRangeOfPoint(playerid, 2.0, BI[i][bPickExitX], BI[i][bPickExitY], BI[i][bPickExitZ]) && GetPlayerVirtualWorld(playerid) == i && GetPlayerInterior(playerid) == BI[i][bInt])
				{
					SetPVarInt(playerid,"usepickupALT", gettime()+5);
					SetPlayerPosEx(playerid, BI[i][bPosX], BI[i][bPosY], BI[i][bPosZ], 0.0, 0, 0, 0, 0);
				}
			}
		}
		if(GetPVarInt(playerid, "inhouse") == 1)
		{
			if(GetPVarInt(playerid,"usepickupALT") > gettime()) return 1;
			for(new i=0; i < TOTALHOUSE; i++)
			{
				if(IsPlayerInRangeOfPoint(playerid, 2.0, HI[i][hEnterIntX], HI[i][hEnterIntY], HI[i][hEnterIntZ]) && GetPlayerVirtualWorld(playerid) == i && GetPlayerInterior(playerid) == HI[i][hInt])
				{
					SetPVarInt(playerid,"usepickupALT", gettime()+5);
					SetPlayerPosEx(playerid, HI[i][hPosX], HI[i][hPosY], HI[i][hPosZ], 0.0, 0, 0, 0, 0);
				}
			}
		}
	}
	/*if(RELEASED(KEY_CTRL_BACK))
	{
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerVehicleSeat(playerid) == 0)
		{
			for(new i=0; i < TOTALBUSINESS; i++)
			{
				if(BI[i][bType] != 2) continue;
				if(IsVehicleInRangeOfPoint(GetPlayerVehicleID(playerid), 2.0, BI[i][bFuelPosX],BI[i][bFuelPosY],BI[i][bFuelPosZ]))
				{
					new vehid_key = GetPlayerVehicleID(playerid);
					if(VI[vehid_key][vFuel] == GetVehicleTank(GetVehicleModel(vehid_key))) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя полный бак.");
					if(VI[vehid_key][vEngine])
					{
						return SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Для заправки сперва нужно заглушить двигатель.");
					}
					else if (!VI[vehid_key][vEngine])
					{
						new str_key[200];
						if(BI[i][bLock]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Бизнес закрыт.");
						SetPVarInt(playerid, "fuelbusinessid", i);
						SetPVarInt(playerid, "fuelcarid", vehid_key);
						format(str_key, sizeof(str_key), ""WHITE_HEX"Введи необходимое количество литров для заправки.\n Цена одного литра бензина "GREEN_HEX"%d$", BI[GetPVarInt(playerid, "fuelbusinessid")][bFuelPrice]);
						return SPD(playerid,DLG_CMD_FILL,DSI,""SERVER_HEX"Заправка транспорта", str_key,"Ввести","Отмена");
					}
				}
			}
		}
	}*/
	if((newkeys && KEY_CROUCH) != false) // Если нажата хотя бы 1 клавиша, и/или это клавиша: 'C'
	{
		SetPVarInt(playerid, "player_last_c_key", GetTickCount()); // Перехватываем время последнего нажатия этой клавиши
	}
	if(PRESSED(KEY_SPRINT))
	{
		if(GetPVarInt(playerid, "Animation") == 1)
		{
			ClearAnimationsEx(playerid);
			DeletePVar(playerid,"Animation");
			TextDrawHideForPlayer(playerid, animDraw);
			return 1;
		}
	}
	if(RELEASED(KEY_ACTION))
	{
		if(IsPlayerInAnyVehicle(playerid)) if(GetPlayerVehicleSeat(playerid)==0) return engineCommand(playerid);
	}
	if(RELEASED(KEY_NO))
	{
		if(GetPlayerVehicleSeat(playerid)== 0 || !IsAVel(GetPlayerVehicleID(playerid)) || !IsABoat(GetPlayerVehicleID(playerid)) || !IsAPlane(GetPlayerVehicleID(playerid))) return lightCommand(playerid);
	}
	if(RELEASED(KEY_YES))
	{
		if(GetPVarInt(playerid,"keyheal") == 1)
		{
			new key_yes_target_id = GetPVarInt(playerid,"medics");
			new key_yes_money = GetPVarInt(playerid, "money");
			if(PI[playerid][pMoney] < key_yes_money)
			{
				SCMESSF(key_yes_target_id, GREY_FORMAT, ""NEGATIVE_MARK" У игрока недостаточно средств.");
				DeletePVar(playerid,"keyheal");
				DeletePVar(playerid,"medics");
				DeletePVar(playerid,"money");
				return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Недостаточно средств для этого.");
			}
			if(!ProxDetectorCMD(10.0, playerid, key_yes_target_id))
			{
				DeletePVar(playerid,"keyheal");
				DeletePVar(playerid,"medics");
				DeletePVar(playerid,"money");
				return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Ты далеко от врача");
			}
			if(!IsPlayerInRangeOfPoint(playerid,70.0,-1324.4583,-19.6535,1501.0859)) 
			{
				DeletePVar(playerid,"keyheal");
				DeletePVar(playerid,"medics");
				DeletePVar(playerid,"money");
				return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Лечиться можно только в больнице.");
			}
			if(PI[key_yes_target_id][pMedics] == 0)
			{
				DeletePVar(playerid,"keyheal");
				DeletePVar(playerid,"medics");
				DeletePVar(playerid,"money");
				return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"У врача закончились медикаменты.");
			}
			PI[key_yes_target_id][pMedics]--;
			GiveMoney(playerid, key_yes_target_id, key_yes_money);
			SetHealth(playerid, 100.0);
			SCMESSF(key_yes_target_id, SERVER_FORMAT,""POSITIVE_MARK" "WHITE_HEX"Ты вылечил игрока %s за %d$", PI[playerid][pName], key_yes_money);
			SCMESSF(playerid, SERVER_FORMAT,""POSITIVE_MARK" "WHITE_HEX"Тебя вылечил %s за %d$", PI[key_yes_target_id][pName], key_yes_money);
			DeletePVar(playerid,"keyheal");
			DeletePVar(playerid,"medics");
			DeletePVar(playerid,"money");
		}
		if(GetPVarInt(playerid, "keycard") == 1)
		{
			new showidcard = GetPVarInt(playerid, "showidcard"), allstr[330], Float:keycard_x_pos, Float:keycard_y_pos, Float:keycard_z_pos;
			GetPlayerPos(showidcard,keycard_x_pos,keycard_y_pos,keycard_z_pos);
			if(!IsPlayerInRangeOfPoint(playerid, 5.0, keycard_x_pos, keycard_y_pos, keycard_z_pos))
			{
				DeletePVar(playerid, "showidcard");
				DeletePVar(playerid, "keycard");
				return SCMESS(playerid,GREY_FORMAT,""NEGATIVE_MARK" Далеко друг от друга.");
			}
			strcat(allstr,""WHITE_HEX"");
			format(g_str,sizeof(g_str),"Имя: "SERVER_HEX"%s\n",PI[showidcard][pName]);
			strcat(allstr,g_str);
			format(g_str,sizeof(g_str),""WHITE_HEX"Пол: "SERVER_HEX"%s\n",(PI[showidcard][pGender] == 1) ? ("Мужской") : ("Женский"));
			strcat(allstr,g_str);
			format(g_str,sizeof(g_str),""WHITE_HEX"Лет в штате: "SERVER_HEX"%d\n",PI[showidcard][pLevel]);
			strcat(allstr,g_str);
			format(g_str,sizeof(g_str),""WHITE_HEX"Серия: "SERVER_HEX"%d\n",PI[showidcard][pIdSeria]);
			strcat(allstr,g_str);
			format(g_str,sizeof(g_str),""WHITE_HEX"Номер: "SERVER_HEX"%d\n",PI[showidcard][pIdNumber]);
			strcat(allstr,g_str);
			format(g_str,sizeof(g_str),""WHITE_HEX"Законопослушность: "SERVER_HEX"%d/100\n",PI[showidcard][pZakon]);
			strcat(allstr,g_str);
			if(PI[playerid][pMember])
			{
				format(g_str,sizeof(g_str),""WHITE_HEX"Организация: "SERVER_HEX"%s\n",frac_name[PI[showidcard][pMember]]);
				strcat(allstr,g_str);
				format(g_str,sizeof(g_str),""WHITE_HEX"Должность: "SERVER_HEX"%s\n",frac_rankname[PI[showidcard][pMember]][PI[showidcard][pRank]]);
				strcat(allstr,g_str);
			}
			SPD(playerid, 0, DSM, ""SERVER_HEX"Идентификационная карта", allstr, "Закрыть", "");
			switch(PI[showidcard][pGender])
			{
				case 0: format(g_str, 90, "показала свою ID карту %s", PI[playerid][pName]);
				case 1: format(g_str, 90, "показал свою ID карту %s", PI[playerid][pName]);
			}
			MeAction(showidcard, g_str);
			DeletePVar(playerid, "showidcard");
			DeletePVar(playerid, "keycard");
		}
	}
	if(newkeys == KEY_NO)
	{
		if(GetPVarInt(playerid,"keyheal") == 1)
		{
			new key_no_target_id = GetPVarInt(playerid,"medics");
			SCMESS(playerid, ACTION_FORMAT, "Ты отказался от лечения.");
			SCMESSF(key_no_target_id, ACTION_FORMAT, "Игрок %s отказался от лечения.", PI[playerid][pName]);
			DeletePVar(playerid,"keyheal");
			DeletePVar(playerid,"medics");
			DeletePVar(playerid,"money");
		}
		if(GetPVarInt(playerid, "keycard") == 1)
		{
			SCMESS(playerid, ACTION_FORMAT, "Ты отказался от просмотра ID карты.");
			SCMESSF(GetPVarInt(playerid, "showidcard"), ACTION_FORMAT, "%s отказался от просмотра ID карты.", PI[playerid][pName]);
			DeletePVar(playerid, "showidcard");
			DeletePVar(playerid, "keycard");
		}
	}
	return 1;
}

public OnPlayerEditObject(playerid, playerobject, objectid, EDIT_RESPONSE:response, Float:fX, Float:fY, Float:fZ, Float:rotationX, Float:rotationY, Float:rotationZ)
{
	if(GetPVarInt(playerid, "LoadATM") > 0)
	{
		if(!playerobject)
		{
			if(!IsValidDynamicObject(objectid)) return 1;
			MoveDynamicObject(objectid, fX, fY, fZ, 10.0, rotationX, rotationY, rotationZ);
		}
		if(response == EDIT_RESPONSE_FINAL)
		{
			TOTALATM++;
			ATMInfo[TOTALATM][aX] = fX;
			ATMInfo[TOTALATM][aY] = fY;
			ATMInfo[TOTALATM][aZ] = fZ;
			ATMInfo[TOTALATM][arX] = rotationX;
			ATMInfo[TOTALATM][arY] = rotationY;
			ATMInfo[TOTALATM][arZ] = rotationZ;
			SCMESS(playerid,WHITE_FORMAT,"Банкомат установлен.");
			DestroyDynamicObject(GetPVarInt(playerid, "LoadATM")-1);
			ATM[TOTALATM] = CreateDynamicObject(2754, fX, fY, fZ, rotationX, rotationY, rotationZ);
			LABELATM[TOTALATM] = CreateDynamic3DTextLabel("Банкомат\n"WHITE_HEX"Используй: ALT", SERVER_FORMAT, ATMInfo[TOTALATM][aX],ATMInfo[TOTALATM][aY],ATMInfo[TOTALATM][aZ]+1.1,10.0);
			DeletePVar(playerid, "LoadATM");
			EndObjectEditing(playerid);
			mysql_format(connects, query, 150,"INSERT INTO "TABLE_ATM" (ID, aX, aY, aZ, arX, arY, arZ) VALUES (%i,'%f','%f','%f','%f', '%f', '%f')",
			TOTALATM,ATMInfo[TOTALATM][aX],ATMInfo[TOTALATM][aY],ATMInfo[TOTALATM][aZ], ATMInfo[TOTALATM][arX], ATMInfo[TOTALATM][arY], ATMInfo[TOTALATM][arZ]);
			mysql_tquery(connects, query, "", "");
		}
		if(response == EDIT_RESPONSE_CANCEL)
		{
			DeletePVar(playerid, "LoadATM");
			SCMESS(playerid, WHITE_FORMAT, "Установка банкомата отменена");
			DestroyDynamicObject(GetPVarInt(playerid, "LoadATM")-1);
			EndObjectEditing(playerid);
		}
		return 1;
	}
	if(response == EDIT_RESPONSE_CANCEL)
	{
		DestroyDynamicObject(objectid);
		EndObjectEditing(playerid);
	}
	if(response == EDIT_RESPONSE_FINAL)
	{
		printf("CreateDynamicObject(%i, %.2f, %.2f, %.2f, %.2f, %.2f, %.2f);",objectid,fX, fY, fZ, rotationX, rotationY, rotationZ);
		EndObjectEditing(playerid);
	}
	return 1;
}

public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 0;
}

public OnPlayerUpdate(playerid)
{
	if(pLoggedIn{playerid})
	{
		new Float:health, Float:armour;
        GetPlayerHealth(playerid, health);
		// if(_:ac_hp_health[playerid] != _:health && GetPVarInt(playerid, "ac-ignore") < gettime())
		// {
		// 	if(ac_hp_health[playerid] > health)
        //     {
        //         ac_hp_health[playerid] = health;
        //     }
		// 	else if(ac_hp_health[playerid] < health)
        //     {
        //         SetPlayerHealth(playerid, ac_hp_health[playerid]);
		// 		KickEx(playerid);
        //     }
		// }
		if(_:PI[playerid][pHp] != _:health && GetPVarInt(playerid, "ac-hp-ignore") < gettime())
		{
			if(PI[playerid][pHp] > health) PI[playerid][pHp] = health;
			if(PI[playerid][pHp] < health) SetPlayerHealth(playerid, PI[playerid][pHp]);
		}
		GetPlayerArmour(playerid, armour);
		if(_:PI[playerid][pArmour] != _:armour && GetPVarInt(playerid, "ac-arm-ignore") < gettime())
		{
			if(PI[playerid][pArmour] > armour) PI[playerid][pArmour] = armour;
			if(PI[playerid][pArmour] < armour) SetPlayerArmour(playerid, PI[playerid][pArmour]);
		}
		// if(_:ac_arm_armour[playerid] != _:armour && GetPVarInt(playerid, "ac-ignore") < gettime())
		// {
		// 	if(ac_arm_armour[playerid] > armour)
        //     {
        //         ac_arm_armour[playerid] = armour;
        //     }
		// 	else if(ac_arm_armour[playerid] < armour)
        //     {
        //         SetPlayerArmour(playerid, ac_arm_armour[playerid]);
		// 		KickEx(playerid);
        //     }
		// }
		if(PI[playerid][pInt] != GetPlayerInterior(playerid)) SetPlayerInterior(playerid, PI[playerid][pInt]);
		if(TI[playerid][playerAFK] > 10)
		{
			new afkstr[30];
			format(afkstr, sizeof(afkstr), "Время в AFK: "WHITE_HEX"%s", ConvertToTime(TI[playerid][playerAFK]));
			SCMESS(playerid, SERVER_FORMAT, afkstr);
		}
		TI[playerid][playerAFK] = -2;
		if(GetPlayerMoney(playerid) != PI[playerid][pMoney])
		{
			ResetPlayerMoney(playerid);
			GivePlayerMoney(playerid, PI[playerid][pMoney]);
		}
		if(PI[playerid][pVW] != GetPlayerVirtualWorld(playerid))
		{
			PI[playerid][pVW] = GetPlayerVirtualWorld(playerid);
			foreach(new i : Admin)
			{
				if(spectateID[i] == playerid) 
				{
					SetPlayerVirtualWorldEx(i, GetPlayerVirtualWorld(playerid));
				}
			}
		}
		foreach(new i : Admin)
		{
			if(spectateID[i] == playerid) 
			{
				UpdatePlayerInfo(i, playerid);
				if (spectateType[i] == SPECTATE_TYPE_VEHICLE) 
				{
					UpdateVehicleInfo(i, GetPlayerVehicleID(playerid));
				}
			}
		}
		if(GetTickCount() - armedbody_pTick[playerid] > 113)
		{
			new weaponid[13],weaponammo[13],pArmedWeapon;
			pArmedWeapon = GetPlayerWeapon(playerid);
			GetPlayerWeaponData(playerid,WEAPON_SLOT:1,WEAPON:weaponid[1],weaponammo[1]);
			GetPlayerWeaponData(playerid,WEAPON_SLOT:2,WEAPON:weaponid[2],weaponammo[2]);
			GetPlayerWeaponData(playerid,WEAPON_SLOT:4,WEAPON:weaponid[4],weaponammo[4]);
			GetPlayerWeaponData(playerid,WEAPON_SLOT:5,WEAPON:weaponid[5],weaponammo[5]);
			GetPlayerWeaponData(playerid,WEAPON_SLOT:7,WEAPON:weaponid[7],weaponammo[7]);
			if(weaponid[1] && weaponammo[1] > 0)
			{
				if(pArmedWeapon != weaponid[1] && (PI[playerid][pRifleSling] && PI[playerid][pShowGun]) || IsACop(playerid))
				{
					if(!IsPlayerAttachedObjectSlotUsed(playerid,0))
					{
						SetPlayerAttachedObject(playerid,0,GetWeaponModel(weaponid[1]),1, 0.199999, -0.139999, 0.030000, 0.500007, -115.000000, 0.000000, 1.000000, 1.000000, 1.000000);
					}
				}
				else 
				{
					if(IsPlayerAttachedObjectSlotUsed(playerid,0))
					{
						RemovePlayerAttachedObject(playerid,0);
					}
				}
			}
			else if(IsPlayerAttachedObjectSlotUsed(playerid,0))
			{
				RemovePlayerAttachedObject(playerid,0);
			}
			if(weaponid[2] && weaponammo[2] > 0)
			{
				if(pArmedWeapon != weaponid[2] && (PI[playerid][pHolster] && PI[playerid][pShowGun]) || IsACop(playerid))
				{
					if(!IsPlayerAttachedObjectSlotUsed(playerid,1))
					{
						SetPlayerAttachedObject(playerid,1,GetWeaponModel(weaponid[2]),8, -0.079999, -0.039999, 0.109999, -90.100006, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
					}
				}
				else 
				{
					if(IsPlayerAttachedObjectSlotUsed(playerid,1))
					{
						RemovePlayerAttachedObject(playerid,1);
					}
				}
			}
			else if(IsPlayerAttachedObjectSlotUsed(playerid,1))
			{
				RemovePlayerAttachedObject(playerid,1);
			}
			if(weaponid[4] && weaponammo[4] > 0)
			{
				if(pArmedWeapon != weaponid[4] && (PI[playerid][pRifleSling] && PI[playerid][pShowGun]) || IsACop(playerid))
				{
					if(!IsPlayerAttachedObjectSlotUsed(playerid,2))
					{
						SetPlayerAttachedObject(playerid,2,GetWeaponModel(weaponid[4]),7, 0.000000, -0.100000, -0.080000, -95.000000, -10.000000, 0.000000, 1.000000, 1.000000, 1.000000);
					}
				}
				else 
				{
					if(IsPlayerAttachedObjectSlotUsed(playerid,2))
					{
						RemovePlayerAttachedObject(playerid,2);
					}
				}
			}
			else if(IsPlayerAttachedObjectSlotUsed(playerid,2))
			{
				RemovePlayerAttachedObject(playerid,2);
			}
			if(weaponid[5] && weaponammo[5] > 0)
			{
				if(pArmedWeapon != weaponid[5] && (PI[playerid][pRifleSling] && PI[playerid][pShowGun]) || IsACop(playerid))
				{
					if(!IsPlayerAttachedObjectSlotUsed(playerid,3))
					{
						SetPlayerAttachedObject(playerid,3,GetWeaponModel(weaponid[5]),1, 0.200000, -0.119999, -0.059999, 0.000000, 206.000000, 0.000000, 1.000000, 1.000000, 1.000000);
					}
				}
				else 
				{
					if(IsPlayerAttachedObjectSlotUsed(playerid,3))
					{
						RemovePlayerAttachedObject(playerid,3);
					}
				}
			}
			else if(IsPlayerAttachedObjectSlotUsed(playerid,3))
			{
				RemovePlayerAttachedObject(playerid,3);
			}
			if(weaponid[7] && weaponammo[7] > 0)
			{
				if(pArmedWeapon != weaponid[7] && (PI[playerid][pRifleSling] && PI[playerid][pShowGun]) || IsACop(playerid))
				{
					if(!IsPlayerAttachedObjectSlotUsed(playerid,4))
					{
						SetPlayerAttachedObject(playerid,4,GetWeaponModel(weaponid[7]),1,-0.100000, 0.000000, -0.100000, 84.399932, 112.000000, 10.000000, 1.099999, 1.000000, 1.000000);
					}
				}
				else 
				{
					if(IsPlayerAttachedObjectSlotUsed(playerid,4))
					{
						RemovePlayerAttachedObject(playerid,4);
					}
				}
			}
			else if(IsPlayerAttachedObjectSlotUsed(playerid,4))
			{
				RemovePlayerAttachedObject(playerid,4);
			}
			armedbody_pTick[playerid] = GetTickCount();
		}
	}
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, CLICK_SOURCE:source)
{
	return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
	if(AI[playerid][aLoggedIn] && AI[playerid][aLevel] >= 2) SetPlayerPosEx(playerid, Float:fX, Float:fY, Float:fZ);
	return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, WEAPON:weaponid, bodypart)
{
	if((issuerid != INVALID_PLAYER_ID) && AI[playerid][c_agm] == true) return 0;
    if((issuerid != INVALID_PLAYER_ID) && IsACop(issuerid) && weaponid == WEAPON_NITESTICK)
	{
		if(IsACop(playerid)) return 1;
		if(IsPlayerInAnyVehicle(playerid)) return SCMESS(issuerid, GREY_FORMAT, "Человек в машине!");
		if(GetPVarInt(playerid, "Tazer") > 0) return SCMESS(issuerid, GREY_FORMAT, "Игрок уже оглушен / в наручниках");
		format(g_str, 70, "%s временно обездвижил тебя электрошокером.", PI[issuerid][pName]);
		SCMESS(playerid, SERVER_FORMAT, g_str);
		format(g_str, 70, "%s временно обездвижен электрошокером.", PI[playerid][pName]);
		SCMESS(issuerid, SERVER_FORMAT, g_str);
		if(PI[playerid][pGender]) format(g_str, 50, "оглушил дубинкой %s", PI[playerid][pName]);
		else format(g_str, 50, "оглушила дубинкой %s", PI[playerid][pName]);
		MeAction(issuerid, g_str);
		ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, false, true, true, true, 0, FORCE_SYNC:1);
		SetTimerEx("TazerOff", 15000, false, "d", playerid);
		TogglePlayerControllable(playerid, false);
		SetPVarInt(playerid, "Tazer", 1);
	}
	if((issuerid != INVALID_PLAYER_ID) && IsACop(issuerid) && weaponid == WEAPON_SILENCED)
	{
		if(IsACop(playerid)) return 1;
		if(IsPlayerInAnyVehicle(playerid)) return SCMESS(issuerid, GREY_FORMAT, ""NEGATIVE_MARK" Человек в машине!");
		if(GetPVarInt(playerid, "Tazer") > 0) return SCMESS(issuerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок уже оглушен / в наручниках.");
		format(g_str, 70, "%s временно обездвижил тебя электрошокером.", PI[issuerid][pName]);
		SCMESS(playerid, ACTION_FORMAT, g_str);
		format(g_str, 70, "%s временно обездвижен электрошокером.", PI[playerid][pName]);
		SCMESS(issuerid, ACTION_FORMAT, g_str);
		if(PI[playerid][pGender]) format(g_str, 70, "применил электрошокер на %s", PI[playerid][pName]);
		else format(g_str, 70, "применила электрошокер на %s", PI[playerid][pName]);
		MeAction(issuerid, g_str);
		ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, false, true, true, true, 0, FORCE_SYNC:1);
		SetTimerEx("TazerOff", 15000, false, "d", playerid);
		TogglePlayerControllable(playerid, false);
		SetPVarInt(playerid, "Tazer", 1);
	}
    return 1;
}

public OnPlayerWeaponShot(playerid, WEAPON:weaponid, BULLET_HIT_TYPE:hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
    PI[playerid][Ammo][Slot(weaponid)] --;
    if(PI[playerid][Ammo][Slot(weaponid)] > GetPlayerAmmo(playerid)) PI[playerid][Ammo][Slot(weaponid)] = GetPlayerAmmo(playerid);
	switch(weaponid)
	{
		case WEAPON_SILENCED, WEAPON_DEAGLE, WEAPON_SHOTGUN, WEAPON_SNIPER:
			{
				new server_tick = GetTickCount();
				if(server_tick - GetPVarInt(playerid, "player_last_shot_tick") < 300 // Последний выстрел игрока из оружия
						&& server_tick - GetPVarInt(playerid, "player_last_c_key") > 1000 // Последнее нажатие клавиши 'С'
						&& ++player_shot_count{playerid} > 2 // Количество выстрелов за некоторое время
						&& !IsPlayerInAnyVehicle(playerid)) // игрок не находится в транспорте ( выстрелы с оружия "Desert Eagle" достаточно быстрые, если игрок стреляет с пассажирского места из транспорта )
				{
					SAMF(DEFAULTRED_FORMAT, "[Anti-Cheat] "WHITE_HEX"%s[%d] вероятно использует Auto +C / Rapid Fire.", PI[playerid][pName], playerid);
					player_shot_count{playerid} = 0;
				}
				SetPVarInt(playerid, "player_last_shot_tick", server_tick); // Перехватываем время, последнего выстрела игрока из оружия
			}
	}
	if(hittype == BULLET_HIT_TYPE_PLAYER && IsPlayerConnected(hitid) && !IsPlayerNPC(hitid))
	{
		new Float:Shot[3], Float:Hit[3], 
		Float:targetpackets = NetStats_PacketLossPercent(hitid), 
		Float:playerpackets = NetStats_PacketLossPercent(playerid),
		playersurf = GetPlayerSurfingVehicleID(playerid), 
		hitsurf = GetPlayerSurfingVehicleID(hitid);
		GetPlayerLastShotVectors(playerid, Shot[0], Shot[1], Shot[2], Hit[0], Hit[1], Hit[2]);
		if(~(playersurf) && ~(hitsurf) && !IsPlayerInAnyVehicle(playerid) && !IsPlayerInAnyVehicle(hitid))
		{
			if(!IsPlayerAimingAtPlayer(playerid, hitid) && !IsPlayerInRangeOfPoint(hitid, 5.0, Hit[0], Hit[1], Hit[2]))
			{
				new issuer[24];
				GetPlayerName(playerid, issuer, 24);
				aimbotWarnings[playerid] ++;
				SAMF(DEFAULTRED_FORMAT, "[Anti-Cheat] "WHITE_HEX"%s[%d] Возможно aimbot или lag [Target PL: %f | Shooter PL: %f]!", issuer, playerid, targetpackets, playerpackets);
				if(aimbotWarnings[playerid] > 10)
				{
					if(targetpackets < 1.2 && playerpackets < 1.2) return Kick(playerid);
					else
					{
						SAMF(DEFAULTRED_FORMAT, "[Anti-Cheat] "WHITE_HEX"%s[%d] Возможно Auto Aim [Target PL: %f | Shooter PL: %f]!", issuer, playerid, targetpackets, playerpackets);
					}
				}
				return 0;
			}
			else return 1;
		}
		else return 1;
	}
    return 1;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid) 
{
	if(spectateID[playerid] != INVALID_PLAYER_ID) 
	{
		if(clickedid == Text:INVALID_TEXT_DRAW) 
		{
        	spectateCameraON[playerid] = true;
        	GameTextForPlayer(playerid, "~w~Spectate Camera Mode: ~g~ON", 5000, 3);
		}
		if(clickedid == BUTTON_PREVIOUS) 
		{
		    new prev = GetPreviousPlayer(spectateID[playerid]);
		    if(prev == INVALID_PLAYER_ID) PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
			else StartSpectate(playerid, prev);
		}
		if(clickedid == BUTTON_NEXT) 
		{
		    new next = GetNextPlayer(spectateID[playerid]);
		    if(next == INVALID_PLAYER_ID) PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
			else StartSpectate(playerid, next);
		}
		return 1;
	}
	if(clickedid == changeskin_TD[0]) // right
	{
		switch(PI[playerid][pGender])
		{
			case 0:
			{
				TI[playerid][changeSkinCount] += 1;
				if(TI[playerid][changeSkinCount] >= 14) TI[playerid][changeSkinCount] = 1;
				format(g_str, 16, "%d$", skinWomen[TI[playerid][changeSkinCount]][1] * BI[GetPVarInt(playerid, "clothesbusinessid")][bProdsPrice]);
    			PlayerTextDrawSetString(playerid, changeskin_PTD[playerid][0], g_str);
				SetPlayerSkin(playerid,skinWomen[TI[playerid][changeSkinCount]][0]);
			}
			case 1:
			{
				TI[playerid][changeSkinCount] += 1;
				if(TI[playerid][changeSkinCount] >= 62) TI[playerid][changeSkinCount] = 1;
				format(g_str, 16, "%d$", skinMen[TI[playerid][changeSkinCount]][1] * BI[GetPVarInt(playerid, "clothesbusinessid")][bProdsPrice]);
    			PlayerTextDrawSetString(playerid, changeskin_PTD[playerid][0], g_str);
				SetPlayerSkin(playerid,skinMen[TI[playerid][changeSkinCount]][0]);
			}
		}
		return 1;
	}
	if(clickedid == changeskin_TD[1]) // left
	{
		switch(PI[playerid][pGender])
		{
			case 0:
			{
				if(TI[playerid][changeSkinCount] <= 0) TI[playerid][changeSkinCount] = 14;//5 - последний скин [Ж]
				TI[playerid][changeSkinCount]-=1;
				format(g_str, 16, "%d$", skinWomen[TI[playerid][changeSkinCount]][1] * BI[GetPVarInt(playerid, "clothesbusinessid")][bProdsPrice]);
    			PlayerTextDrawSetString(playerid, changeskin_PTD[playerid][0], g_str);
				SetPlayerSkin(playerid,skinWomen[TI[playerid][changeSkinCount]][0]);
			}
			case 1: 
			{
				if(TI[playerid][changeSkinCount] <= 0) TI[playerid][changeSkinCount] = 62;//7 - последний скин [М]
				TI[playerid][changeSkinCount]-=1;
				format(g_str, 16, "%d$", skinMen[TI[playerid][changeSkinCount]][1] * BI[GetPVarInt(playerid, "clothesbusinessid")][bProdsPrice]);
    			PlayerTextDrawSetString(playerid, changeskin_PTD[playerid][0], g_str);
				SetPlayerSkin(playerid,skinMen[TI[playerid][changeSkinCount]][0]);
			}
		}
		return 1;
	}
	if(clickedid == changeskin_TD[2]) // buy
	{
		switch(PI[playerid][pGender])
		{
			case 0:
			{
				if(PI[playerid][pMoney] < (skinWomen[TI[playerid][changeSkinCount]][1] * BI[GetPVarInt(playerid, "clothesbusinessid")][bProdsPrice])) 
				{
					return SCMESS(playerid,YELLOW_FORMAT,"- Продавщица: "WHITE_HEX"Данная одежда Вам не по карману!");	
				}
				if(PI[playerid][pHouse] != -1 && HI[PI[playerid][pHouse]][hCupboardBought])
				{
					return SPD(playerid, DLG_BUYCLOTHES, DSM, ""SERVER_HEX"Покупка одежды", ""WHITE_HEX"У тебя приобретён шкаф в доме. Выбери слот в котором сохранить твою новую одежду. Если в слоте уже есть одежда, она будет заменена.", "Далее", "Нет");
				}
				SetMoney(playerid, -skinWomen[TI[playerid][changeSkinCount]][1] * BI[GetPVarInt(playerid, "clothesbusinessid")][bProdsPrice]);
				BI[GetPVarInt(playerid, "clothesbusinessid")][bMoney] += skinWomen[TI[playerid][changeSkinCount]][1] * BI[GetPVarInt(playerid, "clothesbusinessid")][bProdsPrice];
				BI[GetPVarInt(playerid, "clothesbusinessid")][bIncomeDay] += skinWomen[TI[playerid][changeSkinCount]][1] * BI[GetPVarInt(playerid, "clothesbusinessid")][bProdsPrice];
			}
			case 1:
			{
				if(PI[playerid][pMoney] < (skinMen[TI[playerid][changeSkinCount]][1] * BI[GetPVarInt(playerid, "clothesbusinessid")][bProdsPrice])) 
				{
					return SCMESS(playerid,YELLOW_FORMAT,"- Продавщица: "WHITE_HEX"Данная одежда Вам не по карману!");	
				}
				if(PI[playerid][pHouse] != -1 && HI[PI[playerid][pHouse]][hCupboardBought])
				{
					return SPD(playerid, DLG_BUYCLOTHES, DSM, ""SERVER_HEX"Покупка одежды", ""WHITE_HEX"У тебя приобретён шкаф в доме. Выбери слот в котором сохранить твою новую одежду. Если в слоте уже есть одежда, она будет заменена.", "Далее", "Нет");
				}
				SetMoney(playerid, -skinMen[TI[playerid][changeSkinCount]][1] * BI[GetPVarInt(playerid, "clothesbusinessid")][bProdsPrice]);
				BI[GetPVarInt(playerid, "clothesbusinessid")][bMoney] += skinMen[TI[playerid][changeSkinCount]][1] * BI[GetPVarInt(playerid, "clothesbusinessid")][bProdsPrice];
				BI[GetPVarInt(playerid, "clothesbusinessid")][bIncomeDay] += skinMen[TI[playerid][changeSkinCount]][1] * BI[GetPVarInt(playerid, "clothesbusinessid")][bProdsPrice];
			}
		}
		new Float:changeskin_x_pos,Float:changeskin_y_pos,Float:changeskin_z_pos;
		TogglePlayerControllable(playerid, true);
		SetCameraBehindPlayer(playerid);
		GetPlayerPos(playerid, changeskin_x_pos, changeskin_y_pos, changeskin_z_pos);
		SetPlayerPos(playerid,changeskin_x_pos, changeskin_y_pos, changeskin_z_pos);
		BI[GetPVarInt(playerid, "clothesbusinessid")][bProds] -= 50;
		PI[playerid][pSkin] = GetPlayerSkin(playerid);
		SetPlayerSkin(playerid,PI[playerid][pSkin]);
		SaveBusinessInts(GetPVarInt(playerid, "clothesbusinessid"), "bMoney", BI[GetPVarInt(playerid, "clothesbusinessid")][bMoney], "bProds", BI[GetPVarInt(playerid, "clothesbusinessid")][bProds]);
		DeletePVar(playerid, "clothesbusinessid");
		for(new i=0; i < sizeof(changeskin_TD); i++)
		{
			TextDrawHideForPlayer(playerid, changeskin_TD[i]);
			CancelSelectTextDraw(playerid);
		}
		PlayerTextDrawHide(playerid, changeskin_PTD[playerid][0]);
		SCMESS(playerid,YELLOW_FORMAT,"- Продавщица: "WHITE_HEX" Спасибо за покупку. Вы сделали хороший выбор! Приходите еще!");
		SetActorChatBubble(clothesShopActor_intid_15[0], "Спасибо за покупку. Вы сделали хороший выбор! Приходите еще!", GREY_FORMAT, 20.0, 10000);
		ApplyDynamicActorAnimation(clothesShopActor_intid_15[1], "PED", "IDLE_CHAT", 8.1, false, false, false, false, 0);
		return 1;
	}
	if(clickedid == changeskin_TD[3]) // exit
	{
		new Float:changeskin_x_pos,Float:changeskin_y_pos,Float:changeskin_z_pos;
		GetPlayerPos(playerid, changeskin_x_pos, changeskin_y_pos, changeskin_z_pos);
		SetPlayerPosEx(playerid, changeskin_x_pos, changeskin_y_pos, changeskin_z_pos, 0.0, GetPVarInt(playerid, "clothesbusinessid"), BI[GetPVarInt(playerid, "clothesbusinessid")][bInt], 0, 0);
		SetPlayerSkin(playerid,PI[playerid][pSkin]);
		TogglePlayerControllable(playerid, true);
		SetCameraBehindPlayer(playerid);
		SCMESS(playerid,YELLOW_FORMAT,"- Продавщица: "WHITE_HEX" Хорошего дня, приходите еще!");
		SetActorChatBubble(clothesShopActor_intid_15[0], "Хорошего дня, приходите еще!", GREY_FORMAT, 20.0, 10000);
		ApplyDynamicActorAnimation(clothesShopActor_intid_15[1], "PED", "IDLE_CHAT", 8.1, false, false, false, false, 0);
		for(new i=0; i < sizeof(changeskin_TD); i++)
		{
			TextDrawHideForPlayer(playerid, changeskin_TD[i]);
			CancelSelectTextDraw(playerid);
		}
		PlayerTextDrawHide(playerid, changeskin_PTD[playerid][0]);
		return DeletePVar(playerid, "clothesbusinessid");
	}
	if(clickedid == chooseCar_TD[15]) // exit
	{
		DestroyVehicleEx(TI[playerid][selectCar]);
		TogglePlayerControllable(playerid, true);
		SetPlayerVirtualWorldEx(playerid, 7);
		SetCameraBehindPlayer(playerid);
		TI[playerid][selectCarCount] = 0;
		for(new i=0; i < sizeof(chooseCar_TD); i++)
		{
			TextDrawHideForPlayer(playerid, chooseCar_TD[i]);
			CancelSelectTextDraw(playerid);
		}
		for(new i=0; i < sizeof(chooseCar_PTD); i++) PlayerTextDrawHide(playerid, chooseCar_PTD[playerid][i]);
		return 1;
	}
	return 0;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	
	if(playertextid == cupboard_home_PTD[playerid][2]) // model 1
	{
		PI[playerid][pSkin] = HI[PI[playerid][pHouse]][hCupboard][0];
		SetPlayerSkinEx(playerid, HI[PI[playerid][pHouse]][hCupboard][0]);
		SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Ты переоделся в новую одежду.");
		for(new i=0; i < sizeof(cupboard_home_PTD[]); i++)
		{
			PlayerTextDrawHide(playerid, cupboard_home_PTD[playerid][i]);
			CancelSelectTextDraw(playerid);
		}
		return 1;
	}
	if(playertextid == cupboard_home_PTD[playerid][3]) // model 2
	{
		PI[playerid][pSkin] = HI[PI[playerid][pHouse]][hCupboard][1];
		SetPlayerSkinEx(playerid, HI[PI[playerid][pHouse]][hCupboard][1]);
		SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Ты переоделся в новую одежду.");
		for(new i=0; i < sizeof(cupboard_home_PTD); i++)
		{
			PlayerTextDrawHide(playerid, cupboard_home_PTD[playerid][i]);
			CancelSelectTextDraw(playerid);
		}
		return 1;
	}
	if(playertextid == cupboard_home_PTD[playerid][4]) // model 3
	{
		PI[playerid][pSkin] = HI[PI[playerid][pHouse]][hCupboard][2];
		SetPlayerSkinEx(playerid, HI[PI[playerid][pHouse]][hCupboard][2]);
		SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Ты переоделся в новую одежду.");
		for(new i=0; i < sizeof(cupboard_home_PTD); i++)
		{
			PlayerTextDrawHide(playerid, cupboard_home_PTD[playerid][i]);
			CancelSelectTextDraw(playerid);
		}
		return 1;
	}
	if(playertextid == cupboard_home_PTD[playerid][5]) // exit
	{
		for(new i=0; i < sizeof(cupboard_home_PTD); i++)
		{
			PlayerTextDrawHide(playerid, cupboard_home_PTD[playerid][i]);
			CancelSelectTextDraw(playerid);
		}
		return 1;
	}
    return 0;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(response)
	{
		PlayerPlaySound(playerid, 1054, 0.0, 0.0, 0.0);
	}
	if(!response)
	{
		PlayerPlaySound(playerid, 1055, 0.0, 0.0, 0.0);
	}
	switch(dialogid)
	{
		case DLG_FIRST_CONNECT:
		{
			if(!response) return SPD(playerid, DLG_REGISTER, DSI, ""SERVER_HEX"Регистрация | Пароль", textAuth[0], "Далее", "Отмена");
			SPD(playerid, DLG_FIRST_CONNECT_INFO, DSM, ""SERVER_HEX"Информация о сервере", textAuth[4], "Далее", "");
		}
		case DLG_FIRST_CONNECT_INFO:
		{
			if(!response) return KickEx(playerid);
			SPD(playerid, DLG_FIRST_CONNECT_INFO_2, DSM, ""SERVER_HEX"Информация о сервере", textAuth[5], "Далее", "Назад");
		}
		case DLG_FIRST_CONNECT_INFO_2:
		{
			if(!response) return SPD(playerid, DLG_FIRST_CONNECT_INFO, DSM, ""SERVER_HEX"Информация о сервере", textAuth[4], "Далее", "");
			SPD(playerid, DLG_FIRST_CONNECT_RULES, DSM, ""SERVER_HEX"Правила сервера", textAuth[6], "Принять", "Выйти");
		}
		case DLG_FIRST_CONNECT_RULES:
		{
			if(!response) 
			{
				SCMESS(playerid, WHITE_FORMAT, "Ты отказался от принятия правил сервера :(");
				return KickEx(playerid);
			}
			SPD(playerid, DLG_REGISTER, DSI, ""SERVER_HEX"Регистрация | Пароль", textAuth[0], "Далее", "Отмена");
		}
		case DLG_REGISTER:
		{
			if(response)
			{
				if(strlen(inputtext) < MIN_PASSWORD_LENGHT+1 || strlen(inputtext) > MAX_PASSWORD_LENGHT+1)
				{
					SCMESS(playerid, WHITE_FORMAT, "Пароль должен быть не менее "#MIN_PASSWORD_LENGHT" и не более "#MAX_PASSWORD_LENGHT" символов");
					return SPD(playerid, DLG_REGISTER, DSI, ""SERVER_HEX"Регистрация | Пароль", textAuth[0], "Далее", "Отмена");
				}
				for(new i = 0; i < strlen(inputtext); i++)
				{
					if ((inputtext[i] < 'A' || inputtext[i] > 'Z') && (inputtext[i] < 'a' || inputtext[i] > 'z') && (inputtext[i] < '0' || inputtext[i] > '9'))
					{
						SCMESS(playerid, WHITE_FORMAT, "Пароль должен состоять из букв латинского алфавита (A-z) и цифр (0-9).");
						return SPD(playerid, DLG_REGISTER, DSI, ""SERVER_HEX"Регистрация | Пароль", textAuth[0], "Далее", "Отмена");
					}
				}
				SetPVarString(playerid, "player_register_password", inputtext);
				return SPD(playerid, DLG_REG_EMAIL, DSI, ""SERVER_HEX"Регистрация | Электронная почта", textAuth[1], "Далее", "Пропустить");
			}
			else 
			{ 
				return KickEx(playerid);
			}
		}
		case DLG_REG_EMAIL:
		{
			if(response)
			{
                if(!IsValidEmail(inputtext))
                {
				    SCMESS(playerid, WHITE_FORMAT, "Некорректно введена почта!");
				    return SPD(playerid, DLG_REG_EMAIL, DSI, ""SERVER_HEX"Регистрация | Электронная почта", textAuth[1], "Далее", "Пропустить");
				}
				query[0]=EOS;
    			mysql_format(connects, query, 128, "SELECT 1 FROM "TABLE_ACCOUNTS" WHERE `email` = '%e' LIMIT 1", inputtext);
			 	mysql_tquery(connects, query, "CheckMail", "ds", playerid, inputtext);
			}
			else // скип почты
			{
				SPD(playerid, DLG_REG_GENDER, DSM, ""SERVER_HEX"Регистрация | Выбор пола", ""WHITE_HEX"Выбери пол персонажа:", "Мужской", "Женский");
			}
		}
		case DLG_REG_GENDER:
		{
			if(!response)
			{
			    PI[playerid][pGender] = 0;
				new lenght = sizeof(registerWomenSkins);
				for(new i = 0, randomValue; i < lenght; i++)
				{
					randomValue = random(lenght--);
					PI[playerid][pSkin] = registerWomenSkins[randomValue];
				}
			}
			if(response)
			{
			    PI[playerid][pGender] = 1;
				new lenght = sizeof(registerMenSkins);
				for(new i = 0, randomValue; i < lenght; i++)
				{
					randomValue = random(lenght--);
					PI[playerid][pSkin] = registerMenSkins[randomValue];
				}
			}
			KillTimer(playerAuthTimer[playerid]);
			DeletePVar(playerid, "authTimerTick");
			new player_password[MAX_PASSWORD_LENGHT+1], callback_name[17] = "OnPasswordHashed", callback_format[2] = "d";
			GetPVarString(playerid, "player_register_password", player_password, sizeof(player_password));
			bcrypt_hash(player_password, BCRYPT_COST, callback_name, callback_format, playerid);
		}
		case DLG_LOGIN:
		{
			if(!response)
			{
			    SCMESS(playerid, WHITE_FORMAT, "/quit в чат для выхода.");
				return KickEx(playerid);
			}
			new callback_name[18] = "OnPasswordChecked", callback_format[2] = "d";
			bcrypt_check(inputtext, PI[playerid][pHash], callback_name, callback_format, playerid);
		}
		case DLG_CMD_MN:
		{
			if(response)
			{
				switch(listitem)
				{
				    case 0: ShowStats(playerid, playerid);
				    case 1: SPD(playerid, DLG_MENU_CMD, DSL, ""SERVER_HEX"Основные команды сервера", textServerCommands[0], "Выбрать", "Назад");
				    case 2: SPD(playerid, DLG_MENU_REPORT, DSI, ""SERVER_HEX"Связь с администрацией", ""WHITE_HEX"Введи сообщение для модерации сервера в поле ниже:", "Отправить", "Назад");
				    case 3: ShowSettings(playerid);
				}
			}
		}
		case DLG_MENU_STATS:
		{
		    if(response) menuCommand(playerid);
		}
		case DLG_MENU_CMD:
		{
		    if(!response) return menuCommand(playerid);
			switch(listitem)
			{
			    case 0: SPD(playerid, DLG_MENU_CMD_SHOW, DSM,""SERVER_HEX"Команды чата", textServerCommands[1], "Назад","Выйти");
				case 1: SPD(playerid, DLG_MENU_CMD_SHOW, DSM,""SERVER_HEX"Команды сервера", textServerCommands[3], "Назад","Выйти");
			    case 2: 
				{
					new menu_cmd_str[1024];
					switch(PI[playerid][pMember])
					{
						case 0: SCMESS(playerid, WHITE_FORMAT, "Нужно состоять в организации.");
						case 1: 
						{
							g_str[0]=EOS;
							format(g_str, 300, ""WHITE_HEX"/r - рация\n/rb - неролевой чат рации");
							strcat(menu_cmd_str, g_str);
							switch(PI[playerid][pRank])
							{
								case 6..7:
								{
									format(g_str, 300, ""WHITE_HEX"/giverank - повысить сотрудника\n/changeskin - изменить одежду\n/invite - принять игрока в организацию\n/uninvite - уволить сотрудника");
									strcat(menu_cmd_str, g_str);
								}
							}
							format(menu_cmd_str, sizeof(menu_cmd_str), ""SERVER_HEX"Мои команды");
							SPD(playerid, DLG_MENU_CMD_SHOW, DSM, menu_cmd_str, g_str, "Назад","Выйти");
						}
						default: return 1; // потом написать
					}
				}
			    case 3:
				{
					if(AI[playerid][aLevel] && AI[playerid][aLoggedIn]) return ahelpCommand(playerid);
					SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нет доступа!");
				}
				case 4: SPD(playerid, DLG_MENU_CMD_SHOW, DSM,""SERVER_HEX"Команды транспорта", textServerCommands[2], "Назад","Выйти");
			}
		}
		case DLG_MENU_REPORT: 
		{
			if(!response) return menuCommand(playerid);
			reportCommand(playerid, inputtext);
		}
		case DLG_MENU_CMD_SHOW:
		{
		    if(response) return SPD(playerid, DLG_MENU_CMD, DSL, ""SERVER_HEX"Основные команды сервера", textServerCommands[0], "Выбрать", "Назад");
		}
		case DLG_MENU_SETTINGS:
		{
			if(response)
			{
				switch(listitem+1)
				{
				    case 1:
				    {
				        if(!PI[playerid][isEmail])
				        {
				            SPD(playerid, DLG_ADD_EMAIL, DSI, ""SERVER_HEX"Ввод почты", "Введи свою почту в поле ниже:", "Ввести", "Отмена");
				        }
				        else if(PI[playerid][isEmail])
				        {
				            SPD(playerid, DLG_CHANGE_EMAIL, DSL, ""SERVER_HEX"Смена почты", ""SERVER_HEX"1."WHITE_HEX" Доступ к почте имеется\n"SERVER_HEX"2. "WHITE_HEX"Не имею доступа к почте", "Ввести", "Отмена");
				        }
				    }
					case 2:
					{
						switch(PI[playerid][pAdminMess])
						{
							case 0: PI[playerid][pAdminMess]+=1;
							case 1: PI[playerid][pAdminMess]-=1;
						}
						ShowSettings(playerid);
					}
					case 3:
					{
						switch(PI[playerid][pGchatMess])
						{
							case 0: PI[playerid][pGchatMess]+=1;
							case 1: PI[playerid][pGchatMess]-=1;
						}
						ShowSettings(playerid);
					}
					case 4:
					{
						if(!PI[playerid][pRifleSling] && !PI[playerid][pHolster]) 
						{
							SendNegativeMess(playerid, "Отсутствует кобура или оружейный ремень.");
							return ShowSettings(playerid);
						}
						switch(PI[playerid][pShowGun])
						{
							case 0: PI[playerid][pShowGun]+=1;
							case 1: PI[playerid][pShowGun]-=1;
						}
						ShowSettings(playerid);
					}
				}
			}
		}
		case DLG_ADD_EMAIL:
		{
			if(response)
			{
			    if(!IsValidEmail(inputtext))
	            {
				    SCMESS(playerid, WHITE_FORMAT, ""NEGATIVE_MARK" Некорректный email!");
			        return SPD(playerid, DLG_ADD_EMAIL, DSI, ""SERVER_HEX"Ввод почты", ""WHITE_HEX"Введи свою почту в поле ниже:", "Ввести", "Отмена");
				}
				PI[playerid][isEmail] += 1;
				strins(PI[playerid][pEmail], inputtext, 0);
                format(g_str, 60, ""POSITIVE_MARK" Почта %s успешно привязана!", PI[playerid][pEmail]);
                SCMESS(playerid, GREEN_FORMAT, g_str);
				query[0]=EOS;
				mysql_format(connects, query, 160, "UPDATE "TABLE_ACCOUNTS" SET `email` = '%e', `isemail` = '%d' WHERE `id` = '%d' LIMIT 1", PI[playerid][pEmail], PI[playerid][isEmail], PI[playerid][pID]);
			 	mysql_tquery(connects, query, "", "");
		 	}
		}
		case DLG_CHANGE_EMAIL:
		{
			if(response)
			switch(listitem+1)
			{
				case 1:
				{
					return SPD(playerid, DLG_CHANGE_EMAIL, DSI, ""SERVER_HEX"Смена почты", ""WHITE_HEX"Введи код подтверждения с введенной почты в поле: ", "Ввести", "Отмена");
				}
				case 2: 
				{
					return SPD(playerid, DLG_CHANGE_EMAIL, DSM, ""SERVER_HEX"Смена почты", ""WHITE_HEX"Если доступа к почте не имеется, обратись к модераторам для её смены в /report", "Закрыть", "");
				}
			}
		}
		case DLG_ALOGIN_REG:
		{
            if(!response || !AI[playerid][aLevel]) return 1;
			new check_alogin_reg[2];
			for(new i = strlen(inputtext) - 1; i != -1; i--)
			{
				switch(inputtext[i])
				{
			    	case 'A'..'Z', 'А'..'Я': check_alogin_reg[0] ++;
			    	case 'a'..'z', 'а'..'я': check_alogin_reg[1] ++;
				}
			}
			if(strlen(inputtext) < MIN_PASSWORD_LENGHT+1 || strlen(inputtext) > MAX_PASSWORD_LENGHT+1 || (!check_alogin_reg[0] || !check_alogin_reg[1])) return SPD(playerid, DLG_ALOGIN_REG, DSI, ""SERVER_HEX"Регистрация админ пароля", textAuth[2], !"Создать", !"Отмена");
			new callback_name[27] = "OnPasswordCheckedForALogin", callback_format[3] = "ds";
			bcrypt_check(inputtext, PI[playerid][pHash], callback_name, callback_format, playerid, inputtext);
		}
		case DLG_ALOGIN_AUTH:
		{
            if(!response || !AI[playerid][aLevel]) return 1;
			if(AI[playerid][aDifferentIP]) return SendErrorMess(playerid, "Доступ запрещён из-за смены IP адреса. Обратись к старшей администрации.");
			new callback_name[20] = "OnALoginPassChecked", callback_format[2] = "d";
			bcrypt_check(inputtext, AI[playerid][aHash], callback_name, callback_format, playerid);
		}
		case DLG_CHANGEINT:
		{
			if(!response) return apanelCommand(playerid);
			switch(listitem)
			{
				case 0:	SPD(playerid, DLG_CHANGEINT_1, DSI, "Деревянный стиль","Введи номер дома", "Ввести", "Отмена");
				case 1:	SPD(playerid, DLG_CHANGEINT_2, DSI, "Мрамор","Введи номер дома", "Ввести", "Отмена");
				case 2: SPD(playerid, DLG_CHANGEINT_3, DSI, "Дворец","Введи номер дома", "Ввести", "Отмена");
				case 3:	SPD(playerid, DLG_CHANGEINT_4, DSI, "Обычный стиль","Введи номер дома", "Ввести", "Отмена");
				case 4:	SPD(playerid, DLG_CHANGEINT_5, DSI, "Обычное дерево","Введи номер дома", "Ввести", "Отмена");
				case 5: SPD(playerid, DLG_CHANGEINT_6, DSI, "Обычный стиль - 2","Введи номер дома", "Ввести", "Отмена");
				case 6:	SPD(playerid, DLG_CHANGEINT_7, DSI, "Красное дерево","Введи номер дома", "Ввести", "Отмена");
				case 7: SPD(playerid, DLG_CHANGEINT_8, DSI, "Обычный стиль - 3","Введи номер дома", "Ввести", "Отмена");
				case 8: SPD(playerid, DLG_CHANGEINT_9, DSI, "Дешевый стиль","Введи номер дома", "Ввести", "Отмена");
			}
		}
		case DLG_CHANGEINT_1:
		{
			if(response)
			{
				if(strval(inputtext) != HI[strval(inputtext)][hID]) return SCMESS(playerid, GREY_FORMAT, "Такого дома не существует.");
				new change_int_house_id = strval(inputtext);
				HI[change_int_house_id][hInt] = 4;
				HI[change_int_house_id][hEnterIntX] = -261.9759;
				HI[change_int_house_id][hEnterIntY] = 1456.8844;
				HI[change_int_house_id][hEnterIntZ] = 1084.3672;
				SCMESS(playerid, WHITE_FORMAT, "Интерьер дома изменен на Деревянный стиль");
			}
		}
		case DLG_CHANGEINT_2:
		{
			if(response)
			{
				if(strval(inputtext) != HI[strval(inputtext)][hID]) return SCMESS(playerid, GREY_FORMAT, "Такого дома не существует.");
				new change_int_house_id = strval(inputtext);
				HI[change_int_house_id][hInt] = 6;
				HI[change_int_house_id][hEnterIntX] = 234.1571;
				HI[change_int_house_id][hEnterIntY] = 1064.9569;
				HI[change_int_house_id][hEnterIntZ] = 1084.2104;
				SCMESS(playerid, WHITE_FORMAT, "Интерьер дома изменен на Мрамор.");
			}
		}
		case DLG_CHANGEINT_3:
		{
			if(response)
			{
				if(strval(inputtext) != HI[strval(inputtext)][hID]) return SCMESS(playerid, GREY_FORMAT, "Такого дома не существует.");
				new change_int_house_id = strval(inputtext);
				HI[change_int_house_id][hInt] = 5;
				HI[change_int_house_id][hEnterIntX] = 140.9131;
				HI[change_int_house_id][hEnterIntY] = 1367.9713;
				HI[change_int_house_id][hEnterIntZ] = 1083.8621;
				SCMESS(playerid, WHITE_FORMAT, "Интерьер дома изменен на Дворец.");
			}
		}
		case DLG_CHANGEINT_4:
		{
			if(response)
			{
				if(strval(inputtext) != HI[strval(inputtext)][hID]) return SCMESS(playerid, GREY_FORMAT, "Такого дома не существует.");
				new change_int_house_id = strval(inputtext);
				HI[change_int_house_id][hInt] = 5;
				HI[change_int_house_id][hEnterIntX] = 22.7783;
				HI[change_int_house_id][hEnterIntY] = 1404.9600;
				HI[change_int_house_id][hEnterIntZ] = 1084.4297;
				SCMESS(playerid, WHITE_FORMAT, "Интерьер дома изменен на Обычный стиль.");
			}
		}
		case DLG_CHANGEINT_5:
		{
			if(response)
			{
				if(strval(inputtext) != HI[strval(inputtext)][hID]) return SCMESS(playerid, GREY_FORMAT, "Такого дома не существует.");
				new change_int_house_id = strval(inputtext);
				HI[change_int_house_id][hInt] = 10;
				HI[change_int_house_id][hEnterIntX] = 23.8334;
				HI[change_int_house_id][hEnterIntY] = 1340.4812;
				HI[change_int_house_id][hEnterIntZ] = 1084.3750;
				SCMESS(playerid, WHITE_FORMAT, "Интерьер дома изменен на Обычное дерево.");
			}
		}
		case DLG_CHANGEINT_6:
		{
			if(response)
			{
				if(strval(inputtext) != HI[strval(inputtext)][hID]) return SCMESS(playerid, GREY_FORMAT, "Такого дома не существует.");
				new change_int_house_id = strval(inputtext);
				HI[change_int_house_id][hInt] = 4;
				HI[change_int_house_id][hEnterIntX] = 261.0654;
				HI[change_int_house_id][hEnterIntY] = 1284.2991;
				HI[change_int_house_id][hEnterIntZ] = 1080.2578;
				SCMESS(playerid, WHITE_FORMAT, "Интерьер дома изменен на Обычный стиль - 2.");
			}
		}
		case DLG_CHANGEINT_7:
		{
			if(response)
			{
				if(strval(inputtext) != HI[strval(inputtext)][hID]) return SCMESS(playerid, GREY_FORMAT, "Такого дома не существует.");
				new change_int_house_id = strval(inputtext);
				HI[change_int_house_id][hInt] = 2;
				HI[change_int_house_id][hEnterIntX] = 491.0190;
				HI[change_int_house_id][hEnterIntY] = 1399.0691;
				HI[change_int_house_id][hEnterIntZ] = 1080.2578;
				SCMESS(playerid, WHITE_FORMAT, "Интерьер дома изменен на Красное дерево.");
			}
		}
		case DLG_CHANGEINT_8:
		{
			if(response)
			{
				if(strval(inputtext) != HI[strval(inputtext)][hID]) return SCMESS(playerid, GREY_FORMAT, "Такого дома не существует.");
				new change_int_house_id = strval(inputtext);
				HI[change_int_house_id][hInt] = 2;
				HI[change_int_house_id][hEnterIntX] = 225.9761;
				HI[change_int_house_id][hEnterIntY] = 1239.9126;
				HI[change_int_house_id][hEnterIntZ] = 1082.1406;
				SCMESS(playerid, WHITE_FORMAT, "Интерьер дома изменен на Обычный стиль - 3.");
			}
		}
		case DLG_CHANGEINT_9:
		{
			if(response)
			{
				if(strval(inputtext) != HI[strval(inputtext)][hID]) return SCMESS(playerid, GREY_FORMAT, "Такого дома не существует.");
				new change_int_house_id = strval(inputtext);
				HI[change_int_house_id][hInt] = 10;
				HI[change_int_house_id][hEnterIntX] = 2261.3103;
				HI[change_int_house_id][hEnterIntY] = -1136.4467;
				HI[change_int_house_id][hEnterIntZ] = 1050.6328;
				SCMESS(playerid, WHITE_FORMAT, "Интерьер дома изменен на Дешевый стиль.");
			}
		}
		case DLG_APANEL_EXTRA:
		{
			if(!response) return apanelCommand(playerid);
			switch(listitem+1)
			{
				case 1: ClearChat(playerid);
				case 2: return 1;
			}
		}
		case DLG_APANEL_ESTATE:
		{
			if(!response) return apanelCommand(playerid);
			switch(listitem+1)
			{
				case 1:
				{
					new clear_estate_var_count;	
					for(new i=0; i < TOTALHOUSE; i++)
					{
						if(!HI[i][hOwner]) continue;
						ClearHouse(i);
						UpdateHouse(i);
						clear_estate_var_count++;
					}
					foreach(new p : Player)
					{
						if(PI[p][pHouse] == -1 || !pLoggedIn{p}) continue;
						PI[p][pHouse] = -1;
					}
					mysql_tquery(connects, "UPDATE "TABLE_ACCOUNTS" SET `house` = '-1' WHERE `house` != '-1' LIMIT 1", "", "");
					SAMF(DARKRED_FORMAT, "[A] %s продал все занятые дома. Всего занятых домов было %d", PI[playerid][pName], clear_estate_var_count);
				}
				case 2:
				{
					SPD(playerid, DLG_CHANGEINT, DSL, "Интерьер", "Деревянный стиль\nМрамор\nДворец\nОбычный стиль\nОбычное дерево\nОбычный стиль - 2\nКрасное дерево\nОбычный стиль - 3\nДешевый стиль", "Выбрать", "Назад");
				}
				case 3:
				{
					for(new i=0; i < TOTALHOUSE; i++) 
					{
						if(HI[i][hCost] <= HOUSE_COST_TYPE_0 && HI[i][hCost] > 0) HI[i][hType] = 0;
						if(HI[i][hCost] <= HOUSE_COST_TYPE_1 && HI[i][hCost] > HOUSE_COST_TYPE_0) HI[i][hType] = 1;
						if(HI[i][hCost] <= HOUSE_COST_TYPE_2 && HI[i][hCost] > HOUSE_COST_TYPE_1) HI[i][hType] = 2;
						if(HI[i][hCost] <= HOUSE_COST_TYPE_3 && HI[i][hCost] > HOUSE_COST_TYPE_2) HI[i][hType] = 3;
						if(HI[i][hCost] < HOUSE_COST_TYPE_4 && HI[i][hCost] > HOUSE_COST_TYPE_3) HI[i][hType] = 4;
					}
					SCMESSF(playerid, WHITE_FORMAT, "Дома распределены по классам.");
				}
				case 4:
				{
					for(new i=0; i < TOTALHOUSE; i++) 
					{
						switch(HI[i][hType])
						{
							case 0:
							{
								switch(HI[i][hID])
								{
									case 212..322:
									{
										HI[i][hInt] = 1;
										HI[i][hEnterIntX] = 245.3528;
										HI[i][hEnterIntY] = 304.9533;
										HI[i][hEnterIntZ] = 999.1484;
									}
									default:
									{
										switch(random(2))
										{
											case 0:
											{
												HI[i][hInt] = 10;
												HI[i][hEnterIntX] = 2261.3103;
												HI[i][hEnterIntY] = -1136.4467;
												HI[i][hEnterIntZ] = 1050.6328;
											}
											case 1:
											{
												HI[i][hInt] = 6;
												HI[i][hEnterIntX] = 2332.9946;
												HI[i][hEnterIntY] = -1076.1222;
												HI[i][hEnterIntZ] = 1049.0234;
											}
										}
									}
								}
							}
							case 1: // comfort
							{
								switch(random(2))
								{
									case 0:
									{
										HI[i][hInt] = 2;
										HI[i][hEnterIntX] = 225.9761;
										HI[i][hEnterIntY] = 1239.9126;
										HI[i][hEnterIntZ] = 1082.1406;
									}
									case 1: 
									{
										HI[i][hInt] = 8;
										HI[i][hEnterIntX] = 2365.10;
										HI[i][hEnterIntY] = -1133.07;
										HI[i][hEnterIntZ] = 1050.87;
									}
								}
							}
							case 2: // premium
							{
								HI[i][hInt] = 10;
								HI[i][hEnterIntX] = 23.8334;
								HI[i][hEnterIntY] = 1340.4812;
								HI[i][hEnterIntZ] = 1084.3750;
							}
							case 3:
							{
								HI[i][hInt] = 9;
								HI[i][hEnterIntX] = 2317.7922;
								HI[i][hEnterIntY] = -1026.1071;
								HI[i][hEnterIntZ] = 1050.2178;
							}
							case 4:
							{
								HI[i][hInt] = 2;
								HI[i][hEnterIntX] = 491.0190;
								HI[i][hEnterIntY] = 1399.0691;
								HI[i][hEnterIntZ] = 1080.2578;
							}
						}
						mysql_format(connects, query, 250, "UPDATE "TABLE_HOUSES" SET `hEnterIntX` = '%f', `hEnterIntY` = '%f', `hEnterIntZ` = '%f', `hInt` = '%d' WHERE `id` = '%d' LIMIT 1", HI[i][hEnterIntX], HI[i][hEnterIntY], HI[i][hEnterIntZ], HI[i][hInt], i);
    					mysql_tquery(connects, query);
					}
					SCMESS(playerid, WHITE_FORMAT, "Дома распределены по интерьерам.");
				}
				case 5:
				{
					new var_count;
					for(new i = 0; i < TOTALHOUSE; i++) 
					{
						if(HI[i][hCost] < HOUSE_COST_TYPE_0) 
						{
							var_count++;
							HI[i][hCost] = HOUSE_COST_TYPE_0;
						}
					}
					SCMESSF(playerid, WHITE_FORMAT, "Установлена минимальная стоимость (%d). Всего таких домов было: %d", HOUSE_COST_TYPE_0, var_count);
				}
				case 6: 
				{
					for(new i = 0; i < TOTALHOUSE; i++) 
					{
						switch(HI[i][hType])
						{
							case 0:
							{
								HI[i][hCost] = HOUSE_COST_TYPE_0;
								HI[i][hInt] = 1;
								HI[i][hEnterIntX] = 223.1219;
								HI[i][hEnterIntY] = 1287.841;
								HI[i][hEnterIntZ] = 1082.141;
							}
							case 1:
							{
								HI[i][hCost] = HOUSE_COST_TYPE_1;
								HI[i][hInt] = 6;
								HI[i][hEnterIntX] = 2196.4541;
								HI[i][hEnterIntY] = -1204.37097;
								HI[i][hEnterIntZ] = 1049.0229;
							}
							case 2:
							{
								HI[i][hCost] = HOUSE_COST_TYPE_2;
								HI[i][hInt] = 10;
								HI[i][hEnterIntX] = 2270.0449;
								HI[i][hEnterIntY] = -1210.494;
								HI[i][hEnterIntZ] = 1047.563;
							}
							case 3:
							{
								HI[i][hCost] = HOUSE_COST_TYPE_3;
								HI[i][hInt] = 9;
								HI[i][hEnterIntX] = 2317.8068;
								HI[i][hEnterIntY] = -1026.3859;
								HI[i][hEnterIntZ] = 1050.2180;
							}
							case 4:
							{
								HI[i][hCost] = HOUSE_COST_TYPE_4;
								HI[i][hInt] = 5;
								HI[i][hEnterIntX] = 140.2610;
								HI[i][hEnterIntY] = 1366.435;
								HI[i][hEnterIntZ] = 1083.859;
							}
							default:
							{
								HI[i][hCost] = HOUSE_COST_TYPE_4;
								HI[i][hInt] = 5;
								HI[i][hEnterIntX] = 140.2610;
								HI[i][hEnterIntY] = 1366.435;
								HI[i][hEnterIntZ] = 1083.859;
							}
						}
					}
					SCMESS(playerid, WHITE_FORMAT, "Дома распределены по ценам.");
				}
				case 7:
				{
					for(new i = 0; i < TOTALHOUSE; i++)
					{
						switch(HI[i][hType])
						{
							case 0: HI[i][hDice] = HOUSE_COST_TYPE_0/200;
							case 1: HI[i][hDice] = HOUSE_COST_TYPE_1/200;
							case 2: HI[i][hDice] = HOUSE_COST_TYPE_2/200;
							case 3: HI[i][hDice] = HOUSE_COST_TYPE_3/200;
							case 4: HI[i][hDice] = HOUSE_COST_TYPE_4/200;
						}
					}
					SCMESS(playerid, WHITE_FORMAT, "Дома распределены по квартплатам.");
				}
				case 8:
				{
					SaveHouses();
					SCMESS(playerid,WHITE_FORMAT,"Сохранены все дома."); 
				}
			}
		}
		case DLG_CMD_APANEL:
        {
			if(!response) return 1;
			switch(listitem)
			{
				case 0: ahelpCommand(playerid);
				case 1: teleportCommand(playerid);
				case 2:
				{
					if(AI[playerid][aLevel] >= 9) SPD(playerid, DLG_APANEL_ESTATE, DSL, "Управление недвижимостью", "1. Продать все дома\n2. Установить дому интерьер\n3. Распределить все дома по классам\n4. Распределить по интерьерам\n5. Убрать дома по 0 вирт\n6. Распределить цену домов\n7.Распределить квартплатам\n8. Сохранить все дома", "Выбрать", "Назад");
					else SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Отсутствует доступ в этот раздел");
				}
				case 3:
				{
					if(AI[playerid][aLevel] >= 7) SPD(playerid, DLG_APANEL_EXTRA, DSL, "Меню спец. администратора", "1. Очистить чат всем игрокам\n2. Устроится в организацию\n3. Проверить склады фракций\n", "Выбрать", "Назад");
                    else SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Отсутствует доступ в этот раздел");
				}
				case 4:
				{
					if(AI[playerid][aLevel] >= 9) SPD(playerid, 0, DSL, "Меню сервера", ""WHITE_HEX"1. Установить погоду\n2. Установить время суток\n3. Предварительный рестарт сервера\n4. Сохранение всех файлов\n5. Сохранить дома и бизнесы\n6. Включить PayDay\n7. Оптимизировать граффити\n9. Управление анти-читом", "Выбрать", "Назад");
                	else SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Отсутствует доступ в этот раздел");
				}
				case 5: SPD(playerid, 1002, DSI, "Статистика онлайна игрока", "Чтобы посмотреть статистику онлайна какого-либо игрока\nнеобходимо указать его ник", "Принять", "Назад");
			}
			return 1;
		}
		case DLG_CMD_TP:
		{
			if(!response) return 1;
			switch(listitem)
			{
				case 0: SPD(playerid, DLG_TP_ITEM_1, DSL, "{1294dd}Важные места", "1. Автовокзал LS (крыша)\n2. Автовокзал SF (крыша)\n3. Автовокзал LV\n4. Гетто\n5. Автопарк\n6. Шахта\n7. Лесопилка\n8. Оружейный завод\n9. Спавн новичков\n10. Порт LS\n11. Банк LS\n12. Банк SF\n13. Банк LV\n14. Банк PC\n15. Admin Zone[1]\n16. Admin Zone[2]", "Телепорт", "Назад");
				case 1: SPD(playerid, DLG_TP_ITEM_2, DSL, "{1294dd}Базы организаций", "1. Мэрия LS\n2. Мэрия SF\n3. Мэрия LV\n4. Больница LS\n5. Больница SF\n6. Больница LV\n7. Автошкола\n8. База National Guard\n9. SAPD\n10. SFPD\n11. LVPD\n12. FBI\n13. LCN\n14. Yakuza\n15. Russian Mafia", "Телепорт", "Назад");
				case 2: SPD(playerid, DLG_TP_ITEM_3, DSL, "{1294dd}Развлечения", "1. Liberty City\n2. RC Battlefield\n3. Casino Mirage\n4. Гонки: Пустыня LV", "Телепорт", "Назад");
			}
		}
		case DLG_TP_ITEM_1:
		{
			if(!response) return teleportCommand(playerid);
			new Float:x_pos, Float:y_pos, Float:z_pos, Float:A, int_id = 0, world_id = 0;
			switch(listitem)
			{
				case 0:  x_pos = 1742.3274,  y_pos = -2309.0002, z_pos = 26.8856;
				case 1:  x_pos = -1969.5084, y_pos = 139.4100,   z_pos = 36.6420;
				case 2:  x_pos = 2818.5000,  y_pos = 1269.2252,  z_pos = 10.7554;
				case 3:  x_pos = 1801.7378,  y_pos = -1856.4799, z_pos = 13.0746;
				case 4:  x_pos = 1642.1754,  y_pos = -1067.7218, z_pos = 23.8984;
				case 5:  x_pos = 597.6091,   y_pos = 870.6889,   z_pos = -43.1639;
				case 6:  x_pos = -754.1738,  y_pos = -128.4659,  z_pos = 65.8181;
				case 7:  x_pos = -999.9683,  y_pos = -692.3784,  z_pos = 32.0078;
				case 8:  x_pos = 1193.5609,  y_pos = -1822.3992, z_pos = 13.5821;
				case 9:  x_pos = 2786.8469,  y_pos = -2454.1892, z_pos = 13.2064;
				case 10: x_pos = 1564.8397,  y_pos = -1320.8010, z_pos = 16.4844;
				case 11: x_pos = -2243.2056, y_pos = 239.5445,   z_pos = 35.3203;
				case 12: x_pos = 2360.7119,  y_pos = 2363.2302,  z_pos = 10.8203;
				case 13: x_pos = 2301.1162,  y_pos = -3.7193,    z_pos = 26.4844;
				case 14: x_pos = 2320.3799,  y_pos = -1147.1454, z_pos = 1050.7031, int_id=12, world_id=1002;
				case 15: x_pos = 1281.87,    y_pos = -805.26,    z_pos = 1089.94,   int_id=13, world_id=1003;
			}
			GetPlayerFacingAngle(playerid, A);
			SetPlayerPosEx(playerid, x_pos, y_pos, z_pos, A, world_id, int_id);
			
		}
		case DLG_TP_ITEM_2:
		{
			if(!response) return teleportCommand(playerid);
			new Float:x_pos, Float:y_pos, Float:z_pos, Float:A, int_id = 0, world_id = 0;
			switch(listitem)
			{
				case 0:  x_pos = 1481.2532,  y_pos = -1742.1619, z_pos = 13.2;
				case 1:  x_pos = -2765.3337, y_pos = 397.7054,   z_pos = 4.4091;
				case 2:  x_pos = 2386.1128,  y_pos = 2446.8877,  z_pos = 10.8203;
				case 3:  x_pos = 1188.3796,  y_pos = -1326.2778, z_pos = 13.5597;
				case 4:  x_pos = -2636.9165, y_pos = 628.5225,   z_pos = 14.4531;
				case 5:  x_pos = 1584.1058,  y_pos = 1824.2361,  z_pos = 10.8203;
				case 6:  x_pos = -2048.9243, y_pos = -94.2897,   z_pos = 34.8485;
				case 7:  x_pos = 318.0148,   y_pos = 1956.4760,  z_pos = 17.6406;
				case 8:  x_pos = 1539.5493,  y_pos = -1675.5831, z_pos = 13.9361;
				case 9:  x_pos = -1605.2648, y_pos = 721.4100,   z_pos = 11.6420;
				case 10: x_pos = 2234.6067,  y_pos = 2470.9839,  z_pos = 10.8203;
				case 11: x_pos = -2427.5071, y_pos = 538.3549,   z_pos = 30.0781;
				case 12: x_pos = 1451.3292,  y_pos = 751.3010,   z_pos = 11.0234;
				case 13: x_pos = 1463.1851,  y_pos = 2774.1895,  z_pos = 10.6719;
				case 14: x_pos = 948.9276,   y_pos = 1733.1798,  z_pos = 8.8516;
			}
			GetPlayerFacingAngle(playerid, A);
			SetPlayerPosEx(playerid, x_pos, y_pos, z_pos, A, world_id, int_id);
		}
	    case DLG_CMD_GPS:
	    {
	        if(!response) return 1;
			new locname[30], Float:x_pos, Float:y_pos, Float:z_pos;
			switch(listitem)
			{
				case 0: SPD(playerid, DLG_CMD_GPS_ITEM_1, DSL, ""SERVER_HEX"Основные места", "1. Мэрия Los Santos\n2. Спортзал Los Santos\n3. Церковь\n4. Автошкола\n", "Поиск", "Назад");
				case 1:	SPD(playerid, DLG_CMD_GPS_ITEM_2, DSL, ""SERVER_HEX"Работы", "1. Завод по сборке оружия\n2. Лесопилка\n3. Шахта\n4. Автопарк", "Поиск", "Назад"); // \n6. Развозчики товаров\n7. Нефтезавод
				case 2: SPD(playerid, DLG_CMD_GPS_ITEM_3, DSL, ""SERVER_HEX"Государственные организации", "1. SAPD\n2. SFPD\n3. LVPD\n4. FBI\n5. Больница LS\n6. Больница SF\n7. Больница LV\n8. Национальная гвардия\n9. LS News\n10. SF News\n11. LV News", "Поиск", "Назад");
				case 3: SPD(playerid, DLG_CMD_GPS_ITEM_4, DSL, ""SERVER_HEX"Нелегальные организации", "1. Grove Street\n2. The Ballas\n3. The Rifa\n4. Varios Los Aztecas\n5. Los Santos Vagos\n6. Наркопритон\n7. Наркоферма", "Поиск", "Назад");
				case 4:	SPD(playerid, DLG_CMD_GPS_ITEM_5, DSL, ""SERVER_HEX"Автосалоны и тюнинги", "1. Автосалон Los Santos\t{CBCCCE}Эконом"WHITE_HEX"\n2. Автосалон San Fierro\t{CBCCCE}Средний"WHITE_HEX"\n3. Автосалон Las Venturas\t{CBCCCE}Спорт\n4. Мотосалон Los Santos\n5. Пункт выдачи номеров\n6. Тюнинг Los Santos\n7. Тюнинг San Fierro\n8. Тюнинг Las Venturas", "Поиск", "Назад");
				case 5: SPD(playerid, DLG_CMD_GPS_ITEM_6, DSL, ""SERVER_HEX"Банк", "1. Банк San Andreas", "Поиск", "Назад");
				case 6: SPD(playerid, DLG_CMD_GPS_ITEM_7, DSL, ""SERVER_HEX"Бизнесы", "1. Магазин одежды\n2. Аммо-ЛС", "Выбрать", "Назад");
				case 7: SPD(playerid, DLG_CMD_GPS_ITEM_8, DSL, ""SERVER_HEX"Развлечения", "1. Casino Mirage\n2. Центр развлечений", "Выбрать", "Назад");
				case 8: 
				{
					new max_distance = 100000,
						id_atm = -1,
						vehicle_id = GetPlayerVehicleID(playerid);
					for(new i = 1; i < TOTALATM; i++)
					{
						new here_distance =
						(!IsPlayerInAnyVehicle(playerid)) ?
						floatround(GetPlayerDistanceFromPoint(playerid, ATMInfo[i][aX], ATMInfo[i][aY], ATMInfo[i][aZ])) :
						floatround(GetVehicleDistanceFromPoint(vehicle_id, ATMInfo[i][aX], ATMInfo[i][aY], ATMInfo[i][aZ]));
						if(here_distance < max_distance)
						{
							id_atm = i;
							max_distance = here_distance;
						}
					}
					if(max_distance == -1 || id_atm == -1) return 1;
					x_pos = ATMInfo[id_atm][aX], y_pos = ATMInfo[id_atm][aY], z_pos = ATMInfo[id_atm][aZ], locname = "Ближайший банкомат";
				}
			}
			if(listitem > 7) GPSPlayer_(playerid, x_pos, y_pos, z_pos, locname);
  		}
    	case DLG_CMD_GPS_ITEM_1:
		{
			if(!response) return gpsCommand(playerid);
			new locname[32], Float:x_pos, Float:y_pos, Float:z_pos;
			switch(listitem)
			{
				case 0: x_pos = 1482.0909, y_pos = -1739.5809, z_pos = 13.5469, locname = "Мэрия Los Santos";
				case 1: x_pos = 2229.868896, y_pos = -1721.224243, z_pos = 13.560896, locname = "Спортзал Los Santos";
				case 2: x_pos = -1983.3154, y_pos = 1118.0847, z_pos = 53.1254, locname = "Церковь";
				case 3: x_pos = -2026.6204, y_pos = -95.2442, z_pos = 35.1641, locname = "Автошкола";
			}
			GPSPlayer_(playerid, x_pos, y_pos, z_pos, locname);
		}
	    case DLG_CMD_GPS_ITEM_2:
		{
			if(!response) return gpsCommand(playerid);
			new locname[30], Float:x_pos, Float:y_pos, Float:z_pos;
			switch(listitem)
			{
				case 0: x_pos = -999.9683, y_pos = -692.3784, z_pos = 32.0078, locname = "Завод по сборке оружия";
				case 1: x_pos = -761.4990, y_pos = -132.2790, z_pos = 65.7368, locname = "Лесопилка";
				case 2: x_pos = 598.2986, y_pos = 866.5953, z_pos = -42.9609, locname = "Шахта";
				case 3: x_pos = 1638.2668, y_pos = -1146.5863, z_pos = 23.9063, locname = "Автопарк";
			}
			if(listitem != 3) GPSPlayer_(playerid, x_pos, y_pos, z_pos, locname);
		}
		case DLG_CMD_GPS_ITEM_3:
		{
			if(!response) return gpsCommand(playerid);
			new locname[30], Float:x_pos, Float:y_pos, Float:z_pos;
			switch(listitem)
			{
				case 0: x_pos = 1533.9197, y_pos = -1672.7867, z_pos = 13.3828, locname = "SAPD";
				case 1: x_pos = -1569.9221, y_pos = 662.4422, z_pos = 6.9567, locname = "SFPD";
				case 2: x_pos = 2234.4595, y_pos = 2455.1514, z_pos = 10.7913, locname = "LVPD";
				case 3: x_pos = -2436.3701, y_pos = 502.9437, z_pos = 29.9389, locname = "FBI";
				case 4: x_pos = 1188.1952, y_pos = -1320.7008, z_pos = 13.5661, locname = "Больница LS";
				case 5: x_pos = -2655.0745, y_pos = 640.1229, z_pos = 14.4545, locname = "Больница SF";
				case 6: x_pos = 1607.3969, y_pos = 1815.5123, z_pos = 10.8203, locname = "Больница LV";
				case 7: x_pos = 132.7126, y_pos = 1950.5787, z_pos = 18.9647, locname = "Национальная гвардия";
				case 8: x_pos = 1654.0349, y_pos = -1662.5739, z_pos = 22.5156, locname = "LS News";
				case 9: x_pos = -2046.6387, y_pos = 464.3955, z_pos = 35.1719, locname = "SF News";
				case 10: x_pos = 2626.2986, y_pos = 1173.9930, z_pos = 10.8203, locname = "LV News";
			}
			GPSPlayer_(playerid, x_pos, y_pos, z_pos, locname);
		}
		case DLG_CMD_GPS_ITEM_4:
		{
			if(!response) return gpsCommand(playerid);
			new locname[30], Float:x_pos, Float:y_pos, Float:z_pos;
			switch(listitem)
			{
				case 0: x_pos = 2481.6038, y_pos = -1659.8636, z_pos = 13.3438, locname = "Grove Street";
				case 1: x_pos = 2023.2653, y_pos = -1129.3506, z_pos = 24.8447, locname = "The Ballas";
				case 2: x_pos = 2777.2502, y_pos = -1924.1344, z_pos = 13.5394, locname = "The Rifa";
				case 3: x_pos = 2184.1240, y_pos = -1772.9272, z_pos = 13.3684, locname = "Varios Los Aztecas";
				case 4: x_pos = 2744.6750, y_pos = -1176.3390, z_pos = 69.4027, locname = "Los Santos Vagos";
				case 5: x_pos = 2155.9915, y_pos = -1616.2893, z_pos = 14.0245, locname = "Наркопритон";
				case 6: x_pos = -1048.8801, y_pos = -1202.0735, z_pos = 128.9644, locname = "Наркоферма";
			} 
			GPSPlayer_(playerid, x_pos, y_pos, z_pos, locname);
		}
    	case DLG_CMD_GPS_ITEM_5:
		{
			if(!response) return gpsCommand(playerid);
			new locname[30], Float:x_pos, Float:y_pos, Float:z_pos;
			switch(listitem)
			{
				case 0: x_pos = 1100.3071, y_pos = -1741.5416, z_pos = 13.4927, locname = "Автосалон Los Santos";
				case 1: x_pos = -1973.6605, y_pos = 288.4330, z_pos = 35.1719, locname = "Автосалон San Fierro";
				case 2: x_pos = 2467.4592, y_pos = 1323.8057, z_pos = 10.7980, locname = "Автосалон Las Venturas";
				case 3: x_pos = 2128.2168, y_pos = -1132.3344, z_pos = 25.5627, locname = "Мотосалон Los Santos";
				case 4: x_pos = 2446.4431, y_pos = 2376.1890, z_pos = 12.1635, locname = "Пункт выдачи номеров";
				case 5: x_pos = 972.8504, y_pos = -1257.3068, z_pos = 16.9538, locname = "Тюнинг Los Santos";
				case 6: x_pos = -1935.9734, y_pos = 235.3671, z_pos = 34.3125, locname = "Тюнинг San Fierro";
				case 7: x_pos = 2386.954101, y_pos = 1037.186279, z_pos = 10.820312, locname = "Тюнинг Las Venturas";
			}
			GPSPlayer_(playerid, x_pos, y_pos, z_pos, locname);
		}
		case DLG_CMD_GPS_ITEM_6:
		{
			if(!response) return gpsCommand(playerid);
			new locname[30], Float:x_pos, Float:y_pos, Float:z_pos;
			switch(listitem)
			{
				case 0: x_pos = 1579.2549, y_pos = -1329.1456, z_pos = 16.4844, locname = "Банк San Andreas";
			}
			GPSPlayer_(playerid, x_pos, y_pos, z_pos, locname);
		}

		case DLG_CMD_GPS_ITEM_7:
		{
			if(!response) return gpsCommand(playerid);
			new locname[30], Float:x_pos, Float:y_pos, Float:z_pos;
			switch(listitem)
			{
				case 0: x_pos = 461.710388, y_pos = -1500.84558, z_pos = 31.044805, locname = "Victim LS";
				case 1: x_pos = 1368.999877, y_pos = -1279.69494, z_pos = 13.546875, locname = "Ammo-Nation LS";
			}
			GPSPlayer_(playerid, x_pos, y_pos, z_pos, locname);
		}
		case DLG_CMD_GPS_ITEM_8:
		{
			if(!response) return gpsCommand(playerid);
			new locname[30], Float:x_pos, Float:y_pos, Float:z_pos;
			switch(listitem)
			{
				case 0: x_pos = 2165.986083, y_pos = 2164.813476, z_pos = 10.820312, locname = "Casino Mirage";
				case 1: x_pos = 1499.6709, y_pos = -1589.5272, z_pos = 13.3828, locname = "Центр развлечений";
			}
			GPSPlayer_(playerid, x_pos, y_pos, z_pos, locname);
		}
		case DLG_IDCARD_GENDER:
		{
			if(!response) return 1;
			//SPD(playerid, DLG_IDCARD, DSL, ""SERVER_HEX"Оформление ID карты | Пол", ""WHITE_HEX"Выберите пол:\n- Мужчина\n- Женщина", "Далее", "Отмена");
		}
		case DLG_IDCARD:
		{
			if(!response) return 1;
			// switch(listitem+1)
			// {
			// 	case 1: return SPD(playerid, DLG_IDCARD, DSL, ""SERVER_HEX"Оформление ID карты | Пол", ""WHITE_HEX"Выберите пол:\n- Мужчина\n- Женщина", "Далее", "Отмена");
			// 	default: return SPD(playerid, DLG_IDCARD_DATE, DSI, ""SERVER_HEX"Оформление ID-карты | Дата рождения", ""WHITE_HEX"Укажите Вашу дату рождения:\n\
			// 	Пример: 28/12/1990", "Далее","Отмена");
			// }
		}
		case DLG_IDCARD_DATE:
		{
		    // if(!response) return 1;
			// new curr_year, curr_month, curr_day, input_day, input_month, input_year;
			// getdate(curr_year, curr_month, curr_day);
			// if(sscanf(inputtext, "p</>iii", input_day, input_month, input_year)) SPD(playerid, DLG_IDCARD_DATE, DSI, ""SERVER_HEX"Оформление ID-карты | Дата рождения", ""WHITE_HEX"Укажите дату рождения персонажа:\n\
			// Пример: 28/12/1990", "Далее","Отмена");
			// new var_check = curr_year - input_year;
			// if(var_check > 50 || var_check < 1 || input_day > GetMonthDays(input_year, input_month) || input_day < 1 || input_month > 12 || input_month < 1) return SPD(playerid, DLG_IDCARD_DATE, DSI, ""SERVER_HEX"Оформление ID-карты | Дата рождения", ""WHITE_HEX"Укажи дату рождения персонажа:\n\
			// Пример: 28/12/1990", "Далее","Отмена");
			// if(var_check < 18) return SPD(playerid, DLG_IDCARD_DATE, DSI, ""SERVER_HEX"Оформление ID-карты | Дата рождения", ""WHITE_HEX"Укажи дату рождения персонажа:\n\
			// Пример: 28/12/1990\n\
			// "YELLOW_HEX"Персонаж должен быть старше 18 лет.", "Далее","Отмена");
			// if(input_month > curr_month || (input_month == curr_month && input_day > curr_day)) var_check--;
		}
		case DLG_CMD_SETLEADER:
		{
			if(!response) return DeletePVar(playerid, "setleaderpid");
			new setleaderpid = GetPVarInt(playerid, "setleaderpid");
			SetPVarInt(playerid, "pidfraction", listitem+1);
			new pidfraction = GetPVarInt(playerid, "pidfraction");
			if(!IsPlayerConnected(setleaderpid) || !pLoggedIn{setleaderpid} || !PI[setleaderpid][pID]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок вышел с игры");
			new str_1[256];
			for(new i=0; i < MAX_FRACSKINS; i++)
			{
				new skin_id = frac_skin[pidfraction][i];
				if(!skin_id) break;
				if(!i) format(str_1, sizeof(str_1), "Скин %d [%d]", i+1, skin_id);
				else format(str_1, sizeof(str_1), "%s\nСкин %d [%d]", str_1, i+1, skin_id);
			}
			SPD(playerid, DLG_LEADERSKIN, DSL, ""SERVER_HEX"Выбор скина", str_1, "Выбрать", "Отмена");
		}
		case DLG_CMD_TEMPLEADER:
		{
			if(!response) return DeletePVar(playerid, "templeaderpid");
			new templeaderpid = GetPVarInt(playerid, "templeaderpid");
			SetPVarInt(playerid, "pidtempfraction", listitem+1);
			new pidtempfraction = GetPVarInt(playerid, "pidtempfraction");
			if(!IsPlayerConnected(templeaderpid) || !pLoggedIn{templeaderpid} || !PI[templeaderpid][pID]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок вышел с игры");
			new str_1[256];
			for(new i=0; i < MAX_FRACSKINS; i++)
			{
				new skin_id = frac_skin[pidtempfraction][i];
				if(!skin_id) break;
				if(!i) format(str_1, sizeof(str_1), "Скин %d [%d]", i+1, skin_id);
				else format(str_1, sizeof(str_1), "%s\nСкин %d [%d]", str_1, i+1, skin_id);
			}
			SPD(playerid, DLG_TEMPLEADERSKIN, DSL, ""SERVER_HEX"Выбор скина", str_1, "Выбрать", "Отмена");
		}
		case DLG_ONDUTY:
		{
			if(!response) return 1;
			if(PI[playerid][pDuty])
			{
				PI[playerid][pDuty] = 0;
				SetPlayerTeamColor(playerid, PI[playerid][pMember]);
				SetPlayerSkinEx(playerid, PI[playerid][pSkin]);
				ResetWeapons(playerid);
				return SCMESS(playerid, WHITE_FORMAT, "Рабочий день окончен!");
			}
			PI[playerid][pDuty] = 1;
			SetPlayerTeamColor(playerid, PI[playerid][pMember]);
			SetPlayerSkinEx(playerid, PI[playerid][pModel]);
			SCMESS(playerid, WHITE_FORMAT, "Рабочий день успешно начат!");
		}
		case DLG_CMD_INVITE:
		{
			new invitepid = GetPVarInt(playerid, "invitepid"),
				pidfraction = GetPVarInt(playerid, "pidfractioninvite");
			if(!response)
			{
				DeletePVar(playerid, "invitepid");
				DeletePVar(playerid, "pidfractioninvite");
				SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Ты отказался от вступления в организацию.");
				return SCMESS(invitepid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Игрок отказался от вступления в организацию.");
			}
			if(!ProxDetectorCMD(10.0, invitepid, playerid))
			{
				DeletePVar(playerid, "invitepid");
				DeletePVar(playerid, "pidfractioninvite");
				SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Далеко друг от друга");
				return SCMESS(invitepid, GREY_FORMAT, ""NEGATIVE_MARK" Далеко друг от друга");
			}
			new str_1[256];
			for(new i=0; i < MAX_FRACSKINS; i++)
			{
				new skin_id = frac_skin[pidfraction][i];
				if(!skin_id) break;
				if(!i) format(str_1, sizeof(str_1), "Скин %d [%d]", i+1, skin_id);
				else format(str_1, sizeof(str_1), "%s\nСкин %d [%d]", str_1, i+1, skin_id);
			}
			SetPVarInt(invitepid, "invitespid", playerid);
			SetPVarInt(playerid, "invitespidID", PI[invitepid][pID]);
			SCMESS(playerid, SERVER_FORMAT,""POSITIVE_MARK" "WHITE_HEX"Подожди, пока лидер выберет тебе одежду.");
			SPD(invitepid, DLG_INVITESKIN, DSL, ""SERVER_HEX"Выбор скина", str_1, "Принять", "");
		}
		case DLG_MATERIALS_MAYOR:
		{
			if(!response) return 1;
			if(materials[mMayor] <= 0) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" На складе нет материалов.");
			switch(listitem+1)
			{
				case 1:
				{
					if(PI[playerid][pRank] > 2) { SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нет доступа."); return 0; }
					format(g_str, 90, "[Склад] %s %s[%d] взял первый комплект снаряжения.", frac_rankname[PI[playerid][pMember]][PI[playerid][pRank]], PI[playerid][pName], playerid);
					STM(PI[playerid][pMember], g_str, 1);
					SetPlayerArmour(playerid, 100.0);
					GiveWeapon(playerid,3,1);
					materials[mMayor]-=50;
					SaveMaterials("Mayor", materials[mMayor]);
				}
				case 2:
				{
					if(PI[playerid][pRank] != 2) { SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нет доступа."); return 0; }
					format(g_str, 90, "[Склад] %s %s[%d] взял второй комплект снаряжения.", frac_rankname[PI[playerid][pMember]][PI[playerid][pRank]], PI[playerid][pName], playerid);
					STM(PI[playerid][pMember], g_str, 1);
					SetPlayerArmour(playerid, 100.0);
					GiveWeapon(playerid,3,1);
					GiveWeapon(playerid,24,60);
					materials[mMayor]-=100;
					SaveMaterials("Mayor", materials[mMayor]);
				}
			}
		}
		case DLG_MATERIALS_LSPD:
		{
			if(!response) return 1;
			if(materials[mLSPD] <= 0) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" На складе нет материалов.");
			switch(listitem+1)
			{
				case 1:
				{
					if(!PI[playerid][pRank]) { SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нет доступа."); return 0; }
					format(g_str, 90, "[Склад] %s %s[%d] взял первый комплект снаряжения.", frac_rankname[PI[playerid][pMember]][PI[playerid][pRank]], PI[playerid][pName], playerid);
					STM(PI[playerid][pMember], g_str, 1);
					SetPlayerArmour(playerid, 100.0);
					GiveWeapon(playerid,3,1);
					materials[mLSPD]-=70;
					SaveMaterials("SAPD", materials[mLSPD]);
				}
				case 2:
				{
					if(PI[playerid][pRank] < 2) { SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нет доступа."); return 0; }
					format(g_str, 90, "[Склад] %s %s[%d] взял второй комплект снаряжения.", frac_rankname[PI[playerid][pMember]][PI[playerid][pRank]], PI[playerid][pName], playerid);
					STM(PI[playerid][pMember], g_str, 1);
					SetPlayerArmour(playerid, 100.0);
					GiveWeapon(playerid,3,1);
					GiveWeapon(playerid,31,60);
					GiveWeapon(playerid,23,60);
					GiveWeapon(playerid,24,60);
					materials[mLSPD]-=350;
					SaveMaterials("SAPD", materials[mLSPD]);
				}
			}
		}
		case DLG_MATERIALS_FBI:
		{
			if(!response) return 1;
			if(materials[mFBI] <= 0) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" На складе нет материалов.");
			switch(listitem+1)
			{
				case 1:
				{
					if(!PI[playerid][pRank]) { SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нет доступа."); return 0; }
					format(g_str, 90, "[Склад] %s %s[%d] взял первый комплект снаряжения.", frac_rankname[PI[playerid][pMember]][PI[playerid][pRank]], PI[playerid][pName], playerid);
					STM(PI[playerid][pMember], g_str, 1);
					SetPlayerArmour(playerid, 100.0);
					GiveWeapon(playerid,3,1);
					materials[mFBI]-=70;
					SaveMaterials("FBI", materials[mFBI]);
				}
				case 2:
				{
					if(!PI[playerid][pRank]) { SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нет доступа."); return 0; }
					format(g_str, 90, "[Склад] %s %s[%d] взял второй комплект снаряжения.", frac_rankname[PI[playerid][pMember]][PI[playerid][pRank]], PI[playerid][pName], playerid);
					STM(PI[playerid][pMember], g_str, 1);
					SetPlayerArmour(playerid, 100.0);
					GiveWeapon(playerid,3,1);
					GiveWeapon(playerid,31,60);
					GiveWeapon(playerid,23,60);
					GiveWeapon(playerid,24,60);
					materials[mFBI]-=350;
					SaveMaterials("FBI", materials[mFBI]);
				}
			}
		}
		case DLG_MATERIALS_NEWS:
		{
			if(!response) return 1;
			if(materials[mNews] <= 0) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" На складе нет материалов.");
			switch(listitem+1)
			{
				case 1:
				{
					if(PI[playerid][pRank] < 4) { SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нет доступа."); return 0; }
					format(g_str, 90, "[Склад] %s %s[%d] взял камеру со склада.", frac_rankname[PI[playerid][pMember]][PI[playerid][pRank]], PI[playerid][pName], playerid);
					STM(PI[playerid][pMember], g_str, 1);
					GiveWeapon(playerid,43,15);
					materials[mNews]-=15;
					SaveMaterials("News", materials[mNews]);
				}
			}
		}
		case DLG_LEADERSKIN:
		{
			if(!response)
			{
				DeletePVar(playerid, "setleaderpid");
				DeletePVar(playerid, "pidfraction");
				return 1;
			}
			new setleaderpid = GetPVarInt(playerid, "setleaderpid"),
				pidfraction = GetPVarInt(playerid, "pidfraction"),
				skin_id = frac_skin[pidfraction][listitem];
			if(!IsPlayerConnected(setleaderpid) || !pLoggedIn{setleaderpid} || !PI[setleaderpid][pID]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок вышел с игры"); 
			SetLeaderGiveRank(setleaderpid, pidfraction);
			PI[setleaderpid][pLeader] = pidfraction;
			PI[setleaderpid][pMember] = pidfraction;
			PI[setleaderpid][pModel] = skin_id;
			PI[setleaderpid][pDuty] = 1;
			SetPlayerSkinEx(setleaderpid, PI[setleaderpid][pModel]);
			SetPlayerTeamColor(setleaderpid, pidfraction);
			if(IsAGov(playerid)) ResetWeapons(setleaderpid);
			SAMF(GREY_FORMAT, "[A] %s[%d] назначил %s[%d] лидером организации %s", PI[playerid][pName], playerid, PI[setleaderpid][pName], setleaderpid, frac_name[pidfraction]);
			SCMESSF(setleaderpid, ADMIN_FORMAT, "%s[%d] назначил тебя лидером организации %s", PI[playerid][pName], playerid, frac_name[pidfraction]);
			SCMESS(setleaderpid, WHITE_FORMAT, "Рабочий день успешно начат!");
			DeletePVar(playerid, "setleaderpid");
			DeletePVar(playerid, "pidfraction");
		}
		case DLG_TEMPLEADERSKIN:
		{
			if(!response)
			{
				DeletePVar(playerid, "templeaderpid");
				DeletePVar(playerid, "pidtempfraction");
				return 1;
			}
			new templeaderpid = GetPVarInt(playerid, "templeaderpid"),
				pidtempfraction = GetPVarInt(playerid, "pidtempfraction"),
				skin_id = frac_skin[pidtempfraction][listitem];
			if(!IsPlayerConnected(templeaderpid) || !pLoggedIn{templeaderpid} || !PI[templeaderpid][pID]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок вышел с игры");
			SetLeaderGiveRank(templeaderpid, pidtempfraction);
			PI[templeaderpid][pLeader] = pidtempfraction;
			PI[templeaderpid][pMember] = pidtempfraction;
			PI[templeaderpid][pModel] = skin_id;
			PI[templeaderpid][pDuty] = 1;
			SetPlayerSkinEx(templeaderpid, PI[templeaderpid][pModel]);
			SetPlayerTeamColor(templeaderpid, pidtempfraction);
			if(IsAGov(playerid)) ResetWeapons(templeaderpid);
			SCMESS(templeaderpid, WHITE_FORMAT, "Рабочий день успешно начат!");
			SAMF(GREY_FORMAT, "[A] %s[%d] назначил %s[%d] временным лидером организации %s", PI[playerid][pName], playerid, PI[templeaderpid][pName], templeaderpid, frac_name[pidtempfraction]);
			DeletePVar(playerid, "templeaderpid");
			DeletePVar(playerid, "pidtempfraction");
		}
		case DLG_CMD_CHANGESKIN:
		{
			if(!response)
			{
				DeletePVar(playerid, "changeskinpid");
				return 1;
			}
			new changeskinpid = GetPVarInt(playerid, "changeskinpid"), 
				fractionid = PI[changeskinpid][pMember],
				skin_id = frac_skin[fractionid][listitem];
			if(skin_id == PI[changeskinpid][pModel]) return 1;
			SCMESSF(changeskinpid, ACTION_FORMAT, "%s %s выдал тебе новую форму организации.", frac_rankname[PI[playerid][pMember]][PI[playerid][pRank]], PI[playerid][pName]);
			SCMESSF(playerid, ACTION_FORMAT, "Ты выдал %s новую форму организации.", PI[changeskinpid][pName]);
			PI[changeskinpid][pModel] = skin_id;
			SetPlayerSkinEx(changeskinpid, skin_id);
			DeletePVar(playerid, "changeskinpid");
		}
		case DLG_INVITESKIN:
		{
			if(!response)
			{
				DeletePVar(playerid, "invitepid");
				DeletePVar(playerid, "pidfractioninvite");
				DeletePVar(playerid, "invitespidID");
				return 1;
			}
			new invitespid = GetPVarInt(playerid, "invitespid");
			if(GetPVarInt(invitespid, "invitespidID") == PI[playerid][pID])
			{
				if(!response) return 1;
				new pidfraction = PI[playerid][pMember];
				SCMESSF(invitespid, WHITE_FORMAT, "Теперь Вы состоите в организации \"%s\"", frac_name[pidfraction]);
				SCMESSF(invitespid, WHITE_FORMAT, "%s принял предложение присоединиться к \"%s\"", PI[invitespid][pName], frac_name[pidfraction]);
				PI[invitespid][pMember] = pidfraction;
				PI[invitespid][pRank] = 1;
				PI[invitespid][pModel] = frac_skin[pidfraction][listitem];
				PI[invitespid][pDuty] = 1;
				SCMESS(invitespid, WHITE_FORMAT, "Рабочий день успешно начат!");
				SetPlayerSkinEx(invitespid, frac_skin[pidfraction][listitem]);
				SetPlayerTeamColor(invitespid, PI[invitespid][pMember]);
				if(IsAGov(playerid)) ResetWeapons(invitespid);
				DeletePVar(invitespid, "invitespidID");
			}
			else SCMESS(playerid,GREY_FORMAT,""NEGATIVE_MARK" Игрок покинул игру");
			DeletePVar(playerid, "invitepid");
			DeletePVar(playerid, "pidfractioninvite");
			DeletePVar(playerid, "invitespid");
		}
		case DLG_RACE_REG:
		{
		    if(!response) return 1;   
		    new var_count = 0;
			foreach(new i : Player) 
			{
				if(!pLoggedIn{i} || !IsPlayerConnected(i)) continue;
				if(racePlayerReg{i}) var_count++;
			}
			if(var_count == MAX_RACE_PLAYERS) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нет свободных мест для регистрации.");
			racePlayerReg{playerid} = 1;
			if(PI[playerid][pMoney] < 25000) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Недостаточно денег для регистрации.");
			SetMoney(playerid,-25000);
			SCMESS(playerid, WHITE_FORMAT, "Успешная регистрация на гонку.");
	    }
	    case DLG_RACE_CANCEL:
		{
		    if(!response) return 1;
			racePlayerReg{playerid} = 0;
			SCMESS(playerid, WHITE_FORMAT, "Запись на гонку отменена.");
	    }
		case DLG_GETINHOUSE:
		{
			if(!response || GetPVarInt(playerid, "inhouse") == 1) return 1;
			new house = GetPVarInt(playerid, "house_id");
			if(HI[house][hLock]) return GameTextForPlayer(playerid, "~r~CLOSED", 2000, 1);
			SetPlayerPosEx(playerid, HI[house][hEnterIntX], HI[house][hEnterIntY], HI[house][hEnterIntZ], 0.0, house, HI[house][hInt], 0, 0);
			SetPVarInt(playerid, "inhouse", 1);
		}
		case DLG_BUYCLOTHES:
		{
			if(!response) return BuySkin(playerid);
			new str2[90], str3[100];
			for(new i=0; i < 3; i++)
			{
				format(str2, sizeof(str2), "Слот %i: одежда \"%i\"\n", i+1, HI[PI[playerid][pHouse]][hCupboard][i]);
				strcat(str3, str2);
			}
			SPD(playerid, DLG_CHOOSESLOTCLOTHES, DSL, ""SERVER_HEX"Выбрать слот", str3, "Выбрать", "Отмена");
		}
		case DLG_CHOOSESLOTCLOTHES:
		{
			if(!response) return BuySkin(playerid);
			switch(PI[playerid][pGender])
			{
				case 0:
				{
					SetMoney(playerid, -skinWomen[TI[playerid][changeSkinCount]][1] * BI[GetPVarInt(playerid, "clothesbusinessid")][bProdsPrice]);
					BI[GetPVarInt(playerid, "clothesbusinessid")][bMoney] += skinWomen[TI[playerid][changeSkinCount]][1] * BI[GetPVarInt(playerid, "clothesbusinessid")][bProdsPrice];
					BI[GetPVarInt(playerid, "clothesbusinessid")][bIncomeDay] += skinWomen[TI[playerid][changeSkinCount]][1] * BI[GetPVarInt(playerid, "clothesbusinessid")][bProdsPrice];
				}
				case 1:
				{
					SetMoney(playerid, -skinMen[TI[playerid][changeSkinCount]][1] * BI[GetPVarInt(playerid, "clothesbusinessid")][bProdsPrice]);
					BI[GetPVarInt(playerid, "clothesbusinessid")][bMoney] += skinMen[TI[playerid][changeSkinCount]][1] * BI[GetPVarInt(playerid, "clothesbusinessid")][bProdsPrice];
					BI[GetPVarInt(playerid, "clothesbusinessid")][bIncomeDay] += skinMen[TI[playerid][changeSkinCount]][1] * BI[GetPVarInt(playerid, "clothesbusinessid")][bProdsPrice];
				}
			}
			new Float:x_pos,Float:y_pos,Float:z_pos;
			TogglePlayerControllable(playerid, true);
			SetCameraBehindPlayer(playerid);
			GetPlayerPos(playerid, x_pos, y_pos, z_pos);
			SetPlayerPos(playerid,x_pos,y_pos,z_pos);
			BI[GetPVarInt(playerid, "clothesbusinessid")][bProds] -= 50;
			PI[playerid][pSkin] = GetPlayerSkin(playerid);
			SetPlayerSkin(playerid,PI[playerid][pSkin]);
			SaveBusinessInts(GetPVarInt(playerid, "clothesbusinessid"), "bMoney", BI[GetPVarInt(playerid, "clothesbusinessid")][bMoney], "bProds", BI[GetPVarInt(playerid, "clothesbusinessid")][bProds]);
			HI[PI[playerid][pHouse]][hCupboard][listitem] = PI[playerid][pSkin];
			SendPositiveMess(playerid, "Одежда \"%d\" сохранена в шкафу под слотом \"%d\"",PI[playerid][pSkin], listitem);
			SaveHouseCupboard(PI[playerid][pHouse]);
			DeletePVar(playerid, "clothesbusinessid");
			for(new i=0; i < sizeof(changeskin_TD); i++)
			{
				TextDrawHideForPlayer(playerid, changeskin_TD[i]);
				CancelSelectTextDraw(playerid);
			}
			PlayerTextDrawHide(playerid, changeskin_PTD[playerid][0]);
			SCMESS(playerid,YELLOW_FORMAT,"- Продавщица: "WHITE_HEX" Спасибо за покупку. Вы сделали хороший выбор! Приходите еще!");
			SetActorChatBubble(clothesShopActor_intid_15[0], "Спасибо за покупку. Вы сделали хороший выбор! Приходите еще!", GREY_FORMAT, 20.0, 10000);
			ApplyDynamicActorAnimation(clothesShopActor_intid_15[1], "PED", "IDLE_CHAT", 8.1, false, false, false, false, 0);
		}
		case DLG_BUYHOUSE:
		{
			if(!response) return 1;
			new buy_house_id = GetPVarInt(playerid, "house_id");
			if(PI[playerid][pHouse] != -1)
			{
				DeletePVar(playerid, "house_id");
				return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя уже имеется дом.");
			}
			if(!PI[playerid][pIdCard])
			{
				DeletePVar(playerid, "house_id");
				return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Отсутствует банковский счет.");
			}
			if(PI[playerid][pBank] < HI[buy_house_id][hCost])
			{
				DeletePVar(playerid, "house_id");
				return SCMESSF(playerid, YELLOW_FORMAT, "Входящее SMS от \"Банк San Andreas\": "WHITE_HEX"Транзакция была отменена. Причина: недостаточно средств на счету. Всего на счету: %d$", PI[playerid][pBank]);
			}
			PI[playerid][pBank] -= HI[buy_house_id][hCost];
			PI[playerid][pHouse] = HI[buy_house_id][hID];
			HI[buy_house_id][hDays] += 1;
			HI[buy_house_id][hLock]  = 0;
			GetPlayerName(playerid, HI[buy_house_id][hOwner], MAX_PLAYER_NAME+1);
			SaveHouse(buy_house_id);
			UpdateHouse(buy_house_id);
			query[0]=EOS;
			mysql_format(connects, query, 90, "UPDATE "TABLE_ACCOUNTS" SET `house` = '%d', `bank` = '%d' WHERE `id` = '%d' LIMIT 1", PI[playerid][pHouse], PI[playerid][pBank], PI[playerid][pID]);
			mysql_tquery(connects, query);
			SendPositiveMess(playerid, "Поздравляем с приобретением дома (ID: %d) за "GREEN_HEX"%d$"WHITE_HEX"!",HI[buy_house_id][hID], HI[buy_house_id][hCost]);
			SendPositiveMess(playerid, "Твой дом оплачен на %d/3 дней.", HI[buy_house_id][hDays]);
			SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Не забудь проплатить свой дом в банке, иначе он будет возвращён государству.");
			SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Информация о доме /houseinfo");
			SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Чтобы открыть меню дома введи команду /hmenu");
			SCMESSF(playerid, YELLOW_FORMAT, "Входящее SMS от \"Банк San Andreas\": "WHITE_HEX"Транзакция прошла успешно. Сумма перевода: %d$. Теперь банковский счёт составляет: %d$", HI[buy_house_id][hCost], PI[playerid][pBank]);
			GameTextForPlayer(playerid, "~g~WELCOME HOME", 2000, 1);
			SetPlayerPosEx(playerid, HI[buy_house_id][hEnterIntX], HI[buy_house_id][hEnterIntY], HI[buy_house_id][hEnterIntZ], 0.0, buy_house_id, HI[buy_house_id][hInt], 0, 0);
			if(!GetPVarInt(playerid, "inhouse")) SetPVarInt(playerid, "inhouse", 1);
			query[0]=EOS;
			mysql_format(connects, query, 90, "UPDATE "TABLE_ACCOUNTS" SET `house` = '%d' WHERE `id` = '%d' LIMIT 1", PI[playerid][pHouse], PI[playerid][pID]);
			mysql_tquery(connects, query);
			DeletePVar(playerid, "house_id");
		}
		case DLG_SELLHOUSE:
		{
			if(!response) return 1;
			new pidhouse = PI[playerid][pHouse];
			ClearHouse(pidhouse);
			UpdateHouse(pidhouse);
			PI[playerid][pBank] += HI[pidhouse][hCost]/2;
			PI[playerid][pHouse] = -1;
			if(PI[playerid][pPhoneNum]) SCMESSF(playerid, YELLOW_FORMAT, "Входящее SMS от \"Банк San Andreas\": "WHITE_HEX"На Ваш счёт поступило зачисление. Сумма: %d$. Теперь банковский счёт составляет: %d$", HI[pidhouse][hCost]/2, PI[playerid][pBank]);
			query[0]=EOS;
			mysql_format(connects, query, 90, "UPDATE "TABLE_ACCOUNTS" SET `house` = '%d' WHERE `id` = '%d' LIMIT 1", PI[playerid][pHouse], PI[playerid][pID]);
			mysql_tquery(connects, query);
		}
		case DLG_SELLBUSINESS:
		{
			if(!response) return 1;
			new business = PI[playerid][pBusiness];
			ClearBusiness(business);
			UpdateBusiness(business);
			SaveBusiness(business);
			PI[playerid][pBank] += BI[business][bCost]/2;
			PI[playerid][pBusiness] = -1;
			if(PI[playerid][pPhoneNum]) SCMESSF(playerid, YELLOW_FORMAT, "Входящее SMS от \"Банк San Andreas\": "WHITE_HEX"На Ваш счёт поступило зачисление. Сумма: %d$. Теперь банковский счёт составляет: %d$", BI[business][bCost]/2, PI[playerid][pBank]);
		}
		case DLG_HOUSEUPGRADE:
		{
			new pidhouse = PI[playerid][pHouse];
			if(!response) return hmenuCommand(playerid);
			switch(listitem+1)
			{
				case 1: 
				{
					switch(HI[pidhouse][hSafe])
					{
						case 0: //если 0 покупаем сейф
						{
							return SPD(playerid, DLG_BUYSAFE, DSM, ""SERVER_HEX"Покупка домашнего сейфа", ""WHITE_HEX"В твоём доме нет сейфа.\n После его приобретения появится возможность хранить в твоём доме оружие, материалы, наркотики, аптечки и деньги.\nБудь осторожен, ведь сейф могут ограбить.\nПосле продажи дома деньги за сейф возвращены не будут.\n\nПриобрести сейф за "GREEN_HEX"100.000$?", "Да", "Назад");
						} 
						case 1: return 1; //если игрок уже имеет сейф
					}
				}
				case 2:
				{
					switch(HI[pidhouse][hSignal])
					{
						case 0: //если 0 покупаем сигнализацю
						{
							return SPD(playerid, DLG_BUYSIGNAL, DSM, ""SERVER_HEX"Покупка сигнализации", ""WHITE_HEX"В твоём доме нет сигнализации.\n Если твой дом будут грабить, полиция будет об этом уведомлена и преступник уже не скроется.\nПосле продажи дома деньги за сигнализацию возвращены не будут.\n\nПриобрести сигнализацию за "GREEN_HEX"50.000$?", "Да", "Назад");
						} 
						case 1: return 1; //если игрок уже имеет сигнализацию
					}
				}
				case 3:
				{
					switch(HI[pidhouse][hCupboardBought])
					{
						case 0: 
						{
							return SPD(playerid, DLG_BUYCUPBOARD, DSM, ""SERVER_HEX"Покупка шкафа", ""WHITE_HEX"В твоём доме нет шкафа.\n Ты сможешь хранить в нём приобретенную одежду. Максимальное количество одежды - 3.\nПосле продажи дома деньги за шкаф возвращены не будут.\n\nПриобрести шкаф за "GREEN_HEX"50.000$?", "Да", "Назад");
						} 
						case 1: return 1; 
					}
				}
			}
		}
		case DLG_BUYCUPBOARD:
		{
			if(!response) return HouseUpgradeList(playerid);
			if(PI[playerid][pMoney] < 50000) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Недостаточно средств.");
			SetMoney(playerid, -50000);
			HI[PI[playerid][pHouse]][hCupboardBought] = 1;
			SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Шкаф успешно приобретён!");
			SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Открыть меню шкафа - /cupboard.");
			SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Твоя одежда сохранена в первом слоте.");
			HI[PI[playerid][pHouse]][hCupboard][0] = PI[playerid][pSkin];
			SaveHouseCupboard(PI[playerid][pHouse]);
			return HouseUpgradeList(playerid);
		}
		case DLG_BUYSAFE:
		{
			if(!response) return HouseUpgradeList(playerid);
			if(PI[playerid][pMoney] < 100000) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Недостаточно средств.");
			SetMoney(playerid, -100000);
			HI[PI[playerid][pHouse]][hSafe] = 1;
			SaveHouseInt(PI[playerid][pHouse], "hSafe", HI[PI[playerid][pHouse]][hSafe]);
			SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Сейф успешно приобретён!");
			SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Открыть меню сейфа - /safe.");
			return HouseUpgradeList(playerid);
		}
		case DLG_BUYSIGNAL:
		{
			if(!response) return HouseUpgradeList(playerid);
			if(PI[playerid][pMoney] < 50000) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Недостаточно средств.");
			SetMoney(playerid, -50000);
			HI[PI[playerid][pHouse]][hSignal] = 1;
			SaveHouseInt(PI[playerid][pHouse], "hSignal", HI[PI[playerid][pHouse]][hSignal]);
			SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Сигнализация успешно приобретена!");
			return HouseUpgradeList(playerid);
		}
		case DLG_CHANGEPRICEBIS:
		{
			if(!response) return 1;
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if(strval(inputtext) < 1 || strval(inputtext) > 500)
						{
							format(g_str, 150, ""WHITE_HEX"Введи новую цену на товар "DEFAULTRED_HEX"в процентах"WHITE_HEX". Цены сейчас - "CONTRASTORANGE_HEX"%d%\n"YELLOW_HEX"Значение от 1% до 500%", BI[PI[playerid][pBusiness]][bProdsPrice]);
							return SPD(playerid, DLG_CHANGEPRICEBIS, DSI, ""SERVER_HEX"Изменение цены на товар", g_str, "Ввести", "Отмена");
						}
						BI[PI[playerid][pBusiness]][bProdsPrice] = strval(inputtext);
						SaveBusinessInt(PI[playerid][pBusiness], "bProdsPrice", strval(inputtext));
						return SendPositiveMess(playerid, "Цены на товар изменены до %d", BI[PI[playerid][pBusiness]][bProdsPrice]);
					}
					default:
					{
					 	format(g_str,120, ""WHITE_HEX"Введи новую цену на товар "DEFAULTRED_HEX"в процентах"WHITE_HEX". Цены сейчас - "CONTRASTORANGE_HEX"%d%", BI[PI[playerid][pBusiness]][bProdsPrice]);
						SPD(playerid, DLG_CHANGEPRICEBIS, DSI, ""SERVER_HEX"Изменение цены на товар", g_str, "Ввести", "Отмена");
					}
				}
			}
		}
		case DLG_CMD_BMENU:
		{
			if(!response) return 1;
			new business = PI[playerid][pBusiness];
			switch(listitem+1)
			{
				case 1:
				{
					switch(BI[business][bLock])
					{
						case 0:
						{
							BI[business][bLock] = 1;
							UpdateBusiness(business);
							return SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Бизнес теперь закрыт.");
						}
						case 1:
						{
							BI[business][bLock] = 0;
							UpdateBusiness(business);
							return SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Бизнес теперь открыт.");
						} 
					}
				}
				case 2: 
				{
					SPD(playerid, DLG_CHANGENAMEBIS, DSI, ""SERVER_HEX"Название бизнеса", ""WHITE_HEX"Введи новое название бизнеса в поле ниже. Название не должно привышать более 30 символов.", "Ввести", "Отмена");
				}
				case 3: 
				{
					format(g_str,80, ""WHITE_HEX"Введи новую цену на товар в процентах. Цены сейчас - "CONTRASTORANGE_HEX"%d%", BI[PI[playerid][pBusiness]][bProdsPrice]);
					SPD(playerid, DLG_CHANGEPRICEBIS, DSI, ""SERVER_HEX"Изменение цены на товар", g_str, "Ввести", "Отмена");
				}
				case 4:
				{
					SPD(playerid, DLG_SELLBUSINESS, DSM, ""SERVER_HEX"Продать бизнес государству", ""WHITE_HEX"Продавая бизнес государству Вы получаете "DEFAULTRED_HEX"половину стоимости"WHITE_HEX" от покупки бизнеса.\nДеньги за улучшения не возвращаются.\n\n Продать бизнес государству?", "Да", "Отмена");
				}
				case 5: // игроку продать
				{
					if(BI[business][bDays] == 1) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Сначала проплати аренду помещения.");
					if(IsPlayerInRangeOfPoint(playerid, 10.0, BI[business][bPosX], BI[business][bPosY], BI[business][bPosZ]))
					{
						return SPD(playerid, DLG_SELLBUSINESSPLAYER, DSI, ""SERVER_HEX"Продать бизнес игроку | ID игрока", ""WHITE_HEX"Введи ID игрока которому хочешь продать бизнес в поле ниже:", "Ввести", "Отмена");
					}
					return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Во время продажи нужно находиться рядом со своим бизнесом.");
				}
				case 6:
				{
					return bisinfoCommand(playerid);
				}
			}
		}
		case DLG_CMD_BMENU_FUEL:
		{
			if(!response) return 1;
			new business = PI[playerid][pBusiness];
			switch(listitem+1)
			{
				case 1:
				{
					switch(BI[business][bLock])
					{
						case 0:
						{
							BI[business][bLock] = 1;
							UpdateBusiness(business);
							return SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Бизнес теперь закрыт.");
						}
						case 1:
						{
							BI[business][bLock] = 0;
							UpdateBusiness(business);
							return SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Бизнес теперь открыт.");
						} 
					}
				}
				case 2: 
				{
					SPD(playerid, DLG_CHANGENAMEBIS, DSI, ""SERVER_HEX"Название бизнеса", ""WHITE_HEX"Введи новое название бизнеса в поле ниже. Название не должно привышать более 30 символов.", "Ввести", "Отмена");
				}
				case 3: 
				{
					format(g_str,80, ""WHITE_HEX"Введи новую цену на товар в процентах. Цены сейчас - "CONTRASTORANGE_HEX"%d%", BI[PI[playerid][pBusiness]][bProdsPrice]);
					SPD(playerid, DLG_CHANGEPRICEBIS, DSI, ""SERVER_HEX"Изменение цены на товар", g_str, "Ввести", "Отмена");
				}
				case 4: 
				{
					format(g_str,80, ""WHITE_HEX"Введи новую цену на бензин. Цена сейчас - "CONTRASTORANGE_HEX"%s%", BI[PI[playerid][pBusiness]][bFuelPrice]);
					SPD(playerid, DLG_CHANGEPRICEBIS, DSI, ""SERVER_HEX"Изменение цены на бензин", g_str, "Ввести", "Отмена");
				}
				case 5:
				{
					SPD(playerid, DLG_SELLBUSINESS, DSM, ""SERVER_HEX"Продать бизнес государству", ""WHITE_HEX"Продавая бизнес государству Вы получаете "DEFAULTRED_HEX"половину стоимости"WHITE_HEX" от покупки бизнеса.\nДеньги за улучшения не возвращаются.\n\n Продать бизнес государству?", "Да", "Отмена");
				}
				case 6: // игроку продать
				{
					if(BI[business][bDays] == 1) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Сначала проплати аренду помещения.");
					if(IsPlayerInRangeOfPoint(playerid, 10.0, BI[business][bPosX], BI[business][bPosY], BI[business][bPosZ]))
					{
						return SPD(playerid, DLG_SELLBUSINESSPLAYER, DSI, ""SERVER_HEX"Продать бизнес игроку | ID игрока", ""WHITE_HEX"Введи ID игрока которому хочешь продать бизнес в поле ниже:", "Ввести", "Отмена");
					}
					return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Во время продажи нужно находиться рядом со своим бизнесом.");
				}
				case 7:
				{
					return bisinfoCommand(playerid);
				}
			}
		}
		case DLG_CHANGENAMEBIS:
		{
			if(!response) return 1;
			if(strlen(inputtext) > 30)
			{
				return SPD(playerid, DLG_CHANGENAMEBIS, DSI, ""SERVER_HEX"Название бизнеса", ""WHITE_HEX"Введи новое название бизнеса в поле ниже. "DEFAULTRED_HEX"Название не должно привышать более 30 символов.", "Ввести", "Отмена");
			}
			if(strlen(inputtext) < 2)
			{
				return SPD(playerid, DLG_CHANGENAMEBIS, DSI, ""SERVER_HEX"Название бизнеса", ""WHITE_HEX"Введи новое название бизнеса в поле ниже. "DEFAULTRED_HEX"Слишком короткое название.", "Ввести", "Отмена");
			}
			new business = PI[playerid][pBusiness], str_1[30];
			format(str_1, sizeof(str_1), "%s", inputtext);
			BI[business][bName] = str_1;
			UpdateBusiness(business);
			SaveBusinessStr(business, "bName", BI[business][bName]);
			SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Название бизнеса изменено.");
		}
		case DLG_CMD_HMENU:
		{
			if(!response) return 1;
			new pidhouse = PI[playerid][pHouse];
			switch(listitem+1)
			{
				case 1:
				{
					switch(HI[pidhouse][hLock])
					{
						case 0: 
						{
							HI[pidhouse][hLock] = 1;
							return SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Дом теперь закрыт.");
						}
						case 1:
						{
							HI[pidhouse][hLock] = 0;
							return SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Дом теперь открыт.");
						} 
					}
				}
				case 2: HouseUpgradeList(playerid);
				case 3:
				{
					SPD(playerid, DLG_SELLHOUSE, DSM, ""SERVER_HEX"Продать дом государству", ""WHITE_HEX"Продавая дом государству вы получаете "DEFAULTRED_HEX"половину стоимости"WHITE_HEX" от покупки дома.\nДеньги за улучшения не возвращаются.\n\n Продать дом государству?", "Да", "Отмена");
				}
				case 4: // игроку продать
				{
					if(HI[pidhouse][hDays] == 1) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Сначала проплати свой дом.");
					if(IsPlayerInRangeOfPoint(playerid, 30.0, HI[pidhouse][hPosX], HI[pidhouse][hPosY], HI[pidhouse][hPosZ]))
					{
						return SPD(playerid, DLG_SELLHOUSEPLAYER, DSI, ""SERVER_HEX"Продать дом игроку | ID игрока", ""WHITE_HEX"Введи ID игрока которому хочешь продать дом в поле ниже:", "Ввести", "Отмена");
					}
					return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Во время продажи нужно находиться рядом со своим домом.");
				}
			}
		}
		case DLG_SELLHOUSEPLAYER:
		{
			if(!response) return 1;
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if(!IsPlayerConnected(strval(inputtext)) || !pLoggedIn{strval(inputtext)}) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Игрок не в сети.");
						if(strval(inputtext) == playerid) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Указан собственный ID");
						if(PI[strval(inputtext)][pHouse] != -1) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"У этого игрока уже имеется дом.");
						if(ProxDetectorCMD(10.0, playerid, strval(inputtext)))
						{
							SetPVarInt(playerid, "housebuyer", strval(inputtext));
							return SPD(playerid, DLG_SELLHOUSEPLAYER_MONEY, DSI, ""SERVER_HEX"Продать дом игроку | Цена", ""WHITE_HEX"Теперь сумму которую должен заплатить игрок:", "Ввести", "Отмена");
						}
						return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Игрок далеко.");
					}
					default:
					{
					 	SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Вводить можно только цифры.");
						return SPD(playerid, DLG_SELLHOUSEPLAYER, DSI, ""SERVER_HEX"Продать дом игроку | Цена", ""WHITE_HEX"Теперь сумму которую должен заплатить игрок:", "Ввести", "Отмена");
					}
				}
			}
		}
		case DLG_SELLHOUSEPLAYER_MONEY:
		{
			if(!response) 
			{
				DeletePVar(playerid, "housebuyer");
				SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Сделка отменена.");
				return 1;
			}
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						new pidhouse = PI[playerid][pHouse],
							housebuyer = GetPVarInt(playerid, "housebuyer");
						if(!IsPlayerConnected(housebuyer) || !pLoggedIn{housebuyer})
						{
							DeletePVar(playerid, "housebuyer");
							return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Игрок не в сети.");
						}
						if(strval(inputtext) < 50000)
						{
							DeletePVar(playerid, "housebuyer");
							return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Цена должна быть не менее 50.000.");
						}
						if(ProxDetectorCMD(10.0, playerid, housebuyer))
						{
							SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Предложение о покупке дома игроку отправлено.");
							new str_1[256],
								money = strval(inputtext);
							SetPVarInt(housebuyer, "sellerid", playerid);
							SetPVarInt(housebuyer, "sellerprice", money);
							format(str_1, sizeof(str_1), ""WHITE_HEX"Игрок "SERVER_HEX"%s"WHITE_HEX" предлагает тебе приобрести его дом\n\
							\tСтоимость сделки: "GREEN_HEX"%d"WHITE_HEX"\n\
							\tУлучшения дома:\n\
							\tСейф - %s\n\
							\tСигнализация - %s", PI[playerid][pName], money, (HI[pidhouse][hSafe] == 1) ? (""GREEN_HEX"Имеется"WHITE_HEX"") : (""DARKRED_HEX"Отсутствует"WHITE_HEX""), (HI[pidhouse][hSignal] == 1) ? (""GREEN_HEX"Имеется"WHITE_HEX"") : (""DARKRED_HEX"Отсутствует"WHITE_HEX""));
							SPD(housebuyer, DLG_SELLHOUSEPLAYER_ACCEPT, DSM, ""SERVER_HEX"Покупка дома", str_1, "Купить", "Отмена");
							DeletePVar(playerid, "housebuyer");
							return 1;
						}
						DeletePVar(playerid, "housebuyer");
						return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Далеко друг от друга.");
					}
					default:
					{
					 	SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Вводить можно только цифры.");
						return SPD(playerid, DLG_SELLHOUSEPLAYER, DSI, ""SERVER_HEX"Продать дом игроку | Цена", ""WHITE_HEX"Теперь сумму которую должен заплатить игрок:", "Ввести", "Отмена");
					}
				}
			}
		}
		case DLG_SELLHOUSEPLAYER_ACCEPT:
		{
			if(!response)
			{
				SCMESS(GetPVarInt(playerid, "sellerid"), SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Игрок отказался от покупки дома");
				SCMESS(playerid, DARKRED_FORMAT, "Ты отказался от покупки дома.");
				DeletePVar(playerid, "sellerprice");
				return DeletePVar(playerid, "sellerid");
			}
			if(!IsPlayerConnected(GetPVarInt(playerid, "sellerid") || !pLoggedIn{GetPVarInt(playerid, "sellerid")}))
			{
				DeletePVar(playerid, "sellerprice");
				DeletePVar(playerid, "sellerid");
				return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Продавец отключился от сервера.");
			}
			if(!ProxDetectorCMD(10.0, playerid, GetPVarInt(playerid, "sellerid")))
			{
				SCMESS(GetPVarInt(playerid, "sellerid"), DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Далеко друг от друга.");
				SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Далеко друг от друга.");
				DeletePVar(playerid, "sellerprice");
				return DeletePVar(playerid, "sellerid");
			}
			new sellerid = GetPVarInt(playerid, "sellerid"),
				sellerprice = GetPVarInt(playerid, "sellerprice"),
				pidhouse = PI[playerid][pHouse];
			if(PI[playerid][pMoney] < sellerprice)
			{
				SCMESS(sellerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"У игрока недостаточно денег для заключения сделки.");
				SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"У тебя недостаточно денег для заключения сделки.");
				DeletePVar(playerid, "sellerprice");
				return DeletePVar(playerid, "sellerid");
			}
			GiveMoney(playerid, sellerid, sellerprice);
			PI[playerid][pHouse] = PI[sellerid][pHouse];
			PI[sellerid][pHouse] = -1;
			HI[pidhouse][hLock] = 1;
			GetPlayerName(playerid, HI[pidhouse][hOwner], MAX_PLAYER_NAME+1);
			UpdateHouse(pidhouse);
			SaveHouse(pidhouse);
			SCMESSF(sellerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Дом был успешно продан игроку %s за %d$", PI[playerid][pName], sellerprice);
			//
			SendPositiveMess(playerid, "Ты успешно приобрёл дом у игрока %s", PI[sellerid][pName]);
			SendPositiveMess(playerid, "Твой дом оплачен на %d/3 дней.", HI[pidhouse][hDays]);
			SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Не забудь проплатить свой дом в банке, иначе он будет возвращён государству.");
			SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Информация о доме /houseinfo");
			SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Чтобы открыть меню дома введи команду /hmenu");
			query[0]=EOS;
			mysql_format(connects, query, 65, "UPDATE "TABLE_ACCOUNTS" SET `house` = '%d' WHERE `id` = '%d' LIMIT 1 LIMIT 1", PI[playerid][pHouse], PI[playerid][pID]);
			mysql_tquery(connects, query);
			query[0]=EOS;
			mysql_format(connects, query, 65, "UPDATE "TABLE_ACCOUNTS" SET `house` = '%d' WHERE `id` = '%d' LIMIT 1 LIMIT 1", PI[sellerid][pHouse], PI[sellerid][pID]);
			mysql_tquery(connects, query);
			DeletePVar(playerid, "sellerprice");
			return DeletePVar(playerid, "sellerid");
		}
		case DLG_SELLBUSINESSPLAYER:
		{
			if(!response) return 1;
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if(!IsPlayerConnected(strval(inputtext)) || !pLoggedIn{strval(inputtext)}) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Игрок не в сети.");
						if(strval(inputtext) == playerid) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Указан собственный ID");
						if(PI[strval(inputtext)][pBusiness] != -1) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"У этого игрока уже имеется бизнес.");
						if(ProxDetectorCMD(10.0, playerid, strval(inputtext)))
						{
							SetPVarInt(playerid, "bizbuyer", strval(inputtext));
							return SPD(playerid, DLG_SELLBUSINESSPLAYER_MONEY, DSI, ""SERVER_HEX"Продать бизнес игроку | Цена", ""WHITE_HEX"Теперь сумму которую должен заплатить игрок:", "Ввести", "Отмена");
						}
						return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Игрок далеко.");
					}
					default:
					{
					 	SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Вводить можно только цифры.");
						return SPD(playerid, DLG_SELLBUSINESSPLAYER, DSI, ""SERVER_HEX"Продать бизнес игроку | Цена", ""WHITE_HEX"Теперь сумму которую должен заплатить игрок:", "Ввести", "Отмена");
					}
				}
			}
		}
		case DLG_SELLBUSINESSPLAYER_MONEY:
		{
			if(!response) 
			{
				DeletePVar(playerid, "bizbuyer");
				SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Сделка отменена.");
				return 1;
			}
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						new business = PI[playerid][pBusiness],
							bizbuyer = GetPVarInt(playerid, "bizbuyer");
						if(!IsPlayerConnected(bizbuyer) || !pLoggedIn{bizbuyer})
						{
							DeletePVar(playerid, "bizbuyer");
							SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Игрок не в сети.");
							return 1;
						}
						if(strval(inputtext) < 50000)
						{
							DeletePVar(playerid, "bizbuyer");
							SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Цена должна быть не менее 50.000.");
							return 1;
						}
						if(ProxDetectorCMD(10.0, playerid, bizbuyer))
						{
							SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Предложение о покупке бизнеса игроку отправлено.");
							new str_1[256],
								money = strval(inputtext);
							SetPVarInt(bizbuyer, "sellerbizid", playerid);
							SetPVarInt(bizbuyer, "sellerbizprice", money);
							format(str_1, sizeof(str_1), ""WHITE_HEX"Игрок "SERVER_HEX"%s"WHITE_HEX" предлагает тебе приобрести его бизнес\n\
							\tСтоимость сделки: "GREEN_HEX"%d"WHITE_HEX"\n\
							\tНазвание бизнеса: %s\n\
							\tНомер бизнеса: %d", PI[playerid][pName], money, BI[business][bName], BI[business][bID]);
							SPD(bizbuyer, DLG_SELLBUSINESSPLAYER_ACCEPT, DSM, ""SERVER_HEX"Покупка бизнеса", str_1, "Купить", "Отмена");
							DeletePVar(playerid, "bizbuyer");
							return 1;
						}
						DeletePVar(playerid, "bizbuyer");
						return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Далеко друг от друга.");
					}
					default:
					{
					 	SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Вводить можно только цифры.");
						SPD(playerid, DLG_SELLBUSINESSPLAYER_MONEY, DSI, ""SERVER_HEX"Продать бизнес игроку | Цена", ""WHITE_HEX"Теперь сумму которую должен заплатить игрок:", "Ввести", "Отмена");
					}
				}
			}
		}
		case DLG_SELLBUSINESSPLAYER_ACCEPT:
		{
			if(!response)
			{
				SCMESS(GetPVarInt(playerid, "sellerbizid"), SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Игрок отказался от покупки бизнеса.");
				SCMESS(playerid, DARKRED_FORMAT, "Ты отказался от покупки бизнеса.");
				DeletePVar(playerid, "sellerbizprice");
				DeletePVar(playerid, "sellerbizid");
				return 1;
			}
			if(!IsPlayerConnected(GetPVarInt(playerid, "sellerbizid") || !pLoggedIn{GetPVarInt(playerid, "sellerbizid")}))
			{
				DeletePVar(playerid, "sellerbizprice");
				DeletePVar(playerid, "sellerbizid");
				return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Продавщица отключился от сервера.");
			}
			if(!ProxDetectorCMD(10.0, playerid, GetPVarInt(playerid, "sellerbizid")))
			{
				SCMESS(GetPVarInt(playerid, "sellerbizid"), DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Далеко друг от друга.");
				SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Далеко друг от друга.");
				DeletePVar(playerid, "sellerbizprice");
				return DeletePVar(playerid, "sellerbizid");
			}
			new sellerbizid = GetPVarInt(playerid, "sellerbizid"),
				sellerbizprice = GetPVarInt(playerid, "sellerbizprice");
			if(PI[playerid][pMoney] < sellerbizprice)
			{
				SCMESS(sellerbizid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"У игрока недостаточно денег для заключения сделки.");
				SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"У тебя недостаточно денег для заключения сделки.");
				DeletePVar(playerid, "sellerbizprice");
				return DeletePVar(playerid, "sellerbizid");
			}
			GiveMoney(playerid, sellerbizid, sellerbizprice);
			PI[playerid][pBusiness] = PI[sellerbizid][pBusiness];
			new business = PI[playerid][pBusiness];
			PI[sellerbizid][pBusiness] = -1;
			BI[business][bLock] = 0;
			GetPlayerName(playerid, BI[business][bOwner], MAX_PLAYER_NAME+1);
			SaveBusinessStr(business, "bOwner", BI[business][bOwner]);
			UpdateBusiness(business);
			SCMESSF(sellerbizid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Бизнес был успешно продан игроку %s за %d$", PI[playerid][pName], sellerbizprice);
			//
			SendPositiveMess(playerid, "Ты успешно приобрёл бизнес у игрока %s", PI[sellerbizid][pName]);
			SendPositiveMess(playerid, "Аренда помещения оплачена на %d/3 дней.", BI[business][bDays]);
			SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Не забудь проплатить аренду, иначе бизнес будет возвращён государству.");
			SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Информация о бизнесе /bisinfo");
			SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Чтобы открыть меню бизнеса введи команду /bmenu");
			query[0]=EOS;
			mysql_format(connects, query, 65, "UPDATE "TABLE_ACCOUNTS" SET `business` = '%d' WHERE `id` = '%d' LIMIT 1 LIMIT 1", PI[playerid][pBusiness], PI[playerid][pID]);
			mysql_tquery(connects, query);
			query[0]=EOS;
			mysql_format(connects, query, 65, "UPDATE "TABLE_ACCOUNTS" SET `business` = '%d' WHERE `id` = '%d' LIMIT 1 LIMIT 1", PI[sellerbizid][pBusiness], PI[sellerbizid][pID]);
			mysql_tquery(connects, query);
			DeletePVar(playerid, "sellerbizprice");
			return DeletePVar(playerid, "sellerbizid");
		}
		case DLG_SAFE:
		{
			if(!response) return 1;
			switch(listitem+1)
			{
				case 1:
				{
					for(new i = 0; i < 13; i++)
					{
						if(PI[playerid][Weapon][i] > 0 && PI[playerid][Ammo][i] > 0)
						{
							if(PI[playerid][Weapon][i] == 24) HI[PI[playerid][pHouse]][hDeagle] += PI[playerid][Ammo][i];
							else if(PI[playerid][Weapon][i] == 30) HI[PI[playerid][pHouse]][hAK47] += PI[playerid][Ammo][i];
							else if(PI[playerid][Weapon][i] == 25) HI[PI[playerid][pHouse]][hShotgun] += PI[playerid][Ammo][i];
							else if(PI[playerid][Weapon][i] == 31) HI[PI[playerid][pHouse]][hM4] += PI[playerid][Ammo][i];
							else if(PI[playerid][Weapon][i] == 23) HI[PI[playerid][pHouse]][hSdpistol] += PI[playerid][Ammo][i];
							else if(PI[playerid][Weapon][i] == 33) HI[PI[playerid][pHouse]][hRifle] += PI[playerid][Ammo][i];
							else if(PI[playerid][Weapon][i] == 29) HI[PI[playerid][pHouse]][hMP5] += PI[playerid][Ammo][i];
						}
					}
					SCMESS(playerid, SERVER_FORMAT,""POSITIVE_MARK" "WHITE_HEX"Всё твоё оружие теперь в сейфе.");
					SaveHouseSafeWeapon(PI[playerid][pHouse]);
					ResetWeapons(playerid);
				}
				case 2: SPD(playerid, DLG_SAFE_MATS, DSL, ""SERVER_HEX"Материалы", "Положить\nВзять", "Выбрать", "Назад");
				case 3: SPD(playerid, DLG_SAFE_MONEY, DSL, ""SERVER_HEX"Деньги", "Положить\nВзять", "Выбрать", "Назад");
				case 4: SPD(playerid, DLG_SAFE_HEAL, DSL, ""SERVER_HEX"Аптечки", "Положить\nВзять", "Выбрать", "Назад");
				case 5: SPD(playerid, DLG_SAFE_DRUGS, DSL, ""SERVER_HEX"Наркотики", "Положить\nВзять", "Выбрать", "Назад");
				case 6:
				{
					if(!HI[PI[playerid][pHouse]][hDeagle]) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"В твоём сейфе нет этого оружия.");
					SPD(playerid, DLG_SAFE_DEAGLE, DSI, ""SERVER_HEX"Deagle", ""WHITE_HEX"Введи сколько хочешь взять патрон в поле ниже:", "Выбрать", "Назад");
				}
				case 7:
				{ 
					if(!HI[PI[playerid][pHouse]][hAK47]) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"В твоём сейфе нет этого оружия.");
				 	SPD(playerid, DLG_SAFE_AK47, DSI, ""SERVER_HEX"AK47", ""WHITE_HEX"Введи сколько хочешь взять патрон в поле ниже:", "Выбрать", "Назад");
				}
				case 8:
				{
					if(!HI[PI[playerid][pHouse]][hShotgun]) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"В твоём сейфе нет этого оружия.");
					SPD(playerid, DLG_SAFE_SHOTGUN, DSI, ""SERVER_HEX"Shotgun", ""WHITE_HEX"Введи сколько хочешь взять патрон в поле ниже:", "Выбрать", "Назад");
				}
				case 9:
				{
					if(!HI[PI[playerid][pHouse]][hM4]) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"В твоём сейфе нет этого оружия.");
					SPD(playerid, DLG_SAFE_M4, DSI, ""SERVER_HEX"M4", ""WHITE_HEX"Введи сколько хочешь взять патрон в поле ниже:", "Выбрать", "Назад");
				}
				case 10:
				{
					if(!HI[PI[playerid][pHouse]][hSdpistol]) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"В твоём сейфе нет этого оружия.");
					SPD(playerid, DLG_SAFE_SDPISTOL, DSI, ""SERVER_HEX"SD-Pistol", ""WHITE_HEX"Введи сколько хочешь взять патрон в поле ниже:", "Выбрать", "Назад");
				}
				case 11:
				{
					if(!HI[PI[playerid][pHouse]][hRifle]) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"В твоём сейфе нет этого оружия.");
					SPD(playerid, DLG_SAFE_RIFLE, DSI, ""SERVER_HEX"Rifle", ""WHITE_HEX"Введи сколько хочешь взять патрон в поле ниже:", "Выбрать", "Назад");
				}
				case 12:
				{
					if(!HI[PI[playerid][pHouse]][hMP5]) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"В твоём сейфе нет этого оружия.");
					SPD(playerid, DLG_SAFE_MP5, DSI, ""SERVER_HEX"MP5", ""WHITE_HEX"Введи сколько хочешь взять патрон в поле ниже:", "Выбрать", "Назад");
				}
			}
		}
		case DLG_SAFE_MONEY:
		{
			if(!response) return safeCommand(playerid);
			switch(listitem+1)
			{
				case 1:
				{
					if(PI[playerid][pMoney] <= 0) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"У тебя нет денег.");
					SPD(playerid, DLG_SAFE_MONEY_PUT, DSI, ""SERVER_HEX"Положить",""WHITE_HEX"Введи сколько хочешь положить денег в сейф в поле ниже:", "Выбрать", "Отмена");//положить
				} 
				case 2: //взять
				{
					if(HI[PI[playerid][pHouse]][hMoney] == 0) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"В сейфе нет денег.");
					SPD(playerid, DLG_SAFE_MONEY_GET, DSI, ""SERVER_HEX"Взять",""WHITE_HEX"Введи сколько хочешь взять денег из сейфа в поле ниже:", "Выбрать", "Отмена");
				}
			}
		}
		case DLG_SAFE_MONEY_PUT:
		{
			if(!response) return 1;
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if(PI[playerid][pMoney] < strval(inputtext)) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"У тебя нет столько денег.");
						if(strval(inputtext) <= 0) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
						if(strval(inputtext) <= 10000000)
						{
							if(HI[PI[playerid][pHouse]][hMoney] < 10000001)
							{
								if(strval(inputtext) + HI[PI[playerid][pHouse]][hMoney] > 10000000) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Максимальное количество денег в сейфе - 10.000.000$");
								HI[PI[playerid][pHouse]][hMoney] += strval(inputtext);
								SetMoney(playerid, -strval(inputtext));
								SaveHouseInt(PI[playerid][pHouse], "hMoney", HI[PI[playerid][pHouse]][hMoney]);
								SendPositiveMess(playerid, "Ты положил в сейф %d$. Денег в сейфе: %d$",strval(inputtext), HI[PI[playerid][pHouse]][hMoney]);
								return 1;
							} 
							return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Максимальное количество денег в сейфе - 10.000.000$");
						}
						return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Максимальное количество денег в сейфе - 10.000.000$");
					}
					default: 
					{
						SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Вводить можно только цифры.");
						return SPD(playerid, DLG_SAFE_MONEY_PUT, DSI, ""SERVER_HEX"Положить",""WHITE_HEX"Введи сколько хочешь положить денег в сейф в поле ниже:", "Выбрать", "Отмена");
					}
				}
			}
		}
		case DLG_SAFE_MONEY_GET:
		{
			if(!response) return 1;
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if(strval(inputtext) > HI[PI[playerid][pHouse]][hMoney]) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"В сейфе нет столько денег.");
						if(strval(inputtext) <= 0) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
						if(strval(inputtext) <= 10000000)
						{
							if(HI[PI[playerid][pHouse]][hMoney] <= 10000000 && strval(inputtext) <= HI[PI[playerid][pHouse]][hMoney])
							{
								HI[PI[playerid][pHouse]][hMoney] -= strval(inputtext);
								SetMoney(playerid, strval(inputtext));
								SaveHouseInt(PI[playerid][pHouse], "hMoney", HI[PI[playerid][pHouse]][hMoney]);
								SendPositiveMess(playerid, "Ты взял из сейфа %d$. Денег в сейфе: %d$",strval(inputtext), HI[PI[playerid][pHouse]][hMoney]);
								return 1;
							} 
							return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
						}
						return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
					}
					default: 
					{
						SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Вводить можно только цифры.");
						return SPD(playerid, DLG_SAFE_MONEY_GET, DSI, ""SERVER_HEX"Взять",""WHITE_HEX"Введи сколько хочешь взять денег из сейфа в поле ниже:", "Выбрать", "Отмена");
					}
				}
			}
		}
		case DLG_SAFE_HEAL:
		{
			if(!response) return safeCommand(playerid);
			switch(listitem+1)
			{
				case 1:
				{
					if(PI[playerid][pHeal] == 0) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"У тебя нет аптечек.");
					SPD(playerid, DLG_SAFE_HEAL_PUT, DSI, ""SERVER_HEX"Положить",""WHITE_HEX"Введи сколько хочешь положить аптечек в сейф в поле ниже:", "Выбрать", "Отмена");//положить
				} 
				case 2: //взять
				{
					if(HI[PI[playerid][pHouse]][hHeal] == 0) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"В сейфе нет аптечек.");
					SPD(playerid, DLG_SAFE_HEAL_GET, DSI, ""SERVER_HEX"Взять",""WHITE_HEX"Введи сколько хочешь взять аптечек из сейфа в поле ниже:", "Выбрать", "Отмена");
				}
			}
		}
		case DLG_SAFE_HEAL_PUT:
		{
			if(!response) return 1;
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if(PI[playerid][pHeal] < strval(inputtext)) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"У тебя нет столько аптечек.");
						if(strval(inputtext) <= 0) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
						if(strval(inputtext) <= 3)
						{
							if(HI[PI[playerid][pHouse]][hHeal] <= 6)
							{
								if(strval(inputtext) + HI[PI[playerid][pHouse]][hHeal] > 6) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Максимальное количество аптечек в сейфе - 6.");
								HI[PI[playerid][pHouse]][hHeal] += strval(inputtext);
								PI[playerid][pHeal] -= strval(inputtext);
								SaveHouseInt(PI[playerid][pHouse], "hHeal", HI[PI[playerid][pHouse]][hHeal]);
								SendPositiveMess(playerid, "Ты положил в сейф %d шт. аптечек. Аптечек в сейфе: %d шт.",strval(inputtext), HI[PI[playerid][pHouse]][hHeal]);
								return 1;
							} 
							return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Сейф переполнен.");
						}
						return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
					}
					default: 
					{
						SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Вводить можно только цифры.");
						return SPD(playerid, DLG_SAFE_HEAL_PUT, DSI, ""SERVER_HEX"Положить",""WHITE_HEX"Введи сколько хочешь положить аптечек в сейф в поле ниже:", "Выбрать", "Отмена");
					}
				}
			}
		}
		case DLG_SAFE_HEAL_GET:
		{
			if(!response) return 1;
			if(PI[playerid][pHeal] == 3) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Нельзя иметь более 3 аптечек с собой.");
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if(strval(inputtext) > HI[PI[playerid][pHouse]][hHeal]) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"В сейфе нет столько аптечек.");
						if(strval(inputtext) <= 0) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
						if(strval(inputtext) <= 3)
						{
							if(HI[PI[playerid][pHouse]][hHeal] <= 6)
							{
								if(strval(inputtext) + PI[playerid][pHeal] > 3) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Нельзя иметь более 3 аптечек с собой.");
								HI[PI[playerid][pHouse]][hHeal] -= strval(inputtext);
								PI[playerid][pHeal] += strval(inputtext);
								SaveHouseInt(PI[playerid][pHouse], "hHeal", HI[PI[playerid][pHouse]][hHeal]);
								SendPositiveMess(playerid, "Ты взял из сейфа %d шт. аптечек. Аптечек в сейфе: %d шт.",strval(inputtext), HI[PI[playerid][pHouse]][hHeal]);
								return 1;
							} 
							return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
						}
						return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
					}
					default: 
					{
						SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Вводить можно только цифры.");
						return SPD(playerid, DLG_SAFE_HEAL_GET, DSI, ""SERVER_HEX"Взять",""WHITE_HEX"Введи сколько хочешь взять аптечек из сейфа в поле ниже:", "Выбрать", "Отмена");
					}
				}
			}
		}
		case DLG_SAFE_MATS:
		{
			if(!response) return safeCommand(playerid);
			switch(listitem+1)
			{
				case 1:
				{
					if(PI[playerid][pMats] == 0) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"У тебя нет материалов.");
					SPD(playerid, DLG_SAFE_MATS_PUT, DSI, ""SERVER_HEX"Положить",""WHITE_HEX"Введи сколько хочешь положить материалов в сейф в поле ниже:", "Выбрать", "Отмена");//положить
				} 
				case 2: //взять
				{
					if(HI[PI[playerid][pHouse]][hMats] == 0) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"В сейфе нет материалов.");
					SPD(playerid, DLG_SAFE_MATS_GET, DSI, ""SERVER_HEX"Взять",""WHITE_HEX"Введи сколько хочешь взять материалов из сейфа в поле ниже:", "Выбрать", "Отмена");
				}
			}
		}
		case DLG_SAFE_MATS_PUT:
		{
			if(!response) return 1;
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if(PI[playerid][pMats] < strval(inputtext)) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"У тебя нет столько материалов.");
						if(strval(inputtext) <= 0) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
						if(strval(inputtext) <= 500)
						{
							if(HI[PI[playerid][pHouse]][hMats] <= 10000)
							{
								if(strval(inputtext) + HI[PI[playerid][pHouse]][hMats] > 10000) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Максимальное количество материалов в сейфе - 10000.");
								HI[PI[playerid][pHouse]][hMats] += strval(inputtext);
								PI[playerid][pMats] -= strval(inputtext);
								SaveHouseInt(PI[playerid][pHouse], "hMats", HI[PI[playerid][pHouse]][hMats]);
								SendPositiveMess(playerid, "Ты положил в сейф %d материалов. Материалов в сейфе: %d",strval(inputtext), HI[PI[playerid][pHouse]][hMats]);
								return 1;
							} 
							return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Сейф переполнен.");
						}
						return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
					}
					default: 
					{
						SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Вводить можно только цифры.");
						return SPD(playerid, DLG_SAFE_MATS_PUT, DSI, ""SERVER_HEX"Положить",""WHITE_HEX"Введи сколько хочешь положить материалов в сейф в поле ниже:", "Выбрать", "Отмена");//положить
					}
				}
			}
		}
		case DLG_SAFE_MATS_GET:
		{
			if(!response) return 1;
			if(PI[playerid][pMats] == 500) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Нельзя иметь более 500 материалов с собой.");
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if(strval(inputtext) > HI[PI[playerid][pHouse]][hMats]) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"В сейфе нет столько материалов.");
						if(strval(inputtext) <= 0) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
						if(strval(inputtext) <= 500)
						{
							if(HI[PI[playerid][pHouse]][hMats] <= 10000)
							{
								if(strval(inputtext) + PI[playerid][pMats] > 500) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Нельзя иметь более 500 материалов с собой.");
								HI[PI[playerid][pHouse]][hMats] -= strval(inputtext);
								PI[playerid][pMats] += strval(inputtext);
								SaveHouseInt(PI[playerid][pHouse], "hMats", HI[PI[playerid][pHouse]][hMats]);
								SendPositiveMess(playerid, "Ты взял из сейфа %d материалов. Материалов в сейфе: %d",strval(inputtext), HI[PI[playerid][pHouse]][hMats]);
								return 1;
							} 
							return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
						}
						return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
					}
					default: 
					{
						SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Вводить можно только цифры.");
						return SPD(playerid, DLG_SAFE_MATS_GET, DSI, ""SERVER_HEX"Взять",""WHITE_HEX"Введи сколько хочешь взять материалов из сейфа в поле ниже:", "Выбрать", "Отмена");
					}
				}
			}
		}
		case DLG_SAFE_DRUGS:
		{
			if(!response) return safeCommand(playerid);
			switch(listitem+1)
			{
				case 1:
				{
					if(PI[playerid][pDrugs] == 0) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"У тебя нет наркотиков.");
					SPD(playerid, DLG_SAFE_DRUGS_PUT, DSI, ""SERVER_HEX"Положить",""WHITE_HEX"Введи сколько хочешь положить наркотиков в сейф в поле ниже:", "Выбрать", "Отмена");//положить
				} 
				case 2: //взять
				{
					if(HI[PI[playerid][pHouse]][hDrugs] == 0) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"В сейфе нет наркотиков.");
					SPD(playerid, DLG_SAFE_DRUGS_GET, DSI, ""SERVER_HEX"Взять",""WHITE_HEX"Введи сколько хочешь взять наркотиков из сейфа в поле ниже:", "Выбрать", "Отмена");
				}
			}
		}
		case DLG_SAFE_DRUGS_PUT:
		{
			if(!response) return 1;
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if(PI[playerid][pDrugs] < strval(inputtext)) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"У тебя нет столько наркотиков.");
						if(strval(inputtext) <= 0) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
						if(strval(inputtext) <= 500)
						{
							if(HI[PI[playerid][pHouse]][hDrugs] <= 500)
							{
								if(strval(inputtext) + HI[PI[playerid][pHouse]][hDrugs] > 500) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Максимальное количество наркотиков в сейфе - 500.");
								HI[PI[playerid][pHouse]][hDrugs] += strval(inputtext);
								PI[playerid][pDrugs] -= strval(inputtext);
								SaveHouseInt(PI[playerid][pHouse], "hDrugs", HI[PI[playerid][pHouse]][hDrugs]);
								SendPositiveMess(playerid, "Ты положил в сейф %d наркотиков. Наркотиков в сейфе: %d",strval(inputtext), HI[PI[playerid][pHouse]][hDrugs]);
								return 1;
							} 
							return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Сейф переполнен.");
						}
						return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
					}
					default: 
					{
						SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Вводить можно только цифры.");
						return SPD(playerid, DLG_SAFE_DRUGS_PUT, DSI, ""SERVER_HEX"Положить",""WHITE_HEX"Введи сколько хочешь положить наркотиков в сейф в поле ниже:", "Выбрать", "Отмена");//положить
					}
				}
			}
		}
		case DLG_SAFE_DRUGS_GET:
		{
			if(!response) return 1;
			if(PI[playerid][pDrugs] == 100) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Нельзя иметь более 100 наркотиков с собой.");
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if(strval(inputtext) > HI[PI[playerid][pHouse]][hDrugs]) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"В сейфе нет столько наркотиков.");
						if(strval(inputtext) <= 0) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
						if(strval(inputtext) <= 100)
						{
							if(HI[PI[playerid][pHouse]][hDrugs] < 501 && strval(inputtext) <= HI[PI[playerid][pHouse]][hDrugs])
							{
								if(strval(inputtext) + PI[playerid][pDrugs] > 100) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Нельзя иметь более 100 наркотиков с собой.");
								HI[PI[playerid][pHouse]][hDrugs] -= strval(inputtext);
								PI[playerid][pDrugs] += strval(inputtext);
								SaveHouseInt(PI[playerid][pHouse], "hDrugs", HI[PI[playerid][pHouse]][hDrugs]);
								SendPositiveMess(playerid, "Ты взял из сейфа %d наркотиков. Наркотиков в сейфе: %d",strval(inputtext), HI[PI[playerid][pHouse]][hDrugs]);
								return 1;
							} 
							return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
						}
						return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Взять можно только 100 наркотиков.");
					}
					default: 
					{
						SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Вводить можно только цифры.");
						return SPD(playerid, DLG_SAFE_DRUGS_GET, DSI, ""SERVER_HEX"Взять",""WHITE_HEX"Введи сколько хочешь взять наркотиков из сейфа в поле ниже:", "Выбрать", "Отмена");
					}
				}
			}
		}
		case DLG_SAFE_DEAGLE:
		{
			if(!response) return safeCommand(playerid);
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if(strval(inputtext) > HI[PI[playerid][pHouse]][hDeagle]) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"В сейфе нет столько патронов.");
						if(strval(inputtext) <= 0) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
						if(strval(inputtext) <= HI[PI[playerid][pHouse]][hDeagle])
						{
							HI[PI[playerid][pHouse]][hDeagle] -= strval(inputtext);
							GiveWeapon(playerid, 24, strval(inputtext));
							SaveHouseInt(PI[playerid][pHouse], "hDeagle", HI[PI[playerid][pHouse]][hDeagle]);
							SendPositiveMess(playerid, "Ты взял из сейфа %d пт. на Deagle. Патронов в сейфе: %d", strval(inputtext), HI[PI[playerid][pHouse]][hDeagle]);
							return 1;
						}
						return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
					}
					default: 
					{
						SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Вводить можно только цифры.");
						return SPD(playerid, DLG_SAFE_DEAGLE, DSI, ""SERVER_HEX"Deagle", "Введи сколько хочешь взять патрон в поле ниже:", "Выбрать", "Назад");
					}
				}
			}
		}
		case DLG_SAFE_AK47:
		{
			if(!response) return safeCommand(playerid);
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if(strval(inputtext) > HI[PI[playerid][pHouse]][hAK47]) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"В сейфе нет столько патронов.");
						if(strval(inputtext) <= 0) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
						if(strval(inputtext) <= HI[PI[playerid][pHouse]][hAK47])
						{
							HI[PI[playerid][pHouse]][hAK47] -= strval(inputtext);
							GiveWeapon(playerid, 30, strval(inputtext));
							SaveHouseInt(PI[playerid][pHouse], "hAK47", HI[PI[playerid][pHouse]][hAK47]);
							SendPositiveMess(playerid, "Ты взял из сейфа %d пт. на Deagle. Патронов в сейфе: %d",strval(inputtext), HI[PI[playerid][pHouse]][hAK47]);
							return 1;
						}
						return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
					}
					default: 
					{
						SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Вводить можно только цифры.");
						return SPD(playerid, DLG_SAFE_AK47, DSI, ""SERVER_HEX"AK47", "Введи сколько хочешь взять патрон в поле ниже:", "Выбрать", "Назад");
					}
				}
			}
		}
		case DLG_SAFE_SHOTGUN:
		{
			if(!response) return safeCommand(playerid);
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if(strval(inputtext) > HI[PI[playerid][pHouse]][hShotgun]) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"В сейфе нет столько патронов.");
						if(strval(inputtext) <= 0) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
						if(strval(inputtext) <= HI[PI[playerid][pHouse]][hShotgun])
						{
							HI[PI[playerid][pHouse]][hShotgun] -= strval(inputtext);
							GiveWeapon(playerid, 25, strval(inputtext));
							SaveHouseInt(PI[playerid][pHouse], "hShotgun", HI[PI[playerid][pHouse]][hShotgun]);
							SendPositiveMess(playerid, "Ты взял из сейфа %d пт. на Shotgun. Патронов в сейфе: %d",strval(inputtext), HI[PI[playerid][pHouse]][hShotgun]);
							return 1;
						}
						return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
					}
					default: 
					{
						SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Вводить можно только цифры.");
						return SPD(playerid, DLG_SAFE_SHOTGUN, DSI, ""SERVER_HEX"Shotgun", "Введи сколько хочешь взять патрон в поле ниже:", "Выбрать", "Назад");
					}
				}
			}
		}
		case DLG_SAFE_M4:
		{
			if(!response) return safeCommand(playerid);
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if(strval(inputtext) > HI[PI[playerid][pHouse]][hM4]) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"В сейфе нет столько патронов.");
						if(strval(inputtext) <= 0) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
						if(strval(inputtext) <= HI[PI[playerid][pHouse]][hM4])
						{
							HI[PI[playerid][pHouse]][hM4] -= strval(inputtext);
							GiveWeapon(playerid, 31, strval(inputtext));
							SaveHouseInt(PI[playerid][pHouse], "hM4", HI[PI[playerid][pHouse]][hM4]);
							SendPositiveMess(playerid, "Ты взял из сейфа %d пт. на M4. Патронов в сейфе: %d",strval(inputtext), HI[PI[playerid][pHouse]][hM4]);
							return 1;
						}
						return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
					}
					default: 
					{
						SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Вводить можно только цифры.");
						return SPD(playerid, DLG_SAFE_M4, DSI, ""SERVER_HEX"M4", "Введи сколько хочешь взять патрон в поле ниже:", "Выбрать", "Назад");
					}
				}
			}
		}
		case DLG_SAFE_SDPISTOL:
		{
			if(!response) return safeCommand(playerid);
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if(strval(inputtext) > HI[PI[playerid][pHouse]][hSdpistol]) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"В сейфе нет столько патронов.");
						if(strval(inputtext) <= 0) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
						if(strval(inputtext) <= HI[PI[playerid][pHouse]][hSdpistol])
						{
							HI[PI[playerid][pHouse]][hSdpistol] -= strval(inputtext);
							GiveWeapon(playerid, 23, strval(inputtext));
							SaveHouseInt(PI[playerid][pHouse], "hSdpistol", HI[PI[playerid][pHouse]][hSdpistol]);
							SendPositiveMess(playerid, "Ты взял из сейфа %d пт. на SD-Pistol. Патронов в сейфе: %d",strval(inputtext), HI[PI[playerid][pHouse]][hSdpistol]);
							return 1;
						}
						return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
					}
					default: 
					{
						SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Вводить можно только цифры.");
						return SPD(playerid, DLG_SAFE_SDPISTOL, DSI, ""SERVER_HEX"SD-Pistol", "Введи сколько хочешь взять патрон в поле ниже:", "Выбрать", "Назад");
					}
				}
			}
		}
		case DLG_SAFE_RIFLE:
		{
			if(!response) return safeCommand(playerid);
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if(strval(inputtext) > HI[PI[playerid][pHouse]][hRifle]) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"В сейфе нет столько патронов.");
						if(strval(inputtext) <= 0) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
						if(strval(inputtext) <= HI[PI[playerid][pHouse]][hRifle])
						{
							HI[PI[playerid][pHouse]][hRifle] -= strval(inputtext);
							GiveWeapon(playerid, 33, strval(inputtext));
							SaveHouseInt(PI[playerid][pHouse], "hRifle", HI[PI[playerid][pHouse]][hRifle]);
							SendPositiveMess(playerid, "Ты взял из сейфа %d пт. на Rifle. Патронов в сейфе: %d",strval(inputtext), HI[PI[playerid][pHouse]][hRifle]);
							return 1;
						}
						return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
					}
					default: 
					{
						SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Вводить можно только цифры.");
						return SPD(playerid, DLG_SAFE_RIFLE, DSI, ""SERVER_HEX"Rifle", "Введи сколько хочешь взять патрон в поле ниже:", "Выбрать", "Назад");
					}
				}
			}
		}
		case DLG_SAFE_MP5:
		{
			if(!response) return safeCommand(playerid);
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if(strval(inputtext) > HI[PI[playerid][pHouse]][hMP5]) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"В сейфе нет столько патронов.");
						if(strval(inputtext) <= 0) return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
						if(strval(inputtext) <= HI[PI[playerid][pHouse]][hMP5])
						{
							HI[PI[playerid][pHouse]][hMP5] -= strval(inputtext);
							GiveWeapon(playerid, 29, strval(inputtext));
							SaveHouseInt(PI[playerid][pHouse], "hMP5", HI[PI[playerid][pHouse]][hMP5]);
							SendPositiveMess(playerid, "Ты взял из сейфа %d пт. на MP5. Патронов в сейфе: %d",strval(inputtext), HI[PI[playerid][pHouse]][hMP5]);
							return 1;
						}
						return SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Введено неверное значение.");
					}
					default: 
					{
						SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"Вводить можно только цифры.");
						return SPD(playerid, DLG_SAFE_MP5, DSI, ""SERVER_HEX"MP5", "Введи сколько хочешь взять патрон в поле ниже:", "Выбрать", "Назад");
					}
				}
			}
		}
		case DLG_CMD_AGL:
		{
			if(!response)
			{
				DeletePVar(playerid, "aglpid");
				return 1;
			}
			new aglpid = GetPVarInt(playerid, "aglpid");
			switch(listitem+1)
			{
				case 1: 
				{
					if(!PI[aglpid][pLicCar]) 
					{
						SAMF(GREY_FORMAT, "[A] %s %s[%d] выдал лицензию на наземный транспорт %s[%d]", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[aglpid][pName], aglpid);
						SCMESSF(aglpid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"%s %s выдал тебе лицензию на наземный транспорт.", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
						PI[aglpid][pLicCar] = 1;
						return DeletePVar(playerid, "aglpid"); 
					}
					else
					{
						SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"У игрока уже есть эта лицензия.");
						return DeletePVar(playerid, "aglpid");
					}
				}
				case 2:
				{
					if(!PI[aglpid][pLicPlane]) 
					{
						SAMF(GREY_FORMAT, "[A] %s %s[%d] выдал лицензию на воздушный транспорт %s[%d]", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[aglpid][pName], aglpid);
						SCMESSF(aglpid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"%s %s выдал тебе лицензию на воздушный транспорт.", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
						PI[aglpid][pLicPlane] = 1; 
						return DeletePVar(playerid, "aglpid"); 
					}
					else
					{
						SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"У игрока уже есть эта лицензия.");
						return DeletePVar(playerid, "aglpid");
					}
				}
				case 3:
				{
					if(!PI[aglpid][pLicBoat]) 
					{
						SAMF(GREY_FORMAT, "[A] %s %s[%d] выдал лицензию на водный транспорт %s[%d]", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[aglpid][pName], aglpid);
						SCMESSF(aglpid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"%s %s выдал тебе лицензию на водный транспорт.", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
						PI[aglpid][pLicBoat] = 1; 
						return DeletePVar(playerid, "aglpid"); 
					}
					else
					{
						SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"У игрока уже есть эта лицензия.");
						return DeletePVar(playerid, "aglpid");
					} 
				}
			}
		}
		case DLG_CMD_UNAGL:
		{
			if(!response)
			{
				DeletePVar(playerid, "unaglpid");
				return 1;
			}
			new unaglpid = GetPVarInt(playerid, "unaglpid");
			switch(listitem+1)
			{
				case 1: 
				{
					if(!PI[unaglpid][pLicCar]) 
					{
						SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"У игрока нету этой лицензии.");
						return DeletePVar(playerid, "unaglpid");
					}
					else
					{
						SAMF(GREY_FORMAT, "[A] %s %s[%d] забрал лицензию на наземный транспорт у %s[%d]", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[unaglpid][pName], unaglpid);
						SCMESSF(unaglpid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"%s %s забрал у тебя лицензию на наземный транспорт.", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
						PI[unaglpid][pLicCar] = 0;
						return DeletePVar(playerid, "unaglpid"); 
					}
				}
				case 2:
				{
					if(!PI[unaglpid][pLicPlane]) 
					{
						SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"У игрока нету этой лицензии.");
						return DeletePVar(playerid, "unaglpid");
					}
					else
					{
						SAMF(GREY_FORMAT, "[A] %s %s[%d] забрал лицензию на воздушный транспорт у %s[%d]", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[unaglpid][pName], unaglpid);
						SCMESSF(unaglpid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"%s %s забрал у тебя лицензию на водушный транспорт.", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
						PI[unaglpid][pLicPlane] = 0; 
						return DeletePVar(playerid, "unaglpid"); 
					}
				}
				case 3:
				{
					if(!PI[unaglpid][pLicBoat]) 
					{
						SCMESS(playerid, DEFAULTRED_FORMAT, ""NEGATIVE_MARK" "WHITE_HEX"У игрока нету этой лицензии.");
						return DeletePVar(playerid, "unaglpid");
					}
					else
					{
						SAMF(GREY_FORMAT, "[A] %s %s[%d] забрал лицензию на водный транспорт у %s[%d]", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[unaglpid][pName], unaglpid);
						SCMESSF(unaglpid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"%s %s забрал у тебя лицензию на водный транспорт.", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
						PI[unaglpid][pLicBoat] = 0; 
						return DeletePVar(playerid, "unaglpid"); 
					} 
				}
			}
		}
		case DLG_CMD_MUTELIST:
        {
            if(response)
	        {
	            new var_count, targetid = INVALID_PLAYER_ID;
	            foreach(new i : Player) 
				{
					if(!pLoggedIn{i} || !IsPlayerConnected(i)) continue;
			        if(PI[i][pMute] > 0) 
					{
				        if(var_count == listitem) 
						{
				            targetid = i;
					        break;
	    		        }
				        var_count++;
		        	}
		        }
		        if(targetid == INVALID_PLAYER_ID) 
				{
		            mutelistCommand(playerid);
		            return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Выбранный игрок вышел из сети или срок блокировки истек.");
		        }
		        SetPVarInt(playerid, "DialogExtraid", targetid);
		        format(g_str, 60, ""WHITE_HEX"Снять бан чата с "CYANLIGHT_HEX"%s[%d]"WHITE_HEX"?", PI[targetid][pName], targetid);
		        return SPD(playerid, DLG_CMD_MUTELIST_PLAYER, DSM, "Подтверждение", g_str, "Да", "Назад");
	        }
        }
        case DLG_CMD_MUTELIST_PLAYER:
        {
            if(!response) return mutelistCommand(playerid);
            format(g_str, 3, "%d", GetPVarInt(playerid, "DialogExtraid"));
			unmuteCommand(playerid, g_str);
            return DeletePVar(playerid, "DialogExtraid");
        }
		case DLG_CMD_ANIMLIST:
		{
			if(!response) return 1;
			switch(listitem)
			{
				case 0: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_HANDSUP);
				case 1: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_PISSING);
				case 2: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE1);
				case 3: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE2);
				case 4: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE3);
				case 5: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE4);
				case 6: ApplyAnimation(playerid,"DANCING","dnce_M_b",4.1,true,false,false,false,0,FORCE_SYNC:1);
				case 7: ApplyAnimation(playerid,"DANCING","dnce_M_a",4.1,true,false,false,false,0,FORCE_SYNC:1);
				case 8: ApplyAnimation(playerid,"DANCING","dnce_M_b",4.1,true,false,false,false,0,FORCE_SYNC:1);
				case 9: ApplyAnimation(playerid,"DANCING","DAN_Down_A",4.1,true,false,false,false,0,FORCE_SYNC:1);
				case 10: ApplyAnimation(playerid,"DANCING","DAN_Left_A",4.1,true,false,false,false,0,FORCE_SYNC:1);
				case 11: ApplyAnimation(playerid,"DANCING","DAN_Loop_A",4.1,true,false,false,false,0,FORCE_SYNC:1);
				case 12: ApplyAnimation(playerid,"SMOKING","M_smklean_loop",4.1,true,false,false,false,0,FORCE_SYNC:1);
				case 13: ApplyAnimation(playerid,"PED","fucku",4.1,false,false,false,false,0,FORCE_SYNC:1);
				case 14: ApplyAnimation(playerid,"INT_OFFICE","OFF_Sit_Crash",4.1,false,false,false,true,0,FORCE_SYNC:1);
				case 15: ApplyAnimation(playerid,"BEACH","ParkSit_W_Loop",4.1,true,false,false,true,0,FORCE_SYNC:1);
				case 16: ApplyAnimation(playerid,"PED","SEAT_down",4.1,false,false,false,true,0,FORCE_SYNC:1);
				case 17: ApplyAnimation(playerid,"BEACH","ParkSit_M_loop",4.1,true,false,false,true,0,FORCE_SYNC:1);
				case 18: ApplyAnimation(playerid,"BEACH","SitnWait_loop_W",4.1,true,false,false,true,0,FORCE_SYNC:1);
				case 19: ApplyAnimation(playerid,"BEACH","Lay_Bac_Loop",4.1,true,false,false,true,0,FORCE_SYNC:1);
				case 20: ApplyAnimation(playerid,"GANGS","hndshkba",4.1,false,false,false,false,0,FORCE_SYNC:1);
				case 21: ApplyAnimation(playerid,"ON_LOOKERS","WAVE_LOOP",4.1,true,true,true,false,0,FORCE_SYNC:1);
				case 22: ApplyAnimation(playerid,"BENCHPRESS","GYM_BP_CELEBRATE",4.1,true,true,true,false,0,FORCE_SYNC:1);
				case 23: ApplyAnimation(playerid,"GANGS","smkcig_prtl",4.1,false,false,false,false,0,FORCE_SYNC:1);
				case 24: ApplyAnimation(playerid,"DEALER","DEALER_DEAL",4.1,false,false,false,false,0,FORCE_SYNC:1);
				case 25: ApplyAnimation(playerid,"DEALER","DEALER_IDLE_01",4.1,false,false,false,false,0,FORCE_SYNC:1);
				case 26: ApplyAnimation(playerid,"DEALER","DEALER_IDLE_03",4.1,false,false,false,false,0,FORCE_SYNC:1);
				case 27: ApplyAnimation(playerid,"DEALER","DRUGS_BUY",4.1,false,false,false,false,0,FORCE_SYNC:1);
				case 28: ApplyAnimation(playerid,"RYDER","RYD_Die_PT1",4.1,true,true,false,false,0,FORCE_SYNC:1);
				case 29: ApplyAnimation(playerid,"MISC","plyr_shkhead",4.1,false,false,false,false,0,FORCE_SYNC:1);
				case 30: ApplyAnimation(playerid,"CRACK","Crckidle2",4.1,true,false,false,false,0,FORCE_SYNC:1);
				case 31: ApplyAnimation(playerid,"PED","cower",3.0,true,false,false,false,0,FORCE_SYNC:1);
			}
			SetPVarInt(playerid, "Animation", 1);
			TextDrawShowForPlayer(playerid, animDraw);
			return 1;
		}
		case DLG_ATM:
		{
			if(!response) return 1;
			switch(listitem+1) 
			{
				case 1:
				{
					return SCMESSF(playerid, YELLOW_FORMAT, "Банк San Andreas: "WHITE_HEX"Ваш счёт составляет: %d$", PI[playerid][pBank]);
				}
				case 2:
				{
					SPD(playerid, DLG_ATM_GET, DSI, ""YELLOW_HEX"Снять деньги", ""WHITE_HEX"Введите сумму, желаемую для снятия с личного счёта: ", "Ввести", "Назад");
				}
			}
		}
		case DLG_ATM_GET:
		{
			if(!response) return ATMMenu(playerid);
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if(strval(inputtext) > PI[playerid][pBank]) 
						{
							SCMESS(playerid, YELLOW_FORMAT, "Банк San Andreas: "WHITE_HEX"На Вашем счету нет столько денег.");
							return SPD(playerid, DLG_BANK_GET, DSI, ""YELLOW_HEX"Снять деньги", ""WHITE_HEX"Введите сумму, которую нужно снять с личного счёта: ", "Ввести", "Назад");
						}
						if(strval(inputtext) <= 0 || !strlen(inputtext))
						{
							SCMESS(playerid, YELLOW_FORMAT, "Банк San Andreas: "WHITE_HEX"Укажите правильную сумму.");
							return SPD(playerid, DLG_BANK_GET, DSI, ""YELLOW_HEX"Снять деньги", ""WHITE_HEX"Введите сумму, которую нужно снять с личного счёта: ", "Ввести", "Назад");
						}
						if(strval(inputtext) < 100)
						{
							SCMESS(playerid, YELLOW_FORMAT, "Банк San Andreas: "WHITE_HEX"Укажите сумму больше 100$.");
							return SPD(playerid, DLG_BANK_GET, DSI, ""YELLOW_HEX"Снять деньги", ""WHITE_HEX"Введите сумму, которую нужно снять с личного счёта: ", "Ввести", "Назад");
						}
						PI[playerid][pBank] -= strval(inputtext);
						SetMoney(playerid, strval(inputtext));
						SCMESSF(playerid, YELLOW_FORMAT, "Банк San Andreas: "WHITE_HEX"Вы сняли с банковского счёта %d$. Теперь Ваш счёт составляет: %d$", strval(inputtext), PI[playerid][pBank]);
						query[0]=EOS;
						mysql_format(connects, query, 100, "UPDATE "TABLE_ACCOUNTS" SET `bank`='%d' WHERE `id`='%d' LIMIT 1", PI[playerid][pBank], PI[playerid][pID]);
						mysql_tquery(connects, query);
						return 1;
					}
					default:
					{
						SCMESS(playerid, YELLOW_FORMAT, "Банк San Andreas: "WHITE_HEX"Неизвестная сумма.");
						return SPD(playerid, DLG_BANK_GET, DSI, ""YELLOW_HEX"Снять деньги", ""WHITE_HEX"Введите сумму, которую нужно снять с личного счёта: ", "Ввести", "Назад");
					}
				}
			}
		}
		case DLG_BANK:
		{
			if(!response) return 1;
			switch(listitem+1) 
			{
				case 1:
				{
					SCMESSF(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Ваш счёт составляет: %d$", PI[playerid][pBank]);
					BankMenu(playerid);
				}
				case 2:
				{
					SPD(playerid, DLG_BANK_PUT, DSI, ""YELLOW_HEX"Положить деньги", ""WHITE_HEX"Введите сумму, которую нужно положить на личный счёт: ", "Ввести", "Назад");
				}
				case 3:
				{
					SPD(playerid, DLG_BANK_GET, DSI, ""YELLOW_HEX"Снять деньги", ""WHITE_HEX"Введите сумму, желаемую для снятия с личного счёта: ", "Ввести", "Назад");
				}
				case 4:
				{
					SPD(playerid, DLG_BANK_TRANSFER, DSI, ""YELLOW_HEX"Перевод денежных средств | ID", ""WHITE_HEX"Введите ID клиента банка, которому нужно перевести деньги:", "Ввести", "Назад");
				}
				case 5:
				{
					if(PI[playerid][pHouse] == -1) 
					{
						SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"У Вас отсутствует дом.");
						return BankMenu(playerid);
					}
					format(g_str, 130, ""WHITE_HEX"Ваш дом оплачен на %d из 3 дней.\nЦена оплаты 1 дня - %d$\nВведите количество дней, желаемых для оплаты: ", HI[PI[playerid][pHouse]][hDays], HI[PI[playerid][pHouse]][hDice]);
					return SPD(playerid, DLG_BANK_HOUSE, DSI, ""YELLOW_HEX"Оплатить дом", g_str, "Ввести", "Назад");
				}
				case 6:
				{
					if(PI[playerid][pBusiness] == -1) 
					{
						SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"У Вас отсутствует арендованое помещение.");
						return BankMenu(playerid);
					}
					format(g_str, 130, ""WHITE_HEX"Ваше помещение оплачено на %d из 3 дней.\nЦена оплаты 1 дня - %d$\nВведите количество дней, желаемых для оплаты: ", BI[PI[playerid][pBusiness]][bDays], BI[PI[playerid][pBusiness]][bDice]);
					return SPD(playerid, DLG_BANK_BUSINESS, DSI, ""YELLOW_HEX"Оплатить помещение", g_str, "Ввести", "Назад");
				}
				case 7:
				{
					if(PI[playerid][pBusiness] == -1) 
					{
						SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"У Вас отсутствует бизнес.");
						return BankMenu(playerid);
					}
					if(BI[PI[playerid][pBusiness]][bMoney] == 0) 
					{
						SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Счет бизнеса пуст.");
						return BankMenu(playerid);
					}
					format(g_str, 130, ""WHITE_HEX"На счету бизнеса: %d$. Введите количество денег, желаемых для снятия:", BI[PI[playerid][pBusiness]][bMoney], BI[PI[playerid][pBusiness]][bDice]);
					return SPD(playerid, DLG_BUSINESS_MONEY, DSI, ""YELLOW_HEX"Снять деньги со счета бизнеса", g_str, "Ввести", "Назад");
				}
				case 8:
				{
					if(PI[playerid][pBusiness] == -1) 
					{
						SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"У Вас отсутствует бизнес.");
						return BankMenu(playerid);
					}
					if(BI[PI[playerid][pBusiness]][bProds] == 10000) 
					{
						SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Ваш склад забит продукцией.");
						return BankMenu(playerid);
					}
					format(g_str, 130, ""WHITE_HEX"Количество продуктов сейчас: %d/10000. Цена за 1 продукт: "GREEN_HEX"%d$"WHITE_HEX".\nВведите желаемое количество продуктов:", BI[PI[playerid][pBusiness]][bProds], PRODS_PRICE);
					return SPD(playerid, DLG_BUSINESS_PRODS, DSI, ""YELLOW_HEX"Заказать продукты для бизнеса", g_str, "Ввести", "Назад");
				}
			}
		}
		case DLG_BUSINESS_PRODS:
		{
			if(!response) return BankMenu(playerid);
			new business = PI[playerid][pBusiness];
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if((strval(inputtext) + BI[business][bProds]) > 10000) 
						{
							SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"На Вашем складу нет столько места.");
							format(g_str, 130, ""WHITE_HEX"Количество продуктов сейчас: %d/10000. Цена за 1 продукт: "GREEN_HEX"%d$"WHITE_HEX".\nВведите желаемое количество продуктов:", BI[PI[playerid][pBusiness]][bProds], PRODS_PRICE);
							return SPD(playerid, DLG_BUSINESS_PRODS, DSI, ""YELLOW_HEX"Заказать продукты для бизнеса", g_str, "Ввести", "Назад");
						}
						if(strval(inputtext) <= 0 || !strlen(inputtext))
						{
							SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Укажите правильное количество.");
							format(g_str, 130, ""WHITE_HEX"Количество продуктов сейчас: %d/10000. Цена за 1 продукт: "GREEN_HEX"%d$"WHITE_HEX".\nВведите желаемое количество продуктов:", BI[PI[playerid][pBusiness]][bProds], PRODS_PRICE);
							return SPD(playerid, DLG_BUSINESS_PRODS, DSI, ""YELLOW_HEX"Заказать продукты для бизнеса", g_str, "Ввести", "Назад");
						}
						if(PI[playerid][pBank] < PRODS_PRICE*strval(inputtext))
						{
							SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"На Вашем банковском счету недостаточно средств.");
							format(g_str, 130, ""WHITE_HEX"Количество продуктов сейчас: %d/10000. Цена за 1 продукт: "GREEN_HEX"%d$"WHITE_HEX".\nВведите желаемое количество продуктов:", BI[PI[playerid][pBusiness]][bProds], PRODS_PRICE);
							return SPD(playerid, DLG_BUSINESS_PRODS, DSI, ""YELLOW_HEX"Заказать продукты для бизнеса", g_str, "Ввести", "Назад");
						}
						BI[business][bProds] += strval(inputtext);
						PI[playerid][pBank] -= PRODS_PRICE*strval(inputtext);
						if(PI[playerid][pPhoneNum]) SCMESSF(playerid, YELLOW_FORMAT, "Входящее СМС от \"Банк San Andreas\": "WHITE_HEX"Транзакция прошла успешно. Сумма перевода: %d$. Теперь Ваш банковский счёт составляет: %d$", PRODS_PRICE*strval(inputtext), PI[playerid][pBank]);
						SCMESSF(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Вы заказали %d продуктов для своего бизнеса.", strval(inputtext));
						query[0]=EOS;
						mysql_format(connects, query, 100, "UPDATE "TABLE_ACCOUNTS" SET `bank`='%d' WHERE `id`='%d' LIMIT 1", PI[playerid][pBank], PI[playerid][pID]);
						mysql_tquery(connects, query);
						SaveBusinessInt(business, "bProds", BI[business][bProds]);
						return 1;
					}
					default:
					{
						SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Неизвестная сумма.");
						return SPD(playerid, DLG_BANK_PUT, DSI, ""YELLOW_HEX"Положить деньги", ""WHITE_HEX"Введите сумму, которую нужно положить на личный счёт: ", "Ввести", "Назад");
					}
				}
			}
		}
		case DLG_BUSINESS_MONEY:
		{
			if(!response) return BankMenu(playerid);
			new business = PI[playerid][pBusiness];
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if(strval(inputtext) > BI[business][bMoney]) 
						{
							SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"На счету бизнеса нет столько денег.");
							format(g_str, 130, ""WHITE_HEX"На счету бизнеса: %d$. Введите количество денег, желаемых для снятия:", BI[PI[playerid][pBusiness]][bMoney], BI[PI[playerid][pBusiness]][bDice]);
							return SPD(playerid, DLG_BUSINESS_MONEY, DSI, ""YELLOW_HEX"Снять деньги со счета бизнеса", g_str, "Ввести", "Назад");
						}
						if(strval(inputtext) <= 0 || !strlen(inputtext))
						{
							SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Укажите правильную сумму.");
							format(g_str, 130, ""WHITE_HEX"На счету бизнеса: %d$. Введите количество денег, желаемых для снятия:", BI[PI[playerid][pBusiness]][bMoney], BI[PI[playerid][pBusiness]][bDice]);
							return SPD(playerid, DLG_BUSINESS_MONEY, DSI, ""YELLOW_HEX"Снять деньги со счета бизнеса", g_str, "Ввести", "Назад");
						}
						BI[business][bMoney] -= strval(inputtext);
						SetMoney(playerid, strval(inputtext));
						SCMESSF(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Вы успешно сняли %d$ со счёта Вашего бизнеса.", strval(inputtext));
						query[0]=EOS;
						mysql_format(connects, query, 100, "UPDATE "TABLE_ACCOUNTS" SET `bank`='%d' WHERE `id`='%d' LIMIT 1", PI[playerid][pBank], PI[playerid][pID]);
						mysql_tquery(connects, query);
						SaveBusinessInt(business, "bMoney", BI[business][bMoney]);
						return 1;
					}
					default:
					{
						SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Неизвестная сумма.");
						return SPD(playerid, DLG_BANK_PUT, DSI, ""YELLOW_HEX"Положить деньги", ""WHITE_HEX"Введите сумму, которую нужно положить на личный счёт: ", "Ввести", "Назад");
					}
				}
			}
		}
		case DLG_BANK_PUT:
		{
			if(!response) return BankMenu(playerid);
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if(strval(inputtext) > PI[playerid][pMoney]) 
						{
							SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"У Вас нет столько денег.");
							return SPD(playerid, DLG_BANK_PUT, DSI, ""YELLOW_HEX"Положить деньги", ""WHITE_HEX"Введите сумму, которую нужно положить на личный счёт: ", "Ввести", "Назад");
						}
						if(strval(inputtext) <= 0 || !strlen(inputtext))
						{
							SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Укажите правильную сумму.");
							return SPD(playerid, DLG_BANK_PUT, DSI, ""YELLOW_HEX"Положить деньги", ""WHITE_HEX"Введите сумму, которую нужно положить на личный счёт: ", "Ввести", "Назад");
						}
						if(strval(inputtext) < 100)
						{
							SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Укажите сумму больше 100$.");
							return SPD(playerid, DLG_BANK_PUT, DSI, ""YELLOW_HEX"Положить деньги", ""WHITE_HEX"Введите сумму, которую нужно положить на личный счёт: ", "Ввести", "Назад");
						}
						PI[playerid][pBank] += strval(inputtext);
						SetMoney(playerid, -strval(inputtext));
						SCMESSF(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Вы положили на банковский счёт %d$. Теперь Ваш счёт составляет: %d$", strval(inputtext), PI[playerid][pBank]);
						mysql_format(connects, query, 100, "UPDATE "TABLE_ACCOUNTS" SET `bank`='%d' WHERE `id`='%d' LIMIT 1", PI[playerid][pBank], PI[playerid][pID]);
						mysql_tquery(connects, query);
						return 1;
					}
					default:
					{
						SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Неизвестная сумма.");
						return SPD(playerid, DLG_BANK_PUT, DSI, ""YELLOW_HEX"Положить деньги", ""WHITE_HEX"Введите сумму, которую нужно положить на личный счёт: ", "Ввести", "Назад");
					}
				}
			}
		}
		case DLG_BANK_GET:
		{
			if(!response) return BankMenu(playerid);
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if(strval(inputtext) > PI[playerid][pBank]) 
						{
							SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"На Вашем счету нет столько денег.");
							return SPD(playerid, DLG_BANK_GET, DSI, ""YELLOW_HEX"Снять деньги", ""WHITE_HEX"Введите сумму, которую нужно снять с личного счёта: ", "Ввести", "Назад");
						}
						if(strval(inputtext) <= 0 || !strlen(inputtext))
						{
							SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Укажите правильную сумму.");
							return SPD(playerid, DLG_BANK_GET, DSI, ""YELLOW_HEX"Снять деньги", ""WHITE_HEX"Введите сумму, которую нужно снять с личного счёта: ", "Ввести", "Назад");
						}
						if(strval(inputtext) < 100)
						{
							SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Укажите сумму больше 100$.");
							return SPD(playerid, DLG_BANK_GET, DSI, ""YELLOW_HEX"Снять деньги", ""WHITE_HEX"Введите сумму, которую нужно снять с личного счёта: ", "Ввести", "Назад");
						}
						PI[playerid][pBank] -= strval(inputtext);
						SetMoney(playerid, strval(inputtext));
						SCMESSF(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Вы сняли с банковского счёта %d$. Теперь Ваш счёт составляет: %d$", strval(inputtext), PI[playerid][pBank]);
						query[0]=EOS;
						mysql_format(connects, query, 100, "UPDATE "TABLE_ACCOUNTS" SET `bank`='%d' WHERE `id`='%d' LIMIT 1", PI[playerid][pBank], PI[playerid][pID]);
						mysql_tquery(connects, query);
						return 1;
					}
					default:
					{
						SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Неизвестная сумма.");
						return SPD(playerid, DLG_BANK_GET, DSI, ""YELLOW_HEX"Снять деньги", ""WHITE_HEX"Введите сумму, которую нужно снять с личного счёта: ", "Ввести", "Назад");
					}
				}
			}
		}
		case DLG_BANK_TRANSFER:
		{
			if(!response) return BankMenu(playerid);
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if(!IsPlayerConnected(strval(inputtext)) || !pLoggedIn{strval(inputtext)})
						{
							SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Такого клиента не существует.");
							return SPD(playerid, DLG_BANK_TRANSFER, DSI, ""YELLOW_HEX"Перевод денежных средств | ID", ""WHITE_HEX"Введите ID клиента банка, которому нужно перевести деньги:", "Ввести", "Назад");
						}
						if(strval(inputtext) == playerid)
						{
							SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Вы указали свой ID.");
							return SPD(playerid, DLG_BANK_TRANSFER, DSI, ""YELLOW_HEX"Перевод денежных средств | ID", ""WHITE_HEX"Введите ID клиента банка, которому нужно перевести деньги:", "Ввести", "Назад");
						} 
						if(!strlen(inputtext))
						{
							SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Укажите правильный ID.");
							return SPD(playerid, DLG_BANK_TRANSFER, DSI, ""YELLOW_HEX"Перевод денежных средств | ID", ""WHITE_HEX"Введите ID клиента банка, которому нужно перевести деньги:", "Ввести", "Назад");
						}
						if(!PI[strval(inputtext)][pIdCard])
						{
							SCMESS(playerid,  YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"У этого клиента отсутствует ID карта.");
							return SPD(playerid, DLG_BANK_TRANSFER, DSI, ""YELLOW_HEX"Перевод денежных средств | ID", ""WHITE_HEX"Введите ID клиента банка, которому нужно перевести деньги:", "Ввести", "Назад");
						}
						SetPVarInt(playerid, "banktarget", strval(inputtext));
						return SPD(playerid, DLG_BANK_TRANSFER_PLAYER, DSI, ""YELLOW_HEX"Перевод денежных средств | Сумма", ""WHITE_HEX"Введите сумму, желаемую для перевода:", "Ввести", "Отмена");
					}
					default:
					{
						SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Такого клиента не существует.");
						return SPD(playerid, DLG_BANK_TRANSFER, DSI, ""YELLOW_HEX"Перевод денежных средств | ID", ""WHITE_HEX"Введите ID клиента банка, которому нужно перевести деньги:", "Ввести", "Назад");
					}
				}
			}
		}
		case DLG_BANK_TRANSFER_PLAYER:
		{
			if(!response) 
			{
				SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Перевод денежных средств отменён.");
				return DeletePVar(playerid, "banktarget");
			}
			new banktarget = GetPVarInt(playerid, "banktarget");
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if(!IsPlayerConnected(banktarget) || !pLoggedIn{banktarget})
						{
							SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Такого клиента не существует.");
							SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Перевод денежных средств отменён.");
							return DeletePVar(playerid, "banktarget");
						}
						if(strval(inputtext) > PI[playerid][pBank]) 
						{
							SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"На Вашем банковском счету отсутствует указанная сумма.");
							return SPD(playerid, DLG_BANK_TRANSFER_PLAYER, DSI, ""YELLOW_HEX"Перевод денежных средств | Сумма", ""WHITE_HEX"Введите сумму, желаемую для перевода:", "Ввести", "Отмена");
						}
						if(strval(inputtext) <= 0 || !strlen(inputtext))
						{
							SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Укажите правильную сумму.");
							return SPD(playerid, DLG_BANK_TRANSFER_PLAYER, DSI, ""YELLOW_HEX"Перевод денежных средств | Сумма", ""WHITE_HEX"Введите сумму, желаемую для перевода:", "Ввести", "Отмена");
						}
						PI[playerid][pBank] -= strval(inputtext);
						PI[banktarget][pBank] += strval(inputtext);
						if(PI[banktarget][pPhoneNum]) 
						{
							SCMESSF(banktarget, YELLOW_FORMAT, "Входящее SMS от \"Банк San Andreas\": "WHITE_HEX"На Ваш счёт поступило пополнение от клиента банка %s на сумму %d$", PI[playerid][pName], strval(inputtext));
						}
						SCMESSF(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Транзакция прошла успешно");
						SCMESSF(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Сумма перевода: %d. Имя клиента: %s. Банковский счёт составляет: %d$", strval(inputtext), PI[banktarget][pName], PI[banktarget][pBank]);
						query[0]=EOS;
						mysql_format(connects, query, 100, "UPDATE "TABLE_ACCOUNTS" SET `bank`='%d' WHERE `id`='%d' LIMIT 1", PI[playerid][pBank], PI[playerid][pID]);
						mysql_tquery(connects, query);
						query[0]=EOS;
						mysql_format(connects, query, 100, "UPDATE "TABLE_ACCOUNTS" SET `bank`='%d' WHERE `id`='%d' LIMIT 1", PI[playerid][pBank], PI[banktarget][pID]);
						mysql_tquery(connects, query);
						return DeletePVar(playerid, "banktarget");
					}
					default:
					{
						SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Неизвестная сумма.");
						return SPD(playerid, DLG_BANK_TRANSFER_PLAYER, DSI, ""YELLOW_HEX"Перевод денежных средств | Сумма", ""WHITE_HEX"Введите сумму, желаемую для перевода:", "Ввести", "Отмена");
					}
				}
			}
		}
		case DLG_BANK_HOUSE:
		{
			if(!response) return BankMenu(playerid);
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if(strval(inputtext) + HI[PI[playerid][pHouse]][hDays] > 3)
						{
							SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Оплатить дом можно только на 3 дня.");
							format(g_str, 130, ""WHITE_HEX"Ваш дом оплачен на %d из 3 дней.\nЦена оплаты 1 дня - %d$\nВведите количество дней, желаемых для оплаты: ", HI[PI[playerid][pHouse]][hDays], HI[PI[playerid][pHouse]][hDice]);
							return SPD(playerid, DLG_BANK_HOUSE, DSI, ""YELLOW_HEX"Оплатить дом", g_str, "Ввести", "Назад");
						}
						if(strval(inputtext) <= 0 || !strlen(inputtext))
						{
							SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Укажите правильное значение.");
							format(g_str, 130, ""WHITE_HEX"Ваш дом оплачен на %d из 3 дней.\nЦена оплаты 1 дня - %d$\nВведите количество дней, желаемых для оплаты: ", HI[PI[playerid][pHouse]][hDays], HI[PI[playerid][pHouse]][hDice]);
							return SPD(playerid, DLG_BANK_HOUSE, DSI, ""YELLOW_HEX"Оплатить дом", g_str, "Ввести", "Назад");
						}
						if(strval(inputtext) * HI[PI[playerid][pHouse]][hDice] > PI[playerid][pBank])
						{
							SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"На Вашем банковском счету отсутствуют средства.");
							format(g_str, 130, ""WHITE_HEX"Ваш дом оплачен на %d из 3 дней.\nЦена оплаты 1 дня - %d$\nВведите количество дней, желаемых для оплаты: ", HI[PI[playerid][pHouse]][hDays], HI[PI[playerid][pHouse]][hDice]);
							return SPD(playerid, DLG_BANK_HOUSE, DSI, ""YELLOW_HEX"Оплатить дом", g_str, "Ввести", "Назад");
						}
						PI[playerid][pBank] -= strval(inputtext) * HI[PI[playerid][pHouse]][hDice];
						HI[PI[playerid][pHouse]][hDays] += strval(inputtext);
						SCMESSF(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Оплата прошла успешно. Сумма оплаты: %d$. Количество оплаченных дней дома: %d/3. Ваш счёт теперь составляет: %d$", strval(inputtext) * HI[PI[playerid][pHouse]][hDice], HI[PI[playerid][pHouse]][hDays], PI[playerid][pBank]);
						query[0]=EOS;
						mysql_format(connects, query, 100, "UPDATE "TABLE_ACCOUNTS" SET `bank`='%d' WHERE `id`='%d' LIMIT 1", PI[playerid][pBank], PI[playerid][pID]);
						mysql_tquery(connects, query);
						SaveHouseInt(PI[playerid][pHouse], "hDays", HI[PI[playerid][pHouse]][hDays]);
						return 1;
					}
					default:
					{
						SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Введите количество дней для оплаты.");
						format(g_str, 130, ""WHITE_HEX"Ваш дом оплачен на %d из 3 дней.\nЦена оплаты 1 дня - %d$\nВведите количество дней, желаемых для оплаты: ", HI[PI[playerid][pHouse]][hDays], HI[PI[playerid][pHouse]][hDice]);
						return SPD(playerid, DLG_BANK_HOUSE, DSI, ""YELLOW_HEX"Оплатить дом", g_str, "Ввести", "Назад");
					}
				}
			}
		}
		case DLG_BANK_BUSINESS:
		{
			if(!response) return BankMenu(playerid);
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						if(strval(inputtext) + BI[PI[playerid][pBusiness]][bDays] > 3)
						{
							SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Оплатить аренду помещения можно только на 3 дня.");
							format(g_str, 130, ""WHITE_HEX"Ваше помещение оплачено на %d из 3 дней.\nЦена оплаты 1 дня - %d$\nВведите количество дней, желаемых для оплаты: ", BI[PI[playerid][pBusiness]][bDays], BI[PI[playerid][pBusiness]][bDice]);
							return SPD(playerid, DLG_BANK_BUSINESS, DSI, ""YELLOW_HEX"Оплатить помещение", g_str, "Ввести", "Назад");
						}
						if(strval(inputtext) <= 0 || !strlen(inputtext))
						{
							SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Укажите правильное значение.");
							format(g_str, 130, ""WHITE_HEX"Ваше помещение оплачено на %d из 3 дней.\nЦена оплаты 1 дня - %d$\nВведите количество дней, желаемых для оплаты: ", BI[PI[playerid][pBusiness]][bDays], BI[PI[playerid][pBusiness]][bDice]);
							return SPD(playerid, DLG_BANK_BUSINESS, DSI, ""YELLOW_HEX"Оплатить помещение", g_str, "Ввести", "Назад");
						}
						if(strval(inputtext) * BI[PI[playerid][pBusiness]][bDice] > PI[playerid][pBank])
						{
							SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"На Вашем банковском счету отсутствуют средства.");
							format(g_str, 130, ""WHITE_HEX"Ваше помещение оплачено на %d из 3 дней.\nЦена оплаты 1 дня - %d$\nВведите количество дней, желаемых для оплаты: ", BI[PI[playerid][pBusiness]][bDays], BI[PI[playerid][pBusiness]][bDice]);
							return SPD(playerid, DLG_BANK_BUSINESS, DSI, ""YELLOW_HEX"Оплатить помещение", g_str, "Ввести", "Назад");
						}
						PI[playerid][pBank] -= strval(inputtext) * BI[PI[playerid][pBusiness]][bDice];
						BI[PI[playerid][pBusiness]][bDays] += strval(inputtext);
						SCMESSF(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Оплата прошла успешно. Сумма оплаты: %d$. Количество оплаченных дней помещения: %d/3. Ваш счёт теперь составляет: %d$", strval(inputtext) * BI[PI[playerid][pBusiness]][bDice], BI[PI[playerid][pBusiness]][bDays], PI[playerid][pBank]);
						query[0]=EOS;
						mysql_format(connects, query, 100, "UPDATE "TABLE_ACCOUNTS" SET `bank`='%d' WHERE `id`='%d' LIMIT 1", PI[playerid][pBank], PI[playerid][pID]);
						mysql_tquery(connects, query);
						SaveBusinessInt(PI[playerid][pBusiness], "bDays", BI[PI[playerid][pBusiness]][bDays]);
						return 1;
					}
					default:
					{
						SCMESS(playerid, YELLOW_FORMAT, "- Банк San Andreas: "WHITE_HEX"Введите количество дней для оплаты.");
						format(g_str, 130, ""WHITE_HEX"Ваше помещение оплачено на %d из 3 дней.\nЦена оплаты 1 дня - %d$\nВведите количество дней, желаемых для оплаты: ", BI[PI[playerid][pBusiness]][bDays], BI[PI[playerid][pBusiness]][bDice]);
						return SPD(playerid, DLG_BANK_BUSINESS, DSI, ""YELLOW_HEX"Оплатить помещение", g_str, "Ввести", "Назад");
					}
				}
			}
		}
		case DLG_CMD_ADDATM:
		{
			if(!response) return 1;
			new Float:x_pos, Float:y_pos, Float:z_pos, Float:angle_pos;
			GetPlayerPos(playerid, x_pos, y_pos, z_pos);
			GetPlayerFacingAngle(playerid, angle_pos);
			x_pos += floatsin(-angle_pos, degrees);
			y_pos += floatcos(-angle_pos, degrees);
			new atm1;
			SCMESS(playerid, WHITE_FORMAT, "Чтобы выйти, нажми: ESC и чтобы сохранить, нажми курсором: СОХРАНИТЬ");
			atm1 = CreateDynamicObject(2754, x_pos, y_pos, z_pos-0.35, 0.0, 0.0, 0.0);
			SetPVarInt(playerid, "LoadATM", atm1+1);
			BeginObjectEditing(playerid, atm1);
			return 1;
		}
		case DLG_CMD_BUYBUSINESS:
		{
			if(!response) return DeletePVar(playerid, "businessid");
			new business = GetPVarInt(playerid, "businessid");
			if(PI[playerid][pBusiness] != -1) 
			{
				DeletePVar(playerid, "businessid");
				return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя уже есть бизнес.");
			}
			if(BI[business][bOwner]) 
			{
				DeletePVar(playerid, "businessid");
				return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У бизнеса уже есть владелец.");
			}
			if(!PI[playerid][pIdCard])
			{
				DeletePVar(playerid, "businessid");
				return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Отсутствует банковский счёт.");
			}
			if(PI[playerid][pBank] < BI[business][bCost])
			{
				DeletePVar(playerid, "businessid");
				return SCMESSF(playerid, YELLOW_FORMAT, "Входящее SMS от \"Банк San Andreas\": "WHITE_HEX"Транзакция была отменена. Причина: недостаточно средств на счету. Всего на счету: %d$", PI[playerid][pBank]);
			}
			ClearBusiness(business);
			PI[playerid][pBank] -= BI[business][bCost];
			PI[playerid][pBusiness] = BI[business][bID];
			BI[business][bDays] += 1;
			BI[business][bProds] = 3000;
			GetPlayerName(playerid, BI[business][bOwner], MAX_PLAYER_NAME+1);
			UpdateBusiness(business);
			SaveBusiness(business);
			query[0]=EOS;
			mysql_format(connects, query, 105, "UPDATE "TABLE_ACCOUNTS" SET `business` = '%d', `bank` = '%d' WHERE `id` = '%d' LIMIT 1", PI[playerid][pBusiness], PI[playerid][pBank], PI[playerid][pID]);
			mysql_tquery(connects, query);
			SendPositiveMess(playerid, "Поздравляем с приобретением "CONTRASTORANGE_HEX"\"%s\""WHITE_HEX" (ID:%d) за "GREEN_HEX"%d$"WHITE_HEX"!", BI[business][bName], BI[business][bID], BI[business][bCost]);
			SendPositiveMess(playerid, "Аренда помещения оплачена на %d/3 дней.", BI[business][bDays]);
			SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Не забудь проплатить аренду, иначе бизнес будет возвращён государству.");
			SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Информация о бизнесе /bisinfo");
			SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Чтобы открыть меню бизнеса введи команду /bmenu");
			if(PI[playerid][pPhoneNum]) SCMESSF(playerid, YELLOW_FORMAT, "Входящее SMS от \"Банк San Andreas\": "WHITE_HEX"Транзакция прошла успешно. Сумма перевода: %d$. Теперь банковский счёт составляет: %d$", BI[business][bCost], PI[playerid][pBank]);
			DeletePVar(playerid, "businessid");
		}
		case DLG_AMMOLIST:
		{
			if(!response) return DeletePVar(playerid, "menu_ammobusiness");
			new business = GetPVarInt(playerid, "menu_ammobusiness"), price = BI[business][bProdsPrice], gun_price = ammoInfo[listitem][adCost]*price;
			switch(listitem)
			{
				case 0..7:
				{
					SPD(playerid, DLG_AMMOLIST_AMMO, DSI, "Ammo San Andreas",""WHITE_HEX"Введи количество патрон\nкоторые будут в комплекте с оружием:","Купить", "Назад");
					SetPVarInt(playerid,"itemid",listitem);
				}
				default:
				{
					if(PI[playerid][pMoney] < gun_price)
					{
						DeletePVar(playerid, "menu_ammobusiness");
						SCMESS(playerid, GREY_FORMAT,""NEGATIVE_MARK" Недостаточно средств.");
						return 1;
					} 
					SetMoney(playerid, -gun_price);
					BI[business][bMoney] += gun_price;
					BI[business][bProds] -= 50;
					BI[business][bIncomeDay] += gun_price;
					GiveWeapon(playerid,ammoInfo[listitem][adGunID],1);
					SaveBusinessInts(business, "bMoney", BI[business][bMoney], "bProds", BI[business][bProds]);
					DeletePVar(playerid, "menu_ammobusiness");
				}
			}
		}
		case DLG_AMMOLIST_AMMO:
		{
			if(!response)
			{
				DeletePVar(playerid, "itemid");
				return DeletePVar(playerid, "menu_ammobusiness");
			}
			for(new i=0; i < strlen(inputtext); i++)
			{
				switch(inputtext[i])
				{
					case '0'..'9':
					{
						new listitempvar = GetPVarInt(playerid, "itemid"), business = GetPVarInt(playerid, "menu_ammobusiness"), price = BI[business][bProdsPrice], gun_price = (ammoInfo[listitempvar][adCost]*price)*strval(inputtext);
						if(PI[playerid][pMoney] < gun_price)
						{
							DeletePVar(playerid, "itemid");
							DeletePVar(playerid, "menu_ammobusiness");
							SCMESS(playerid, GREY_FORMAT,""NEGATIVE_MARK" Недостаточно средств.");
							return 1;
						}
						if(strval(inputtext) > 999 || strval(inputtext) < 1)
						{
							DeletePVar(playerid, "itemid");
							DeletePVar(playerid, "menu_ammobusiness");
							return SPD(playerid, DLG_AMMOLIST_AMMO, DSI, "Ammo San Andreas",""WHITE_HEX"Введи количество патрон\nкоторые будут в комплекте с оружием:\n\
							"YELLOW_HEX"Значение от 1 до 999","Купить", "Назад");
						}
						SetMoney(playerid, -gun_price);
						BI[business][bProds] -= 50;
						BI[business][bIncomeDay] += gun_price;
						BI[business][bMoney] += gun_price;
						GiveWeapon(playerid,ammoInfo[listitempvar][adGunID],strval(inputtext));
						DeletePVar(playerid, "itemid");
						SaveBusinessInts(business, "bMoney", BI[business][bMoney], "bProds", BI[business][bProds]);
						DeletePVar(playerid, "menu_ammobusiness");
					}
					default:
					{
						SPD(playerid, DLG_AMMOLIST_AMMO, DSI, "Ammo San Andreas",""WHITE_HEX"Введи количество патрон\nкоторые будут в комплекте с оружием:","Купить", "Назад");
					}
				}
			}
			return 1;
		}
		case DLG_PRODSMENU:
		{
			if(!response) return DeletePVar(playerid, "menu_business");
			new business = GetPVarInt(playerid, "menu_business"), strPlayerText[20], price = BI[business][bProdsPrice];
			if((BI[business][bProds] - 50) < 0)
			{
				DeletePVar(playerid, "menu_business");
				SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У бизнеса недостаточно продукции.");
				return 1;
			}
			switch(listitem+1)
			{
				case 1:
				{
					if(PI[playerid][pMoney] < (price*14))
					{
						DeletePVar(playerid, "menu_business");
						SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Недостаточо денег.");
						return MagazineList(playerid, business);
					}
					if(PI[playerid][pPhone])
					{
						DeletePVar(playerid, "menu_business");
						SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя уже есть телефон.");
						return MagazineList(playerid, business);
					}
					PI[playerid][pPhone] = 1;
					format(strPlayerText,sizeof(strPlayerText),"~r~-%d", price*14);
					SetMoney(playerid, -(price*14));
					SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Теперь у тебя есть телефон. Для его работы нужно приобрести СИМ карту.");
					BI[business][bMoney] += price*14;
					BI[business][bIncomeDay] += price*14;
				}
				case 2:
				{
					if(PI[playerid][pMoney] < (price*9))
					{
						DeletePVar(playerid, "menu_business");
						SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Недостаточо денег.");
						return MagazineList(playerid, business);
					}
					PI[playerid][pPhoneNum] = 10000 + random(999999);
					SendPositiveMess(playerid, "Твой новый номер телефона: "CONTRASTORANGE_HEX"%d"WHITE_HEX". Банк будет уведомлять тебя о изменениях счёта. Отправить СМС - /sms [номер]", PI[playerid][pPhoneNum]);
					format(strPlayerText,sizeof(strPlayerText),"~r~-%d", price*9);
					SetMoney(playerid, -(price*9));
					BI[business][bMoney] += price*9;
					BI[business][bIncomeDay] += price*9;
				}
				case 3:
				{
					if(PI[playerid][pMoney] < (price*6))
					{
						DeletePVar(playerid, "menu_business");
						SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Недостаточо денег.");
						return MagazineList(playerid, business);
					}
					if(PI[playerid][pPhoneBook])
					{
						DeletePVar(playerid, "menu_business");
						SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя уже есть телефонная книга.");
						return MagazineList(playerid, business);
					}
					PI[playerid][pPhoneBook] = 1;
					format(strPlayerText,sizeof(strPlayerText),"~r~-%d", price*6);
					SetMoney(playerid, -(price*6));
					SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Телефонная книга приобретена.");
					BI[business][bMoney] += price*6;
					BI[business][bIncomeDay] += price*6;
				}
				case 4:
				{
					if(PI[playerid][pMoney] < (price*6))
					{
						DeletePVar(playerid, "menu_business");
						SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Недостаточо денег.");
						return MagazineList(playerid, business);
					}
					if(PI[playerid][pBook])
					{
						DeletePVar(playerid, "menu_business");
						SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя уже есть справочник.");
						return MagazineList(playerid, business);
					}
					PI[playerid][pBook] = 1;
					format(strPlayerText,sizeof(strPlayerText),"~r~-%d", price*6);
					SetMoney(playerid, -(price*6));
					SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Спраовчник приобретён.");
					BI[business][bMoney] += price*6;
					BI[business][bIncomeDay] += price*6;
				}
				case 5:
				{
					if(PI[playerid][pMoney] < (price*15))
					{
						DeletePVar(playerid, "menu_business");
						SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Недостаточо денег.");
						return MagazineList(playerid, business);
					}
					if(PI[playerid][pHeal] == 3)
					{
						DeletePVar(playerid, "menu_business");
						SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нельзя иметь более 3 аптечек.");
						return MagazineList(playerid, business);
					}
					PI[playerid][pHeal] += 1;
					format(strPlayerText,sizeof(strPlayerText),"~r~-%d", price*15);
					SetMoney(playerid, -(price*15));
					SendPositiveMess(playerid, "Аптечка приобретена. Всего аптечек: %d", PI[playerid][pHeal]);
					BI[business][bMoney] += price*15;
					BI[business][bIncomeDay] += price*15;
				}
				case 6:
				{
					if(PI[playerid][pMoney] < (price*8))
					{
						DeletePVar(playerid, "menu_business");
						SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Недостаточо денег.");
						return MagazineList(playerid, business);
					}
					GiveWeapon(playerid, 14, 1);
					SetMoney(playerid, -(price*8));
					SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Цветы приоребетены.");
					BI[business][bMoney] += price*8;
					BI[business][bIncomeDay] += price*8;
				}
				case 7:
				{
					if(PI[playerid][pMoney] < (price*12))
					{
						DeletePVar(playerid, "menu_business");
						SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Недостаточо денег.");
						return MagazineList(playerid, business);
					}
					GiveWeapon(playerid, 41, 25);
					SetMoney(playerid, -(price*12));
					SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Перцовый баллончик приобретён.");
					BI[business][bMoney] += price*12;
					BI[business][bIncomeDay] += price*12;
				}
				case 8:
				{
					if(PI[playerid][pMoney] < (price*15))
					{
						DeletePVar(playerid, "menu_business");
						SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Недостаточо денег.");
						return MagazineList(playerid, business);
					}
					if(PI[playerid][pLockpick])
					{
						DeletePVar(playerid, "menu_business");
						SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя уже есть набор инструментов для работы с замками.");
						return MagazineList(playerid, business);
					}
					PI[playerid][pLockpick] = 1;
					SetMoney(playerid, -(price*15));
					SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Набор инструментов для работы с замками приобертён.");
					BI[business][bMoney] += price*15;
					BI[business][bIncomeDay] += price*15;
				}
				case 9:
				{
					if(PI[playerid][pMoney] < (price*13))
					{
						DeletePVar(playerid, "menu_business");
						SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Недостаточо денег.");
						return MagazineList(playerid, business);
					}
					if(PI[playerid][pRope])
					{
						DeletePVar(playerid, "menu_business");
						SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя уже есть верёвка.");
						return MagazineList(playerid, business);
					}
					PI[playerid][pRope] = 1;
					SetMoney(playerid, -(price*13));
					SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Верёвка приобретена.");
					BI[business][bMoney] += price*13;
					BI[business][bIncomeDay] += price*13;
				}
				case 10:
				{
					if(PI[playerid][pMoney] < (price*7))
					{
						DeletePVar(playerid, "menu_business");
						SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Недостаточо денег.");
						return MagazineList(playerid, business);
					}
					if(PI[playerid][pMask] == 3)
					{
						DeletePVar(playerid, "menu_business");
						SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нельзя иметь более 3 масок.");
						return MagazineList(playerid, business);
					}
					PI[playerid][pMask] += 1;
					SetMoney(playerid, -(price*7));
					SendPositiveMess(playerid, "Маска приобретена. Всего масок: %d", PI[playerid][pMask]);
					BI[business][bMoney] += price*7;
					BI[business][bIncomeDay] += price*7;
				}
				case 11:
				{
					if(PI[playerid][pMoney] < (price*12))
					{
						DeletePVar(playerid, "menu_business");
						SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Недостаточо денег.");
						return MagazineList(playerid, business);
					}
					if(PI[playerid][pGPS])
					{
						DeletePVar(playerid, "menu_business");
						SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя уже есть GPS навигатор.");
						return MagazineList(playerid, business);
					}
					PI[playerid][pGPS] += 1;
					SetMoney(playerid, -(price*7));
					SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"GPS навигатор приобретён. Чтобы его использовать - "CONTRASTORANGE_HEX"/gps "WHITE_HEX"в чат");
					BI[business][bMoney] += price*12;
					BI[business][bIncomeDay] += price*12;
				}
			}
			BI[business][bProds] -= 50;
			if(BI[business][bDays]) SaveBusinessInts(business, "bMoney", BI[business][bMoney], "bProds", BI[business][bProds]);
			MagazineList(playerid, business);
			SetPlayerChatBubble(playerid, "что-то покупает", RPCMD_FORMAT, 20.0, 5000);
		}
		case DLG_CMD_FILL:
		{
			if(!response) 
			{
				DeletePVar(playerid, "fuelbusinessid");
				DeletePVar(playerid, "fuelcarid");
				return 1;
			}
			new str_1[200];
			if(!strlen(inputtext) || strval(inputtext) > 50 || strval(inputtext) < 1)
			{
				format(str_1, sizeof(str_1),""WHITE_HEX"Введи необходимое количество литров для заправки.\nЦена одного литра бензина "GREEN_HEX"%d$"WHITE_HEX". "YELLOW_HEX"Значение от 1 до 50:", BI[GetPVarInt(playerid, "fuelbusinessid")][bFuelPrice]);
				SPD(playerid,DLG_CMD_FILL,DSI,""SERVER_HEX"Заправка транспорта",str_1,"Ввести","Отмена");
				return 1;
			}
			new business = GetPVarInt(playerid, "fuelbusinessid");
			if(BI[business][bProds] < strval(inputtext)) 
			{
				DeletePVar(playerid, "fuelbusinessid");
				DeletePVar(playerid, "fuelcarid");
				return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У бизнеса недостаточно продукции.");
			}
			new vehid = GetPVarInt(playerid, "fuelcarid");
			if((VI[vehid][vFuel] + strval(inputtext)) > GetVehicleTank(GetVehicleModel(vehid)))
			{
				format(str_1, sizeof(str_1),""WHITE_HEX"Введи необходимое количество литров для заправки.\n Цена одного литра бензина "GREEN_HEX"%d$"WHITE_HEX". "DEFAULTRED_HEX"В твой бак столько не влезет.", BI[business][bFuelPrice]);
				return SPD(playerid,DLG_CMD_FILL,DSI,""SERVER_HEX"Заправка транспорта",str_1,"Ввести","Отмена");
			}
			if(PI[playerid][pMoney] < (strval(inputtext)*BI[business][bFuelPrice]))
			{
				format(str_1, sizeof(str_1),""WHITE_HEX"Введи необходимое количество литров для заправки.\n Цена одного литра бензина "GREEN_HEX"%d$"WHITE_HEX". "DEFAULTRED_HEX""NEGATIVE_MARK" Недостаточно средств.", BI[business][bFuelPrice]);
				return SPD(playerid,DLG_CMD_FILL,DSI,""SERVER_HEX"Заправка транспорта",str_1,"Ввести","Отмена");
			}
			SetMoney(playerid, -(strval(inputtext)*BI[business][bFuelPrice]));
			new fuelwait = strval(inputtext)*100, strPlayerText[20], Float:inputValue = strval(inputtext);
			TogglePlayerControllable(playerid, false);
			BI[business][bProds] -= strval(inputtext);
			BI[business][bMoney] += strval(inputtext)*BI[business][bFuelPrice];
			BI[business][bIncomeDay] += strval(inputtext)*BI[business][bFuelPrice];
			format(strPlayerText, sizeof(strPlayerText), "~r~-%d", strval(inputtext)*BI[business][bFuelPrice]);
			GameTextForPlayer(playerid,strPlayerText,2000,1);
			GameTextForPlayer(playerid,"~r~~n~~n~~n~~n~~n~~n~~n~~n~~n~REFUELING...",3000,3);
			SaveBusinessInts(business, "bMoney", BI[business][bMoney], "bProds", BI[business][bProds]);
			DeletePVar(playerid, "fuelbusinessid");
			DeletePVar(playerid, "fuelcarid");
			TI[playerid][isRefueling] = 1;
			TI[playerid][refuelingTimer] = SetTimerEx("Refueling", fuelwait, true, "iiif", playerid, vehid, inputValue, VI[vehid][vFuel]);
		}
		case DLG_SELECTCAR:
		{
			if(!response) return 1;
			if(!PI[playerid][pLicCar]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя отсутствует лицензия на вождение наземным транспортом.");
			TI[playerid][selectCarCount] = 0;
			TogglePlayerControllable(playerid, false);
			SetPlayerVirtualWorldEx(playerid, 112+playerid);
			TI[playerid][selectCar] = CreateVehicleEx(112+playerid, 82, 400, 1438.3589,737.7350,1087.6284, 180.9903, 1, 1, 600);
			SetPlayerCameraPos(playerid, 1440.0671, 730.8436, 1089.9569);
			SetPlayerCameraLookAt(playerid, 1439.7881, 731.8032, 1089.6213);
			for(new i = 0; i < sizeof(chooseCar_TD); i++)
			{
				TextDrawShowForPlayer(playerid,chooseCar_TD[i]);
				SelectTextDraw(playerid, CONTRASTORANGE_FORMAT);
			} 
			for(new i = 0; i < sizeof(chooseCar_PTD); i++) PlayerTextDrawShow(playerid,chooseCar_PTD[playerid][i]);
		}
		case DLG_CMD_OBJECT:
		{
			if(!response) DeletePVar(playerid, "objectplayerid");
			new objectplayerid = GetPVarInt(playerid, "objectplayerid");
			switch(listitem)
			{
				case 0:
				{
					if(IsPlayerAttachedObjectSlotUsed(objectplayerid, 2)) RemovePlayerAttachedObject(objectplayerid, 2);
					SetPlayerAttachedObject(objectplayerid,2,19137,2,0.100000,0.000000,0.000000,0.000000,0.000000,0.000000,1.000000,1.000000,1.000000);
					SAMF(GREY_FORMAT, "[A] %s %s[%d] выдал объект [Шляпа курицы] %s[%d]", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[objectplayerid][pName], objectplayerid);
					SCMESSF(objectplayerid,0x6ab1ffaa,"%s %s выдал тебе объект [Шляпа Курицы]", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
				}
				case 1:
				{
					if(IsPlayerAttachedObjectSlotUsed(objectplayerid, 7)) RemovePlayerAttachedObject(objectplayerid, 7);
					SetPlayerAttachedObject(objectplayerid,7, 19270, 2, 0.111052, 0.021643, -0.000846, 92.280899, 92.752510, 358.071044, 1.200000, 1.283168, 1.200000);
					SAMF(GREY_FORMAT, "[A] %s %s выдал объект [Огонь на голову] %s", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[objectplayerid][pName], objectplayerid);
					SCMESSF(objectplayerid,0x6ab1ffaa,"%s %s выдал тебе объект [Огонь на голову]", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
				}
				case 2:
				{
					if(IsPlayerAttachedObjectSlotUsed(objectplayerid, 4)) RemovePlayerAttachedObject(objectplayerid, 4);
					SetPlayerAttachedObject(objectplayerid,4, 18646, 2, 0.111052, 0.021643, -0.000846, 92.280899, 92.752510, 358.071044, 1.200000, 1.283168, 1.200000);
					SAMF(GREY_FORMAT, "[A] %s %s выдал объект [Мигалка на голову] %s", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[objectplayerid][pName], objectplayerid);
					SCMESSF(objectplayerid,0x6ab1ffaa,"%s %s выдал тебе объект [Мигалка на голову]", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
				}
				case 3:
				{
					if(IsPlayerAttachedObjectSlotUsed(objectplayerid, 7)) RemovePlayerAttachedObject(objectplayerid, 7);
					SetPlayerAttachedObject(objectplayerid,7, 19163, 2, 0.111052, 0.021643, -0.000846, 100.280899, 100.752510, 445.071044, 1.100000, 1.300000, 1.300000);
					SAMF(GREY_FORMAT, "[A] %s %s выдал объект [Черная маска] %s", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[objectplayerid][pName], objectplayerid);
					SCMESSF(objectplayerid,0x6ab1ffFF,"%s %s выдал тебе объект [Черная маска]", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
				}
				case 4:
				{
					if(IsPlayerAttachedObjectSlotUsed(objectplayerid, 0)) RemovePlayerAttachedObject(objectplayerid, 0);
					SetPlayerAttachedObject(objectplayerid,0, 18915, 2, 0.1, 0.03, -0.005, 90.0, 180.0, 90.0);
					SAMF(GREY_FORMAT, "[A] %s %s выдал объект [Бандана 1] %s", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[objectplayerid][pName], objectplayerid);
					SCMESSF(objectplayerid,0x6ab1ffaa,"%s %s выдал тебе объект [Бандана 1]", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
				}
				case 5:
				{
					if(IsPlayerAttachedObjectSlotUsed(objectplayerid, 0)) RemovePlayerAttachedObject(objectplayerid, 0);
					SetPlayerAttachedObject(objectplayerid,0, 18912, 2, 0.1, 0.03, -0.005, 90.0, 180.0, 90.0);
					SAMF(GREY_FORMAT, "[A] %s %s выдал объект [Бандана 2] %s", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[objectplayerid][pName], objectplayerid);
					SCMESSF(objectplayerid,0x6ab1ffaa,"%s %s выдал тебе объект [Бандана 2]", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
				}
				case 6:
				{
					if(IsPlayerAttachedObjectSlotUsed(objectplayerid, 0)) RemovePlayerAttachedObject(objectplayerid, 0);
					SetPlayerAttachedObject(objectplayerid,0, 18916, 2, 0.1, 0.03, -0.005, 90.0, 180.0, 90.0);
					SAMF(GREY_FORMAT, "[A] %s %s выдал объект [Бандана 3] %s", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[objectplayerid][pName], objectplayerid);
					SCMESSF(objectplayerid,0x6ab1ffaa,"%s %s выдал тебе объект [Бандана 3]", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
				}
				case 7:
				{
					if(IsPlayerAttachedObjectSlotUsed(objectplayerid, 0)) RemovePlayerAttachedObject(objectplayerid, 0);
					SetPlayerAttachedObject(objectplayerid,0, 18917, 2, 0.1, 0.03, -0.005, 90.0, 180.0, 90.0);
					SAMF(GREY_FORMAT, "[A] %s %s выдал объект [Бандана 4] %s", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[objectplayerid][pName], objectplayerid);
					SCMESSF(objectplayerid,0x6ab1ffaa,"%s %s выдал тебе объект [Бандана 4]", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
				}
				case 8:
				{
					if(IsPlayerAttachedObjectSlotUsed(objectplayerid, 0)) RemovePlayerAttachedObject(objectplayerid, 0);
					SetPlayerAttachedObject(objectplayerid,0, 18918, 2, 0.1, 0.03, -0.005, 90.0, 180.0, 90.0);
					SAMF(GREY_FORMAT, "[A] %s %s выдал объект [Бандана 5] %s", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[objectplayerid][pName], objectplayerid);
					SCMESSF(objectplayerid,0x6ab1ffaa,"%s %s выдал тебе объект [Бандана 5]", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
				}
				case 9:
				{
					if(IsPlayerAttachedObjectSlotUsed(objectplayerid, 4)) RemovePlayerAttachedObject(objectplayerid, 4);
					SetPlayerAttachedObject(objectplayerid,4, 3528, 2, 0.111052, 0.021643, -0.000846, 92.280899, 92.752510, 358.071044, 0.100000, 0.100000, 0.100000);
					SAMF(GREY_FORMAT, "[A] %s %s выдал объект [Маска дракона] %s", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[objectplayerid][pName], objectplayerid);
					SCMESSF(objectplayerid,0x6ab1ffaa,"%s %s выдал тебе объект [Маска дракона]", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
				}
				case 10:
				{
					if(IsPlayerAttachedObjectSlotUsed(objectplayerid, 4)) RemovePlayerAttachedObject(objectplayerid, 4);
					SetPlayerAttachedObject(objectplayerid,4, 18643, 2, 0.111052, 0.021643, -0.000846, 92.280899, 92.752510, 358.071044, 1.200000, 1.283168, 1.200000);
					SAMF(GREY_FORMAT, "[A] %s %s выдал объект [Лазер на голову] %s", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[objectplayerid][pName], objectplayerid);
					SCMESSF(objectplayerid,0x6ab1ffaa,"%s %s выдал тебе объект [Лазер на голову]", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
				}
				case 11:
				{
					if(IsPlayerAttachedObjectSlotUsed(objectplayerid, 0) || IsPlayerAttachedObjectSlotUsed(objectplayerid, 1) || IsPlayerAttachedObjectSlotUsed(objectplayerid, 4))
					{
						RemovePlayerAttachedObject(objectplayerid, 0);
						RemovePlayerAttachedObject(objectplayerid, 1);
						RemovePlayerAttachedObject(objectplayerid, 4);
					}
					SetPlayerAttachedObject(objectplayerid,0, 18693, 5, 1.983503, 1.558882, -0.129482, 86.705787, 308.978118, 268.198822, 1.500000, 1.500000, 1.500000);
					SetPlayerAttachedObject(objectplayerid,1, 18693, 6, 1.983503, 1.558882, -0.129482, 86.705787, 308.978118, 268.198822, 1.500000, 1.500000, 1.500000);
					SetPlayerAttachedObject(objectplayerid,4, 18965, 2, 0.111052, 0.021643, -0.000846, 92.280899, 92.752510, 358.071044, 1.200000, 1.283168, 1.200000);
					SAMF(GREY_FORMAT, "[A] %s %s выдал объект [Комплект всемогущий] %s", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[objectplayerid][pName], objectplayerid);
					SCMESSF(objectplayerid,0x6ab1ffaa,"%s %s выдал тебе объект [Комплект всемогущий]", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
				}
				case 12:
				{
					if(IsPlayerAttachedObjectSlotUsed(objectplayerid, 7)) RemovePlayerAttachedObject(objectplayerid, 7);
					SetPlayerAttachedObject(objectplayerid,7, 19078, 1, 0.329150, -0.072101, 0.156082, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
					SAMF(GREY_FORMAT, "[A] %s %s выдал объект [Попугай на плечо] %s", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[objectplayerid][pName], objectplayerid);
					SCMESSF(objectplayerid,0x6ab1ffaa,"%s %s выдал тебе объект [Попугай на плечо]", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
				}
				case 13:
				{
					if(IsPlayerAttachedObjectSlotUsed(objectplayerid, 7)) RemovePlayerAttachedObject(objectplayerid, 7);
					SetPlayerAttachedObject(objectplayerid,7, 354, 1, 0.329150, -0.072101, 0.156082, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
					SAMF(GREY_FORMAT, "[A] %s %s выдал объект [Яркий свет] %s", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[objectplayerid][pName], objectplayerid);
					SCMESSF(objectplayerid,0x6ab1ffaa,"%s %s выдал тебе объект [Яркий свет]", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
				}
				case 14:
				{
					if(IsPlayerAttachedObjectSlotUsed(objectplayerid, 1)) RemovePlayerAttachedObject(objectplayerid, 1);
					SetPlayerAttachedObject(objectplayerid,1, 356, 6, 0.013610, -0.021393, -0.144862, 2.354303, 354.413848, 0.219168, 3.034477, 3.000000, 3.000000);
					SAMF(GREY_FORMAT, "[A] %s %s выдал объект [Большой M4 в руку] %s", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[objectplayerid][pName], objectplayerid);
					SCMESSF(objectplayerid,0x6ab1ffaa,"%s %s выдал тебе объект [Большой M4 в руку]", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
				}
				case 15:
				{
					if(IsPlayerAttachedObjectSlotUsed(objectplayerid, 1)) RemovePlayerAttachedObject(objectplayerid, 1);
					SetPlayerAttachedObject(objectplayerid,1, 19086, 8, -0.049768, -0.014062, -0.108385, 87.458297, 263.478149, 184.123764, 0.622413, 1.041609, 1.012785);
					SAMF(GREY_FORMAT, "[A] %s %s выдал объект [Пенис] %s", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[objectplayerid][pName], objectplayerid);
					SCMESSF(objectplayerid,0x6ab1ffaa,"%s %s выдал тебе объект [Пенис]", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
				}
				case 16:
				{
					if(IsPlayerAttachedObjectSlotUsed(objectplayerid, 0)) RemovePlayerAttachedObject(objectplayerid, 0);
					SetPlayerAttachedObject(objectplayerid,0, 19078, 1, -1.097527, -0.348305, -0.008029, 0.000000, 0.000000, 0.000000, 8.073966, 8.073966, 8.073966);
					SAMF(GREY_FORMAT, "[A] %s %s выдал объект [Костюм попугая] %s", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[objectplayerid][pName], objectplayerid);
					SCMESSF(objectplayerid,0x6ab1ffaa,"%s %s выдал тебе объект [Костюм попугая]", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
				}
				case 17:
				{
					RemovePlayerAttachedObject(objectplayerid, 0);
					RemovePlayerAttachedObject(objectplayerid, 1);
					RemovePlayerAttachedObject(objectplayerid, 2);
					RemovePlayerAttachedObject(objectplayerid, 3);
					RemovePlayerAttachedObject(objectplayerid, 4);
					RemovePlayerAttachedObject(objectplayerid, 5);
					RemovePlayerAttachedObject(objectplayerid, 6);
					RemovePlayerAttachedObject(objectplayerid, 7);
					RemovePlayerAttachedObject(objectplayerid, 8);
					RemovePlayerAttachedObject(objectplayerid, 9);
					SAMF(GREY_FORMAT, "[A] %s %s удалил все объкты у %s", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, PI[objectplayerid][pName], objectplayerid);
					SCMESSF(objectplayerid,0x6ab1ffaa,"%s %s удалил у тебя все объекты.", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
				}
			}
			DeletePVar(playerid, "objectplayerid");
		}
		case DLG_MINE_ACTOR:
		{
			if(!response) return 1;
			switch(listitem+1)
			{
				case 1:
				{
					SetActorChatBubble(minerActor_HQ, "На этой шахте ты можешь добыть сырьё. Его можно продать,\nлибо после обработки использовать в личных целях.\nКупить кирку для добычи сырья можешь у меня", GREY_FORMAT, 20.0, 10000);
					ApplyDynamicActorAnimation(minerActor_HQ, "PED", "IDLE_CHAT", 8.1, false, false, false, false, 0);
				}
				case 2:
				{
					if(PI[playerid][pDefaultPickaxe])
					{
						SetActorChatBubble(minerActor_HQ, "У тебя уже есть кирка", GREY_FORMAT, 20.0, 5000);
						ApplyDynamicActorAnimation(minerActor_HQ, "PED", "IDLE_CHAT", 8.1, false, false, false, false, 0);
						return 1;
					}
					SetMoney(playerid, -20000);
					SetActorChatBubble(minerActor_HQ, "Отлично! Теперь ты готов к работе", GREY_FORMAT, 20.0, 5000);
					SendClueMess(playerid, "Чтобы добыть ресурс подойди к определённому камню и нажми ALT");
					ApplyDynamicActorAnimation(minerActor_HQ, "PED", "IDLE_CHAT", 8.1, false, false, false, false, 0);
					PI[playerid][pDefaultPickaxe] = 1;
				}
			}
		}
	}
	return 1;
}

function: OnPasswordHashed(playerid)
{
	new hash[BCRYPT_HASH_LENGTH];
	bcrypt_get_hash(hash);
	PI[playerid][pHash] = hash;
	if(GetPVarInt(playerid, "wrongPass")) DeletePVar(playerid, "wrongPass");
	if(GetPVarInt(playerid, "player_register_password")) DeletePVar(playerid, "player_register_password");
	return OnPlayerRegister(playerid);
}

function: OnPasswordChecked(playerid)
{
    new bool:match = bcrypt_is_equal();
	if(match == true)
	{
		if(GetPVarInt(playerid, "wrongPass")) DeletePVar(playerid, "wrongPass");
		if(GetPVarInt(playerid, "player_register_password")) DeletePVar(playerid, "player_register_password");
		KillTimer(playerAuthTimer[playerid]);
		DeletePVar(playerid, "authTimerTick");
		PI[playerid][pAuthTick] = 0;
		query[0]=EOS;
		mysql_format(connects, query, 350, "SELECT * FROM "TABLE_BANLOG" WHERE `name` = '%e' LIMIT 1", PI[playerid][pName]);
		return mysql_tquery(connects, query, "CheckBan", "is", playerid, PI[playerid][pName]);
	}
	else
	{
		SetPVarInt(playerid, "wrongPass", GetPVarInt(playerid, "wrongPass") + 1);
		if(GetPVarInt(playerid, "wrongPass") == 3)
		{
			SCMESS(playerid, WHITE_FORMAT, "Исчерпаны все попытки ввода пароля!");
			SCMESS(playerid, WHITE_FORMAT, "/quit в чат для выхода.");
			return KickEx(playerid);
		}
		format(g_str, 226, ""WHITE_HEX"Приветствуем на "SERVER_NAME_FULL"!\n\
		Игровой ник: "CONTRASTORANGE_HEX"%s"WHITE_HEX"\n\
		Аккаунт зарегистрирован на сервере.\n\n\
		"DEFAULTRED_HEX"Пароль введён неверно! Проверь раскладку и Caps Lock.\n"WHITE_HEX"Осталось попыток: %d", PI[playerid][pName], (3 - GetPVarInt(playerid, "wrongPass")));
		return SPD(playerid, DLG_LOGIN, DSP, ""SERVER_HEX"Авторизация | Пароль", g_str, "Далее", "Отмена");
	}
}

function: OnPasswordCheckedForALogin(playerid, password[])
{
    new bool:match = bcrypt_is_equal();
	if(match == true)
	{
		SCMESS(playerid, DEFAULTRED_FORMAT, "Не ставь пароль от своего аккаунта!");
		return SPD(playerid, DLG_ALOGIN_REG, DSI, ""SERVER_HEX"Регистрация админ пароля", textAuth[2], !"Создать", !"Отмена");
	}
	else
	{
		new callback_name[19] = "OnALoginPassHashed", callback_format[3] = "d";
		return bcrypt_hash(password, BCRYPT_COST, callback_name, callback_format, playerid);
	}
}

function: OnALoginPassHashed(playerid)
{
	new hash[BCRYPT_HASH_LENGTH];
	bcrypt_get_hash(hash);
	AI[playerid][aHash] = hash;
	if(!AI[playerid][FD]) SAMF(SOFTGREEN_FORMAT, "[A] Зарегистрирован новый модер %s[%d].", PI[playerid][pName], playerid);
	SCMESS(playerid, GREEN_FORMAT, "Пароль зарегистрирован. Введи /alogin для авторизации.");
	query[0]=EOS;
	mysql_format(connects, query, 140, "UPDATE "TABLE_ADMINS" SET `apass` = '%e' WHERE `admin` = '%d' LIMIT 1", AI[playerid][aHash], PI[playerid][pID]);
	return mysql_tquery(connects, query, "", "");
}

function: OnALoginPassChecked(playerid)
{
    new bool:match = bcrypt_is_equal();
	if(match == true)
	{
		if(GetPVarInt(playerid, "wrongAPass")) DeletePVar(playerid, "wrongAPass");
		SCMESSF(playerid, WHITE_FORMAT, "Успешная авторизация, %s%s.", adminRank[AI[playerid][aLevel]][pdColor], adminRank[AI[playerid][aLevel]][pdRank]);
		AI[playerid][aLoggedIn] = true;
		if(AI[playerid][aLevel] != 8 || !AI[playerid][FD]) SAMF(SOFTGREEN_FORMAT, "[A] %s %s[%d] авторизировался.", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid);
		return Iter_Add(Admin, playerid);
	}
	else
	{
		SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Неверный пароль!");
		SetPVarInt(playerid, "wrongAPass", GetPVarInt(playerid, "wrongAPass") + 1);
		if(GetPVarInt(playerid, "wrongAPass") == 3)
		{
			DeletePVar(playerid, "wrongAPass");
			SCMESS(playerid, WHITE_FORMAT, "Все попытки ввода пароля были исчерпаны!");
			SCMESS(playerid, WHITE_FORMAT, "По восстановлению в лс tg: "SERVER_HEX"@prigman");
			KickEx(playerid);
			return SAMF(YELLOW_FORMAT, "[A] %s %s ввёл неверный пароль несколько раз и был кикнут!", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName]);
		}
		return SPD(playerid, DLG_ALOGIN_AUTH, DSP, !""DEFAULTRED_HEX"Авторизация", ""WHITE_HEX"Введи пароль", "Вход", "Отмена");
	}
}

function: LoadMaterials()
{
	new rows, message_true[55], message_false[45];
	format(message_true, sizeof(message_true), "[LoadMaterials] Warehouses have been successfully loaded.");
	format(message_false, sizeof(message_false), "[LoadMaterials] Warehouses haven't loaded.");
	cache_get_row_count(rows);
	if(!rows)
	{
		printf(message_false);
	    return 1;
	}
	cache_get_value_name_int(0, "Mayor", materials[mMayor]);
	cache_get_value_name_int(0, "SAPD", materials[mLSPD]);
	cache_get_value_name_int(0, "FBI", materials[mFBI]);
	cache_get_value_name_int(0, "SA News", materials[mNews]);
	printf(message_true);
	return 1;
}

function: LoadHouses()
{
	static rows;
	new string_cb[35];
	cache_get_row_count(rows);
	if(!rows)
	{
		printf("[LoadHouses] Houses haven't loaded.");
	    return 1;
	}
	for(new i=0; i < rows; i++)
	{
		cache_get_value_index_int(i, 0, HI[i][hID]);
		cache_get_value_index_float(i, 1, HI[i][hPosX]);
		cache_get_value_index_float(i, 2, HI[i][hPosY]);
		cache_get_value_index_float(i, 3, HI[i][hPosZ]);
		cache_get_value_index_float(i, 4, HI[i][hEnterIntX]);
		cache_get_value_index_float(i, 5, HI[i][hEnterIntY]);
		cache_get_value_index_float(i, 6, HI[i][hEnterIntZ]);
		cache_get_value_index_float(i, 7, HI[i][hCarx]);
		cache_get_value_index_float(i, 8, HI[i][hCary]);
		cache_get_value_index_float(i, 9, HI[i][hCarz]);
		cache_get_value_index_float(i, 10, HI[i][hCara]);
		cache_get_value_index_int(i, 11, HI[i][hInt]);
		cache_get_value_index_int(i, 12, HI[i][hLock]);
		cache_get_value_index_int(i, 13, HI[i][hSafe]);
		cache_get_value_index_int(i, 14, HI[i][hSignal]);
		cache_get_value_index_int(i, 15, HI[i][hCupboardBought]);
		cache_get_value_index(i, 16, string_cb, 35), sscanf(string_cb, "p<,>a<i>[3]", HI[i][hCupboard]);
		cache_get_value_index_int(i, 17, HI[i][hMats]);
		cache_get_value_index_int(i, 18, HI[i][hMoney]);
		cache_get_value_index_int(i, 19, HI[i][hHeal]);
		cache_get_value_index_int(i, 20, HI[i][hDrugs]);
		cache_get_value_index_int(i, 21, HI[i][hDeagle]);
		cache_get_value_index_int(i, 22, HI[i][hAK47]);
		cache_get_value_index_int(i, 23, HI[i][hShotgun]);
		cache_get_value_index_int(i, 24, HI[i][hM4]);
		cache_get_value_index_int(i, 25, HI[i][hSdpistol]);
		cache_get_value_index_int(i, 26, HI[i][hRifle]);
		cache_get_value_index_int(i, 27, HI[i][hMP5]);
		cache_get_value_index(i, 28, HI[i][hOwner], MAX_PLAYER_NAME+1);
		cache_get_value_index_int(i, 29, HI[i][hType]);
		cache_get_value_index_int(i, 30, HI[i][hDice]);
		cache_get_value_index_int(i, 31, HI[i][hDays]);
		cache_get_value_index_int(i, 32, HI[i][hCost]);
		//HI[i][hID] = TOTALHOUSE;
		if(!HI[i][hOwner])
		{
			HI[i][hPick] = CreateDynamicPickup(1273, 23, HI[i][hPosX], HI[i][hPosY], HI[i][hPosZ], 0);
			HI[i][hIcon] = CreateDynamicMapIcon(HI[i][hPosX], HI[i][hPosY], HI[i][hPosZ], 31, 0, 0, -1, -1, 180);
		}
		if(HI[i][hOwner])
		{
			HI[i][hPick] = CreateDynamicPickup(1272, 23, HI[i][hPosX], HI[i][hPosY], HI[i][hPosZ], 0);
			HI[i][hIcon] = CreateDynamicMapIcon(HI[i][hPosX], HI[i][hPosY], HI[i][hPosZ], 32, 0, 0, -1, -1, 180);
		}
		CreateDynamic3DTextLabel("ALT для выхода", SERVER_FORMAT, HI[i][hEnterIntX], HI[i][hEnterIntY], HI[i][hEnterIntZ], 5.0);
		TOTALHOUSE++;
	}
	printf("[LoadHouses] Houses have been successfully loaded. Total houses: %d.", TOTALHOUSE);
	return 1;
}

function: LoadBusiness()
{
	static rows;
	cache_get_row_count(rows);
	if(!rows)
	{
		printf("[LoadBusiness] Businesses haven't loaded.");
	    return 1;
	}
	for(new i=0; i < rows; i++)
	{
		cache_get_value_index_int(i, 0, BI[i][bID]);
		cache_get_value_index_int(i, 1, BI[i][bType]);
		cache_get_value_index_float(i, 2, BI[i][bPosX]);
		cache_get_value_index_float(i, 3, BI[i][bPosY]);
		cache_get_value_index_float(i, 4, BI[i][bPosZ]);
		cache_get_value_index_float(i, 5, BI[i][bEnterIntX]);
		cache_get_value_index_float(i, 6, BI[i][bEnterIntY]);
		cache_get_value_index_float(i, 7, BI[i][bEnterIntZ]);
		cache_get_value_index_int(i, 8, BI[i][bInt]);
		cache_get_value_index_float(i, 9, BI[i][bPickExitX]);
		cache_get_value_index_float(i, 10, BI[i][bPickExitY]);
		cache_get_value_index_float(i, 11, BI[i][bPickExitZ]);
		cache_get_value_index_float(i, 12, BI[i][bCPposX]);
		cache_get_value_index_float(i, 13, BI[i][bCPposY]);
		cache_get_value_index_float(i, 14, BI[i][bCPposZ]);
		if(BI[i][bType] == 2)
		{
			cache_get_value_index_float(i, 15, BI[i][bFuelPosX]);
			cache_get_value_index_float(i, 16, BI[i][bFuelPosY]);
			cache_get_value_index_float(i, 17, BI[i][bFuelPosZ]);
		}
		if(BI[i][bType] == 4)
		{
			cache_get_value_index_float(i, 18, BI[i][bDressingX]);
			cache_get_value_index_float(i, 19, BI[i][bDressingY]);
			cache_get_value_index_float(i, 20, BI[i][bDressingZ]);
			cache_get_value_index_float(i, 21, BI[i][bDressingA]);
		}
		cache_get_value_index(i, 22, BI[i][bName], 30);
		cache_get_value_index(i, 23, BI[i][bOwner], MAX_PLAYER_NAME+1);
		cache_get_value_index_int(i, 24, BI[i][bLock]);
		cache_get_value_index_int(i, 25, BI[i][bDice]);
		cache_get_value_index_int(i, 26, BI[i][bDays]);
		cache_get_value_index_int(i, 27, BI[i][bProds]);
		cache_get_value_index_int(i, 28, BI[i][bMoney]);
		cache_get_value_index_int(i, 29, BI[i][bProdsPrice]);
		if(BI[i][bType] == 2) cache_get_value_index_int(i, 30, BI[i][bFuelPrice]);
		cache_get_value_index_int(i, 31, BI[i][bCost]);
		CreateDynamicPickup(19132, 23, BI[i][bPosX], BI[i][bPosY], BI[i][bPosZ], 0);
		BI[i][bExitPick] = CreateDynamicPickup(19132, 23, BI[i][bPickExitX], BI[i][bPickExitY], BI[i][bPickExitZ], i);
		BI[i][bMenuPick] = CreateDynamicCP(BI[i][bCPposX], BI[i][bCPposY], BI[i][bCPposZ], 1.0, i, BI[i][bInt]);
		switch(BI[i][bType])
		{
			case 1: CreateDynamicMapIcon(BI[i][bPosX], BI[i][bPosY], BI[i][bPosZ], 17, 0, 0, -1, -1, 180);
			case 2://fuel
			{
				CreateDynamicPickup(1650, 23, BI[i][bFuelPosX], BI[i][bFuelPosY], BI[i][bFuelPosZ], 0);
				CreateDynamicMapIcon(BI[i][bPosX], BI[i][bPosY], BI[i][bPosZ], 51, 0, 0, -1, -1, 180);
			}
			case 3: CreateDynamicMapIcon(BI[i][bPosX], BI[i][bPosY], BI[i][bPosZ], 6, 0, 0, -1, -1, 180);
			case 4: CreateDynamicMapIcon(BI[i][bPosX], BI[i][bPosY], BI[i][bPosZ], 45, 0, 0, -1, -1, 180);
			default: CreateDynamicMapIcon(BI[i][bPosX], BI[i][bPosY], BI[i][bPosZ], 17, 0, 0, -1, -1, 180);
		}
		TOTALBUSINESS++;
		//BI[i][bID] = TOTALBUSINESS;
		UpdateBusiness(i);
	}
	printf("[LoadBusiness] Businesses have been successfully loaded. Total businesses: %d.", TOTALBUSINESS);
	return 1;
}

function: SaveMaterials(const frac[], mats)
{
	query[0]=EOS;
	mysql_format(connects, query, 90, "UPDATE "TABLE_MATERIALS" SET `%s` = '%d' LIMIT 1", frac, mats);
	return mysql_tquery(connects, query);
}

function: Refueling(playerid, refuel_vehicle_id, Float:fuelamount, Float:oldfuel)
{
	if((VI[refuel_vehicle_id][vFuel] - oldfuel) < fuelamount)
	{
		GameTextForPlayer(playerid,"~r~~n~~n~~n~~n~~n~~n~~n~~n~~n~REFUELING...",3000,3);
		VI[refuel_vehicle_id][vFuel] += fuelamount / 4.0;
	}
	else if((VI[refuel_vehicle_id][vFuel] - oldfuel) == fuelamount)
	{
		KillTimer(TI[playerid][refuelingTimer]);
		TI[playerid][isRefueling] = 0;
		TogglePlayerControllable(playerid, true);
		GameTextForPlayer(playerid,"~g~~n~~n~~n~~n~~n~~n~~n~~n~~n~REFUELED!",2000,3);
	}
	return 1;
}

function: PlayerRegCheck(playerid, race_check)
{
    if(race_check != g_MysqlRaceCheck[playerid])
	{
		SCMESS(playerid, DARKRED_FORMAT, "Ошибка: #1");
		return KickEx(playerid);
	}
	new rows, string[220];
	cache_get_row_count(rows);
	if(rows)
	{
		playerAuthTimer[playerid] = SetTimerEx("AuthTimer", 1000, true, "d", playerid);
		cache_get_value_name(0, "regip", PI[playerid][pRegIp], MAX_IP_LENGHT);
		cache_get_value_name(0, "salt", PI[playerid][pHash], BCRYPT_HASH_LENGTH);
		SAMF(GREY_FORMAT, "[A] %s[%d] подключается. Reg IP: %s | IP now: %s", PI[playerid][pName], playerid, PI[playerid][pRegIp], PI[playerid][pIP]);
		PI[playerid][Cache_ID] = cache_save();
		format(string,sizeof(string),""WHITE_HEX"Приветствуем на "SERVER_NAME_FULL"!\n\
		Игровой ник: "CONTRASTORANGE_HEX"%s"WHITE_HEX"\n\
	 	Аккаунт зарегистрирован на сервере.\n\n\
		Введите пароль ниже.\n\n", PI[playerid][pName]);
		return SPD(playerid, DLG_LOGIN, DSP, ""SERVER_HEX"Авторизация | Пароль", string, "Далее", "Отмена");
	}
	else
	{
		playerAuthTimer[playerid] = SetTimerEx("RegisterTimer", 1000, true, "d", playerid);
		SAMF(GREY_FORMAT, "[A] %s[%d] подключается впервые. IP: %s", PI[playerid][pName], playerid, PI[playerid][pIP]);
		return SPD(playerid, DLG_FIRST_CONNECT, DSM, ""SERVER_HEX"Добро пожаловать!", textAuth[3], "Да","Нет");
	}
}

function: PlayerKick(playerid) return Kick(playerid);

function: OnAccountCreated(playerid) return PI[playerid][pID] = cache_insert_id();

function: CheckMail(playerid, email[])
{
	if(cache_num_rows() > 0)
	{
 		SCMESS(playerid, WHITE_FORMAT, "Данная почта уже зарегистрирована.");
		return SPD(playerid, DLG_REG_EMAIL, DSI, ""SERVER_HEX"Регистрация | Электронная почта", textAuth[1], "Далее", "Пропустить");
	}
    strmid(PI[playerid][pEmail], email, 0, strlen(email), MAX_EMAIL_LENGHT+1);
    PI[playerid][isEmail] += 1;
	return SPD(playerid, DLG_REG_GENDER, DSM, ""SERVER_HEX"Регистрация | Выбор пола", ""WHITE_HEX"Выбери пол персонажа:", "Мужской", "Женский");
}

function: SecUpdate()
{
    new hour, minute, second, weatherChange = random(1);
	gettime(hour, minute, second);
	if((hour == 0 && minute == 0))
	{
		for(new i=0; i < TOTALHOUSE; i++)
		{
			if(!HI[i][hDays]) continue;
			HI[i][hDays] -= 1;
			if(!HI[i][hDays] && HI[i][hOwner])
			{
				ClearHouse(i);
				UpdateHouse(i);
			}
		}
		for(new i=0; i < TOTALBUSINESS; i++)
		{
			if(!BI[i][bDays]) continue;
			if(BI[i][bIncomeDay]) BI[i][bIncomeDay] = 0;
			BI[i][bDays] -= 1;
			if(!BI[i][bDays] && BI[i][bOwner])
			{
				ClearBusiness(i);
				UpdateBusiness(i);
			}
		}
		foreach(new i : Player)
		{
			if(!pLoggedIn{i} || !IsPlayerConnected(i)) continue;
			PI[i][pDayOnline] = 0;
			PI[i][pAFKDayTime] = 0;
		}
		mysql_tquery(connects, "UPDATE "TABLE_ACCOUNTS" SET `afkdayonline` = '0' WHERE `afkdayonline` != '0'");
		mysql_tquery(connects, "UPDATE "TABLE_ACCOUNTS" SET `dayonline` = '0' WHERE `dayonline` != '0'");
	}
	if((hour > ghour) || (hour == 0 && ghour == 23))
	{
		ghour = hour;
		PayDay();
		SetWorldTime(hour+3);
		new currentTime[30];
		format(currentTime, sizeof(currentTime), "Время на сервере сейчас %d:00.", hour);
		SMTA(YELLOW_FORMAT, currentTime);
	}
	if((hour == 10) || (hour == 13) || (hour == 15) || (hour == 18) || (hour == 21))
	{
		if((minute == 3) || (minute == 25))
		{
			if(raceStatus == 0) StartRace();
		}
	}
	if((hour == 0) || (hour == 4) || (hour == 8) || (hour == 12) || (hour == 16) || (hour == 20))
	{
		switch(weatherChange)
		{
			case 1: SetWeather(random(20));
		}
	}
	if(raceStatus != 0)
	{
		if(raceTime != 0) raceTime--;
		if(raceStatus == 1)
		{
		    if(raceTime == 300) SMTA(YELLOW_FORMAT, "[Мероприятие] "WHITE_HEX"До начала гонок 5 минут.");
			if(raceTime == 120) SMTA(YELLOW_FORMAT, "[Мероприятие] "WHITE_HEX"До начала гонок 2 минуты.");
			if(!raceTime)
			{
			    new carid, var_count_race_players = 0;
			    foreach(new i : Player) 
				{
					if(!pLoggedIn{i} || !IsPlayerConnected(i)) continue;
					if(racePlayerReg{i}) var_count_race_players++;
				}
			    if(var_count_race_players > 1)
			    {
				    foreach(new i : Player)
				    {
				        if(!pLoggedIn{i} || !IsPlayerConnected(i) || !racePlayerReg{i}) continue;
				        TogglePlayerControllable(i, false);
				        SetPlayerPosEx(i, raceVehiclePos[var_count_race_players][0], raceVehiclePos[var_count_race_players][1], raceVehiclePos[var_count_race_players][2], 1, 0);
				        carid = CreateVehicleEx(1, 0, 541, raceVehiclePos[var_count_race_players][0], raceVehiclePos[var_count_race_players][1], raceVehiclePos[var_count_race_players][2], raceVehiclePos[var_count_race_players][2], random(90), random(90), 3600);
						var_count_race_players++;
						VI[carid][vFuel] = GetVehicleTank(GetVehicleModel(carid));
						raceVehiclePlayer[i] = carid;
						PutPlayerInVehicle(i, carid, 0);
						SetVehicleVariables(carid, true, true, false, false, false, false, false);
						ResetPlayerWeapons(i);
						raceMarkPlayer[i] = 0;
						UpdatePlayerRaceMark(i);
				    }
				    raceStatus = 2;
			    	raceTime = 20;
			    }
			    else
			    {
			        foreach(new i : Player)
					{
						if(!pLoggedIn{i} || !IsPlayerConnected(i) || !racePlayerReg{i}) continue;
						racePlayerReg{i} = 0;
					}
			        SMTA(YELLOW_FORMAT, "[Мероприятие] "WHITE_HEX"Регистрация на гонки отменена, недостаточно участников.");
			        raceStatus = raceTime = 0;
			    }
			}
		}
		else if(raceStatus == 2)
		{
		    if(raceTime > 0) format(g_str, 16, "~r~%d", raceTime);
		    else format(g_str, 16, "~g~GO", raceTime);
		   	foreach(new i : Player)
		    {
		        if(!racePlayerReg{i} || !IsPlayerConnected(i) || !pLoggedIn{i}) continue;
		        GameTextForPlayer(i, g_str, 1100, 4);
		        if(raceTime == 0) TogglePlayerControllable(i, true);
		 	}
		 	if(raceTime == 0)
		 	{
		 	    raceStatus = 3;
		 	    raceTime = 600;
		 	}
		}
		else if(raceStatus == 3)
		{
		    if(raceFinishPlayerID == 0)
			{
			    if(GetRacePlayersAmount() == 0) SMTA(YELLOW_FORMAT, "[Мероприятие] "WHITE_HEX"Гонки окончены, все игроки покинули гонку.");
			    raceTime = 0;
	       	}
			if(raceTime == 0) raceStatus = 0;
		}
	}
	return 1;
}

function: LoadAccount(playerid)
{
    new rows;
	cache_get_row_count(rows);
	if(!rows) 
	{
		ClearRegisterData(playerid);
		return SPD(playerid, DLG_REGISTER, DSI, ""SERVER_HEX"Регистрация | Пароль", textAuth[0], "Далее", "Отмена");
	}
    cache_get_value_name_int(0, "id", PI[playerid][pID]);
    cache_get_value_name_int(0, "isemail", PI[playerid][isEmail]);
    cache_get_value_name_int(0, "gender", PI[playerid][pGender]);
    cache_get_value_name_int(0, "skin", PI[playerid][pSkin]);
    cache_get_value_name_int(0, "level", PI[playerid][pLevel]);
    cache_get_value_name_int(0, "exp", PI[playerid][pExp]);
	//cache_get_value_name_int(0, "age", PI[playerid][pAge]);
	cache_get_value_name_int(0, "riflesling", PI[playerid][pRifleSling]);
	cache_get_value_name_int(0, "holster", PI[playerid][pHolster]);
	cache_get_value_name_int(0, "showgun", PI[playerid][pShowGun]);
    cache_get_value_name_int(0, "money", PI[playerid][pMoney]);
	cache_get_value_name_int(0, "idcard", PI[playerid][pIdCard]);
	cache_get_value_name_int(0, "cardseria", PI[playerid][pIdSeria]);
	cache_get_value_name_int(0, "cardnumber", PI[playerid][pIdNumber]);
	cache_get_value_name_int(0, "phone", PI[playerid][pPhone]);
	cache_get_value_name_int(0, "phonenum", PI[playerid][pPhoneNum]);
	cache_get_value_name_int(0, "book", PI[playerid][pBook]);
	cache_get_value_name_int(0, "phonebook", PI[playerid][pPhoneBook]);
	cache_get_value_name_int(0, "lockpick", PI[playerid][pLockpick]);
	cache_get_value_name_int(0, "rope", PI[playerid][pRope]);
	cache_get_value_name_int(0, "mask", PI[playerid][pMask]);
	cache_get_value_name_int(0, "mask", PI[playerid][pGPS]);
	cache_get_value_name_int(0, "bank", PI[playerid][pBank]);
	cache_get_value_name_int(0, "donate", PI[playerid][pDonate]);
    cache_get_value_name_float(0, "hp", PI[playerid][pHp]);
	cache_get_value_name_float(0, "armour", PI[playerid][pArmour]);
	cache_get_value_name_float(0, "pVehX", PI[playerid][pVehX]);
	cache_get_value_name_float(0, "pVehY", PI[playerid][pVehY]);
	cache_get_value_name_float(0, "pVehZ", PI[playerid][pVehZ]);
	cache_get_value_name_float(0, "pVehA", PI[playerid][pVehA]);
	cache_get_value_name_float(0, "pVehFuel", PI[playerid][pVehFuel]);
	cache_get_value_name_float(0, "pVehHP", PI[playerid][pVehHP]);
	cache_get_value_name_int(0, "pVehModel", PI[playerid][pVehModel]);
	cache_get_value_name_int(0, "pVehColorP", PI[playerid][pVehColorP]);
	cache_get_value_name_int(0, "pVehColorS", PI[playerid][pVehColorS]);
	cache_get_value_name_int(0, "house", PI[playerid][pHouse]);
	cache_get_value_name_int(0, "business", PI[playerid][pBusiness]);
	cache_get_value_name_int(0, "adminMessages", PI[playerid][pAdminMess]);
	cache_get_value_name_int(0, "gChatMessages", PI[playerid][pGchatMess]);
    cache_get_value_name_int(0, "warns", PI[playerid][pWarns]);
	cache_get_value_name_int(0, "warn_active", PI[playerid][pActiveWarn]);
	cache_get_value_name_int(0, "warn_time", PI[playerid][punWarnstime]);
	cache_get_value_name_int(0,	"leader", PI[playerid][pLeader]);
	cache_get_value_name_int(0,	"model", PI[playerid][pModel]);
	cache_get_value_name_int(0,	"rank", PI[playerid][pRank]);
	cache_get_value_name_int(0,	"member", PI[playerid][pMember]);
	cache_get_value_name_int(0,	"vigs", PI[playerid][pVigs]);
	cache_get_value_name_int(0,	"houronline", PI[playerid][pHourOnline]);
	cache_get_value_name_int(0,	"allonline", PI[playerid][pAllOnline]);
	cache_get_value_name_int(0,	"dayonline", PI[playerid][pDayOnline]);
	cache_get_value_name_int(0,	"afkdayonline", PI[playerid][pAFKDayTime]);
	cache_get_value_name_int(0,	"heals", PI[playerid][pHeal]);
	cache_get_value_name_int(0,	"mats", PI[playerid][pMats]);
	cache_get_value_name_int(0,	"licCar", PI[playerid][pLicCar]);
	cache_get_value_name_int(0,	"licBoat", PI[playerid][pLicBoat]);
	cache_get_value_name_int(0,	"licPlane", PI[playerid][pLicPlane]);
	cache_get_value_name_int(0,	"zakonp", PI[playerid][pZakon]);
	cache_get_value_name_int(0,	"mute", PI[playerid][pMute]);
	cache_get_value_name_int(0,	"GCmute", PI[playerid][pGCMute]);
    cache_get_value_name(0, "email", PI[playerid][pEmail], MAX_EMAIL_LENGHT+1);
	cache_get_value_name(0, "geton_ip", PI[playerid][pGetonIP], MAX_IP_LENGHT);
	cache_get_value_name(0, "game_reg_date", PI[playerid][pRegDate], MAX_DATE_LENGHT);
 	cache_get_value_name(0, "weapons", PI[playerid][pWeaponsDB],64),sscanf(PI[playerid][pWeaponsDB], "p<,>a<i>[13]",PI[playerid][Weapon]);
    cache_get_value_name(0, "ammos", PI[playerid][pAmmoDB],64),sscanf(PI[playerid][pAmmoDB], "p<,>a<i>[13]",PI[playerid][Ammo]);
	query[0]=EOS;
    mysql_format(connects, query, 130, "SELECT * FROM "TABLE_DEMORGAN" WHERE `id` = '%d' LIMIT 1", PI[playerid][pID]);
    return mysql_tquery(connects, query, "LoadDemorgan", "i", playerid);
}

function: LoadAdmin(playerid)
{
    new rows;
	cache_get_row_count(rows);
	if(rows)
	{
		cache_get_value_name(0, "apass", AI[playerid][aHash], BCRYPT_HASH_LENGTH);
		cache_get_value_name_int(0, "alevel", AI[playerid][aLevel]);
		cache_get_value_name_int(0, "avigs", AI[playerid][aVigs]);
		cache_get_value_name_int(0, "fd", AI[playerid][FD]);
		cache_get_value_name_int(0, "online_saturday", AI[playerid][aOnlineSaturday]);
		cache_get_value_name_int(0, "online_sunday", AI[playerid][aOnlineSunday]);
		cache_get_value_name_int(0, "online_monday", AI[playerid][aOnlineMonday]);
		cache_get_value_name_int(0, "online_tuesday", AI[playerid][aOnlineTuesday]);
		cache_get_value_name_int(0, "online_wednesday", AI[playerid][aOnlineWednesday]);
		cache_get_value_name_int(0, "online_thursday", AI[playerid][aOnlineThursday]);
		cache_get_value_name_int(0, "online_friday", AI[playerid][aOnlineFriday]);
		cache_get_value_name_int(0, "differentIP", AI[playerid][aDifferentIP]);
	}
	pLoggedIn{playerid} = 1;
	PI[playerid][pTimer] = SetTimerEx("PlayerTimer", 1000, true, "i", playerid);
	new ips[4], str[7], tempGetonIp[16], tempCurrentIp[16];
	format(tempGetonIp, sizeof(tempGetonIp), "%s", PI[playerid][pGetonIP]);
	format(tempCurrentIp, sizeof(tempCurrentIp), "%s", PI[playerid][pIP]);
	sscanf(tempCurrentIp, "p<.>dddd", ips[0], ips[1], ips[2], ips[3]);// получаем ип адрес и каждое значение пишем в отдельную переменную
	format(str, sizeof(str), "%d",ips[0]+ips[1]);
	strmid(tempGetonIp, str, 0, strlen(str), sizeof(str));
	if(AI[playerid][aLevel] && !AI[playerid][FD])
	{
		if(strcmp(tempGetonIp, str, true) != 0 || AI[playerid][aDifferentIP])
		{
			SAMF(DEFAULTRED_FORMAT, "[A] Внимание! У %s[%d] не совпадают IP адреса, возможно, взлом:", PI[playerid][pName], playerid);
			SAMF(DEFAULTRED_FORMAT, "Прошлый: "WHITE_HEX"%s"DEFAULTRED_HEX" | Сейчас: "WHITE_HEX"%s"DEFAULTRED_HEX"]", PI[playerid][pGetonIP], PI[playerid][pIP]);
			AI[playerid][aDifferentIP] += 1;
			mysql_format(connects, query, 160, "UPDATE "TABLE_ADMINS" SET `differentIP`='%d' WHERE `id` = '%d' LIMIT 1", AI[playerid][aDifferentIP], PI[playerid][pID]);
			mysql_tquery(connects, query);
		}
	}
	if(!AI[playerid][aDifferentIP])
	{
		PI[playerid][pGetonDate] = gettime();
		query[0]=EOS;
		mysql_format(connects, query, 160, "UPDATE "TABLE_ACCOUNTS" SET `geton_date`='%s', `geton_ip` = '%s' WHERE `id` = '%d' LIMIT 1", UnixToDate(PI[playerid][pGetonDate]), PI[playerid][pIP], PI[playerid][pID]);
		mysql_tquery(connects, query);
	}
	if(PI[playerid][pWarns])
	{
		SCMESSF(playerid, GOLDORANGE_FORMAT, "На аккаунте "CONTRASTORANGE_HEX"%d "WHITE_HEX"%s. Осталось до снятия "CONTRASTORANGE_HEX"%d часов.", PI[playerid][pWarns], (PI[playerid][pActiveWarn] > 1) ? ("предупреждения") : ("предупреждение"), 30 - PI[playerid][punWarnstime]);
	}
	//PlayerPlaySound(playerid, 0, 0.0, 0.0, 0.0);
	format(g_str, 90, "~b~WELCOME,~w~ %s", PI[playerid][pName]);
	GameTextForPlayer(playerid, g_str, 4000, 1);
	return TogglePlayerSpectating(playerid, false);
}

function: LoadDemorgan(playerid)
{
	new rows;
	cache_get_row_count(rows);
	if(rows)
	{
		cache_get_value_name_int(0, "id", DI[playerid][dID]);
		cache_get_value_name_int(0, "time", DI[playerid][dTime]);
		cache_get_value_name(0, "reason", DI[playerid][dReason], 64);
		cache_get_value_name(0, "admin", DI[playerid][dAdmin], MAX_PLAYER_NAME+1);
		cache_get_value_name_int(0, "gamedate", DI[playerid][dDate]);
	}
	query[0]=EOS;
    mysql_format(connects, query, 250, "SELECT * FROM "TABLE_ADMINS" WHERE `admin` = '%d' LIMIT 1", PI[playerid][pID]);
    mysql_tquery(connects, query, "LoadAdmin", "i", playerid);
}

function: LoadATM()
{
	new time = GetTickCount(), rows;
	cache_get_row_count(rows);
	if(rows)
	{
		for(new idx = 1; idx <= rows; idx++)
		{
			cache_get_value_index_int(idx-1, 0, ATMInfo[idx][aID]); // ID
			cache_get_value_index_float(idx-1, 1, ATMInfo[idx][aX]); // aX
			cache_get_value_index_float(idx-1, 2, ATMInfo[idx][aY]); // aY
			cache_get_value_index_float(idx-1, 3, ATMInfo[idx][aZ]); // aZ
			cache_get_value_index_float(idx-1, 4, ATMInfo[idx][arX]); // arX
			cache_get_value_index_float(idx-1, 5, ATMInfo[idx][arY]); // arY
			cache_get_value_index_float(idx-1, 6, ATMInfo[idx][arZ]); // arZ
			TOTALATM++;
			ATM[idx] = CreateDynamicObject(2754, ATMInfo[idx][aX], ATMInfo[idx][aY], ATMInfo[idx][aZ], ATMInfo[idx][arX], ATMInfo[idx][arY], ATMInfo[idx][arZ]);
			LABELATM[idx] = CreateDynamic3DTextLabel("Банкомат\n"WHITE_HEX"Используй: ALT", SERVER_FORMAT, ATMInfo[idx][aX],ATMInfo[idx][aY],ATMInfo[idx][aZ]+1.1,10.0);
		}
		return printf("[LoadATM] ATMs have been successfully loaded. Total ATMs: %i. Time: %i ms.", TOTALATM, GetTickCount() - time);
	}
	return printf("[LoadATM] ATMs haven't loaded.");
}

function: GmTest(playerid, gmtest_target_id, Float:oldhealth)
{
	new Float: newhealth;
	GetPlayerHealth(gmtest_target_id, newhealth);
	new mes[256], string[60];
	if(oldhealth == newhealth) 
	{
		string = "{FF0000}Возможно, игрок использует God Mode(GM)";
		SAMF(DEFAULTRED_FORMAT, "[Anti-Cheat] "WHITE_HEX"Возможно, игрок %s[%d] использует God Mode!", PI[gmtest_target_id][pName], gmtest_target_id);
	}
	if(oldhealth != newhealth) string = "{05E900}Вероятно, игрок чист, показатель его HP уменьшился";
	format(mes, sizeof(mes), ""WHITE_HEX"Было: {FF9900}%.0f.0 (HP)\n"WHITE_HEX"Стало: {FF9900}%.0f.0 (HP)\n"WHITE_HEX"Уменьшилось на: {FF9900}%.0f.0 (HP)\n\n%s", oldhealth, newhealth, oldhealth-newhealth, string);
	SPD(playerid, 0, DSM, PI[gmtest_target_id][pName], mes, !"Закрыть", !"");
	SetHealth(gmtest_target_id, oldhealth);
	startGmTest[playerid] = false;
	return SetArmour(gmtest_target_id,gmarm[gmtest_target_id]);
}

function: OnCheckStatsAdmin(playerid, name[])
{
    new rows;
    cache_get_row_count(rows);
    if(!rows) return SCMESS(playerid, WHITE_FORMAT, ""NEGATIVE_MARK" Админ с таким ником не найден.");
    new string[256],
    string_dialogue[2000],
    check_online_monday,
    check_online_tuesday,
    check_online_wednesday,
    check_online_thursday,
    check_online_friday,
    check_online_saturday,
    check_online_sunday,
    check_online_allday;
	cache_get_value_name_int(0, "online_monday", check_online_monday);
	cache_get_value_name_int(0, "online_tuesday", check_online_tuesday);
	cache_get_value_name_int(0, "online_wednesday", check_online_wednesday);
	cache_get_value_name_int(0, "online_thursday", check_online_thursday);
	cache_get_value_name_int(0, "online_friday", check_online_friday);
	cache_get_value_name_int(0, "online_saturday", check_online_saturday);
	cache_get_value_name_int(0, "online_sunday", check_online_sunday);
    strcat(string_dialogue, "{FF9900}Недельный онлайн\n\n");
    format(string, sizeof(string), "{FFFFFF}Понедельник:\t\t{3399FF}%i мин. (%i час.)\n", check_online_monday/60, check_online_monday/3600);
    strcat(string_dialogue, string);
    format(string, sizeof(string), "{FFFFFF}Вторник\t\t{3399FF}%i мин. (%i час.)\n", check_online_tuesday/60, check_online_tuesday/3600);
    strcat(string_dialogue, string);
    format(string, sizeof(string), "{FFFFFF}Среда\t\t\t{3399FF}%i мин. (%i час.)\n", check_online_wednesday/60, check_online_wednesday/3600);
    strcat(string_dialogue, string);
    format(string, sizeof(string), "{FFFFFF}Четверг\t\t{3399FF}%i мин. (%i час.)\n", check_online_thursday/60, check_online_thursday/3600);
    strcat(string_dialogue, string);
    format(string, sizeof(string), "{FFFFFF}Пятница\t\t{3399FF}%i мин. (%i час.)\n", check_online_friday/60, check_online_friday/3600);
    strcat(string_dialogue, string);
    format(string, sizeof(string), "{FFFFFF}Суббота\t\t{3399FF}%i мин. (%i час.)\n", check_online_saturday/60, check_online_saturday/3600);
    strcat(string_dialogue, string);
    format(string, sizeof(string), "{FFFFFF}Воскресенье\t\t{3399FF}%i мин. (%i час.)\n", check_online_sunday/60, check_online_sunday/3600);
    strcat(string_dialogue, string);
    check_online_allday = check_online_monday + check_online_tuesday + check_online_wednesday + check_online_thursday + check_online_friday + check_online_saturday + check_online_sunday;
    format(string, sizeof(string), "\n{AFAFAF}Общий онлайн(недельный):\t{DD90FF}%i мин. (%i час.)\n\n", check_online_allday/60, check_online_allday/3600);
    strcat(string_dialogue, string);
    static const fmt_str[] = "Статистика администратора - %s";
    new str_1[sizeof(fmt_str) + (-2+25)];
    format(str_1, sizeof(str_1), fmt_str, name);
    return SPD(playerid, 0, DSM, str_1, string_dialogue, "Закрыть", "");
}

function: PlayerTimer(playerid)
{
	if(!pLoggedIn{playerid}) return Kick(playerid);
	PI[playerid][pDayOnline]++;
	if(TI[playerid][playerAFK] > 2)
	{
		format(g_str, 30, "AFK: "WHITE_HEX"%s", ConvertToTime(TI[playerid][playerAFK] - 2));
		SetPlayerChatBubble(playerid, g_str, DARKBLUE_FORMAT, 20.0, 1150);
		PI[playerid][pAFKDayTime]++;
	}
	TI[playerid][playerAFK]++;
	if(TI[playerid][playerAFK] < 2)
	{
		if(AI[playerid][aLoggedIn]) AI[playerid][aOnlineDay]++;
		PI[playerid][pHourOnline]++;
		PI[playerid][pAllOnline]++;
	}
	if(PI[playerid][pMute])
	{
		PI[playerid][pMute]--;
		if(PI[playerid][pMute] <= 0) SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Чат разблокирован. Не нарушай правила чата!");
	}
	if(PI[playerid][pGCMute])
	{
		PI[playerid][pGCMute]--;
		if(PI[playerid][pGCMute] <= 0) SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Глобальный чат разблокирован. Не нарушай правила чата!");
	}
	if(PI[playerid][pDuty]) PI[playerid][pDutyTimer]++;
	if(DI[playerid][dTime])
	{
		if(PI[playerid][pVW] != 1111 || PI[playerid][pInt] != 1111)
		{
			SAMF(DEFAULTRED_FORMAT, "[A] Внимание! Игрок %s[%d] пытается обойти деморган!", PI[playerid][pName], playerid);
			SpawnPlayerEx(playerid);
		}
		DI[playerid][dTime]--;
		ResetPlayerWeapons(playerid);
		new str_1[20];
		format(str_1, sizeof(str_1), "~r~Time: %d", DI[playerid][dTime]);
		GameTextForPlayer(playerid, str_1, 1000, 4);
		if(DI[playerid][dTime] <= 0)
		{
			DI[playerid] = demorganDataNull;
			SendPositiveMess(playerid, "Ты выпущен из деморгана. Не нарушай правила сервера!");
			query[0]=EOS;
			mysql_format(connects, query, 90, "DELETE FROM "TABLE_DEMORGAN" WHERE `id` = '%d'", PI[playerid][pID]);
			mysql_tquery(connects, query, "","");
			SpawnPlayerEx(playerid);
		}
	}
	if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		new carid = GetPlayerVehicleID(playerid);
		if(!IsAPlane(carid) && !IsAVel(carid))
		{
			new Float:VHealth;
			GetVehicleHealth(carid,VHealth);
			if(VHealth < 500 && VI[carid][vEngine])
			{
				VI[carid][vUnEngine] ++;
				if(VI[carid][vUnEngine] >= random(40))
				{
					if(GetVehicleModel(carid) != 494)
					{
						SetVehicleVariables(carid, .engine = false, .lights = false);
						VI[carid][vUnEngine] = 0;
						if(VHealth < 400) SendNegativeMess(playerid, "Транспорт сильно повреждён.");
					}
				}
			}
		}
		if(GetVehicleModel(carid) != 494 && GetVehicleModel(carid) != 433 && GetVehicleModel(carid) != 548)
		{
			new Float:hpveh;
			GetVehicleHealth(carid, hpveh);
			if(hpveh < 300.0) SetVehicleHealth(carid, 350.0);
		}
	}
	return 1;
}

function: ClearAnimText(playerid) return ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, false, false, false, false, 0, FORCE_SYNC:1);

function: SetAuthCameraPos(playerid)
{
	SetPlayerCameraPos(playerid, -1282.6100, 728.6600, 130.8500);
	SetPlayerCameraLookAt(playerid, -1283.5601, 728.9800, 130.8000);
	//PlayerPlaySound(playerid, 142, 0.0, 0.0, 0.0);
}

function: PlayerBanipCheck(playerid)
{
	//InterpolateCameraPos(playerid, 855.8500, -1765.0400, 30.3900, 869.9800, -1747.6200, 15.8600, 3100);
	//InterpolateCameraLookAt(playerid, 856.4300, -1764.2100, 30.1700, 870.5400, -1746.7700, 15.8900, 3100);
	SetPlayerVirtualWorld(playerid, playerid+1);
	if(cache_num_rows() > 0)
	{
    	new unbandate_IP, reason_IP[64], admin[MAX_PLAYER_NAME+1], bandate, str_1[256];
        cache_get_value_name_int(0, "unbandate", unbandate_IP),
		cache_get_value_name_int(0, "gamedate", bandate),
		cache_get_value_name(0, "reason", reason_IP, 50);
		cache_get_value_name(0, "admin", admin, MAX_PLAYER_NAME+1);
		if(unbandate_IP > gettime())
		{
			format(str_1,sizeof(str_1),""WHITE_HEX"IP адрес заблокирован\nАдминистратор: %s\nДата блокировки: %s\nДата снятия блокировки: %s\n\
			Причина: %s",
			admin, UnixToDate(bandate), UnixToDate(unbandate_IP), reason_IP);
			SPD(playerid, 0, DSM,""DARKRED_HEX"Информация о блокировке", str_1, "Отмена", "");
			return KickEx(playerid);
		}
		else
		{
		    query[0]=EOS;
 			mysql_format(connects, query, 100,"DELETE FROM "TABLE_BANIPLOG" WHERE `ip` = '%s' LIMIT 1", PI[playerid][pIP]);
			mysql_tquery(connects, query, "", "");
		}
	}
	query[0]=EOS;
	mysql_format(connects, query, 105, "SELECT `id`, `salt`, `regip` FROM "TABLE_ACCOUNTS" WHERE `name` = '%e' LIMIT 1", PI[playerid][pName]);
	return mysql_tquery(connects, query, "PlayerRegCheck", "id", playerid, g_MysqlRaceCheck[playerid]);
}

function: CheckBan(playerid, name[])
{
    new	rows, admin[MAX_PLAYER_NAME+1], unbandate, reason[100], str_1[256], bandate;
    cache_get_row_count(rows);
    if(rows)
	{
	    cache_get_value_name(0, "admin", admin);
	    cache_get_value_name(0, "reason", reason);
	    cache_get_value_name_int(0, "unbandate", unbandate);
		cache_get_value_name_int(0, "gamedate", bandate);
	    if(unbandate > gettime())
		{
	        format(str_1, sizeof(str_1), ""WHITE_HEX"Аккаунт: %s\nДата блокировки:%s\nАдминистратор: %s\nПричина: %s\n\nДата разблокировки: %s", name, UnixToDate(bandate), admin, reason, UnixToDate(unbandate));
	        SPD(playerid,0,DSM,""DARKRED_HEX"Информация о блокировке",str_1,"Закрыть","");
	        return KickEx(playerid);
    	}
	    else
		{
		    query[0]=EOS;
	        mysql_format(connects, query, 85, "DELETE FROM "TABLE_BANLOG" WHERE `name` = '%e' LIMIT 1",name);
         	mysql_tquery(connects, query, "","");
   	 	}
  	}
    cache_set_active(PI[playerid][Cache_ID]);
	query[0]=EOS;
    mysql_format(connects, query, 700, "SELECT * FROM "TABLE_ACCOUNTS" WHERE `name` = '%e' AND `salt` = '%e' LIMIT 1", PI[playerid][pName], PI[playerid][pHash]);
	mysql_tquery(connects, query, "LoadAccount", "i", playerid);
	cache_delete(PI[playerid][Cache_ID]);
	PI[playerid][Cache_ID] = MYSQL_INVALID_CACHE;
	return 1;
}

function: CheckAdmin(playerid, tmp[], days, reason[], type)
{
	new rows;
	cache_get_row_count(rows);
	if(rows)
	{
		new adminLevel;
		cache_get_value_name_int(0, "alevel", adminLevel);
		if(AI[playerid][aLevel] <= adminLevel)
		return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Администратор не может быть наказан.");
	}
	query[0]=EOS;
	if(!type) mysql_format(connects, query, 85, "SELECT 1 FROM "TABLE_BANLOG" WHERE name = '%e' LIMIT 1", tmp);
	if(type == 1) mysql_format(connects, query, 85, "SELECT 1 FROM "TABLE_BANIPLOG" WHERE ip = '%s' LIMIT 1", tmp);
	else
	{
		mysql_format(connects, query, 85, "SELECT `id`, `warns` FROM "TABLE_ACCOUNTS" WHERE `name` = '%e' LIMIT 1", tmp);
		return mysql_tquery(connects, query, "OffWarn", "dss", playerid, tmp, reason);
	}
	return mysql_tquery(connects, query, "OffBan", "dsdsd", playerid, tmp, days, reason, type);
}

function: OffBan(playerid, tmp[], days, reason[], type)
{
	if(cache_num_rows() > 0) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок / IP адрес уже заблокирован!");
	if(!type)
	{
		new ids = GetPlayerID(tmp);
		if(ids != INVALID_PLAYER_ID)
		{
       		SCMESSF(ids, ADMIN_FORMAT, "%s %s заблокировал твой аккаунт на %d дней. Причина: %s", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], days, reason);
        	KickEx(ids);
    	}
		format(g_str, 100, "выдал offban с причиной: %s", reason);
		Admin_Log(playerid, g_str, tmp);
	}
	else
	{
		foreach(new i : Player)
		{
	    	if(!strcmp(tmp, PI[i][pIP], true))
			{
	        	SCMESSF(i, ADMIN_FORMAT, "%s %s заблокировал твой IP адрес на %d дней. Причина: %s",adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], days, reason);
				format(g_str, 120, "выдал banip с причиной: %s | IP: %s", reason, PI[i][pIP]);
				Admin_Log(playerid, g_str, PI[i][pName]);
        		KickEx(i);
	    	}
		}
	}
	ServerBan(playerid, tmp, days, reason, type);
	return SAMF(ADMIN_FORMAT, "%s %s[%i] заблокировал %s %s на %d дней. Причина: %s",adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, (!type) ? ("в оффлайне игрока") : ("IP адрес:"), tmp, days, reason);
}

function: UnBan(playerid, tmp[], type, params)
{
	new rows;
	cache_get_row_count(rows);
	query[0]=EOS;
	if(!rows) return SCMESS(playerid, GREY_FORMAT,""NEGATIVE_MARK" Игрок / IP адрес не заблокирован.");
    if(!type) mysql_format(connects, query, 85, "DELETE FROM "TABLE_BANLOG" WHERE `name` = '%e'",tmp);
    else mysql_format(connects, query, 85, "DELETE FROM "TABLE_BANIPLOG" WHERE `ip` = '%s'",tmp);
    mysql_tquery(connects, query, "","");
	SAMF(GREY_FORMAT,"[A] %s %s[%d] разблокировал %s %s.",adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], params, (!type) ? ("игрока") : ("IP адрес:"),tmp);
	return Admin_Log(playerid, "разбанил unban", tmp);
}

function: OffWarn(playerid, tmp[], reason[])
{
	if(!cache_num_rows()) return SCMESSF(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Аккаунт %s не найден в базе данных.", tmp);
	new ids, warns;
	cache_get_value_name_int(0, "id", ids);
	cache_get_value_name_int(0, "warns", warns);
	if(ids == 1 || ids == 3) return DelAdmin(playerid, 0);
	else if(++ warns < 3)
	{
        query[0]=EOS;
		mysql_format(connects, query, 190, "UPDATE "TABLE_ACCOUNTS" SET `warns` = '%d', `warn_active` = '1', `warn_time` = '0', `leader` = '0', `member` = '0', `rank` = '0', `model` = '0' WHERE `id` = '%d' LIMIT 1", warns, ids);
		mysql_tquery(connects, query);
		SAMF(GREY_FORMAT, "[A] %s %s выдал предупреждение в оффлайне %s (%d/3). Причина: %s",adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], tmp, warns, reason);
		format(g_str, 110, "выдал предупреждение (%d/3) с причиной: %s", warns, reason);
		Admin_Log(playerid, g_str, tmp);
	}
	else
	{
	    query[0]=EOS;
		mysql_format(connects, query, 130, "UPDATE "TABLE_ACCOUNTS" SET `warns` = '0', `warn_active` = '0', `warn_time` = '0' WHERE `id` = '%d' LIMIT 1", ids);
		mysql_tquery(connects, query);
		query[0]=EOS;
		mysql_format(connects, query, 90, "SELECT 1 FROM "TABLE_BANLOG" WHERE `name` = '%e' LIMIT 1", tmp);
		mysql_tquery(connects, query, "OffBan", "dsdsd", playerid, tmp, 2, reason, 0);
	}
	return 1;
}

function: AdminVig(playerid, tmp[], reason[], type)
{
    if(!cache_num_rows()) return SCMESSF(playerid, GREY_FORMAT, "%s не является администратором", tmp);
	new ids, admin, vigs;
	cache_get_value_name_int(0, "admin", ids);
	cache_get_value_name_int(0, "alevel", admin);
	cache_get_value_name_int(0, "avigs", vigs);
	if(admin >= AI[playerid][aLevel]) return SCMESS(playerid, WHITE_FORMAT, ""NEGATIVE_MARK" Нет прав.");
	if(type == 1)
	{
		if(++ vigs >= 3)
	    {
	        SAMF(ADMIN_FORMAT,"%s %s снял с %s права модератора (3/3). Причина: %s",adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], tmp, reason);
	        format(g_str, 110, "снял права модератора (3/3), по причине: %s", reason);
	        Admin_Log(playerid, g_str, tmp);
			query[0]=EOS;
	        mysql_format(connects, query, 85, "DELETE FROM "TABLE_ADMINS" WHERE `admin` = '%d'", ids);
            mysql_tquery(connects, query, "", "");
        }
        else
        {
            SAMF(ADMIN_FORMAT, "%s %s выдал модератору %s выговор (%d/3). Причина: %s", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], tmp, vigs, reason);
            format(g_str, 110, "выдал выговор (%d/3), по причине: %s", vigs, reason);
            Admin_Log(playerid, g_str, tmp);
			query[0]=EOS;
            mysql_format(connects, query, 85, "UPDATE "TABLE_ADMINS" SET `avigs` = '%d' WHERE `admin` = '%d' LIMIT 1", vigs, ids);
	        mysql_tquery(connects, query, "", "");
	    }
	}
	else
	{
        vigs --;
		SAMF(ADMIN_FORMAT, "%s %s снял модератору %s выговор (%d/3). Причина: %s",adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], tmp, vigs, reason);
  		format(g_str, 110, "снял выговор (%d/3), по причине: %s", vigs, reason);
  		Admin_Log(playerid, g_str, tmp);
  		mysql_format(connects, query, 75, "UPDATE "TABLE_ADMINS" SET `avigs` = '%d' WHERE `admin` = '%d' LIMIT 1", vigs, ids);
		mysql_tquery(connects, query, "", "");
	}
	return 1;
}

function: AdminCheckBan(playerid, name[], type)
{
	new rows;
	cache_get_row_count(rows);
	if(rows)
	{
    	new unbandate_IP, bandate_IP, reason[50], admin[24], str_1[256];
    	cache_get_value_name_int(0, "unbandate", unbandate_IP),
		cache_get_value_name_int(0, "gamedate", bandate_IP),
		cache_get_value_name(0, "reason", reason, 50);
		cache_get_value_name(0, "admin", admin, 24);
		format(str_1, sizeof(str_1), ""WHITE_HEX"%s: %s\nДата блокировки: %s\nАдминистратор: %s\nПричина: %s\n\nДата разблокировки: %s", (!type) ? ("Аккаунт") : ("IP адрес"),
		name, UnixToDate(bandate_IP), admin, reason, UnixToDate(unbandate_IP));
	    return SPD(playerid,0,DSM,""DARKRED_HEX"Информация о блокировке", str_1, "Закрыть", "");
	}
	else
	{
	    format(g_str, 50, "%s не заблокирован.", (!type) ? ("Аккаунт") : ("IP адрес"));
		SCMESS(playerid, GREY_FORMAT, g_str);
	}
	return 1;
}

function: GetOffDm(playerid, nick[], time, reason[])
{
	new rows, cachepid;
	cache_get_row_count(rows);
	if(!rows) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Такого игрока не существует.");
	cache_get_value_name_int(0, "id", cachepid);
	query[0]=EOS;
	mysql_format(connects, query, 300, "SELECT * FROM "TABLE_DEMORGAN" WHERE `id` = '%d' LIMIT 1", cachepid);
	return mysql_tquery(connects, query, "OffDm", "iisis", playerid, cachepid, nick, time, reason);
}

function: OffDm(playerid, cachepid, nick[], time, reason[])
{
	new rows;
	cache_get_row_count(rows);
	if(rows) 
	{
		if(time == 0)
		{
			query[0]=EOS;
			mysql_format(connects, query, 65, "DELETE FROM "TABLE_DEMORGAN" WHERE `id` = '%d' LIMIT 1", cachepid);
			mysql_tquery(connects, query, "","");
			SAMF(GREY_FORMAT,"[A] %s %s[%d] выпустил в оффлайне игрока %s из деморгана.", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], playerid, nick);
		}
		else if(time > 0) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок уже в деморгане.");
	}
	if(!rows)
	{
		if(time == 0) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок не в деморгане.");
		time *= 60;
		query[0]=EOS;
		mysql_format(connects, query, 190, "INSERT INTO "TABLE_DEMORGAN" (`id`, `time`, `reason`, `admin`, `gamedate`) VALUES ('%d', '%d', '%e', '%e', '%e')", cachepid, time, reason, PI[playerid][pName], UnixToDate(gettime()));
		mysql_tquery(connects, query);
		SAMTAF(ADMIN_FORMAT, "%s %s посадил в деморган в оффлайне игрока %s на %d минут. Причина: %s", adminRank[AI[playerid][aLevel]][pdRank], PI[playerid][pName], nick, time/60, reason);
	}
	return 1;
}

function: GetDmInfoID(playerid, nick[])
{
	new rows;
	cache_get_row_count(rows);
	if(!rows) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Такого игрока не существует.");
	new cachepid;
	cache_get_value_name_int(0, "id", cachepid);
	mysql_format(connects, query, 210, "SELECT `id`, `time`, `reason`, `admin`, `gamedate` FROM "TABLE_DEMORGAN" WHERE `id` = '%d' LIMIT 1", cachepid);
	return mysql_tquery(connects, query, "GetDmInfo", "ii", playerid, cachepid);
}

function: GetDmInfo(playerid, cachepid)
{
	new rows;
	cache_get_row_count(rows);
	if(!rows) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок не в деморгане.");
	new pidtime,pidreason[64],pidadmin[MAX_PLAYER_NAME+1],dmdate;
	cache_get_value_name_int(0, "time", pidtime);
	cache_get_value_name_int(0, "gamedate", dmdate);
	cache_get_value_name(0, "reason", pidreason, 64);
	cache_get_value_name(0, "admin", pidadmin, MAX_PLAYER_NAME+1);
	new str_1[256];
	format(str_1, sizeof(str_1), ""WHITE_HEX"Выдал: %s\n\
	Дата наказания: %s\n\
	Причина: %s\n\
	Осталось сидеть: %d", pidadmin, UnixToDate(dmdate), pidreason, ConvertToTime(pidtime));
	return SPD(playerid, 0, DSM, ""DARKRED_HEX"Информация о наказании", str_1, "Закрыть","");
}

function: GetOffStats(playerid, nick[])
{
    new rows;
	cache_get_row_count(rows);
	if(!rows) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Такого игрока не существует.");
	new cachepid;
	cache_get_value_name_int(0, "id", cachepid);
	mysql_format(connects, query, 210, "SELECT * FROM "TABLE_ACCOUNTS" WHERE `id` = '%d' LIMIT 1", cachepid);
	return mysql_tquery(connects, query, "GetOffStatsInfo", "ii", playerid, cachepid);
}

function: GetOffStatsInfo(playerid, cachepid)
{
	return 1;
}

function: UpdateVehicleFuel(fuel_vehicle_id)
{
	if(VI[fuel_vehicle_id][vFuel] <= 0.0)
	{
    	VI[fuel_vehicle_id][vFuel] = 0.0;
		return SetVehicleVariables(fuel_vehicle_id, .engine = false, .lights = false);
	}
	VI[fuel_vehicle_id][vFuel] -= 0.0030;
	return 1;
}

function: UpdatePlayerVelocimetro(playerid)
{
	if(TI[playerid][playerAFK] > 2 && GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 1;
	if(IsAPlane(GetPlayerVehicleID(playerid)) || IsABoat(GetPlayerVehicleID(playerid)) || IsAVel(GetPlayerVehicleID(playerid))) return 1;
	new vehid = GetPlayerVehicleID(playerid);
   /* if(VI[vehid][vFuel] <= 0.0)
	{
    	VI[vehid][vFuel] = 0.0;
		return SetVehicleVariables(vehid, .engine = false, .lights = false);
	}*/
 	//if(VI[vehid][vEngine] == true) VI[vehid][vFuel] -= 0.0030;
    format(g_str, 16, "%02d KM/H", GetVehicleSpeed(vehid));
    PlayerTextDrawSetString(playerid, textPlayerVelocimetro[1][playerid], g_str);
    format(g_str, 16, "%.0f%", GetVehicleHealthEx(vehid));
    PlayerTextDrawSetString(playerid, textPlayerVelocimetro[3][playerid], g_str);
	format(g_str, 16, "%.1f", VI[vehid][vFuel]);
    PlayerTextDrawSetString(playerid, textPlayerVelocimetro[2][playerid], g_str);
    return 1;
}

function: PlayerToggle(playerid)
{
	TogglePlayerControllable(playerid, true);
	return ClearAnimationsEx(playerid);
}

function: TazerOff(playerid)
{
	SetPVarInt(playerid, "Tazer", 0);
	TogglePlayerControllable(playerid, true);
	return ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, false, false, false, false, 0, FORCE_SYNC:1);
}

function: EngineVehicle(playerid, vehicle_id)
{
	if(IsPlayerInVehicle(playerid,vehicle_id))
	{
		new Float:Health;
		GetVehicleHealth(vehicle_id, Health);
		if(Health > 1000.0) Health = 1000.0;
		new hp = 11 - floatround(Health / 100.0);
		new uEngine = random(hp);
		if(uEngine < 4)
		{
			SetVehicleVariables(vehicle_id, .engine = true, .lights = true);
			DoAction(playerid, "Двигатель успешно завёлся");
		}
		else DoAction(playerid, "Двигатель не завёлся");
	}
	return 1;
}

function: GetAllMembers(playerid)
{
	new rows, member, rank, name[MAX_PLAYER_NAME+1], str_1[100], str2[2024], vigs, geton_date[MAX_DATE_LENGHT];
	cache_get_row_count(rows);
	if(!rows) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Информация о сотрудниках не найдена.");
	for(new i=0; i < rows; i++)
	{
		cache_get_value_name(0, "name", name, MAX_PLAYER_NAME+1);
		cache_get_value_name_int(0, "member", member);
		cache_get_value_name_int(0, "rank", rank);
		cache_get_value_name_int(0, "vigs", vigs);
		cache_get_value_name(0, "geton_date", geton_date, MAX_DATE_LENGHT);
		format(str_1, sizeof(str_1), "%d. %s %s[%d/3]\t%s", i+1, frac_rankname[member][rank], name, vigs, geton_date);
		strcat(str2, str_1);
	}
	return SPD(playerid, 0, DSL, ""SERVER_HEX"Сотрудники организации", str2, "Выбрать", "Закрыть");
}

function: RegisterTimer(playerid)
{
	if(GetPVarInt(playerid, "authTimerTick") == 600)
	{
		SCMESS(playerid, CONTRASTORANGE_FORMAT, "Время на регистрацию истекло.");
		return KickEx(playerid);
	}
	return SetPVarInt(playerid, "authTimerTick", PI[playerid][pAuthTick]+=1);
}

function: AuthTimer(playerid)
{
	if(GetPVarInt(playerid, "authTimerTick") == 30)
	{
		SCMESS(playerid, CONTRASTORANGE_FORMAT, "Время на авторизацию истекло.");
		return KickEx(playerid);
	}
	return SetPVarInt(playerid, "authTimerTick", PI[playerid][pAuthTick]+=1);
}

@cmd() allmembers(playerid, params[], help)
{
	if(!PI[playerid][pMember] || !IsAbleToInvite(playerid)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нет доступа.");
	query[0]=EOS;
	mysql_format(connects, query, 200, "SELECT `id`, `name`, `member`, `rank`, `geton_date` FROM "TABLE_ACCOUNTS" WHERE `member` = '%d' AND `leader` = '0' LIMIT 1", PI[playerid][pMember]);
	mysql_tquery(connects, query, "GetAllMembers", "i", playerid);
	return 1;
}

@cmd() heal(playerid, params[], help)
{
	if(!pLoggedIn{playerid}) return 1;
	if(PI[playerid][pMember] != TEAM_HOSPITAL) return SCMESS(playerid, GREY_FORMAT, !""NEGATIVE_MARK" Доступно только мед работникам.");
	if(PI[playerid][pRank] < 2) return SCMESS(playerid, GREY_FORMAT, !""NEGATIVE_MARK" Доступно только со 2-го ранга.");
	if(PI[playerid][pMedics] == 0) return SCMESS(playerid, GREY_FORMAT, !""NEGATIVE_MARK" Нет медикоментов с собой.");
	extract params -> new pid; else return SCMESS(playerid, WHITE_FORMAT, !"Подсказка: /heal [id]");
	if(!pLoggedIn{pid} || !IsPlayerConnected(pid) || !PI[pid][pID]) return 1;
	if(GetPVarInt(pid,"keyheal") == 1) return SCMESS(playerid, GREY_FORMAT, !""NEGATIVE_MARK" Игроку уже предложено лечение.");
	if(!ProxDetectorCMD(10.0, playerid, pid)) return SCMESS(playerid, GREY_FORMAT, TooFarFromPlayer);
	if(!IsPlayerInRangeOfPoint(playerid,100.0,-1324.4583,-19.6535,1501.0859)) return SCMESS(playerid, GREY_FORMAT, !""NEGATIVE_MARK" Лечить можно только в больнице.");
	if(pid == playerid) return SCMESS(playerid, GREY_FORMAT, !""NEGATIVE_MARK" Нельзя лечить самого себя.");
	GetPlayerHealth(pid, PI[pid][pHp]);
	if(PI[pid][pHp] >= 100.0) return SCMESS(playerid, GREY_FORMAT, !""NEGATIVE_MARK" Игрок здоров.");
	SCMESSF(playerid, ACTION_FORMAT, !"Ты предложил %s вылечиться за %d$", PI[pid][pName], 10000);
	SCMESSF(pid, ACTION_FORMAT, !"%s предложил тебе вылечиться за %d$", PI[playerid][pName], 10000);
	SCMESS(pid, ACTION_FORMAT, !"Нажми "GREEN_HEX"Y"ACTION_HEX" для подтверждения, либо "DEFAULTRED_HEX"N"ACTION_HEX" для отказа.");
	SetPVarInt(pid, "medics", playerid);
	SetPVarInt(pid, "money", 10000);
	SetPVarInt(pid, "keyheal", 1);
	return 1;
}

@cmd() idcard(playerid, params[], help)
{
	if(!PI[playerid][pIdCard]) return SCMESS(playerid, GREY_FORMAT, !""NEGATIVE_MARK" У тебя нету ID карты. Сделать её можно в мэрии.");
	extract params -> new pid; else return SCMESS(playerid, WHITE_FORMAT, !"Подсказка: /idcard [id игрока]");
	if(!pLoggedIn{pid} || !IsPlayerConnected(pid) || !PI[pid][pID]) return 1;
	if(playerid == pid)
	{
		new allstr[330];
		strcat(allstr,""WHITE_HEX"");
		format(g_str,sizeof(g_str),"Имя: "SERVER_HEX"%s\n",PI[playerid][pName]);
		strcat(allstr,g_str);
		format(g_str,sizeof(g_str),""WHITE_HEX"Пол: "SERVER_HEX"%s\n",(PI[playerid][pGender] == 1) ? ("Мужской") : ("Женский"));
		strcat(allstr,g_str);
		format(g_str,sizeof(g_str),""WHITE_HEX"Лет в штате: "SERVER_HEX"%d\n",PI[playerid][pLevel]);
		strcat(allstr,g_str);
		format(g_str,sizeof(g_str),""WHITE_HEX"Серия: "SERVER_HEX"%d\n",PI[playerid][pIdSeria]);
		strcat(allstr,g_str);
		format(g_str,sizeof(g_str),""WHITE_HEX"Номер: "SERVER_HEX"%d\n",PI[playerid][pIdNumber]);
		strcat(allstr,g_str);
		format(g_str,sizeof(g_str),""WHITE_HEX"Законопослушность: "SERVER_HEX"%d/100\n",PI[playerid][pZakon]);
		strcat(allstr,g_str);
		if(PI[playerid][pMember])
		{
			format(g_str,sizeof(g_str),""WHITE_HEX"Организация: "SERVER_HEX"%s\n",frac_name[PI[playerid][pMember]]);
			strcat(allstr,g_str);
			format(g_str,sizeof(g_str),""WHITE_HEX"Должность: "SERVER_HEX"%s\n",frac_rankname[PI[playerid][pMember]][PI[playerid][pRank]]);
			strcat(allstr,g_str);
		}
		MeAction(playerid, "посмотрел свою ID карту");
		return SPD(playerid, 0, DSM, ""SERVER_HEX"Идентификационная карта", allstr, "Закрыть", ""); 
	}
	if(!ProxDetectorCMD(5.0, playerid, pid)) return SCMESS(playerid, GREY_FORMAT, TooFarFromPlayer);
	if(GetPVarInt(playerid,"keycard") == 1)return SCMESS(playerid,GREY_FORMAT,"Предложение уже отправлено.");
	SCMESSF(playerid,SERVER_FORMAT,""POSITIVE_MARK" "WHITE_HEX"Предложение %s посмотреть свои документы отправлено.", PI[pid][pName]);
	SCMESSF(pid,ACTION_FORMAT,"%s предлагает посмотреть его документы.", PI[pid][pName]);
	SCMESSF(pid,ACTION_FORMAT, "Нажми "GREEN_HEX"Y"ACTION_HEX" для подтверждения, либо "DEFAULTRED_HEX"N"ACTION_HEX" для отказа.");
	SetPVarInt(pid, "showidcard", playerid);
	SetPVarInt(pid, "keycard", 1);
	SetPVarInt(playerid,"reloader",gettime()+2);
	return 1;
}

@cmd() leaders(playerid, params[], help)
{
	new full, string[2048], text[20];
	strcat(string, ""GREY_HEX"Организация - Должность - Имя лидера - Телефон\n\n");
	foreach(new i : Player)
	{
		if(!pLoggedIn{i} || !IsPlayerConnected(i) || AI[i][aLevel]) continue;
		if(!PI[i][pLeader])
		{
			SCMESS(playerid, GREY_FORMAT, "Отсутствуют лидеры в сети.");
			continue;
		}
		if(PI[i][pLeader])
		{
			if(!PI[i][pPhoneNum]) format(text, sizeof(text), "Нет");
			else format(text, sizeof(text), "%i", PI[i][pPhoneNum]);
			format(g_str, sizeof(g_str),""WHITE_HEX"%s - %s - %s - %s\n", frac_name[PI[i][pLeader]], frac_rankname[PI[i][pMember]][PI[i][pRank]], PI[i][pName], text);
			strcat(string, g_str);
			full++;
		}
	}
	SPD(playerid, 0, DSM, ""SERVER_HEX"Лидеры организаций в сети", string, "Закрыть", "");
	return 1;
}

@cmd() safe(playerid, params[], help)
{
	safeCommand(playerid);
	return 1;
}

@cmd() cupboard(playerid, params[], help)
{
	if(PI[playerid][pHouse] == -1) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Для этого нужно иметь дом.");
	new pidhouse = PI[playerid][pHouse];
	if(HI[pidhouse][hCupboardBought])
	{
		if(PI[playerid][pVW] == pidhouse && PI[playerid][pInt] == HI[pidhouse][hInt])
		{
			PlayerTextDrawShow(playerid, cupboard_home_PTD[playerid][0]);
			PlayerTextDrawShow(playerid, cupboard_home_PTD[playerid][1]);
			if(HI[PI[playerid][pHouse]][hCupboard][0] > 0) 
			{
				PlayerTextDrawSetPreviewModel(playerid, cupboard_home_PTD[playerid][2], HI[PI[playerid][pHouse]][hCupboard][0]);
				PlayerTextDrawShow(playerid, cupboard_home_PTD[playerid][2]);
			}
			if(HI[PI[playerid][pHouse]][hCupboard][1] > 0) 
			{
				PlayerTextDrawSetPreviewModel(playerid, cupboard_home_PTD[playerid][3], HI[PI[playerid][pHouse]][hCupboard][1]);
				PlayerTextDrawShow(playerid, cupboard_home_PTD[playerid][3]);
			}
			if(HI[PI[playerid][pHouse]][hCupboard][2] > 0)
			{
				PlayerTextDrawSetPreviewModel(playerid, cupboard_home_PTD[playerid][4], HI[PI[playerid][pHouse]][hCupboard][2]);
				PlayerTextDrawShow(playerid, cupboard_home_PTD[playerid][4]);
			} 
			PlayerTextDrawShow(playerid, cupboard_home_PTD[playerid][5]);
			SelectTextDraw(playerid, SERVER_FORMAT);
			return 1;
		}
		else return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нужно находиться у себя дома.");
	}
	return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Для этого нужно иметь шкаф.");
}

@cmd() houseinfo(playerid, params[], help)
{
	new pidhouse = PI[playerid][pHouse];
	if(PI[playerid][pHouse] != -1 && PI[playerid][pHouse] == HI[PI[playerid][pHouse]][hID])
	{
		new str_1[256];
		format(str_1, sizeof(str_1), ""WHITE_HEX"Номер дома: \t\t%d\n\
					Класс: \t\t\t{%s}%s"WHITE_HEX" \n\
					Статус: \t\t%s\n\
					Квартплата: \t\t%d\n\
					Стоимость: \t\t%d\n\
					Оплачен на: \t\t"YELLOW_HEX"%d/3"WHITE_HEX" дней\n\
					Владелец: \t\t%s", HI[pidhouse][hID], house_type[HI[pidhouse][hType]][htColor],house_type[HI[pidhouse][hType]][htType], (HI[pidhouse][hLock] == 1) ? (""DEFAULTRED_HEX"Закрыт"WHITE_HEX"") : (""GREEN_HEX"Открыт"WHITE_HEX""), HI[pidhouse][hDice], HI[pidhouse][hCost], HI[pidhouse][hDays], HI[pidhouse][hOwner]);
		return SPD(playerid, 0, DSM, ""SERVER_HEX"Информация о доме", str_1, "Закрыть", "");
	}
	return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Для этого нужно иметь дом.");
}

@cmd() hmenu(playerid, params[], help)
{
	hmenuCommand(playerid);
	return 1;
}

@cmd() bmenu(playerid, params[], help)
{
	if(PI[playerid][pBusiness] != -1)
	{
		new str_1[256];
		switch(BI[PI[playerid][pBusiness]][bType])
		{
			case 2:
			{
				format(str_1, sizeof(str_1), ""WHITE_HEX"Закрыть/Открыть бизнес\n\
					Изменить название бизнесу\n\
					Изменить цены на товар\n\
					Изменить цену на бензин\n\
					Продать бизнес государству\n\
					Продать бизнес игроку\n\
					Посмотреть информацию о бизнесе");
				return SPD(playerid, DLG_CMD_BMENU_FUEL, DSL, ""SERVER_HEX"Меню бизнеса", str_1, "Закрыть", "");
			}
			default:
			{
				format(str_1, sizeof(str_1), ""WHITE_HEX"Закрыть/Открыть бизнес\n\
					Изменить название бизнесу\n\
					Изменить цены на товар\n\
					Продать бизнес государству\n\
					Продать бизнес игроку\n\
					Посмотреть информацию о бизнесе");
				return SPD(playerid, DLG_CMD_BMENU, DSL, ""SERVER_HEX"Меню бизнеса", str_1, "Закрыть", "");
			}
		}
	}
	return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Для этого нужно иметь бизнес.");
}

@cmd() bisinfo(playerid, params[], help)
{
	bisinfoCommand(playerid);
	return 1;
}

@cmd() fill(playerid, params[], help)
{
	for(new i=0; i < TOTALBUSINESS; i++)
	{
		if(BI[i][bType] != 2) continue;
		if(IsPlayerInRangeOfPoint(playerid, 2.0, BI[i][bFuelPosX],BI[i][bFuelPosY],BI[i][bFuelPosZ]))
		{
			if(GetPlayerVehicleSeat(playerid) == 0)
			{
				new vehid = GetPlayerVehicleID(playerid);
				if(VI[vehid][vFuel] == GetVehicleTank(GetVehicleModel(vehid))) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя полный бак.");
				if(VI[vehid][vEngine])
				{
					return SCMESS(playerid, SERVER_FORMAT, ""POSITIVE_MARK" "WHITE_HEX"Для заправки сперва нужно заглушить двигатель.");
				}
				else if (!VI[vehid][vEngine])
				{
					new str_1[200];
					if(BI[i][bLock]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Бизнес закрыт.");
					SetPVarInt(playerid, "fuelbusinessid", i);
					SetPVarInt(playerid, "fuelcarid", vehid);
					format(str_1, sizeof(str_1), ""WHITE_HEX"Введи необходимое количество литров для заправки.\n Цена одного литра бензина "GREEN_HEX"%d$", BI[GetPVarInt(playerid, "fuelbusinessid")][bFuelPrice]);
					return SPD(playerid,DLG_CMD_FILL,DSI,""SERVER_HEX"Заправка транспорта", str_1,"Ввести","Отмена");
				}
			}
		}
	}
	return 1;
}

@cmd(.alts = {"buybiz","buybis"}) buybusiness(playerid, params[], help)
{
	if(PI[playerid][pBusiness] != -1) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя уже есть бизнес.");
	if(IsPlayerInAnyVehicle(playerid)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Сначала покинь транспорт.");
	for(new i=0; i < TOTALBUSINESS; i++)
	{
		if(BI[i][bOwner]) continue;
		if(IsPlayerInRangeOfPoint(playerid, 2.0, BI[i][bPosX], BI[i][bPosY], BI[i][bPosZ]) && GetPlayerVirtualWorld(playerid) == 0)
		{
			format(g_str, 120, ""WHITE_HEX"Приобрести бизнес "CONTRASTORANGE_HEX"\"%s\""WHITE_HEX" за "GREEN_HEX"%d$"WHITE_HEX"?", BI[i][bName], BI[i][bCost]);
			SetPVarInt(playerid, "businessid", i);
			SPD(playerid, DLG_CMD_BUYBUSINESS, DSM, ""SERVER_HEX"Покупка бизнеса", g_str, "Да", "Отмена");
		}
	}
	return 1;
}

@cmd() gps(playerid, params[], help)
{
	gpsCommand(playerid);
	return 1;
}

@cmd() pay(playerid, params[], help)
{
	extract params -> new pid, amount; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /pay [id] [сумма]");
	if(!IsPlayerConnected(pid) || playerid == pid) return 1;
	if(!ProxDetectorCMD(3.0, playerid, pid)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок далеко!");
	if(amount < 1 || amount < 100000) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Передаваемая сумма должна быть более 1 и менее 100.000$"); 
	if(PI[playerid][pMoney] < amount) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нет столько денег для перевода!");
	GiveMoney(playerid, pid, amount);
	ApplyAnimationEx(playerid, "DEALER", "shop_pay", 4.1, false, true, true, false, false, FORCE_SYNC:1);
	SCMESSF(playerid, SERVER_FORMAT, ""POSITIVE_MARK" Ты передал %d$ игроку %s[%d]", amount, PI[pid][pName], pid);
	SCMESSF(pid, SERVER_FORMAT, ""POSITIVE_MARK" %s[%d] передал тебе %d$", PI[playerid][pName], playerid, amount);  
	return 1;
}

@cmd() time(playerid, params[], help)
{
	new currdate;
	currdate = gettime();
	format(g_str, 100, "~b~%s~n~~w~PLAYED %s", UnixToDate(currdate), ConvertToTime(PI[playerid][pHourOnline]));
	GameTextForPlayer(playerid, g_str, 5000, 1);
	ApplyAnimationEx(playerid,"COP_AMBIENT","Coplook_watch",4.1,false,false,false,false,2000,FORCE_SYNC:1);
	switch(PI[playerid][pGender])
	{
		case 0: MeAction(playerid, "взглянула на часы");
		case 1: MeAction(playerid, "взглянул на часы");
	}
	SCMESSF(playerid, LIGHTBLUE_FORMAT, "Время в афк за сегодня: "WHITE_HEX"%s", ConvertToTime(PI[playerid][pAFKDayTime]));
	SCMESSF(playerid, LIGHTBLUE_FORMAT, "Всего отыграно за сегодня: "WHITE_HEX"%s", ConvertToTime(PI[playerid][pDayOnline]));
	if(PI[playerid][pMute]) SCMESSF(playerid, CONTRASTORANGE_FORMAT, "До разблокировки чата: %s", ConvertToTime(PI[playerid][pMute]));
	if(PI[playerid][pGCMute]) SCMESSF(playerid, CONTRASTORANGE_FORMAT, "До разблокировки глобального чата: %s", ConvertToTime(PI[playerid][pMute]));
	return 1;
}

@cmd(.alts = {"mn","mm"}) menu(playerid, params[], help)
{
	menuCommand(playerid);
	return 1;
}

@cmd() stats(playerid, params[], help)
{
	ShowStats(playerid,playerid);
	return 1;
}

@cmd() help(playerid, params[], help)
{
	return SPD(playerid, DLG_MENU_CMD, DSL, ""SERVER_HEX"Основные команды сервера", textServerCommands[0], "Выбрать", "Назад");
}

@cmd(.alts = {"moders"}) admins(playerid, params[], help)
{
	new var_count;
    SCMESS(playerid, YELLOW_FORMAT, "Модерация в сети:");
	if(!AI[playerid][aLevel])
	{
		foreach(new i : Admin)
		{
			if(AI[i][FD]) continue;
			if(TI[i][playerAFK] > 2) SCMESSF(playerid, WHITE_FORMAT, "%s%s"WHITE_HEX" %s[%d] "YELLOW_HEX"(AFK: %s)", adminRank[AI[i][aLevel]][pdColor], adminRank[AI[i][aLevel]][pdRank], PI[i][pName],i, ConvertToTime(TI[i][playerAFK] - 2));
			else SCMESSF(playerid, WHITE_FORMAT, "%s%s"WHITE_HEX" %s[%d]", adminRank[AI[i][aLevel]][pdColor], adminRank[AI[i][aLevel]][pdRank], PI[i][pName],i);
			var_count ++;
		}
	}
	else
	{
		foreach(new i : Player)
		{
			if(!pLoggedIn{i} || !IsPlayerConnected(i)) continue;
			if(AI[i][aLevel] && !AI[i][FD])
			{
				if(!AI[i][aLoggedIn]) SCMESSF(playerid, GREY_FORMAT, "%s %s[%d] не авторизован", adminRank[AI[i][aLevel]][pdRank], PI[i][pName], i);
				if(spectateID[i] != INVALID_PLAYER_ID)
				{
					if(TI[i][playerAFK] > 2) SCMESSF(playerid, WHITE_FORMAT, "%s%s"WHITE_HEX" %s[%d] "GREEN_HEX"(lvl:%d)"WHITE_HEX" [%d/3] "YELLOW_HEX"(AFK: %s) "DEFAULTRED_HEX"/sp %d", adminRank[AI[i][aLevel]][pdColor], adminRank[AI[i][aLevel]][pdRank], PI[i][pName],i,AI[i][aLevel],AI[i][aVigs], ConvertToTime(TI[i][playerAFK] - 2),spectateID[i]);
					else SCMESSF(playerid, WHITE_FORMAT, "%s%s"WHITE_HEX" %s[%d] "GREEN_HEX"(lvl:%d)"WHITE_HEX" [%d/3] "DEFAULTRED_HEX"/sp %d", adminRank[AI[i][aLevel]][pdColor], adminRank[AI[i][aLevel]][pdRank], PI[i][pName],i,AI[i][aLevel],AI[i][aVigs],spectateID[i]);
				}
				var_count ++;
			}
		}
	}
    if(var_count) SCMESSF(playerid, YELLOW_FORMAT, "Всего "WHITE_HEX"%d"YELLOW_HEX" модераторов на сервере", var_count);
	else if(!var_count) SCMESS(playerid, GREY_FORMAT, "Сейчас нет модераторов или администраторов в сети.");
	return 1;
}

@cmd() report(playerid, params[], help)
{
    reportCommand(playerid, params);
	return 1;
}

@cmd() n(playerid, params[], help)
{
	if(PI[playerid][pMute]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя бан чата!");
    if(IsNull(params)) return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /n [неролевое сообщение]");
	format(g_str, MAX_STR_LENGHT, "(( %s[%d]: %s ))", PI[playerid][pName], playerid, params);
	ProxDetector(13.0, playerid, g_str, NONRP_FORMAT);
	SetPlayerChatBubble(playerid, params, NONRP_FORMAT, 13.0, 5000);
	return 1;
}

@cmd(.alts = {"shout"}) s(playerid, params[], help)
{
	if(PI[playerid][pMute]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя бан чата!");
    if(IsNull(params)) return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /(s)hout [кричать]");
	format(g_str, MAX_STR_LENGHT, "{%s}%s[%d] "WHITE_HEX"кричит: %s", frac_name[PI[playerid][pMember]][fdColor], PI[playerid][pName], playerid, params);
	ProxDetector(35.0, playerid, g_str, WHITE_FORMAT);
	SetPlayerChatBubble(playerid, params, WHITE_FORMAT, 35.0, 5000);
	if(!IsPlayerInAnyVehicle(playerid) || !TI[playerid][playerFreezed]) ApplyAnimation(playerid, "ON_LOOKERS", "shout_01", 4.1, false, false, false, false, 0, FORCE_SYNC:1);
	return 1;
}

@cmd(.alts = {"whisper"}) w(playerid, params[], help)
{
	if(PI[playerid][pMute]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя бан чата!");
	if(IsNull(params)) return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /(w)hisper [текст]");
	format(g_str, MAX_STR_LENGHT, "%s[%d] шепчет: %s", PI[playerid][pName], playerid, params);
	ProxDetector(2.0, playerid, g_str, RPCHAT_FORMAT_GRAD1);
	SetPlayerChatBubble(playerid, params, RPCHAT_FORMAT_GRAD1, 2.0, 5000);
	return 1;
}

@cmd() me(playerid, params[], help)
{
	if(PI[playerid][pMute]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя бан чата!");
    if(IsNull(params)) return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /me [действие персонажа]");
	MeAction(playerid, params);
	return 1;
}

@cmd() do(playerid, params[], help)
{
	if(PI[playerid][pMute]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя бан чата!");
    if(IsNull(params)) return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /do [действие от 3-го лица]");
	DoAction(playerid, params);
	return 1;
}

@cmd() try(playerid, params[], help)
{
	if(PI[playerid][pMute]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя бан чата!");
    if(IsNull(params)) return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /try [действие персонажа]");
    TryAction(playerid, params);
	return 1;
}

@cmd() engine(playerid, params[], help)
{
	engineCommand(playerid);
	return 1;
}

@cmd() light(playerid, params[], help)
{
	lightCommand(playerid);
	return 1;
}

@cmd() lock(playerid, params[], help)
{
	new carid = PI[playerid][pVehID], Float:x_cmd_lock, Float:y_cmd_lock, Float:z_cmd_lock;
	if(!PI[playerid][pVehModel]) return SCMESS(playerid, GREY_FORMAT, !""NEGATIVE_MARK" Ты не имеешь личного транспорта.");
	if(!TI[playerid][personalVehFirst]) return SCMESS(playerid, GREY_FORMAT, !""NEGATIVE_MARK" Машина 1 не заспавнена.");
	GetVehiclePos(carid, x_cmd_lock, y_cmd_lock, z_cmd_lock);
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, x_cmd_lock, y_cmd_lock, z_cmd_lock)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Личный транспорт далеко.");
	if(!IsAVel(carid))
	{
		if(VI[carid][vLock])
		{
			SetVehicleVariables(carid, .doors = false);
			GameTextForPlayer(playerid, "~g~unlocked", 2000, 3);
			PlayerPlaySound(playerid, 24600, 0.0, 0.0, 0.0);
			format(g_str,50,"%s",(PI[playerid][pGender] == 1) ? ("открыл транспорт") : ("открыла транспорт"));
			SetPlayerChatBubble(playerid, g_str, RPCMD_FORMAT, 20.0, 5000);
		}
		else if(!VI[carid][vLock])
		{
			SetVehicleVariables(carid, .doors = true);
			GameTextForPlayer(playerid, "~r~locked", 2000, 3);
			PlayerPlaySound(playerid, 24600, 0.0, 0.0, 0.0);
			format(g_str,50,"%s",(PI[playerid][pGender] == 1) ? ("закрыл транспорт") : ("закрыла транспорт"));
			SetPlayerChatBubble(playerid, g_str, RPCMD_FORMAT, 20.0, 5000);
		}
	}
	return 1;
}

@cmd() createmyveh(playerid, params[], help)
{
	extract params -> new carmodel, clr1, clr2; else return SCMESS(playerid, WHITE_FORMAT, "/createmyveh carid clr1 clr2");
	new Float:x_pos,Float:y_pos,Float:z_pos,Float:a;
	GetPlayerPos(playerid, x_pos, y_pos, z_pos);
	GetPlayerFacingAngle(playerid, a);
	PI[playerid][pVehModel] = carmodel;
	PI[playerid][pVehX] = x_pos;
	PI[playerid][pVehY] = y_pos;
	PI[playerid][pVehZ] = z_pos;
	PI[playerid][pVehA] = a;
	PI[playerid][pVehColorP] = clr1;
	PI[playerid][pVehColorS] = clr2;
	PI[playerid][pVehFuel] = GetVehicleTank(PI[playerid][pVehModel]);
	PI[playerid][pVehHP] = 1000.0;
	mysql_format(connects, query, 350, "UPDATE "TABLE_ACCOUNTS" SET `pVehX` = '%f', `pVehY` = '%f', `pVehZ` = '%f', `pVehA` = '%f', `pVehModel` = '%d', `pVehColorP` = '%d', `pVehColorS` = '%d', `pVehFuel` = '%f', `pVehHP` = '%f' WHERE `id` = '%d' LIMIT 1", PI[playerid][pVehX], PI[playerid][pVehY], PI[playerid][pVehZ], PI[playerid][pVehA], PI[playerid][pVehModel], PI[playerid][pVehColorS], PI[playerid][pVehColorP], PI[playerid][pVehFuel], PI[playerid][pVehHP], PI[playerid][pID]);
	mysql_tquery(connects, query);
	SCMESS(playerid, WHITE_FORMAT, "Личный трнаспорт создан. Загрузить его - /loadmyveh");
	return 1;
}

@cmd() loadmyveh(playerid, params[], help)
{
	if(TI[playerid][personalVehFirst]) return SCMESS(playerid, WHITE_FORMAT, "Транспорт уже загружен.");
	if(!PI[playerid][pVehModel]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя нет личного транспорта.");
	PI[playerid][pVehID] = CreateVehicle(PI[playerid][pVehModel], PI[playerid][pVehX], PI[playerid][pVehY], PI[playerid][pVehZ], PI[playerid][pVehA], PI[playerid][pVehColorP], PI[playerid][pVehColorS], -1);
	SetVehicleHealth(PI[playerid][pVehID], PI[playerid][pVehHP]);
	VI[PI[playerid][pVehID]][vFuel] = PI[playerid][pVehFuel];
	SetVehicleVariables(PI[playerid][pVehID], .engine = false, .lights = false, .doors = true);
	TI[playerid][personalVehFirst] = true;
	return 1;
}

@cmd() park(playerid, params[], help)
{
	if(!PI[playerid][pVehModel]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя нет личного транспорта.");
	if(PI[playerid][pVehID] != GetPlayerVehicleID(playerid)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Ты не в своём транспорте.");
	if(GetPlayerVehicleSeat(playerid) != 0) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нужно находиться на водительском месте личного транспорта.");
	if(GetVehicleSpeed(PI[playerid][pVehID]) >= 1) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Сначала останови транспорт.");
	new Float:vehhp;
	GetVehicleHealth(PI[playerid][pVehID], vehhp);
	if(vehhp <= 100.0) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Транспорт сильно повреждён. Сначала отремонтируй его.");
	if(PI[playerid][pInt] >= 1 || PI[playerid][pVW] >= 1) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Здесь нельзя запарковать транспорт.");
	TI[playerid][personalVehFirst] = false;
	DestroyVehicleEx(PI[playerid][pVehID]);
	new Float:x_pos,Float:y_pos,Float:z_pos,Float:a;
	GetPlayerPos(playerid, x_pos, y_pos, z_pos);
	GetPlayerFacingAngle(playerid, a);
	PI[playerid][pVehX] = x_pos;
	PI[playerid][pVehY] = y_pos;
	PI[playerid][pVehZ] = z_pos;
	PI[playerid][pVehA] = a;
	mysql_format(connects, query, 350, "UPDATE "TABLE_ACCOUNTS" SET `pVehX` = '%f', `pVehY` = '%f', `pVehZ` = '%f', `pVehA` = '%f' WHERE `id` = '%d' LIMIT 1", PI[playerid][pVehX], PI[playerid][pVehY], PI[playerid][pVehZ], PI[playerid][pVehA], PI[playerid][pID]);
	mysql_tquery(connects, query);
	PI[playerid][pVehID] = CreateVehicle(PI[playerid][pVehModel], PI[playerid][pVehX], PI[playerid][pVehY], PI[playerid][pVehZ], PI[playerid][pVehA], PI[playerid][pVehColorP], PI[playerid][pVehColorS], -1);
	SetVehicleHealth(PI[playerid][pVehID], PI[playerid][pVehHP]);
	VI[PI[playerid][pVehID]][vFuel] = PI[playerid][pVehFuel];
	SetVehicleVariables(PI[playerid][pVehID], .engine = false, .lights = false, .doors = true);
	TI[playerid][personalVehFirst] = true;
	PutPlayerInVehicle(playerid, PI[playerid][pVehID], 0);
	SCMESS(playerid, WHITE_FORMAT, "Место спавна транспорта успешно установлено.");
	return 1;
}

@cmd() vehmenu(playerid, params[], help)
{
	if(!PI[playerid][pVehModel]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя нет личного транспорта.");
	//SPD(playerid, DLG_CMD_VEHMENU, DSL, ""SERVER_HEX"Меню личного транспорта", "1. %s\n
	//2. ", "Выбрать", "Выйти");
	return 1;
}

@cmd() members(playerid, params[], help)
{
	if(!PI[playerid][pMember]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Ты нигде не работаешь.");
	SCMESS(playerid, YELLOW_FORMAT, "Сотрудники в сети:");
	new members_count;
	foreach(new i : Player)
	{
        if(AI[i][aLevel] || !pLoggedIn{i} || !IsPlayerConnected(i) || PI[i][pMember] != PI[playerid][pMember]) continue;
	    members_count++;
	   	switch(IsAGov(playerid))
		{
			case 1:
			{
				if(TI[i][playerAFK] > 2)
				{
					SCMESSF(playerid, SERVER_FORMAT, "%s %s[%d] | %s (AFK: %s)",frac_rankname[PI[i][pMember]][PI[i][pRank]], PI[i][pName], i, PI[i][pDuty] ? ("Работает") : ("Выходной"), ConvertToTime(TI[i][playerAFK] - 2));
				}
				else SCMESSF(playerid, SERVER_FORMAT, "%s %s[%d] | %s",frac_rankname[PI[i][pMember]][PI[i][pRank]], PI[i][pName], i, PI[i][pDuty] ? ("Работает") : ("Выходной"));
			}
			default:
			{
				if(TI[i][playerAFK] > 2)
				{
					SCMESSF(playerid, SERVER_FORMAT, "%s %s[%d] (AFK: %s)",frac_rankname[PI[i][pMember]][PI[i][pRank]], PI[i][pName], i, ConvertToTime(TI[i][playerAFK] - 2));
				}
				else SCMESSF(playerid, SERVER_FORMAT, "%s %s[%d]",frac_rankname[PI[i][pMember]][PI[i][pRank]], PI[i][pName], i);
			}
		}
	}
	if(members_count == 0) SCMESS(playerid, GREY_FORMAT, "Нет сотрудников в сети.");
	else SCMESSF(playerid, WHITE_FORMAT, "Всего %d сотрудников в сети.", members_count);
	return 1;
}

@cmd() invite(playerid, params[], help)
{
	if(!PI[playerid][pMember]) return 1;
	if(IsAbleToInvite(playerid))
	{
		extract params -> new pid; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /invite [id]");
		if(!IsPlayerConnected(pid) || pid == playerid) return 1;
		if(IsPlayerInAnyVehicle(pid)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок в машине.");
		if(PI[pid][pMember]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Он уже состоит в организации.");
		if(PI[pid][pWarns]) return SCMESS(playerid, GREY_FORMAT,""NEGATIVE_MARK" У игрока имеется предупреждение.");
		if(!PI[pid][pIdCard]) return SCMESS(playerid, GREY_FORMAT,""NEGATIVE_MARK" У игрока нет ID карты.");
		if(!ProxDetectorCMD(10.0, playerid, pid) || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(pid)) return SCMESS(playerid, GREY_FORMAT,""NEGATIVE_MARK" Игрок далеко.");
		SendPositiveMess(playerid, "Игроку %s[%d] отправлено приглашение в организацию: %s", PI[pid][pName], pid, frac_name[PI[playerid][pMember]]);
		new pidfraction = PI[playerid][pMember],
			str_1[256];
		format(str_1,sizeof(str_1),""WHITE_HEX"%s предлагает тебе вступить в организацию: "SERVER_HEX"%s"WHITE_HEX"\n\nНажми \"Да\" для согласия или \"Нет\" для отказа.", PI[playerid][pName],frac_name[PI[playerid][pMember]]);
		SetPVarInt(pid, "invitepid", playerid);
		SetPVarInt(pid, "pidfractioninvite", pidfraction);
		SPD(pid, DLG_CMD_INVITE, DSM, "Приглашение в организацию", str_1, "Да", "Нет");
	}
	return 1;
}

@cmd() gov(playerid, params[], help)
{
	if(IsAbleToGov(playerid))
	{
		if(PI[playerid][pMute]) return SCMESS(playerid, GREY_FORMAT, !""NEGATIVE_MARK" У тебя мут!");
		extract params -> new string:text[MAX_STR_LENGHT]; else return SCMESS(playerid, WHITE_FORMAT, !"Подсказка: /gov [сообщение]");
		if(GetPVarInt(playerid,"gov") > gettime()) return SCMESS(playerid, GREY_FORMAT, !""NEGATIVE_MARK" Отправить гос. новость можно раз в секунду.");
		SMTAF(GOV_FORMAT, !"[%s] %s: %s", frac_name[PI[playerid][pMember]], PI[playerid][pName], text);
		SetPVarInt(playerid,"gov",gettime() + 1);
	}
	return 1;
}

@cmd() giverank(playerid, params[], help)
{
    if(!PI[playerid][pMember]) return 1;
	if(IsAbleToInvite(playerid))
	{
		extract params -> new pid, rank; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /giverank [id] [rank]");
		if(!IsPlayerConnected(pid) || pid == playerid) return 1;
		if(PI[pid][pLeader]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Указан ID лидера!");
		if(PI[playerid][pMember] != PI[pid][pMember]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Данный игрок не в твоей организации!");
		if(PI[playerid][pMember] > 0 && PI[playerid][pRank] <= rank) return SCMESS(playerid, GREY_FORMAT,""NEGATIVE_MARK" Ошибка");
		if(PI[playerid][pLeader] <= 0 && PI[playerid][pRank] <=  PI[pid][pRank]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Ошибка");
		if(rank == PI[pid][pRank]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У него уже и так эта должность.");
		if(rank > PI[pid][pRank])
		{
			PI[pid][pRank] = rank;
			SCMESSF(pid, ACTION_FORMAT, "%s[%d] повысил тебя до должности %s", PI[playerid][pName], playerid, frac_rankname[PI[pid][pMember]][PI[pid][pRank]]);
			SCMESSF(playerid, ACTION_FORMAT, "Ты повысил %s до должности %s.", PI[pid][pName], frac_rankname[PI[pid][pMember]][PI[pid][pRank]]);
			return 1;
		}
		PI[pid][pRank] = rank;
		SCMESSF(pid, ACTION_FORMAT, "%s[%d] понизил тебя до должности %s", PI[playerid][pName], playerid, frac_rankname[PI[pid][pMember]][PI[pid][pRank]]);
		SCMESSF(playerid, ACTION_FORMAT, "Ты понизил %s до должности %s.", PI[pid][pName], frac_rankname[PI[pid][pMember]][PI[pid][pRank]]);
	}
    return 1;
}

@cmd() uninvite(playerid, params[], help)
{
    if(!PI[playerid][pMember]) return 1;
	if(IsAbleToInvite(playerid))
	{
		extract params -> new pid, string:reason[64]; else return SCMESS(playerid, WHITE_FORMAT, "Используй: /uninvite [id] [reason]");
		if(!IsPlayerConnected(pid) || pid == playerid) return 1;
		if(strlen(reason) >= 64) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Слишком длинная причина.");
		if(PI[playerid][pRank] == PI[pid][pRank]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нельзя уволить этого игрока");
		if(PI[playerid][pLeader] <= 0 && PI[playerid][pRank] <= PI[pid][pRank]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Нельзя уволить этого игрока");
		if(PI[pid][pMember] != PI[playerid][pMember]) return SCMESS(playerid,GREY_FORMAT,""NEGATIVE_MARK" Нельзя уволить этого игрока");
		if(PI[pid][pMember] <= 0 || PI[pid][pLeader] >= 1) return 1;
		ClearMember(pid);
		SCMESSF(pid, ACTION_FORMAT, "%s[%d] выгнал Вас из организации. Причина: %s",PI[playerid][pName],pid,reason);
		SCMESSF(playerid, ACTION_FORMAT, "Вы выгнали %s[%d] из организации по причине: %s",PI[pid][pName],pid,reason);
		SCMESS(pid, WHITE_FORMAT, "Теперь Вы обычный гражданин.");
		SAMF(GREY_FORMAT,!"(uninvite) %s %s[%d] уволил из организации %s[%d]. Причина: %s", frac_rankname[PI[playerid][pMember]][PI[playerid][pRank]],PI[playerid][pName], playerid,PI[pid][pName], pid,reason);
	}
	return 1;
}

@cmd(.alts = {"radio"}) r(playerid, params[], help)
{
	if(IsAGov(playerid))
	{
		if(PI[playerid][pMute]) return SCMESS(playerid, GREY_FORMAT, !""NEGATIVE_MARK" У тебя бан чата!");
		if(!PI[playerid][pDuty]) return SCMESS(playerid, WHITE_FORMAT, !""NEGATIVE_MARK" Должен быть в форме организации.");
		if(IsNull(params)) return SCMESS(playerid, WHITE_FORMAT, !"Подсказка: /(r)adio [сообщение]");
		new str_1[MAX_STR_LENGHT];
		format(str_1, sizeof(str_1), "[R] %s %s[%d]: %s", frac_rankname[PI[playerid][pMember]][PI[playerid][pRank]], PI[playerid][pName], playerid, params);
		STM(PI[playerid][pMember], str_1);
		switch(PI[playerid][pGender])
		{
			case 0: SetPlayerChatBubble(playerid, "сообщила что-то по рации", RPCMD_FORMAT, 20.0, 5000);
			case 1: SetPlayerChatBubble(playerid, "сообщил что-то по рации", RPCMD_FORMAT, 20.0, 5000);
		}
		return 1;
	}
	return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Доступно только для государственных организаций.");
}

@cmd() rn(playerid, params[], help)
{
	if(IsAGov(playerid))
	{
		if(PI[playerid][pMute]) return SCMESS(playerid, GREY_FORMAT, !""NEGATIVE_MARK" У тебя бан чата!");
		if(!PI[playerid][pDuty]) return SCMESS(playerid, WHITE_FORMAT, !""NEGATIVE_MARK" Должен быть в форме организации.");
		if(IsNull(params)) return SCMESS(playerid, WHITE_FORMAT, !"Подсказка: /rn [сообщение]");
		new str_1[MAX_STR_LENGHT];
		format(str_1, sizeof(str_1), "[RN] (( %s %s[%d]: %s ))", frac_rankname[PI[playerid][pMember]][PI[playerid][pRank]], PI[playerid][pName], playerid, params);
		STM(PI[playerid][pMember], str_1);
		switch(PI[playerid][pGender])
		{
			case 0: SetPlayerChatBubble(playerid, "сообщила что-то по рации", RPCMD_FORMAT, 20.0, 5000);
			case 1: SetPlayerChatBubble(playerid, "сообщил что-то по рации", RPCMD_FORMAT, 20.0, 5000);
		}
		return 1;
	}
	return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Доступно только для государственных организаций.");
}

@cmd() changeskin(playerid, params[], help)
{
	if(!PI[playerid][pMember]) return 1;
	if(IsAbleToInvite(playerid))
	{
		extract params -> new pid; else return SCMESS(playerid, WHITE_FORMAT, "Подсказка: /changeskin [id]");
		if(!IsPlayerConnected(pid) || !pLoggedIn{pid} || !PI[pid][pID]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрока нет на сервере");
		if(PI[pid][pMember] == 0) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Игрок не в организации!");
		if(PI[pid][pMember] != PI[pid][pMember]) return SCMESS(playerid, GREY_FORMAT, !""NEGATIVE_MARK" Игрок находится в другой организации!");
		if(!ProxDetectorCMD(10.0, playerid, pid) || GetPlayerVirtualWorld(playerid) != GetPlayerVirtualWorld(pid)) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Далеко друг от друга");
		if(!PI[pid][pDuty]) return SCMESS(playerid, GREEN_FORMAT, !""NEGATIVE_MARK" Игрок не на работе.");
		if(PI[pid][pRank] > PI[playerid][pRank]) return SCMESS(playerid, GREY_FORMAT, !""NEGATIVE_MARK" Недостаточный ранг.");
		new str_1[256];
		for(new i=0; i < MAX_FRACSKINS; i++)
		{
			new skin_id = frac_skin[PI[playerid][pMember]][i];
			if(!skin_id) break;
			if(!i) format(str_1, sizeof(str_1), "Скин %d [%d]", i+1, skin_id);
			else format(str_1, sizeof(str_1), "%s\nСкин %d [%d]", str_1, i+1, skin_id);
		}
		SetPVarInt(playerid, "changeskinpid", pid);
		SPD(playerid, DLG_CMD_CHANGESKIN, DSL, ""SERVER_HEX"Выбор скина", str_1, "Принять", "");
	}
	return 1;
}

@cmd() animlist(playerid, params[], help)
{
	if(IsPlayerInAnyVehicle(playerid)) return SCMESS(playerid, GREY_FORMAT, !""NEGATIVE_MARK" В данный момент нельзя использовать анимации");
	//if(GetPVarInt(playerid, "AntiFloodHEALME") > gettime()) return SCMESS(playerid, GREY_FORMAT, "На данный момент вы в бою!");
	if(TI[playerid][playerFreezed]) return SCMESS(playerid, GREY_FORMAT, !""NEGATIVE_MARK" В данный момент Вы заморожены!");
	if(GetPVarInt(playerid, "Tazer") > 0) return SCMESS(playerid, GREY_FORMAT, !""NEGATIVE_MARK" Вы оглушены / в наручниках!");
	new string[440], animid;
	if(sscanf(params, "i", animid))
	{
		new anims[][] =
		{
			{"1. Руки вверх\n2. Справлять нужду\n3. Танец (1)\n4. Танец (2)\n5. Танец (3)\n6. Танец (4)\n7. Танец (5)\n8. Танец (6)\n9. Танец (7)\n10. Танец (8)\n11. Танец (9)\n12. Танец(10)\n13. Курить\n14. Возмущение\n15. Присесть (1)\n16. Присесть (2)\n17. Присесть (3)\n18. Присесть (4)\n19. Лежать (1)\n20. Лежать (2)\n21. Жест рукой (1)\n22. Жест рукой (2)\n"},
			{"23. Читать рэп\n24. Зивать\n25. Диллер (1)\n26. Диллер (2)\n27. Диллер (3)\n28. Диллер (4)\n29. Пьяная походка\n30. Рука лицо\n31. Спать на боку\n32. Сесть на корточки"}
		};
		string = "";
		format(string, sizeof(string), "%s%s", anims[0], anims[1]);
		SPD(playerid,DLG_CMD_ANIMLIST,DSL, !""SERVER_HEX"Анимации", string, !"Выбрать", !"Отмена");
	}
	switch(animid)
	{
		case 0:
		{
			new animss[][] =
			{
				{"1. Руки вверх\n2. Справлять нужду\n3. Танец (1)\n4. Танец (2)\n5. Танец (3)\n6. Танец (4)\n7. Танец (5)\n8. Танец (6)\n9. Танец (7)\n10. Танец (8)\n11. Танец (9)\n12. Танец(10)\n13. Курить\n14. Возмущение\n15. Присесть (1)\n16. Присесть (2)\n17. Присесть (3)\n18. Присесть (4)\n19. Лежать (1)\n20. Лежать (2)\n21. Жест рукой (1)\n22. Жест рукой (2)\n"},
				{"23. Читать рэп\n24. Зивать\n25. Диллер (1)\n26. Диллер (2)\n27. Диллер (3)\n28. Диллер (4)\n29. Пьяная походка\n30. Рука лицо\n31. Спать на боку\n32. Сесть на корточки"}
			};
			string = "";
			format(string, sizeof(string), "%s%s", animss[0], animss[1]);
			SPD(playerid,DLG_CMD_ANIMLIST,DSL, ""SERVER_HEX"Анимации", string, !"Выбрать", !"Отмена");
			return 1;
		}
		case 1: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_HANDSUP);
		case 2: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_PISSING);
		case 3: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE1);
		case 4: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE2);
		case 5: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE3);
		case 6: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE4);
		case 7: ApplyAnimation(playerid,"DANCING","dnce_M_b",4.1,true,false,false,false,0,FORCE_SYNC:1);
		case 8: ApplyAnimation(playerid,"DANCING","dnce_M_a",4.1,true,false,false,false,0,FORCE_SYNC:1);
		case 9: ApplyAnimation(playerid,"DANCING","dnce_M_b",4.1,true,false,false,false,0,FORCE_SYNC:1);
		case 10: ApplyAnimation(playerid,"DANCING","DAN_Down_A",4.1,true,false,false,false,0,FORCE_SYNC:1);
		case 11: ApplyAnimation(playerid,"DANCING","DAN_Left_A",4.1,true,false,false,false,0,FORCE_SYNC:1);
		case 12: ApplyAnimation(playerid,"DANCING","DAN_Loop_A",4.1,true,false,false,false,0,FORCE_SYNC:1);
		case 13: ApplyAnimation(playerid,"SMOKING","M_smklean_loop",4.1,true,false,false,false,0,FORCE_SYNC:1);
		case 14: ApplyAnimation(playerid,"PED","fucku",4.1,false,false,false,false,0,FORCE_SYNC:1);
		case 15: ApplyAnimation(playerid,"INT_OFFICE","OFF_Sit_Crash",4.1,false,false,false,true,0,FORCE_SYNC:1);
		case 16: ApplyAnimation(playerid,"BEACH","ParkSit_W_Loop",4.1,true,false,false,true,0,FORCE_SYNC:1);
		case 17: ApplyAnimation(playerid,"PED","SEAT_down",4.1,false,false,false,true,0,FORCE_SYNC:1);
		case 18: ApplyAnimation(playerid,"BEACH","ParkSit_M_loop",4.1,true,false,false,true,0,FORCE_SYNC:1);
		case 19: ApplyAnimation(playerid,"BEACH","SitnWait_loop_W",4.1,true,false,false,true,0,FORCE_SYNC:1);
		case 20: ApplyAnimation(playerid,"BEACH","Lay_Bac_Loop",4.1,true,false,false,true,0,FORCE_SYNC:1);
		case 21: ApplyAnimation(playerid,"GANGS","hndshkba",4.1,false,false,false,false,0,FORCE_SYNC:1);
		case 22: ApplyAnimation(playerid,"ON_LOOKERS","WAVE_LOOP",4.1,true,true,true,false,0,FORCE_SYNC:1);
		case 23: ApplyAnimation(playerid,"BENCHPRESS","GYM_BP_CELEBRATE",4.1,true,true,true,false,0,FORCE_SYNC:1);
		case 24: ApplyAnimation(playerid,"GANGS","smkcig_prtl",4.1,false,false,false,false,0,FORCE_SYNC:1);
		case 25: ApplyAnimation(playerid,"DEALER","DEALER_DEAL",4.1,false,false,false,false,0,FORCE_SYNC:1);
		case 26: ApplyAnimation(playerid,"DEALER","DEALER_IDLE_01",4.1,false,false,false,false,0,FORCE_SYNC:1);
		case 27: ApplyAnimation(playerid,"DEALER","DEALER_IDLE_03",4.1,false,false,false,false,0,FORCE_SYNC:1);
		case 28: ApplyAnimation(playerid,"DEALER","DRUGS_BUY",4.1,false,false,false,false,0,FORCE_SYNC:1);
		case 29: ApplyAnimation(playerid,"RYDER","RYD_Die_PT1",4.1,true,true,false,false,0,FORCE_SYNC:1);
		case 30: ApplyAnimation(playerid,"MISC","plyr_shkhead",4.1,false,false,false,false,0,FORCE_SYNC:1);
		case 31: ApplyAnimation(playerid,"CRACK","Crckidle2",4.1,true,false,false,false,0,FORCE_SYNC:1);
		case 32: ApplyAnimation(playerid,"PED","cower",3.0,true,false,false,false,0,FORCE_SYNC:1);
	}
	SetPVarInt(playerid, "Animation", 1);
	TextDrawShowForPlayer(playerid, animDraw);
	return 1;
}

@cmd(.alts = {"globalchat", "gchat"}) gc(playerid, params[], help)
{
	if(PI[playerid][pLevel] < 2) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Для использования глобального чата нужен 2-й уровень.");
	if(PI[playerid][pGCMute] || PI[playerid][pMute]) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" У тебя бан чата.");
	if(!AI[playerid][aLevel]) if(globalChat == false) return SCMESS(playerid, GREY_FORMAT, ""NEGATIVE_MARK" Глобальный чат отключен для игроков.");
	extract params -> new string:text[MAX_STR_LENGHT]; else return SCMESS(playerid, WHITE_FORMAT, !"Подсказка: /gc [text]");
	if(AI[playerid][aLevel])
	{
		GLMESSF(GCHAT_FORMAT, "[GC] "DARKYELLOW_HEX"[А]"GCHAT_HEX" %s[%d]: %s", PI[playerid][pName], playerid, text);
	}
	else
	{
		GLMESSF(GCHAT_FORMAT, "[GC] %s[%d]: %s", PI[playerid][pName], playerid, text);
	}
	return 1;
}

#include <admin\commands.inc>