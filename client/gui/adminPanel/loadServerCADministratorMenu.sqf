//	@file Version: 1.0
//	@file Name: loadServerCADministratorMenu.sqf
//	@file Author: [404] Deadbeat, [CAD] Krycek
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define serverCADminMenu_option 50007
disableSerialization;

private ["_start","_displayServerCADmin","_serverCADminSelect","_panelOptions"];
_uid = getPlayerUID player;
if (_uid in serverCADministrators) then 
{
	_start = createDialog "ServerCADminMenu";
	
	_displayServerCADmin = uiNamespace getVariable "ServerCADminMenu";
	_serverCADminSelect = _displayServerCADmin displayCtrl serverCADminMenu_option;
	
	_panelOptions = ["Player Management",
					"Object Management",
					"Debugging Tags",
					"Teleport",
	                "Money",
					"Allow Player Icons",
					"Allow Groups",
					"Day Cycle"];
	
	{
		_serverCADminSelect lbAdd _x;
	} forEach _panelOptions;
}
else
{
	exit;
};