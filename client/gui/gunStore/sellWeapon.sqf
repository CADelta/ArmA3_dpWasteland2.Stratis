
//	@file Version: 1.0
//	@file Name: sellWeapon.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AimZ =(dp)=
//	@file Created: 20/11/2012 05:13
//	@file Args:

//Initialize Values
private["_primary","_magazine","_weapon_value","_magSell"];
_magSell = 0;
_weapon_value = 0;
_primary = currentWeapon player;
_magazine = currentMagazine player;

if(_primary == "") exitWith {hint "You don't have a current weapon in your hand to sell!";};

{
	if(_x select 0 == _primary) then 
	{
		_weapon_value = _weapon_value + (_x select 3);
	};
} forEach weaponsArray;
{
	if(_x select 0 == _magazine) then 
	{
		_weapon_value = _weapon_value + (_x select 3);
	};
} forEach ammoArray;

player removeWeapon _primary;
if (_magazine != "") then 
{
	player removeMagazines _magazine;
};
player setVariable ["cmoney", (player getVariable ["cmoney", 0]) + _weapon_value, true];
hint format["You sold your gun and ammo for $%1", _weapon_value];