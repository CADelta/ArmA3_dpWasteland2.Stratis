
//	@file Version: 1.0
//	@file Name: relations.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!isDedicated) exitWith {};

diag_log format["*** relations Started ***"];

// 0 = enemy | 1 = friendly
EAST setFriend [WEST, 0];
EAST setFriend [EAST, 1];
EAST setFriend [RESISTANCE, 0];
EAST setFriend [CIVILIAN, 1];
WEST setFriend [EAST, 0];
WEST setFriend [WEST, 1];
WEST setFriend [RESISTANCE, 0];
WEST setFriend [CIVILIAN, 1];
RESISTANCE setFriend [EAST, 0];
RESISTANCE setFriend [RESISTANCE, 1];	// Org = 1 | This must be why Independent got minus score for killing Independent, only seems logical to set this to 0, since Independent vs Independent = enemy.
RESISTANCE setFriend [WEST, 0];
RESISTANCE setFriend [CIVILIAN, 1];
CIVILIAN setFriend [EAST, 0];
CIVILIAN setFriend [WEST, 0];
CIVILIAN setFriend [RESISTANCE, 0];
CIVILIAN setFriend [CIVILIAN, 1];

diag_log format["*** relations Finished ***"];