
//	@file Version: 2.0
//	@file Name: vehicleCreation.sqf
//	@file Author: [404] Deadbeat, AimZ =(dp)=, [CAD] Krycek
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!isDedicated) exitWith {};

//diag_log format["*** vehicleCreation Started ***"];

private ["_vehicletype","_vehicle","_type","_position"];
_position = _this select 0;
_objectList = _this select 1;
_restrictContent = _this select 2;
_coverArea = _this select 3;
_respawn = _this select 4;

_type = floor (random (count _objectList));
_vehicletype = _objectList select _type;

_vehicle = createVehicle [_vehicletype,[7094,5961,0],[],40,"NONE"];
_vehicle setVariable ["newVehicle",vChecksum,true];
_vehicle setVariable ["timeout", (time + desertedTimeLimit + random maxRandomTimeLimit), true];
_vehicle setVariable ["last_timeout", time, true];
_vehicle setVariable ["status", "alive", true];
_vehicle setVariable ["respawn", _respawn, true];
_vehicle setDir (random 360);
_position = [_position,1,_coverArea,1,0,60 * (pi / 180),0] call BIS_fnc_findSafePos;
_vehicle setPos _position;

//_vehicle allowDamage false;
//_vehicle enableSimulation false;

if (_restrictContent) then
{
	//Clear Inventory
	clearMagazineCargoGlobal _vehicle;
	clearWeaponCargoGlobal _vehicle;

	//Set Cars Attributes
	_vehicle setFuel (0.05 + (random 0.0));		// Vehicles can now spawn with no fuel or up to 5% fuel.
	_vehicle setDamage (0.50 + (random 0.25));

	if (count(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "Turrets") > 0) then
	{
		_vehicle setVehicleAmmo (0.50 + (random 0.50));
	};

	//_vehicle disableTIEquipment true;			// Disabling this allows for Thermal Imagaging Equipment in Cars.
	[_vehicle] call randomWeapons;
};

_vehicle

//diag_log format["*** vehicleCreation Finished ***"];
