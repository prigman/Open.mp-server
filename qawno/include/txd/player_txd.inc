for(new i=0; i < sizeof(Logo); i++) TextDrawShowForPlayer(playerid, Logo[i]);

changeskin_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 322.3280, 337.5833, "10000000"); // ïóñòî
PlayerTextDrawLetterSize(playerid, changeskin_PTD[playerid][0], 0.4205, 1.7805);
PlayerTextDrawAlignment(playerid, changeskin_PTD[playerid][0], TEXT_DRAW_ALIGN:2);
PlayerTextDrawColour(playerid, changeskin_PTD[playerid][0], 8388863);
PlayerTextDrawSetOutline(playerid, changeskin_PTD[playerid][0], 1);
PlayerTextDrawBackgroundColour(playerid, changeskin_PTD[playerid][0], 255);
PlayerTextDrawFont(playerid, changeskin_PTD[playerid][0], TEXT_DRAW_FONT:3);
PlayerTextDrawSetProportional(playerid, changeskin_PTD[playerid][0], true);
PlayerTextDrawSetShadow(playerid, changeskin_PTD[playerid][0], 0);

textPlayerVelocimetro[0][playerid] = CreatePlayerTextDraw(playerid,615.000000, 385.000000, "Landstalker");
PlayerTextDrawAlignment(playerid,textPlayerVelocimetro[0][playerid], TEXT_DRAW_ALIGN:3);
PlayerTextDrawBackgroundColour(playerid,textPlayerVelocimetro[0][playerid], 0);
PlayerTextDrawFont(playerid,textPlayerVelocimetro[0][playerid], TEXT_DRAW_FONT:1);
PlayerTextDrawLetterSize(playerid,textPlayerVelocimetro[0][playerid], 0.330000, 1.299999);
PlayerTextDrawColour(playerid,textPlayerVelocimetro[0][playerid], -156);
PlayerTextDrawSetOutline(playerid,textPlayerVelocimetro[0][playerid], 0);
PlayerTextDrawSetProportional(playerid,textPlayerVelocimetro[0][playerid], true);
PlayerTextDrawSetShadow(playerid,textPlayerVelocimetro[0][playerid], 1);
PlayerTextDrawSetSelectable(playerid,textPlayerVelocimetro[0][playerid], false);

textPlayerVelocimetro[1][playerid] = CreatePlayerTextDraw(playerid,615.000000, 399.000000, "000 km/h");
PlayerTextDrawAlignment(playerid,textPlayerVelocimetro[1][playerid], TEXT_DRAW_ALIGN:3);
PlayerTextDrawBackgroundColour(playerid,textPlayerVelocimetro[1][playerid], 0);
PlayerTextDrawFont(playerid,textPlayerVelocimetro[1][playerid], TEXT_DRAW_FONT:2);
PlayerTextDrawLetterSize(playerid,textPlayerVelocimetro[1][playerid], 0.250000, 1.299999);
PlayerTextDrawColour(playerid,textPlayerVelocimetro[1][playerid], -156);
PlayerTextDrawSetOutline(playerid,textPlayerVelocimetro[1][playerid], 0);
PlayerTextDrawSetProportional(playerid,textPlayerVelocimetro[1][playerid], true);
PlayerTextDrawSetShadow(playerid,textPlayerVelocimetro[1][playerid], 1);
PlayerTextDrawSetSelectable(playerid,textPlayerVelocimetro[1][playerid], false);

textPlayerVelocimetro[2][playerid] = CreatePlayerTextDraw(playerid,615.000000, 413.000000, "0 Liters");
PlayerTextDrawAlignment(playerid,textPlayerVelocimetro[2][playerid], TEXT_DRAW_ALIGN:3);
PlayerTextDrawBackgroundColour(playerid,textPlayerVelocimetro[2][playerid], 0);
PlayerTextDrawFont(playerid,textPlayerVelocimetro[2][playerid], TEXT_DRAW_FONT:2);
PlayerTextDrawLetterSize(playerid,textPlayerVelocimetro[2][playerid], 0.250000, 1.299999);
PlayerTextDrawColour(playerid,textPlayerVelocimetro[2][playerid], -156);
PlayerTextDrawSetOutline(playerid,textPlayerVelocimetro[2][playerid], 0);
PlayerTextDrawSetProportional(playerid,textPlayerVelocimetro[2][playerid], true);
PlayerTextDrawSetShadow(playerid,textPlayerVelocimetro[2][playerid], 1);
PlayerTextDrawSetSelectable(playerid,textPlayerVelocimetro[2][playerid], false);

