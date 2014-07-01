if (isServer) exitWith {};  

diag_log format["*** createMenuActions Started ***"];

private ["_vehiclePlayer"];

aActionsIDs = [];

aActionsIDs = aActionsIDs + [player addAction["Scanner", "client\actions\useScanner.sqf", [], 1, false, false, "", 'scannerBattery > 60 && !scanningInProgress']];
aActionsIDs = aActionsIDs + [player addAction["Loot Dead Body", "client\gui\playerMenu\loadLootPlayerMenu.sqf", [], 1, false, false, "", '_object = nearestobjects [player, ["B_Soldier_F","B_soldier_M_F","B_medic_F","B_soldier_repair_F","O_Soldier_F","O_soldier_M_F","O_medic_F","O_soldier_repair_F","I_Soldier_F","I_soldier_M_F","I_medic_F","I_soldier_repair_F"], 5]; if (count _object > 1) then {_object = _object select 1;} else {_object = player;}; player distance _object < 5 && !alive _object']];
aActionsIDs = aActionsIDs + [player addAction["Use The Gun Store", "client\gui\gunStore\loadGunStore.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["C_man_polo_4_F"],  5] select 0) < 5']];
aActionsIDs = aActionsIDs + [player addAction["Use The General Store", "client\gui\generalStore\loadGenStore.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["C_man_polo_6_F"],  5] select 0) < 5']];
aActionsIDs = aActionsIDs + [player addAction["Use The Construction Store", "client\gui\constructionStore\loadConstructionStore.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["C_man_polo_5_F"],  5] select 0) < 5']];
aActionsIDs = aActionsIDs + [player addAction["Refuel Jerry Can", "client\actions\refuelFuelCan.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["Land_FuelStation_Feed_F", "Land_MetalBarrel_F"], 3] select 0) < 3 AND ((player getVariable "fuelFull") == 0) AND ((player getVariable "fuelEmpty") == 1)']];
aActionsIDs = aActionsIDs + [player addAction["Syphon Fuel", "client\actions\SyphonFuelTank.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["Car", "Helicopter", "Tank"], 4] select 0) < 3 AND ((player getVariable "fuelFull") == 0) AND ((player getVariable "fuelEmpty") == 1) AND vehicle player == player']];
aActionsIDs = aActionsIDs + [player addAction["Take from food sack", "noscript.sqf", '_nobj = (nearestobjects [player, ["Land_Sacks_goods_F"],  5] select 0); _nobj setVariable["food",(_nobj getVariable "food")-1,true]; player setVariable["canfood",(player getVariable "canfood")+1,true]; player playmove "AinvPknlMstpSlayWrflDnon"; if(_nobj getVariable "food" < 1) then {hint "You have taken some food.\nFood sack is empty.";} else {hint format["You have taken some food.\n(Food left: %1)", (_nobj getVariable "food")];};',0,false,false,"",'player distance (nearestobjects [player, ["Land_Sacks_goods_F"],  5] select 0) < 5 and (player getVariable "canfood") < 3 and (nearestobjects [player, ["Land_Sacks_goods_F"],  5] select 0) getVariable "food" > 0']];
aActionsIDs = aActionsIDs + [player addAction["Take from water can","noscript.sqf",'_nobj = (nearestobjects [player, ["Land_CanisterPlastic_F"],  5] select 0);_nobj setVariable["water",(_nobj getVariable "water")-1,true];player setVariable["water",(player getVariable "water")+1,true];player playmove "AinvPknlMstpSlayWrflDnon";if(_nobj getVariable "water" < 1) then {hint "You have taken some water.\nCanister is empty.";}else{hint format["You have taken some water.\n(Water left: %1)", (_nobj getVariable "water")];};',0,false,false,"",'player distance (nearestobjects [player, ["Land_CanisterPlastic_F"],  5] select 0) < 5 and (player getVariable "water") < 4 and (nearestobjects [player, ["Land_CanisterPlastic_F"],  5] select 0) getVariable "water" > 0']];
aActionsIDs = aActionsIDs + [player addAction[("<t color=""#FFFFFF"">Cancel Action</t>"), "noscript.sqf", 'doCancelAction = true;', 1, false, false, "", 'mutexScriptInProgress']];

//aActionsIDs = aActionsIDs + [player addAction[("<t color=""#414d35"">Show Chat</t>"), "showChat true", [], -9, false, true]];	// Temp solution for the disappearing chat box.

_vehiclePlayer = vehicle player;
playerMenuId = _vehiclePlayer addAction [format ["<t color='#BE6300'>%1</t>", "Player Menu"], loadPlayerMenu,[],-10,false,false,"","local player"];

while {alive player} do 
{
	if (vehicle player != _vehiclePlayer) then 
	{
		_vehiclePlayer removeaction playerMenuId;
		_vehiclePlayer = vehicle player;
		playerMenuId = _vehiclePlayer addAction [format ["<t color='#BE6300'>%1</t>", "Player Menu"], loadPlayerMenu,[],-10,false,false,"","local player"];
	};
	sleep 2;
};

_vehiclePlayer removeaction playerMenuId;
		
diag_log format["*** createMenuActions Finished ***"];