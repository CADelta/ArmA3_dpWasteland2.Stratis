//	Name: init.sqf
//	Author: AimZ =(dp)=

diag_log format["******** MISSION init Started ********"];
versionName = "v2.5.5";
modVersion = "build-2sgrd95";
vChecksum = 1;
{vChecksum = vChecksum + _x;} forEach (toArray modVersion); 

if(isServer) then 
{
	[] execVM "server\functions\PartialAntiCheats.sqf";
	
    diag_log format["*** Server Setup ***"];
	serverCompiledScripts = false;
	[] call compileFinal preprocessFileLineNumbers "server\functions\serverCompile.sqf";
	waitUntil{serverCompiledScripts};
	[] call serverInit;
};

if(!isDedicated) then {
    diag_log format["*** Client Setup ***"];
	enableSaving[false,false]; 

	playerCompiledScripts = false;
	[] call compileFinal preprocessFileLineNumbers "client\functions\clientCompile.sqf";
	waitUntil{playerCompiledScripts};
	[] call clientInit;
		
	"THISIS437SPARTA" addPublicVariableEventHandler { [] spawn (_this select 1); };
    dat4ClientStarted = player;
    publicVariableServer "dat4ClientStarted";
	
};

//init 3rd Party Scripts
[] execVM "client\functions\module_cleanup\init.sqf";		// New Cleanup Script by Conroy.	** TESTING **
[] execVM "addons\R3F_ARTY_AND_LOG\init.sqf";

// Disable r3f on map/mission sided buildings (causes desync when moved)
// props to Tonic-_- at the BIS forums for this find! :)
// Disabled : should be handled in r3f's init now :)
//
// if (!isDedicated) then {
// 	waitUntil {!isNil {R3F_LOG_CFG_objets_deplacables}};
// 	{
//     	if(!(_x in (allMissionObjects "Building"))) then
//     	{
// 	        _x setVariable["R3F_LOG_disabled",true];
//     	};
// 	} foreach (nearestObjects[[0,0], R3F_LOG_CFG_objets_deplacables, 20000]); 
// };

diag_log format["******** MISSION init Finshed ********"];

