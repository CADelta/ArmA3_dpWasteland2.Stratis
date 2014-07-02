
//	@file Name: relations.sqf
//	@file Author: [404] Deadbeat, [CAD] Krycek

if(!isDedicated) exitWith {};

diag_log format["*** relations Started ***"];

// 0 = enemy | 1 = friendly
WEST setFriend [EAST, 0];
WEST setFriend [WEST, 1];
WEST setFriend [RESISTANCE, 0];
WEST setFriend [CIVILIAN, 1];
EAST setFriend [WEST, 0];
EAST setFriend [EAST, 1];
EAST setFriend [RESISTANCE, 0];
EAST setFriend [CIVILIAN, 1];

RESISTANCE setFriend [EAST, 0];
RESISTANCE setFriend [RESISTANCE, 1];
RESISTANCE setFriend [WEST, 0];
RESISTANCE setFriend [CIVILIAN, 1];
CIVILIAN setFriend [EAST, 0];
CIVILIAN setFriend [WEST, 0];
CIVILIAN setFriend [RESISTANCE, 0];
CIVILIAN setFriend [CIVILIAN, 1];

diag_log format["*** relations Finished ***"];