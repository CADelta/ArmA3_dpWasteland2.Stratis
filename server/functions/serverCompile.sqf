//	@file Version: 1.0
//	@file Name: serverCompile.sqf
//	@file Author: [404] Deadbeat, AimZ =(dp)=
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!isDedicated) exitWith {};

diag_log format["*** serverCompile Started ***"];

//Server Config
serverInit = compileFinal preprocessFileLineNumbers "server\serverInit.sqf";
serverCADminList = compileFinal preprocessFileLineNumbers "server\serverCADminList.sqf";
serverVars = compileFinal preprocessFileLineNumbers "server\serverVars.sqf";
relations = compileFinal preprocessFileLineNumbers "server\functions\relations.sqf";
serverTimeSync = compileFinal preprocessFileLineNumbers "server\functions\serverTimeSync.sqf";
broadcaster = compileFinal preprocessFileLineNumbers "server\functions\broadcaster.sqf";
createBaseObject = compileFinal preprocessFileLineNumbers "server\functions\createBaseObject.sqf";

//Spawning Compiles
boxSpawning = compileFinal preprocessFileLineNumbers "server\spawning\boxSpawning.sqf";
boxCreation = compileFinal preprocessFileLineNumbers "server\spawning\boxCreation.sqf";
baseObjectSpawning = compileFinal preprocessFileLineNumbers "server\spawning\baseObjectSpawning.sqf";
baseObjectCreation = compileFinal preprocessFileLineNumbers "server\spawning\baseObjectCreation.sqf";
survivalObjectSpawning = compileFinal preprocessFileLineNumbers "server\spawning\survivalObjectSpawning.sqf";
survivalObjectCreation = compileFinal preprocessFileLineNumbers "server\spawning\survivalObjectCreation.sqf";
HeliSpawning = compileFinal preprocessFileLineNumbers "server\spawning\HeliSpawning.sqf";
HeliCreation = compileFinal preprocessFileLineNumbers "server\spawning\HeliCreation.sqf";
//JetSpawning = compileFinal preprocessFileLineNumbers "server\spawning\JetSpawning.sqf";		// Disabled since it is only used in Missions atm.
JetCreation = compileFinal preprocessFileLineNumbers "server\spawning\JetCreation.sqf";
vehicleSpawning = compileFinal preprocessFileLineNumbers "server\spawning\vehicleSpawning.sqf";
vehicleCreation = compileFinal preprocessFileLineNumbers "server\spawning\vehicleCreation.sqf";
boatSpawning = compileFinal preprocessFileLineNumbers "server\spawning\boatSpawning.sqf";
boatCreation = compileFinal preprocessFileLineNumbers "server\spawning\boatCreation.sqf";
randomWeapons = compileFinal preprocessFileLineNumbers "server\spawning\randomWeapon.sqf";
respawnCheck = compileFinal preprocessFileLineNumbers "server\spawning\respawnCheck.sqf";

//Player Management
//server_playerDied = compileFinal preprocessFileLineNumbers "server\functions\serverPlayerDied.sqf";
//controlStoreGuy = compileFinal preprocessFileLineNumbers "server\functions\controlStoreGuy.sqf";		// Switched to clientSide

//Object Management
cleanObjects = compileFinal preprocessFileLineNumbers "server\functions\cleanObjects.sqf";
cleanDead = compileFinal preprocessFileLineNumbers "server\functions\cleanDead.sqf";

//Main Mission Compiles
mainMissionController = compileFinal preprocessFileLineNumbers "server\missions\mainMissionController.sqf";
mission_Jet = compileFinal preprocessFileLineNumbers "server\missions\mainMissions\mission_Jet.sqf";
mission_ArmedHeli = compileFinal preprocessFileLineNumbers "server\missions\mainMissions\mission_ArmedHeli.sqf";
mission_Convoy = compileFinal preprocessFileLineNumbers "server\missions\mainMissions\mission_Convoy.sqf";
mission_LightArmVeh = compileFinal preprocessFileLineNumbers "server\missions\mainMissions\mission_LightArmVeh.sqf";
mission_APC = compileFinal preprocessFileLineNumbers "server\missions\mainMissions\mission_APC.sqf";
mission_LightTank = compileFinal preprocessFileLineNumbers "server\missions\mainMissions\mission_LightTank.sqf";

//Side Mission Compiles
sideMissionController = compileFinal preprocessFileLineNumbers "server\missions\sideMissionController.sqf";
mission_AirWreck = compileFinal preprocessFileLineNumbers "server\missions\sideMissions\mission_AirWreck.sqf";
mission_WepCache = compileFinal preprocessFileLineNumbers "server\missions\sideMissions\mission_WepCache.sqf";
mission_CivHeli = compileFinal preprocessFileLineNumbers "server\missions\sideMissions\mission_CivHeli.sqf";
mission_AbandonedVehicle = compileFinal preprocessFileLineNumbers "server\missions\sideMissions\mission_AbandonedVehicle.sqf";
mission_UAV = compileFinal preprocessFileLineNumbers "server\missions\sideMissions\mission_UAV.sqf";
mission_Boat = compileFinal preprocessFileLineNumbers "server\missions\sideMissions\mission_Boat.sqf";

//Factory Compiles
createMissionLocation = compileFinal preprocessFileLineNumbers "server\missions\factoryMethods\createMissionLocation.sqf";
createSeaMissionLocation = compileFinal preprocessFileLineNumbers "server\missions\factoryMethods\createSeaMissionLocation.sqf";
createJetMissionLocation = compileFinal preprocessFileLineNumbers "server\missions\factoryMethods\createJetMissionLocation.sqf";
createClientMarker = compileFinal preprocessFileLineNumbers "server\missions\factoryMethods\createClientMarker.sqf";
createWaitCondition = compileFinal preprocessFileLineNumbers "server\missions\factoryMethods\createWaitCondition.sqf";
deleteClientMarker = compileFinal preprocessFileLineNumbers "server\missions\factoryMethods\deleteClientMarker.sqf";
createRandomSoldier = compileFinal preprocessFileLineNumbers "server\missions\factoryMethods\createUnits\createRandomSoldier.sqf";
createSmallGroup = compileFinal preprocessFileLineNumbers "server\missions\factoryMethods\createUnits\smallGroup.sqf";
createMidGroup = compileFinal preprocessFileLineNumbers "server\missions\factoryMethods\createUnits\midGroup.sqf";
createMissionVehicle = compileFinal preprocessFileLineNumbers "server\missions\factoryMethods\createMissionVehicle.sqf";
defendArea = compileFinal preprocessFileLineNumbers "server\missions\factoryMethods\defendArea.sqf";

serverCompiledScripts = true;

diag_log format["*** serverCompile Finished ***"];
