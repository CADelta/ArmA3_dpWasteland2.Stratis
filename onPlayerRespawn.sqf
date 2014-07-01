if (isServer) exitWith {};  
 
diag_log format["****** onPlayerRespawn Started ******"];
 
private ["_newUnit", "_corpse", "_respawn", "_respawnDelay","_respawnLocation"];
 
// params [<newUnit>,<oldUnit>,<respawn>,<respawnDelay>]
_newUnit = _this select 0; // players new body
_corpse = _this select 1; // players corpse (could be objNull)
_respawn = _this select 2; 
_respawnDelay = _this select 3;

titleText ["You were born to respawn...", "BLACK", 0];

// remove everything
{player removeWeapon _x;} foreach weapons player;
player switchMove "aidlpercmstpsraswrfldnon_idlesteady01n";
player playMove "aidlpercmstpsraswrfldnon_idlesteady01n";

sleep 2;

// Player setup
[] call PlayerSetup;				// initialise players gear
[] spawn createMenuActions;			// add player menu items

// **************************************
[] spawn 
{
	sleep 2;
	//waitUntil{!respawnDialogActive};
	
	if(!isNull pvar_PlayerTeamKiller) then 
	{
		pDialogTeamkiller = pvar_PlayerTeamKiller;
		pvar_PlayerTeamKiller = objNull;
		if (allowPlayerIcons == "ON") then
		{
			[] execVM "client\functions\createTeamKillDialog.sqf";
		};
	};
};
// **************************************

diag_log format["****** onPlayerRespawn Finished ******"];
 