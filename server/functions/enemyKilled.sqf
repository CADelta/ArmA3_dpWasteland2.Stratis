//Passed array: [unit, killer]
_unit = _this select 0;
_killer = _this select 1;

_inVehicle = (vehicle _killer != _killer);

if (!_inVehicle) then
{
	// the player is not in the vehicle
	_killer addScore 2;
}
else
{
	// the player is in the vehicle
	_killer addScore 2;				// CAD - Org. = 2. Test value of 1, to see if you can decrease the score while in a vehicle. This could/should encourage players not to just run over the AI.
};