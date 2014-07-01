//	Name: init.sqf
//	Author: AimZ =(dp)=

if(isServer) exitWith {};

diag_log format["****** clientInit Started ******"];

// Public variable events
"currentDate" addPublicVariableEventHandler {[] call timeSync};
"messageSystem" addPublicVariableEventHandler {[] call serverMessage};
"clientMissionMarkers" addPublicVariableEventHandler {[] call updateMissionsMarkers};
"pvar_teamKillList" addPublicVariableEventHandler {[] call updateTeamKiller};
"pvar_teamkillMessage" addPublicVariableEventHandler {if(local(_this select 1)) then {[] spawn teamkillMessage;};};

"allowPlayerIcons" addPublicVariableEventHandler {hint format["Player Icons %1", allowPlayerIcons];};
"allowGroups" addPublicVariableEventHandler {if(allowGroups == "OFF") then {[player] joinSilent grpNull;}; hint format["Groups %1", allowGroups];};
"clockCycle" addPublicVariableEventHandler {hint format["Day Night Cycle %1", clockCycle];};

"refuelVehicle" addPublicVariableEventHandler {
	_data = _this select 1;_currVehicle = _data select 0;_fuelAmount = _data select 1;
	if (_currVehicle != "") then 
	{
		_obj = objectFromNetId _currVehicle;
		if (_obj != objNull) then
		{
			if (local _obj) then
			{
				_fuel = ((fuel _obj) + _fuelAmount);
				if (_fuel > 1) then 
				{
					_fuel = 1;
				};
				_obj setFuel _fuel;
				refuelVehicle = ["",0];
				publicVariable "refuelVehicle";
			};
		};
	};
};
"defuelVehicle" addPublicVariableEventHandler {
	_data = _this select 1;
	_currVehicle = _data select 0;
	_fuelAmount = _data select 1;
	if (_currVehicle != "") then 
	{
		_obj = objectFromNetId _currVehicle;
		if (_obj != objNull) then
		{
			if (local _obj) then
			{
				_fuel = ((fuel _obj) - _fuelAmount);	
				if (_fuel < 0) then {_fuel = 0;};
				_obj setFuel _fuel;
				
				defuelVehicle = ["",0];
				publicVariable "defuelVehicle";
			};
		};
	};
};

// Initialise
[] call clientVars;
[] call briefing;

// wait for the player to be ingame before continuing
waitUntil {!(isNull player)};
waitUntil {vehicle player == player};
waitUntil {!visibleMap};
sleep 2;

// One time only setup
[] call initPlayer;	

// Update map markers
[] call createTownMarkers;
[] call createGunStoreMarkers;
[] call createGeneralStoreMarkers;
[] call createConstructionStoreMarkers;
[] call updateMissionsMarkers;

[] spawn {
	_objects = nearestObjects [getMarkerPos "Town_1", ["House_F"], 28000];
	{
		_x allowDamage false;
		_x enableSimulation false;
		sleep 0.01;
	} foreach _objects;
};

// Player setup
//sleep 2;
[] call PlayerSetup;	
[] spawn createMenuActions;	
[] spawn initSurvival; 
[] call createKeyboardEvent; 

// Start HUD drawing
[] spawn rechargeScanner;
[] spawn playerHud;
[] spawn drawPlayerIcons;
[] spawn getPlayerData;
[] spawn getDebugData;

[] spawn cleanLocalObjects;		// CAD - TEST

isStandRunning = false;
isKneelRunning = false;
isStandSprinting = false;
isKneelSprinting = false;
player addEventHandler ["AnimStateChanged","
	_str_sprint1 = toArray 'amovpercmeva';
	_str_sprint2 = toArray 'amovpknlmeva';
	_str_run1 = toArray 'amovpercmrun';
	_str_run2 = toArray 'amovpknlmrun';
	_str_anim = toArray (_this select 1);
	if (count _str_anim < 12) then 
	{
		_str_anim = 'amovpercxxxx';
	};
	_isStandRunning = true;
	_isKneelRunning = true;
	_isStandSprinting = true;
	_isKneelSprinting = true;
	{
		if (_x != _str_anim select _forEachIndex) then
		{
			_isStandRunning = false;
		};
	} foreach _str_run1;
	{
		if (_x != _str_anim select _forEachIndex) then
		{
			_isKneelRunning = false;
		};
	} foreach _str_run2;
	{
		if (_x != _str_anim select _forEachIndex) then
		{
			_isStandSprinting = false;
		};
	} foreach _str_sprint1;
	{
		if (_x != _str_anim select _forEachIndex) then
		{
			_isKneelSprinting = false;
		};
	} foreach _str_sprint2;
	isStandRunning = _isStandRunning;
	isKneelRunning = _isKneelRunning;	
	isStandSprinting = _isStandSprinting;
	isKneelSprinting = _isKneelSprinting;
"];

player enableFatigue true;
finalFatigue = 0; // damage: 0=good, 1=bad | thirst=100:good, 0=bad
[] spawn 
{
	while {true} do
	{
		_thirst = ((((player getVariable ["thirst",0]) / 100) * -1) + 1) / 1.5;
		_hunger = ((((player getVariable ["hunger",0]) / 100) * -1) + 1) / 1.5;
		_damage = (damage player) / 2;
		_minfatigue = ((_thirst max _hunger) max (_damage));  
		
		if ((isStandSprinting || isKneelSprinting || isStandRunning || isKneelRunning) && (vehicle player == player)) then
		{
			if (finalFatigue < 1) then {
				if (isStandSprinting || isKneelSprinting) then
				{
					finalFatigue = finalFatigue + 0.02;
				};
				if (isStandRunning || isKneelRunning) then
				{
					finalFatigue = finalFatigue + 0.01;
				};
			} 
			else 
			{
				finalFatigue = 1;
			};
		}
		else
		{
			if (finalFatigue > _minfatigue) then 
			{
				finalFatigue = finalFatigue - 0.1;
			} 
			else 
			{
				finalFatigue = _minfatigue;
			};
		};
		//hint format["fatigue: %1, %2, %3, %4, %5", finalFatigue, isStandSprinting, isKneelSprinting, isStandRunning, isKneelRunning];
		player setFatigue finalFatigue;
		sleep 1;
	};
};

diag_log format["******** clientInit Finished ********"];
