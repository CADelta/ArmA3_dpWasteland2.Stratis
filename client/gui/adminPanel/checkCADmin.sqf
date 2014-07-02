//	@file Name: checkCADmin.sqf
//	@file Author: [404] Deadbeat, [CAD] Krycek

private ["_uid","_handle"];

_uid = getPlayerUID player;
if ((_uid in dpModerators) || (_uid in serverCADministrators)) then
{
    if ((_uid in dpModerators)) then
	{
		execVM "client\gui\adminPanel\loaddpModeratorMenu.sqf";
	//hint "Welcome dp Moderator";
	};
    if ((_uid in serverCADministrators)) then
	{
		execVM "client\gui\adminPanel\loadServerCADministratorMenu.sqf";
        //hint "Welcome CADministrator";
	};
}
else
{
	sleep 1;
    _handle = player execVM "client\gui\adminPanel\checkCADmin2.sqf";
    waitUntil {scriptDone _handle};
};