if (!isServer) exitWith {};

diag_log format["****** repawnCheck Started ******"];

private ["_unit","_delay","_deserted","_position","_type","_damage","_alive","_curtime","_timeout","_respawn","_num","_objectDistance"];

// Define variables

_delay = burningTimeLimit;
_deserted = desertedTimeLimit;

while {true} do
{
	{
		if (!(isNull _x)) then
		{
			_unit = _x;
			_type = typeOf _unit;
			_status = _unit getVariable ["status", "unknown"];
			
			_unit setVariable ["last_timeout", time, true];
			
			switch (_status) do
			{
				case "alive": 
				{
					_damage = damage _unit;	
					_alive = {alive _x} count crew _unit;
					_curtime = time;
					_timeout = _unit getVariable ["timeout", -1];

					if (_timeout > -1) then 
					{
						if (_alive == 0 and _damage <= 0.99) then 
						{
							if (_curtime > _timeout) then
							{
								_unit setVariable ["status", "respawn", true];
							};
						}
						else
						{
							_unit setVariable ["timeout", (time + desertedTimeLimit + random maxRandomTimeLimit), true];
						};
					};

					// check for badly broken
					// if ((_damage > 0.96 && _alive == 0) || !alive _unit) then	// = Original.
					if (_damage > 0.96) then
					{
						_unit setDamage 1;
						_unit setVariable ["status", "burn", true];
						_unit setVariable ["timeout", (time + burningTimeLimit), true];
					};
				}; 
				case "burn": 
				{
					_curtime = time;
					_timeout = _unit getVariable ["timeout", (time + burningTimeLimit)];
				
					if (_curtime > _timeout) then
					{
						_unit setVariable ["status", "respawn", true];
					};
				}; 
				case "respawn": 
				{
					_respawn = _unit getVariable ["respawn", false];
					if (!_respawn) then
					{
						_unit removeAllEventHandlers "GetIn";
						_unit removeAllEventHandlers "killed";
						_unit removeAllEventHandlers "HandleDamage";
						deleteVehicle _unit;
					}
					else
					{
						if (_unit isKindOf "Car") then
						{
							_unit removeAllEventHandlers "GetIn";
							_unit removeAllEventHandlers "killed";
							_unit removeAllEventHandlers "HandleDamage";
							deleteVehicle _unit;
							
							_position = getMarkerPos format ["Spawn_%1", floor (random 118) + 1];					
							_type = floor (random 4);
							switch (_type) do 
							{ 
							  case 0: {[_position, Quadbikes, true, 50, true] call vehicleCreation;}; 
							  case 1: {[_position, Cars, true, 50, true] call vehicleCreation;}; 
							  case 2: {[_position, Trucks, true, 50, true] call vehicleCreation;}; 
							  case 3: {[_position, UnarmedMRAPVehicles, true, 50, true] call vehicleCreation;}; 
							};
						};
						if (_unit isKindOf "Ship") then		// Ship or Boat_F - could be wrong - TEST IT! Update: Think Ship works fine.
						{
							_unit removeAllEventHandlers "GetIn";
							_unit removeAllEventHandlers "killed";
							_unit removeAllEventHandlers "HandleDamage";
							deleteVehicle _unit;
							
							_position = getMarkerPos format ["boatSpawn_%1", floor (random 10) + 1];					
							_type = floor (random 3);
							switch (_type) do
							{
								case 0: {[_position, Rubber_duck_base_F, true, 40, true] call boatCreation;};
								case 1: {[_position, Boat_Civil_01_base_F, true, 40, true] call boatCreation;};
								case 2: {[_position, SDV_01_base_F, true, 40, true] call boatCreation;};
							};
						};
						if (_unit isKindOf "ReammoBox_F") then
						{
							_unit removeAllEventHandlers "GetIn";
							_unit removeAllEventHandlers "killed";
							_unit removeAllEventHandlers "HandleDamage";
							deleteVehicle _unit;
							
							_position = getMarkerPos format ["Town_%1", floor (random 24) + 1];					
							[_position, ammoBoxes, true, 20, true] call boxCreation;	
						};
						if (_unit isKindOf "Helicopter") then
						{
							_unit removeAllEventHandlers "GetIn";
							_unit removeAllEventHandlers "killed";
							_unit removeAllEventHandlers "HandleDamage";
							deleteVehicle _unit;
							
							_position = getMarkerPos format ["heliSpawn_%1", floor (random 24) + 1];			
							_type = floor (random 2);
							switch (_type) do 
							{ 
							  case 0: {[_position, LightHelicopters, true, 50, true] call vehicleCreation;}; 
							  case 1: {[_position, TransportHelicopters, true, 50, true] call vehicleCreation;}; 
							};
						};
						if ((typeof _unit) in survivalObjectList) then
						{
							_unit removeAllEventHandlers "GetIn";
							_unit removeAllEventHandlers "killed";
							_unit removeAllEventHandlers "HandleDamage";
							deleteVehicle _unit;
							
							_position = getMarkerPos format ["Town_%1", floor (random 24) + 1];	
							[_position, survivalObjectList, true, 50, true] call survivalObjectCreation;	
						};
					};
				}; 
				case "unknown": 
				{
					diag_log format["SPAWN - unknown state for vehicle: %1", _type];
				}; 
			};
		};
	} foreach vehicles;

	sleep 2;
};

diag_log format["****** repawnCheck Finished ******"];