textPlayerVelocimetro[3][playerid] = CreatePlayerTextDraw(playerid,615.000000, 427.000000, "0%");
PlayerTextDrawAlignment(playerid,textPlayerVelocimetro[3][playerid], TEXT_DRAW_ALIGN:3);
PlayerTextDrawBackgroundColour(playerid,textPlayerVelocimetro[3][playerid], 0);
PlayerTextDrawFont(playerid,textPlayerVelocimetro[3][playerid], TEXT_DRAW_FONT:2);
PlayerTextDrawLetterSize(playerid,textPlayerVelocimetro[3][playerid], 0.250000, 1.299999);
PlayerTextDrawColour(playerid,textPlayerVelocimetro[3][playerid], -156);
PlayerTextDrawSetOutline(playerid,textPlayerVelocimetro[3][playerid], 0);
PlayerTextDrawSetProportional(playerid,textPlayerVelocimetro[3][playerid], true);
PlayerTextDrawSetShadow(playerid,textPlayerVelocimetro[3][playerid], 1);
PlayerTextDrawSetSelectable(playerid,textPlayerVelocimetro[3][playerid], false);

/*****************
* PLAYER INFO TEXTS
*****************/
playerInfoPTD[playerid][0] = CreatePlayerTextDraw(playerid, 302.0000, 340.0000, "Username");
PlayerTextDrawFont(playerid, playerInfoPTD[playerid][0], TEXT_DRAW_FONT:1);
PlayerTextDrawLetterSize(playerid, playerInfoPTD[playerid][0], 0.2399, 1.3000);
PlayerTextDrawColour(playerid, playerInfoPTD[playerid][0], -7601921);
PlayerTextDrawSetShadow(playerid, playerInfoPTD[playerid][0], 0);
PlayerTextDrawSetOutline(playerid, playerInfoPTD[playerid][0], 0);
PlayerTextDrawBackgroundColour(playerid, playerInfoPTD[playerid][0], 255);
PlayerTextDrawSetProportional(playerid, playerInfoPTD[playerid][0], true);
PlayerTextDrawTextSize(playerid, playerInfoPTD[playerid][0], 640.0000, 0.0000);

playerInfoPTD[playerid][1] = CreatePlayerTextDraw(playerid, 302.0000, 351.0000, "ID: 13");
PlayerTextDrawFont(playerid, playerInfoPTD[playerid][1], TEXT_DRAW_FONT:1);
PlayerTextDrawLetterSize(playerid, playerInfoPTD[playerid][1], 0.1199, 0.5999);
PlayerTextDrawColour(playerid, playerInfoPTD[playerid][1], 1684301055);
PlayerTextDrawSetShadow(playerid, playerInfoPTD[playerid][1], 0);
PlayerTextDrawSetOutline(playerid, playerInfoPTD[playerid][1], 0);
PlayerTextDrawBackgroundColour(playerid, playerInfoPTD[playerid][1], 255);
PlayerTextDrawSetProportional(playerid, playerInfoPTD[playerid][1], true);
PlayerTextDrawTextSize(playerid, playerInfoPTD[playerid][1], 640.0000, 0.0000);

playerInfoPTD[playerid][2] = CreatePlayerTextDraw(playerid, 251.5000, 384.0000, "HEALTH: ~w~80");
PlayerTextDrawFont(playerid, playerInfoPTD[playerid][2], TEXT_DRAW_FONT:1);
PlayerTextDrawLetterSize(playerid, playerInfoPTD[playerid][2], 0.1399, 0.7999);
PlayerTextDrawColour(playerid, playerInfoPTD[playerid][2], -1768515841);
PlayerTextDrawSetShadow(playerid, playerInfoPTD[playerid][2], 0);
PlayerTextDrawSetOutline(playerid, playerInfoPTD[playerid][2], 0);
PlayerTextDrawBackgroundColour(playerid, playerInfoPTD[playerid][2], 255);
PlayerTextDrawSetProportional(playerid, playerInfoPTD[playerid][2], true);
PlayerTextDrawTextSize(playerid, playerInfoPTD[playerid][2], 640.0000, 0.0000);

