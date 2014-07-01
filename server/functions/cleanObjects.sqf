//	@file Version: 1.0
//	@file Name: cleanObjects.sqf
//	@file Author: AimZ =(dp)=
//	@file Created: 24/06/2013
//	@file Args:

if(!isDedicated) exitWith {};

diag_log format["*** cleanObjects Started ***"];

private ["_check","_checkCount","_timeout"];		// CAD - Org. = private ["_vehicleType","_check","_checkCount","_bodyCount","_timeout","_position"];

_check = 0;
_checkCount = 0;

while {true} do 
{
	_allMObjects = allMissionObjects "All"; 
	{
		if (!(isNull _x)) then 
		{
			_x setVariable ["last_timeout", time, true];
		
			_mapbuilding = _x getVariable ["mapbuilding",false];
			
			
			if(!(_x isKindOf "CAManBase") AND !(_x isKindOf "Logic") AND !((_x isKindOf "Wall" || _x isKindOf "House") && _mapbuilding)) then
			{
				_check = _x getVariable ["newVehicle",0];
				_checkCount = _x getVariable ["newVehicleCount",0];
				_timeout = _x getVariable ["timeout", time + 240];
				
				if (_check != vChecksum && _checkCount == 0) then 
				{
					_checkCount = _checkCount + 1;
					_x setVariable ["newVehicleCount",_checkCount,true];
					_x setVariable ["timeout", time + 240, true];
				};
			
				if (_check != vChecksum && time > _timeout) then
				{
					_x removeAllEventHandlers "GetIn";
					_x removeAllEventHandlers "killed";
					_x removeAllEventHandlers "HandleDamage";
					deleteVehicle _x;
				};
			};
		};
		
		sleep 1;
	} forEach _allMObjects; 
	sleep 1;
};

diag_log format["*** cleanObjects Finished ***"];