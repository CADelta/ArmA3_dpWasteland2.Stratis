#include "dialog\player_sys.sqf"; 

disableSerialization;
private["_playerDialog","_Dialog","_foodtext","_watertext","_moneytext","_uptime","_groupButton","_mIndex"];

_playerDialog = createDialog "lootPlayerMenu";

waituntil {dialog};
_corpse = (nearestobjects [player, ["B_Soldier_F","B_soldier_M_F","B_medic_F","B_soldier_repair_F","O_Soldier_F","O_soldier_M_F","O_medic_F","O_soldier_repair_F","I_Soldier_F","I_soldier_M_F","I_medic_F","I_soldier_repair_F"],  5] select 1);

_currPlayerState = animationState player;
player playMoveNow "AinvPknlMstpSnonWnonDnon_Putdown_AinvPknlMstpSnonWnonDnon";
	
while {dialog} do
{
	if (player distance _corpse < 5 && !alive _corpse) then
	{
		if(isnil {_corpse getVariable "cmoney"}) then {_corpse setVariable["cmoney",0,true];};
			
		_Dialog = findDisplay lootPlayerMenu_DIALOG;
		_moneytext = _Dialog displayCtrl loot_money_text;
		_itemList = _dialog displayCtrl loot_item_list;

		lbClear _itemList;
		
		_moneytext ctrlSetText format["%1", _corpse getVariable "cmoney"];

		if(_corpse getVariable "canfood" > 0) then {
			_itemListIndex = _itemList lbAdd format["%1x - Canned Food", _corpse getVariable "canfood"];
			_itemList lbSetData [(lbSize _itemList)-1, "canfood"];
		};

		if(_corpse getVariable "water" > 0) then {
			_itemListIndex = _itemList lbAdd format["%1x - Water bottle", _corpse getVariable "water"];
			_itemList lbSetData [(lbSize _itemList)-1, "water"];
		};

		if(_corpse getVariable "fuelFull" == 1) then {
			_itemListIndex = _itemList lbAdd "Fuel Can";
			_itemList lbSetData [(lbSize _itemList)-1, "fuelFull"];
		};

		if(_corpse getVariable "fuelEmpty" == 1) then {
			_itemListIndex = _itemList lbAdd "Empty Fuel Can";
			_itemList lbSetData [(lbSize _itemList)-1, "fuelEmpty"];
		};
		if(_corpse getVariable "camonet" > 0) then {
			if(_corpse getVariable "camonet" > 1) then {
				_str = format ["%1x - Slum Canvas (Black)", _corpse getVariable "camonet"];
			} else {
				_str = "Slum Canvas (Black)";
			};
			_itemListIndex = _itemList lbAdd format["%1x - Slum Canvas (Black)", _corpse getVariable "camonet"];
			_itemList lbSetData [(lbSize _itemList)-1, "camonet"];
		};
		if(_corpse getVariable "repairkits" > 0) then {
			_str = "Repair Kit";
			
			if(_corpse getVariable "repairkits" > 1) then 
			{
				_str = format ["%1x - Repair Kit", _corpse getVariable "repairkits"];
			} else {
				_str = "Repair Kit"
			};
			
			_itemListIndex = _itemList lbAdd _str;
			_itemList lbSetData [(lbSize _itemList)-1, "repairkits"];
		};

		if(_corpse getVariable "medkits" > 0) then {
			_str = "Medical kit";
			if(_corpse getVariable "medkits" > 1) then {
				_str = format ["%1x - Medical kit", _corpse getVariable "medkits"];
			} else {
				_str = "Medical kit";
			};
			_itemListIndex = _itemList lbAdd _str;
			_itemList lbSetData [(lbSize _itemList)-1, "medkit"];
		};

		if(_corpse getVariable "spawnBeacon" > 0) then {
			_itemListIndex = _itemList lbAdd "Spawn Beacon";
			_itemList lbSetData [(lbSize _itemList)-1, "spawnBeacon"];
		};
	}
	else 
	{
		closeDialog 0; 
	};
			
	sleep 1;
};

player playMoveNow _currPlayerState;