playerInfoPTD[playerid][3] = CreatePlayerTextDraw(playerid, 320.5000, 384.0000, "ARMOUR: ~w~10");
PlayerTextDrawFont(playerid, playerInfoPTD[playerid][3], TEXT_DRAW_FONT:1);
PlayerTextDrawLetterSize(playerid, playerInfoPTD[playerid][3], 0.1399, 0.7999);
PlayerTextDrawColour(playerid, playerInfoPTD[playerid][3], -1768515841);
PlayerTextDrawSetShadow(playerid, playerInfoPTD[playerid][3], 0);
PlayerTextDrawSetOutline(playerid, playerInfoPTD[playerid][3], 0);
PlayerTextDrawBackgroundColour(playerid, playerInfoPTD[playerid][3], 255);
PlayerTextDrawSetProportional(playerid, playerInfoPTD[playerid][3], true);
PlayerTextDrawTextSize(playerid, playerInfoPTD[playerid][3], 640.0000, 0.0000);

playerInfoPTD[playerid][4] = CreatePlayerTextDraw(playerid, 302.0000, 360.5000, "WEAPON: ~w~M4 (144)");
PlayerTextDrawFont(playerid, playerInfoPTD[playerid][4], TEXT_DRAW_FONT:1);
PlayerTextDrawLetterSize(playerid, playerInfoPTD[playerid][4], 0.1399, 0.7999);
PlayerTextDrawColour(playerid, playerInfoPTD[playerid][4], -1768515841);
PlayerTextDrawSetShadow(playerid, playerInfoPTD[playerid][4], 0);
PlayerTextDrawSetOutline(playerid, playerInfoPTD[playerid][4], 0);
PlayerTextDrawBackgroundColour(playerid, playerInfoPTD[playerid][4], 255);
PlayerTextDrawSetProportional(playerid, playerInfoPTD[playerid][4], true);
PlayerTextDrawTextSize(playerid, playerInfoPTD[playerid][4], 640.0000, 0.0000);

playerInfoPTD[playerid][5] = CreatePlayerTextDraw(playerid, 302.0000, 368.0000, "MONEY: ~g~$~w~99,242,221");
PlayerTextDrawFont(playerid, playerInfoPTD[playerid][5], TEXT_DRAW_FONT:1);
PlayerTextDrawLetterSize(playerid, playerInfoPTD[playerid][5], 0.1399, 0.7999);
PlayerTextDrawColour(playerid, playerInfoPTD[playerid][5], -1768515841);
PlayerTextDrawSetShadow(playerid, playerInfoPTD[playerid][5], 0);
PlayerTextDrawSetOutline(playerid, playerInfoPTD[playerid][5], 0);
PlayerTextDrawBackgroundColour(playerid, playerInfoPTD[playerid][5], 255);
PlayerTextDrawSetProportional(playerid, playerInfoPTD[playerid][5], true);
PlayerTextDrawTextSize(playerid, playerInfoPTD[playerid][5], 640.0000, 0.0000);

playerInfoPTD[playerid][6] = CreatePlayerTextDraw(playerid, 302.0000, 375.0000, "SPEED: ~w~0.2 mps");
PlayerTextDrawFont(playerid, playerInfoPTD[playerid][6], TEXT_DRAW_FONT:1);
PlayerTextDrawLetterSize(playerid, playerInfoPTD[playerid][6], 0.1399, 0.7999);
PlayerTextDrawColour(playerid, playerInfoPTD[playerid][6], -1768515841);
PlayerTextDrawSetShadow(playerid, playerInfoPTD[playerid][6], 0);
PlayerTextDrawSetOutline(playerid, playerInfoPTD[playerid][6], 0);
PlayerTextDrawBackgroundColour(playerid, playerInfoPTD[playerid][6], 255);
PlayerTextDrawSetProportional(playerid, playerInfoPTD[playerid][6], true);
PlayerTextDrawTextSize(playerid, playerInfoPTD[playerid][6], 640.0000, 0.0000);

