if (isServer) exitWith {}; 

diag_log format["****** onPlayerKilled Started ******"];
 
private ["_corpse", "_killer", "_respawn", "_respawnDelay", "_respawnLocation"];
 
// params [<unit>,<killer>,<respawn>,<respawnDelay>]
_corpse = _this select 0; // dead player
_killer = _this select 1; // killed player (could be objNull)
_respawn = _this select 2; 
_respawnDelay = _this select 3;

_corpse removeAction playerMenuId;
{
	_corpse removeAction _x;
} forEach aActionsIDs;

// **************************************
_player = player;
_suspects = [];

if((_player != _killer) && (vehicle _player != vehicle _killer) && (playerSide == side _killer) && (str(playerSide) in ["WEST", "EAST"])) then {
	pvar_PlayerTeamKiller = objNull;
	if(_killer isKindOf "CAManBase") then {
		pvar_PlayerTeamKiller = _killer;
	} else {
		_veh = (_killer);
		_trts = configFile >> "CfgVehicles" >> typeof _veh >> "turrets";
		_paths = [[-1]];
		if (count _trts > 0) then {
			for "_i" from 0 to (count _trts - 1) do {
				_trt = _trts select _i;
				_trts2 = _trt >> "turrets";
				_paths = _paths + [[_i]];
				for "_j" from 0 to (count _trts2 - 1) do {
					_trt2 = _trts2 select _j;
					_paths = _paths + [[_i, _j]];
				};
			};
		};
		_ignore = ["SmokeLauncher", "FlareLauncher", "CMFlareLauncher", "CarHorn", "BikeHorn", "TruckHorn", "TruckHorn2", "SportCarHorn", "MiniCarHorn", "Laserdesignator_mounted"];
		{
			_weps = (_veh weaponsTurret _x) - _ignore;
			if(count _weps > 0) then {
				_unt = objNull;
				if(_x select 0 == -1) then {_unt = driver _veh;}
				else {_unt = _veh turretUnit _x;};
				if(!isNull _unt) then {
					_suspects = _suspects + [_unt];
				};
			};
		} forEach _paths;

		if(count _suspects == 1) then {
			pvar_PlayerTeamKiller = _suspects select 0;
		};
	};
};

if ((_player != _killer) && (isNull pvar_PlayerTeamKiller)) then 
{
	_corpse setVariable["canfood",player getVariable ["canfood",0],true];
	_corpse setVariable["water",player getVariable ["water",0],true];
	_corpse setVariable["repairkits",player getVariable ["repairkits",0],true];
	_corpse setVariable["medkits",player getVariable ["medkits",0],true];
	_corpse setVariable["cmoney",player getVariable ["cmoney",0],true];
	_corpse setVariable["fuelFull",player getVariable ["fuelFull", 0], true];
	_corpse setVariable["fuelEmpty", 0, true];
	_corpse setVariable["spawnBeacon",player getVariable ["spawnBeacon",0],true];
	_corpse setVariable["camonet",0,true];
}
else
{
	_corpse setVariable["canfood",0,true];
	_corpse setVariable["water",0,true];
	_corpse setVariable["repairkits",0,true];
	_corpse setVariable["medkits",0,true];
	_corpse setVariable["cmoney",0,true];
	_corpse setVariable["fuelFull", 0, true];
	_corpse setVariable["fuelEmpty", 0, true];
	_corpse setVariable["spawnBeacon",0,true];
	_corpse setVariable["camonet",0,true];
};

if(!isNull(pvar_PlayerTeamKiller)) then {
	pvar_teamkillMessage = pvar_PlayerTeamKiller;
	publicVariable "pvar_teamkillMessage";
};
// **************************************

diag_log format["****** onPlayerKilled Finished ******"];
 