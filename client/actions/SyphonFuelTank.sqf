
_vehicle = nearestobjects [player, ["Car", "Helicopter", "Tank"], 4];
if (count _vehicle > 0) then
{
	_vehicle = _vehicle select 0;
};

_fuelAmount = 0.25;

switch true do {
	case (_vehicle isKindOf "Air"): {_fuelAmount = 0.10;};
	case (_vehicle isKindOf "Tank"): {_fuelAmount = 0.10;};
//	case (_vehicle isKindOf "Motorcycle"): {_fuelAmount = 0.75;};		// CAD - This must be from ArmA 2?
	case (_vehicle isKindOf "ATV_Base_EP1"): {_fuelAmount = 0.75;};
};

if (fuel _vehicle > 0) then
{
	if (player distance _vehicle < 6) then		// Org. = 4
	{
        if(!(local _vehicle)) then
		{
			defuelVehicle = [netId _vehicle,_fuelAmount];
			publicVariable "defuelVehicle";
		}
		else
		{
			_fuel = (fuel _vehicle) - _fuelAmount;
			if (_fuel < 0) then {_fuel = 0;};
			_vehicle setFuel _fuel;
		};

		player setVariable ["fuelFull",1,false];
		player setVariable["fuelEmpty",0,false];
		hint "Your jerry can is now full";
	}
	else
	{
		hint "Vehicle to far away";
	};
}
else
{
	hint "No fuel in vehicle";
};