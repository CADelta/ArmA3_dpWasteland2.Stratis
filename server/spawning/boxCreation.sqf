//	Name: boxCreation.sqf
//	Author: AimZ =(dp)=, [CAD] Krycek

if(!isDedicated) exitWith {};

//diag_log format["*** boxCreation Started ***"];

private ["_boxtype","_box","_type","_position","_weapons","_weapontype"];
_position = _this select 0;
_ammoBoxList = _this select 1;
_restrictContent = _this select 2;
_coverArea = _this select 3;
_respawn = _this select 4;

_type = floor (random (count _ammoBoxList));
_boxtype = _ammoBoxList select _type;

_box = createVehicle [_boxtype,[8100,8100,0],[],40,"NONE"];			// Org. spawn was Pythos [7094,5961,0] ** Now it is in the top right corner of Stratis.
_box setVariable ["newVehicle",vChecksum,true];
_box setVariable ["timeout", (time + ammoDesertedTimeLimit + random maxRandomTimeLimit), true];
_box setVariable ["last_timeout", time, true];
_box setVariable ["status", "alive", true];
_box setVariable ["respawn", _respawn, true];
_box setDir (random 360);
_position = [_position, 1, _coverArea, 1, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
_box setPos _position;

//_box allowDamage false;
//_box enableSimulation false;

if (_restrictContent) then
{
	// remove weapons
	_weapons = getWeaponCargo _box;
	_weapontype = _weapons select 0;
	_weaponcount = _weapons select 1;
	clearWeaponCargoGlobal _box;
	{
		if (!(_x in removeWeapons)) then {
			_box addWeaponCargoGlobal [_x, _weaponcount select _forEachIndex];
		};
	} foreach _weapontype;

	// remove ammo
	_ammos = getMagazineCargo _box;
	_ammotype = _ammos select 0;
	_ammocount = _ammos select 1;

	clearMagazineCargoGlobal _box;
	{
		if (!(_x in removeAmmo)) then {
			_box addMagazineCargoGlobal [_x, _ammocount select _forEachIndex];
		};
	} foreach _ammotype;
};

_box
//diag_log format["*** boxCreation Finished ***"];
