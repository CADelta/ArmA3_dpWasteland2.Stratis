//	@file Version: 2.0
//	@file Name: vehicleCreation.sqf
//	@file Author: [404] Deadbeat, AimZ =(dp)=, [CAD] Krycek
//	@file Created: 20/11/2012 05:19

if(!isDedicated) exitWith {};

//diag_log format["*** boatCreation Started ***"];

private ["_boattype","_boat","_type","_position"];
_position = _this select 0;
_objectList = _this select 1;
_restrictContent = _this select 2;
_coverArea = _this select 3;
_respawn = _this select 4;

_type = floor (random (count _objectList));
_boattype = _objectList select _type;

_boat = createVehicle [_boattype, [0,0,0], [], 40, "None"];	//Original spawn was pos. at Pythos. [7094,5961,0]
_boat setVariable ["newVehicle",vChecksum,true];
_boat setVariable ["timeout", (time + desertedTimeLimit + random maxRandomTimeLimit), true];
_boat setVariable ["last_timeout", time, true];
_boat setVariable ["status", "alive", true];
_boat setVariable ["respawn", _respawn, true];
_boat setDir (random 360);

//                0     1       2      3  4  5  6  
_position = [_position, 1, _coverArea, 1, 2, 0, 1] call BIS_fnc_findSafePos;	
_boat setPos _position;

//_boat allowDamage false;
//_boat enableSimulation false;

if (_restrictContent) then
{
	//Clear Inventory
	clearMagazineCargoGlobal _boat;
	clearWeaponCargoGlobal _boat;

	//Set Boat Attributes
	// set status of vehicle
	_boat setFuel (0.20 + (random 0.05));
	//_boat setDamage (0.0 + (random 0.25)); // (0 - 1) = 0.5 -> 0.75

	if (count(configFile >> "CfgVehicles" >> (typeOf _boat) >> "Turrets") > 0) then
	{
		_boat setVehicleAmmo (0.25 + (random 0.75));
	};

	//_boat disableTIEquipment true;		// Disabling this allows for Thermal Imagaging Equipment in Boats.
	//[_boat] call randomWeapons;			// Disabling this disallows for weapons to spawn in Boats (Believe Boats do not have inventory so guess this need to be disabled).
};

_boat

//diag_log format["*** boatCreation Finished ***"];


/****** BIS_fnc_findSafePos Description: ********

Function to retrieve and dynamic position in the world according to several parameters.

Parameter(s):
_this select 0: center position (Array)															// Note: passing [] (empty Array), the world's safePositionAnchor entry will be used.
_this select 1: minimum distance from the center position (Number)
_this select 2: maximum distance from the center position (Number)								// Note: passing -1, the world's safePositionRadius entry will be used.
_this select 3: minimum distance from the nearest object (Number)
_this select 4: water mode (Number)																// 0: cannot be in water - 1: can either be in water or not - 2: must be in water
_this select 5: maximum terrain gradient (average altitude difference in meters - Number)
_this select 6: shore mode (Number): 															// 0: does not have to be at a shore - 1: must be at a shore
_this select 7: (optional) blacklist (Array of Arrays)
(_this select 7) select X: Top-left and bottom-right coordinates of blacklisted area (Array)
_this select 8: (optional) default positions (Array of Arrays)
(_this select 8) select 0: default position on land (Array)
(_this select 8) select 1: default position on water (Array)

Source: http://forums.bistudio.com/archive/index.php/t-103108.html