playerInfoPTD[playerid][7] = CreatePlayerTextDraw(playerid, 384.0000, 333.5000, "1/15");
PlayerTextDrawFont(playerid, playerInfoPTD[playerid][7], TEXT_DRAW_FONT:1);
PlayerTextDrawLetterSize(playerid, playerInfoPTD[playerid][7], 0.1399, 0.7999);
PlayerTextDrawAlignment(playerid, playerInfoPTD[playerid][7], TEXT_DRAW_ALIGN:3);
PlayerTextDrawColour(playerid, playerInfoPTD[playerid][7], -1768515841);
PlayerTextDrawSetShadow(playerid, playerInfoPTD[playerid][7], 0);
PlayerTextDrawSetOutline(playerid, playerInfoPTD[playerid][7], 0);
PlayerTextDrawBackgroundColour(playerid, playerInfoPTD[playerid][7], 255);
PlayerTextDrawSetProportional(playerid, playerInfoPTD[playerid][7], true);
PlayerTextDrawTextSize(playerid, playerInfoPTD[playerid][7], 640.0000, 0.0000);

/*****************
* VEHICLE INFO TEXTS
*****************/
vehicleInfoPTD[playerid][0] = CreatePlayerTextDraw(playerid, 251.5000, 412.0000, "Truck");
PlayerTextDrawFont(playerid, vehicleInfoPTD[playerid][0], TEXT_DRAW_FONT:1);
PlayerTextDrawLetterSize(playerid, vehicleInfoPTD[playerid][0], 0.2399, 1.3000);
PlayerTextDrawColour(playerid, vehicleInfoPTD[playerid][0], -1768515841);
PlayerTextDrawSetShadow(playerid, vehicleInfoPTD[playerid][0], 0);
PlayerTextDrawSetOutline(playerid, vehicleInfoPTD[playerid][0], 0);
PlayerTextDrawBackgroundColour(playerid, vehicleInfoPTD[playerid][0], 255);
PlayerTextDrawSetProportional(playerid, vehicleInfoPTD[playerid][0], true);
PlayerTextDrawTextSize(playerid, vehicleInfoPTD[playerid][0], 640.0000, 0.0000);

vehicleInfoPTD[playerid][1] = CreatePlayerTextDraw(playerid, 251.5000, 423.5000, "MODELID: 456");
PlayerTextDrawFont(playerid, vehicleInfoPTD[playerid][1], TEXT_DRAW_FONT:1);
PlayerTextDrawLetterSize(playerid, vehicleInfoPTD[playerid][1], 0.1199, 0.5999);
PlayerTextDrawColour(playerid, vehicleInfoPTD[playerid][1], 1684301055);
PlayerTextDrawSetShadow(playerid, vehicleInfoPTD[playerid][1], 0);
PlayerTextDrawSetOutline(playerid, vehicleInfoPTD[playerid][1], 0);
PlayerTextDrawBackgroundColour(playerid, vehicleInfoPTD[playerid][1], 255);
PlayerTextDrawSetProportional(playerid, vehicleInfoPTD[playerid][1], true);
PlayerTextDrawTextSize(playerid, vehicleInfoPTD[playerid][1], 640.0000, 0.0000);

vehicleInfoPTD[playerid][2] = CreatePlayerTextDraw(playerid, 320.5000, 421.0000, "HEALTH: ~w~1000/1000");
PlayerTextDrawFont(playerid, vehicleInfoPTD[playerid][2], TEXT_DRAW_FONT:1);
PlayerTextDrawLetterSize(playerid, vehicleInfoPTD[playerid][2], 0.1399, 0.7999);
PlayerTextDrawColour(playerid, vehicleInfoPTD[playerid][2], -1768515841);
PlayerTextDrawSetShadow(playerid, vehicleInfoPTD[playerid][2], 0);
PlayerTextDrawSetOutline(playerid, vehicleInfoPTD[playerid][2], 0);
PlayerTextDrawBackgroundColour(playerid, vehicleInfoPTD[playerid][2], 255);
PlayerTextDrawSetProportional(playerid, vehicleInfoPTD[playerid][2], true);
PlayerTextDrawTextSize(playerid, vehicleInfoPTD[playerid][2], 640.0000, 0.0000);

