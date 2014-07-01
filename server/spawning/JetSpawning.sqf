//	@file Version: 1.0
//	@file Name: JetSpawning.sqf
//	@file Author: [404] Costlyy, AimZ =(dp)=, [CAD] Krycek
//	@file Created: 20/12/2012 21:00
//	@file Description: Random static jets
//	@file Args:

if(!isDedicated) exitWith {};

diag_log format["****** JetSpawning Started ******"];

private ["_counter","_position","_type","_start","_step","_end"];

_counter = 0;
_step = 1;
_start = floor (random _step) + 1;
_end = 2;

for "_i" from _start to _end step _step do
{
	_position = getMarkerPos format ["jeliSpawn_%1", _i];
	_type = floor (random 2);
	switch (_type) do 
	{ 
	  case 0: {[_position, ArmedFighterPlanes, true, 1, true] call JetCreation;};		// Although this is singular for now, gonna keep it in a case so new Jets can easily be added.
	  case 1: {[_position, ArmedFighterPlanes, true, 1, true] call JetCreation;};		// Although this is singular for now, gonna keep it in a case so new Jets can easily be added.
	};

	_counter = _counter + 1;
};

diag_log format["WASTELAND SERVER - %1 Static Jets Spawned",_counter];
diag_log format["****** JetSpawning Finished ******"];
