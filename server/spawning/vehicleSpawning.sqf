//	@file Version: 1.0
//	@file Name: vehicleSpawning.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AimZ =(dp)=, [CAD] Krycek
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!isDedicated) exitWith {};

diag_log format["****** vehicleSpawning Started ******"];

private ["_counter","_position","_type","_num","_start","_step","_end"];

_counter = 0;
_step = 2;
_start = floor (random _step) + 1;
_end = 118;

for "_i" from _start to _end step _step do
{
	_position = getMarkerPos format ["Spawn_%1", _i];
	_type = floor (random 12);
	switch (_type) do 
	{ 
	  case 0: {[_position, Quadbikes, true, 50, true] call vehicleCreation;};
	  case 1: {[_position, Quadbikes, true, 50, true] call vehicleCreation;};		// This is a duplicate line to make MRAPs spawn less.
	  case 2: {[_position, Cars, true, 50, true] call vehicleCreation;};
	  case 3: {[_position, Cars, true, 50, true] call vehicleCreation;};			// This is a duplicate line to make MRAPs spawn less.
	  case 4: {[_position, Cars, true, 50, true] call vehicleCreation;}; 			// This is a duplicate line to make MRAPs spawn less.
	  case 5: {[_position, Cars, true, 50, true] call vehicleCreation;}; 			// This is a duplicate line to make MRAPs spawn less.
	  case 6: {[_position, Trucks, true, 50, true] call vehicleCreation;};
	  case 7: {[_position, Trucks, true, 50, true] call vehicleCreation;};			// This is a duplicate line to make MRAPs spawn less.
	  case 8: {[_position, Trucks, true, 50, true] call vehicleCreation;}; 			// This is a duplicate line to make MRAPs spawn less.
	  case 9: {[_position, Trucks, true, 50, true] call vehicleCreation;}; 			// This is a duplicate line to make MRAPs spawn less.
	  case 10: {[_position, Trucks, true, 50, true] call vehicleCreation;}; 		// This is a duplicate line to make MRAPs spawn less.
	  case 11: {[_position, UnarmedMRAPVehicles, true, 50, true] call vehicleCreation;}; 
	};
		
	_counter = _counter + 1;
};

diag_log format["WASTELAND SERVER - %1 Vehicles Spawned",_counter];
diag_log format["****** vehicleSpawning Finished ******"];
