//	@file Version: 1.0
//	@file Name: mainMissionController.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [CAD] Krycek
//	@file Created: 08/12/2012 15:19

if(!isServer) exitWith {};

#include "mainMissions\mainMissionDefines.sqf";

//diag_log format["****** mainMissionController Started ******"];

private ["_MMarray","_lastMission","_randomIndex","_mission","_missionType","_newMissionArray","_lastMission"];

//Main Mission Array
_MMarray = [
	[mission_APC,"mission_APC"],
	[mission_LightTank,"mission_LightTank"],
	[mission_ArmedHeli,"mission_ArmedHeli"],
	[mission_LightArmVeh,"mission_LightArmVeh"],
	[mission_Convoy,"mission_Convoy"],
	[mission_Jet,"mission_Jet"]
];
_lastMission = "nomission";										// CAD*

while {true} do
{
    //Select Mission
    _randomIndex = floor (random (count _MMarray));
	_mission = _MMarray select _randomIndex select 0;
    _missionType = _MMarray select _randomIndex select 1;		// CAD*


	//Select new mission if the same
    if(str(_missionType) == _lastMission) then					// CAD*
    {
        _newMissionArray = _MMarray;
        _newMissionArray set [_randomIndex, "REMOVETHISCRAP"];
        _newMissionArray = _newMissionArray - ["REMOVETHISCRAP"];
        _randomIndex = floor (random (count _newMissionArray));
        _missionType = _newMissionArray select _randomIndex select 1;
        _mission = _newMissionArray select _randomIndex select 0;
    };

	_missionRunning = [] spawn _mission;

    _hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Main Objective</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>Starting in %1 Minutes</t>", mainMissionDelayTime / 60, mainMissionColor, subTextColor];
	messageSystem = _hint;
	publicVariable "messageSystem";

    _lastMission = _missionType;								// CAD*
	waitUntil{scriptDone _missionRunning};
    sleep 5;
};

//diag_log format["****** mainMissionController Finished ******"];

// CAD* = Added this back in, since the same mission otherwise seems to pop up too often.