vehicleInfoPTD[playerid][3] = CreatePlayerTextDraw(playerid, 320.5000, 406.0000, "SPEED: ~w~60 kps");
PlayerTextDrawFont(playerid, vehicleInfoPTD[playerid][3], TEXT_DRAW_FONT:1);
PlayerTextDrawLetterSize(playerid, vehicleInfoPTD[playerid][3], 0.1399, 0.7999);
PlayerTextDrawColour(playerid, vehicleInfoPTD[playerid][3], -1768515841);
PlayerTextDrawSetShadow(playerid, vehicleInfoPTD[playerid][3], 0);
PlayerTextDrawSetOutline(playerid, vehicleInfoPTD[playerid][3], 0);
PlayerTextDrawBackgroundColour(playerid, vehicleInfoPTD[playerid][3], 255);
PlayerTextDrawSetProportional(playerid, vehicleInfoPTD[playerid][3], true);
PlayerTextDrawTextSize(playerid, vehicleInfoPTD[playerid][3], 640.0000, 0.0000);

cupboard_home_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 171.4642, 175.9998, "CUPBOARD"); // ïóñòî
PlayerTextDrawLetterSize(playerid, cupboard_home_PTD[playerid][0], 0.4000, 1.6000);
PlayerTextDrawAlignment(playerid, cupboard_home_PTD[playerid][0], TEXT_DRAW_ALIGN:1);
PlayerTextDrawColour(playerid, cupboard_home_PTD[playerid][0], -1);
PlayerTextDrawSetOutline(playerid, cupboard_home_PTD[playerid][0], 1);
PlayerTextDrawBackgroundColour(playerid, cupboard_home_PTD[playerid][0], 255);
PlayerTextDrawFont(playerid, cupboard_home_PTD[playerid][0], TEXT_DRAW_FONT:3);
PlayerTextDrawSetProportional(playerid, cupboard_home_PTD[playerid][0], true);
PlayerTextDrawSetShadow(playerid, cupboard_home_PTD[playerid][0], 0);

cupboard_home_PTD[playerid][1] = CreatePlayerTextDraw(playerid, 169.1215, 186.3166, "Box"); // ïóñòî
PlayerTextDrawLetterSize(playerid, cupboard_home_PTD[playerid][1], 0.0000, 9.4846);
PlayerTextDrawTextSize(playerid, cupboard_home_PTD[playerid][1], 434.0000, 0.0000);
PlayerTextDrawAlignment(playerid, cupboard_home_PTD[playerid][1], TEXT_DRAW_ALIGN:1);
PlayerTextDrawColour(playerid, cupboard_home_PTD[playerid][1], -1);
PlayerTextDrawUseBox(playerid, cupboard_home_PTD[playerid][1], true);
PlayerTextDrawBoxColour(playerid, cupboard_home_PTD[playerid][1], 5635947);
PlayerTextDrawBackgroundColour(playerid, cupboard_home_PTD[playerid][1], 255);
PlayerTextDrawFont(playerid, cupboard_home_PTD[playerid][1], TEXT_DRAW_FONT:1);
PlayerTextDrawSetProportional(playerid, cupboard_home_PTD[playerid][1], true);
PlayerTextDrawSetShadow(playerid, cupboard_home_PTD[playerid][1], 0);

cupboard_home_PTD[playerid][2] = CreatePlayerTextDraw(playerid, 166.9475, 184.1332, ""); // model 1
PlayerTextDrawTextSize(playerid, cupboard_home_PTD[playerid][2], 90.0000, 90.0000);
PlayerTextDrawAlignment(playerid, cupboard_home_PTD[playerid][2], TEXT_DRAW_ALIGN:1);
PlayerTextDrawColour(playerid, cupboard_home_PTD[playerid][2], -1);
PlayerTextDrawBackgroundColour(playerid, cupboard_home_PTD[playerid][2], 0);
PlayerTextDrawFont(playerid, cupboard_home_PTD[playerid][2], TEXT_DRAW_FONT:5);
PlayerTextDrawSetProportional(playerid, cupboard_home_PTD[playerid][2], false);
PlayerTextDrawSetShadow(playerid, cupboard_home_PTD[playerid][2], 0);
PlayerTextDrawSetSelectable(playerid, cupboard_home_PTD[playerid][2], true);
PlayerTextDrawSetPreviewModel(playerid, cupboard_home_PTD[playerid][2], 0);
PlayerTextDrawSetPreviewRot(playerid, cupboard_home_PTD[playerid][2], 0.0000, 0.0000, 0.0000, 1.0000);

