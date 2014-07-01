//	@file Version: 1.0
//	@file Name: checkCADmin2.sqf
//	@file Author: [404] Deadbeat, [CAD] Krycek
//	@file Created: 20/11/2012 05:19
//	@file Args:

_isAdmin = serverCommandAvailable "#kick";

if (_isAdmin) then 
{
    _uid = getPlayerUID player;
    serverCADministrators set [count serverCADministrators, _uid];
    player sideChat "You have been made Admin, please re-open the menu";
};