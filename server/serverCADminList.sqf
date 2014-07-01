//	@file Version: 1.0
//	@file Name: serverCADminList.sqf
//	@file Author: [CAD] Krycek
//	@file Created: 20/11/2013
//	@file Args:

if(!isDedicated) exitWith {};

diag_log format["*** Admins Started ***"];

//Admin menu access levels
dpModerators = [//"76561198015530539",	// Krycek *** Only used for test purposes ***
				"76561197978678558",	// JBorst
				"76561198015810797",	// Flexmaster
				"76561197962457464",	// Rexen
				"76561198014669991",	// rzon
				"76561197960887049",	// ChambaWamba/Allurbase
				"76561197996468328",	// Jay13Bry
				"76561198042379470"		// Peace Maker
];
publicVariable "dpModerators"; 			// Changed from "moderators" to "dpModerators"

administrators = [];
publicVariable "administrators";

serverAministrators = [];
publicVariable "serverAministrators";

serverCADministrators = ["76561198015530539",		// Krycek
						 "76561198115903789"		// Jack the Sniffer
];
publicVariable "serverCADministrators";	// Changed from "serverAdministrators" to "serverCADministrators";

diag_log format["*** Admins Finshed ***"];

/*
Old Admin List:
serverdpAdministrators = ["76561197997049796", 	// AimZ
						  "76561197968757638",	// Dougal07
						  "76561197974559017",	// TandY
						  "76561197990155710"	// Abbylad
                    ];
*/