cupboard_home_PTD[playerid][3] = CreatePlayerTextDraw(playerid, 257.5036, 184.0499, ""); // model 2
PlayerTextDrawTextSize(playerid, cupboard_home_PTD[playerid][3], 90.0000, 90.0000);
PlayerTextDrawAlignment(playerid, cupboard_home_PTD[playerid][3], TEXT_DRAW_ALIGN:1);
PlayerTextDrawColour(playerid, cupboard_home_PTD[playerid][3], -1);
PlayerTextDrawBackgroundColour(playerid, cupboard_home_PTD[playerid][3], 0);
PlayerTextDrawFont(playerid, cupboard_home_PTD[playerid][3], TEXT_DRAW_FONT:5);
PlayerTextDrawSetProportional(playerid, cupboard_home_PTD[playerid][3], false);
PlayerTextDrawSetShadow(playerid, cupboard_home_PTD[playerid][3], 0);
PlayerTextDrawSetSelectable(playerid, cupboard_home_PTD[playerid][3], true);
PlayerTextDrawSetPreviewModel(playerid, cupboard_home_PTD[playerid][3], 0);
PlayerTextDrawSetPreviewRot(playerid, cupboard_home_PTD[playerid][3], 0.0000, 0.0000, 0.0000, 1.0000);

cupboard_home_PTD[playerid][4] = CreatePlayerTextDraw(playerid, 348.0969, 183.9666, ""); // model 3
PlayerTextDrawTextSize(playerid, cupboard_home_PTD[playerid][4], 90.0000, 90.0000);
PlayerTextDrawAlignment(playerid, cupboard_home_PTD[playerid][4], TEXT_DRAW_ALIGN:1);
PlayerTextDrawColour(playerid, cupboard_home_PTD[playerid][4], -1);
PlayerTextDrawBackgroundColour(playerid, cupboard_home_PTD[playerid][4], 0);
PlayerTextDrawFont(playerid, cupboard_home_PTD[playerid][4], TEXT_DRAW_FONT:5);
PlayerTextDrawSetProportional(playerid, cupboard_home_PTD[playerid][4], false);
PlayerTextDrawSetShadow(playerid, cupboard_home_PTD[playerid][4], 0);
PlayerTextDrawSetSelectable(playerid, cupboard_home_PTD[playerid][4], true);
PlayerTextDrawSetPreviewModel(playerid, cupboard_home_PTD[playerid][4], 0);
PlayerTextDrawSetPreviewRot(playerid, cupboard_home_PTD[playerid][4], 0.0000, 0.0000, 0.0000, 1.0000);

cupboard_home_PTD[playerid][5] = CreatePlayerTextDraw(playerid, 423.3602, 167.2501, "LD_BEAT:cross"); // ïóñòî
PlayerTextDrawTextSize(playerid, cupboard_home_PTD[playerid][5], 13.0000, 14.0000);
PlayerTextDrawAlignment(playerid, cupboard_home_PTD[playerid][5], TEXT_DRAW_ALIGN:1);
PlayerTextDrawColour(playerid, cupboard_home_PTD[playerid][5], -16776961);
PlayerTextDrawBackgroundColour(playerid, cupboard_home_PTD[playerid][5], 255);
PlayerTextDrawFont(playerid, cupboard_home_PTD[playerid][5], TEXT_DRAW_FONT:4);
PlayerTextDrawSetProportional(playerid, cupboard_home_PTD[playerid][5], false);
PlayerTextDrawSetShadow(playerid, cupboard_home_PTD[playerid][5], 0);
PlayerTextDrawSetSelectable(playerid, cupboard_home_PTD[playerid][5], true);

chooseCar_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 326.0000, 310.0000, "Sentinel"); // ˜˜˜˜˜
PlayerTextDrawLetterSize(playerid, chooseCar_PTD[playerid][0], 0.4674, 2.1891);
PlayerTextDrawAlignment(playerid, chooseCar_PTD[playerid][0], TEXT_DRAW_ALIGN:2);
PlayerTextDrawColour(playerid, chooseCar_PTD[playerid][0], -1);
PlayerTextDrawBackgroundColour(playerid, chooseCar_PTD[playerid][0], 255);
PlayerTextDrawFont(playerid, chooseCar_PTD[playerid][0], TEXT_DRAW_FONT:1);
PlayerTextDrawSetProportional(playerid, chooseCar_PTD[playerid][0], true);
PlayerTextDrawSetShadow(playerid, chooseCar_PTD[playerid][0], 1);

