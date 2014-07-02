//	@file Name: vehicleSpawning.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AimZ =(dp)=, [CAD] Krycek

if(!isDedicated) exitWith {};

diag_log format["****** vehicleSpawning Started ******"];

private ["_counter","_position","_type","_start","_step","_end"];

_counter = 0;
_step = 1.5;		// 1.685
_start = floor (random _step) + 1;
_end = 118;

for "_i" from _start to _end step _step do
{
	_position = getMarkerPos format ["Spawn_%1", _i];
	_type = floor (random 4);
	switch (_type) do 
	{ 
	  case 0: {[_position, Quadbikes, true, 50, true] call vehicleCreation;};
	  case 1: {[_position, Cars, true, 50, true] call vehicleCreation;};
	  case 2: {[_position, Trucks, true, 50, true] call vehicleCreation;};
	  case 3: {[_position, UnarmedMRAPVehicles, true, 50, true] call vehicleCreation;};
	};
		
	_counter = _counter + 1;
};

diag_log format["WASTELAND SERVER - %1 Vehicles Spawned",_counter];
diag_log format["****** vehicleSpawning Finished ******"];