/*chooseCar_PTD[playerid][1] = CreatePlayerTextDraw(playerid, 419.0000, 358.5999, "00.0_L_/_KM"); // ˜˜˜˜˜
PlayerTextDrawLetterSize(playerid, chooseCar_PTD[playerid][1], 0.2809, 1.3898);
PlayerTextDrawTextSize(playerid, chooseCar_PTD[playerid][1], 0.0000, 66.0000);
PlayerTextDrawAlignment(playerid, chooseCar_PTD[playerid][1], 2);
PlayerTextDrawColour(playerid, chooseCar_PTD[playerid][1], -1);
PlayerTextDrawBackgroundColour(playerid, chooseCar_PTD[playerid][1], 255);
PlayerTextDrawFont(playerid, chooseCar_PTD[playerid][1], 1);
PlayerTextDrawSetProportional(playerid, chooseCar_PTD[playerid][1], 1);
PlayerTextDrawSetShadow(playerid, chooseCar_PTD[playerid][1], 0);*/

chooseCar_PTD[playerid][2] = CreatePlayerTextDraw(playerid, 328.0000, 343.0000, "1000000000$"); // ˜˜˜˜˜
PlayerTextDrawLetterSize(playerid, chooseCar_PTD[playerid][2], 0.5025, 2.4457);
PlayerTextDrawTextSize(playerid, chooseCar_PTD[playerid][2], 0.0000, 87.0000);
PlayerTextDrawAlignment(playerid, chooseCar_PTD[playerid][2], TEXT_DRAW_ALIGN:2);
PlayerTextDrawColour(playerid, chooseCar_PTD[playerid][2], 8388863);
PlayerTextDrawBackgroundColour(playerid, chooseCar_PTD[playerid][2], 255);
PlayerTextDrawFont(playerid, chooseCar_PTD[playerid][2], TEXT_DRAW_FONT:3);
PlayerTextDrawSetProportional(playerid, chooseCar_PTD[playerid][2], true);
PlayerTextDrawSetShadow(playerid, chooseCar_PTD[playerid][2], 1);

chooseCar_PTD[playerid][3] = CreatePlayerTextDraw(playerid, 419.0000, 344.0000, "FUEL:_50_L"); // ˜˜˜˜˜
PlayerTextDrawLetterSize(playerid, chooseCar_PTD[playerid][3], 0.2809, 1.3898);
PlayerTextDrawTextSize(playerid, chooseCar_PTD[playerid][3], 0.0000, 66.0000);
PlayerTextDrawAlignment(playerid, chooseCar_PTD[playerid][3], TEXT_DRAW_ALIGN:2);
PlayerTextDrawColour(playerid, chooseCar_PTD[playerid][3], -1);
PlayerTextDrawBackgroundColour(playerid, chooseCar_PTD[playerid][3], 255);
PlayerTextDrawFont(playerid, chooseCar_PTD[playerid][3], TEXT_DRAW_FONT:1);
PlayerTextDrawSetProportional(playerid, chooseCar_PTD[playerid][3], true);
PlayerTextDrawSetShadow(playerid, chooseCar_PTD[playerid][3], 0);

chooseCar_PTD[playerid][4] = CreatePlayerTextDraw(playerid, 418.0000, 329.0000, "000_KM/H"); // ˜˜˜˜˜
PlayerTextDrawLetterSize(playerid, chooseCar_PTD[playerid][4], 0.2809, 1.3898);
PlayerTextDrawTextSize(playerid, chooseCar_PTD[playerid][4], 0.0000, 66.0000);
PlayerTextDrawAlignment(playerid, chooseCar_PTD[playerid][4], TEXT_DRAW_ALIGN:2);
PlayerTextDrawColour(playerid, chooseCar_PTD[playerid][4], -1);
PlayerTextDrawBackgroundColour(playerid, chooseCar_PTD[playerid][4], 255);
PlayerTextDrawFont(playerid, chooseCar_PTD[playerid][4], TEXT_DRAW_FONT:1);
PlayerTextDrawSetProportional(playerid, chooseCar_PTD[playerid][4], true);
PlayerTextDrawSetShadow(playerid, chooseCar_PTD[playerid][4], 0);