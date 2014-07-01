/*
 * This file contains the configuration variables of the logistics system.
 * Important note : All the classes names which inherits from the ones used in configuration variables will be also available.

 * There are two ways to manage new objects with the logistics system. The first is to add these objects in the
 * following appropriate lists. The second is to create a new external file in the /addons_config/ directory,
 * according to the same scheme as the existing ones, and to add a #include at the end of this current file.
 
 */

/****** TOW WITH VEHICLE / REMORQUER AVEC VEHICULE ******/

/**
 * List of class names of (ground or air) vehicles which can tow tow-able objects.
*/

R3F_LOG_CFG_remorqueurs = [
	"C_Offroad_01_F",
	"B_G_Offroad_01_F",
	"B_G_Offroad_01_armed_F",
	//"C_SUV_01_F",
	//"C_Hatchback_01_F",
    //"C_Hatchback_01_sport_F",
	"B_MRAP_01_gmg_F",
	"B_MRAP_01_hmg_F",
	"O_MRAP_02_gmg_F",
	"O_MRAP_02_hmg_F",
	"I_MRAP_03_gmg_F",
	"I_MRAP_03_hmg_F",
	"B_MRAP_01_F",
	"O_MRAP_02_F",
	"I_MRAP_03_F",
    "B_Truck_01_transport_F",
    "B_Truck_01_covered_F",
    "B_Truck_01_mover_F",
    "B_Truck_01_medical_F",
	"B_Truck_01_box_F",
	"B_Truck_01_Repair_F",
    "B_Truck_01_ammo_F",
    "B_Truck_01_fuel_F",
    "O_Truck_02_covered_F",
    "O_Truck_02_transport_F",
	"O_Truck_02_medical_F",
    "O_Truck_02_box_F",
    "O_Truck_02_Ammo_F",
    "O_Truck_02_fuel_F",
    "I_Truck_02_covered_F",
    "I_Truck_02_transport_F",
	"I_Truck_02_medical_F",	
    "I_Truck_02_ammo_F",
    "I_Truck_02_box_F",
    "I_Truck_02_fuel_F",
    "C_Van_01_transport_F",
    "C_Van_01_box_F",
    "C_Van_01_fuel_F",
    "B_G_Van_01_transport_F",
    "B_G_Van_01_fuel_F",
	"B_APC_Wheeled_01_cannon_F",
    "O_APC_Wheeled_02_rcws_F",
    "I_APC_Wheeled_03_cannon_F",
	"I_APC_tracked_03_cannon_F"
];

/**
 * List of class names of tow-able objects.
*/
R3F_LOG_CFG_objets_remorquables = [
//	Offroads
    "C_Offroad_01_F",
	"B_G_Offroad_01_F",
	"B_G_Offroad_01_armed_F",
//	Civilian Cars
	"C_SUV_01_F",
	"C_Hatchback_01_F",
    "C_Hatchback_01_sport_F",
//	Trucks and Vans
    "B_Truck_01_transport_F",
    "B_Truck_01_covered_F",
    "B_Truck_01_mover_F",
    "B_Truck_01_medical_F",
	"B_Truck_01_box_F",
	"B_Truck_01_Repair_F",
    "B_Truck_01_ammo_F",
    "B_Truck_01_fuel_F",
    "O_Truck_02_covered_F",
    "O_Truck_02_transport_F",
	"O_Truck_02_medical_F",
    "O_Truck_02_box_F",
    "O_Truck_02_Ammo_F",
    "O_Truck_02_fuel_F",
    "I_Truck_02_covered_F",
    "I_Truck_02_transport_F",
	"I_Truck_02_medical_F",	
    "I_Truck_02_ammo_F",
    "I_Truck_02_box_F",
    "I_Truck_02_fuel_F",
    "C_Van_01_transport_F",
    "C_Van_01_box_F",
    "C_Van_01_fuel_F",
    "B_G_Van_01_transport_F",
    "B_G_Van_01_fuel_F",
//	MRAPs
	"B_MRAP_01_F", 
	"O_MRAP_02_F", 
	"I_MRAP_03_F",
	"B_MRAP_01_gmg_F", 
	"B_MRAP_01_hmg_F", 
	"O_MRAP_02_gmg_F", 
	"O_MRAP_02_hmg_F", 
	"I_MRAP_03_gmg_F", 
	"I_MRAP_03_hmg_F",	
//	APCs
    "B_APC_Wheeled_01_cannon_F",
    "O_APC_Wheeled_02_rcws_F",
    "I_APC_Wheeled_03_cannon_F",
	"I_APC_tracked_03_cannon_F",
    "B_APC_Tracked_01_rcws_F",
    "B_APC_Tracked_01_CRV_F",
    "B_APC_Tracked_01_AA_F",
    "O_APC_Tracked_02_cannon_F",
    "O_APC_Tracked_02_AA_F",
//	Helis
    "B_Heli_Light_01_F",
    "B_Heli_Light_01_armed_F",
    "O_Heli_Light_02_F",
    "O_Heli_Light_02_unarmed_F",
	"I_Heli_light_03_F",			// WY-55 - Hellcat
	"I_Heli_light_03_unarmed_F",	// WY-55 - Hellcat (Unarmed)
    "B_Heli_Transport_01_F",
    "B_Heli_Transport_01_camo_F",
    "I_Heli_Transport_02_F",
    "B_Heli_Attack_01_F",
    "O_Heli_Attack_02_F",
    "O_Heli_Attack_02_black_F",
//	Jets
	"I_Plane_Fighter_03_CAS_F",
    "I_Plane_Fighter_03_AA_F"
];

/****** LIFT WITH VEHICLE / HELIPORTER AVEC VEHICULE ******/

/**
 * List of class names of air vehicles which can lift lift-able objects.
*/
/*R3F_LOG_CFG_heliporteurs = [		// Old list.
    "B_Heli_Light_01_F",
    "B_Heli_Light_01_armed_F",
    "O_Heli_Light_02_F",
    "O_Heli_Light_02_unarmed_F",
	"I_Heli_light_03_F",			// WY-55 - Hellcat
	"I_Heli_light_03_unarmed_F",	// WY-55 - Hellcat (Unarmed)
    "B_Heli_Transport_01_F",
    "B_Heli_Transport_01_camo_F",
    "I_Heli_Transport_02_F",
    "B_Heli_Attack_01_F",
    "O_Heli_Attack_02_F",
    "O_Heli_Attack_02_black_F"
];*/		// Old list.

R3F_LOG_CFG_heliporteurs =
[
	"Helicopter_Base_F"
];

/**
 * List of class names of lift-able objects.
*/
R3F_LOG_CFG_objets_heliportables = [
//	Offroads
    "C_Offroad_01_F",
	"B_G_Offroad_01_F",
	"B_G_Offroad_01_armed_F",
//	Cars
	"C_SUV_01_F",
	"C_Hatchback_01_F",
    "C_Hatchback_01_sport_F",
//	Trucks
    "B_Truck_01_transport_F",
    "B_Truck_01_covered_F",
    "B_Truck_01_mover_F",
    "B_Truck_01_medical_F",
	"B_Truck_01_box_F",
	"B_Truck_01_Repair_F",
    "B_Truck_01_ammo_F",
    "B_Truck_01_fuel_F",
    "O_Truck_02_covered_F",
    "O_Truck_02_transport_F",
	"O_Truck_02_medical_F",
    "O_Truck_02_box_F",
    "O_Truck_02_Ammo_F",
    "O_Truck_02_fuel_F",
    "I_Truck_02_covered_F",
    "I_Truck_02_transport_F",
	"I_Truck_02_medical_F",	
    "I_Truck_02_ammo_F",
    "I_Truck_02_box_F",
    "I_Truck_02_fuel_F",
//	Vans	
    "C_Van_01_transport_F",
    "C_Van_01_box_F",
    "C_Van_01_fuel_F",
    "B_G_Van_01_transport_F",
    "B_G_Van_01_fuel_F",
//	MRAPs
	"B_MRAP_01_F", 
	"O_MRAP_02_F", 
	"I_MRAP_03_F",
	"B_MRAP_01_gmg_F", 
	"B_MRAP_01_hmg_F", 
	"O_MRAP_02_gmg_F", 
	"O_MRAP_02_hmg_F", 
	"I_MRAP_03_gmg_F", 
	"I_MRAP_03_hmg_F",	
//	Light Armour
    "B_APC_Wheeled_01_cannon_F",
    "O_APC_Wheeled_02_rcws_F",
    "I_APC_Wheeled_03_cannon_F",
	"I_APC_tracked_03_cannon_F",
    "B_APC_Tracked_01_rcws_F",
    "B_APC_Tracked_01_CRV_F",
    "B_APC_Tracked_01_AA_F",
    "O_APC_Tracked_02_cannon_F",
    "O_APC_Tracked_02_AA_F",
//	Heavy Armour
	"B_MBT_01_cannon_F",
    "B_MBT_01_arty_F",
    "B_MBT_01_mlrs_F",
    "O_MBT_02_arty_F",
    "O_MBT_02_cannon_F",
	"I_MBT_03_cannon_F",
//	Boats
	"O_Boat_Armed_01_hmg_F",
	"B_Boat_Armed_01_minigun_F",
	"I_Boat_Armed_01_minigun_F",
	"B_G_Boat_Transport_01_F",
	"B_Boat_Transport_01_F",
	"O_Boat_Transport_01_F",
	"I_Boat_Transport_01_F",
	"B_Lifeboat",
	"O_Lifeboat",
	"C_Rubberboat",
	"C_Boat_Civil_01_F",
	"C_Boat_Civil_01_rescue_F",
	"C_Boat_Civil_01_police_F",
//	Structures
	"Land_Cargo_Tower_V1_F"			// CAD - Tested and works, with some extra coding in the "heliportables" file.
];


/****** LOAD IN VEHICLE ******/

/**
 * List of class names of (ground or air) vehicles which can transport transportable objects.
 * The second element of the arrays is the load capacity (in relation with the capacity cost of the objects).
 */
 
/**
 * Note : the priority of a declaration of capacity to another corresponds to their order in the tables.
 *   For example : the "Truck" class is in the "Car" class (see http://community.bistudio.com/wiki/ArmA_2:_CfgVehicles).
 *   If "Truck" is declared with a capacity of 140 before "Car". And if "Car" is declared after "Truck" with a capacity of 40,
 *   Then all the sub-classes in "Truck" will have a capacity of 140. And all the sub-classes of "Car", excepted the ones
 *   in "Truck", will have a capacity of 40.
*/

R3F_LOG_CFG_transporteurs = [
//	Trucks
	["B_Truck_01_box_F", 120],
	["B_Truck_01_Repair_F", 80],
	["B_Truck_01_transport_F", 60],
	["B_Truck_01_covered_F", 50],
	["B_Truck_01_medical_F", 50],
	["B_Truck_01_mover_F", 30],
	["B_Truck_01_ammo_F", 20],
	["B_Truck_01_fuel_F", 10],
	["O_Truck_02_box_F", 50],
	["O_Truck_02_transport_F", 40],
	["O_Truck_02_covered_F", 30],
	["O_Truck_02_medical_F", 30],
	["O_Truck_02_Ammo_F", 20],
	["O_Truck_02_fuel_F", 10],
	["I_Truck_02_box_F", 50],
	["I_Truck_02_transport_F", 40],
	["I_Truck_02_covered_F", 30],
	["I_Truck_02_medical_F", 30],
	["I_Truck_02_ammo_F", 20],
	["I_Truck_02_fuel_F", 10],
//	MRAPs
	["B_MRAP_01_gmg_F", 20],
	["B_MRAP_01_hmg_F", 20],
	["O_MRAP_02_gmg_F", 20],
	["O_MRAP_02_hmg_F", 20],
	["I_MRAP_03_gmg_F", 20],
	["I_MRAP_03_hmg_F", 20],
	["B_MRAP_01_F", 25],
	["O_MRAP_02_F", 25],
	["I_MRAP_03_F", 25],
//	Light Armour
	["B_APC_Wheeled_01_cannon_F", 20],
	["O_APC_Wheeled_02_rcws_F", 20],
	["I_APC_Wheeled_03_cannon_F", 20],
	["I_APC_tracked_03_cannon_F",30],
	["B_APC_Tracked_01_rcws_F", 30],
	["B_APC_Tracked_01_CRV_F", 40],
	["B_APC_Tracked_01_AA_F", 30],
	["O_APC_Tracked_02_cannon_F", 30],
	["O_APC_Tracked_02_AA_F", 30],
//	Heavy Armour
	["B_MBT_01_cannon_F", 30],
	["O_MBT_02_cannon_F", 30],
	["I_MBT_03_cannon_F", 30],
	["B_MBT_01_arty_F", 30],
	["B_MBT_01_mlrs_F", 20],
	["O_MBT_02_arty_F", 30],
//	Helis
	["B_Heli_Attack_01_F", 10],	
	["B_Heli_Light_01_armed_F", 20],
	["B_Heli_Light_01_F", 30],
	["O_Heli_Light_02_F", 40],
	["O_Heli_Light_02_unarmed_F", 50],
	["O_Heli_Attack_02_F", 50],
	["O_Heli_Attack_02_black_F", 50],
	["I_Heli_light_03_F", 50],				// WY-55 - Hellcat
	["I_Heli_light_03_unarmed_F", 50],		// WY-55 - Hellcat (Unarmed)
	["B_Heli_Transport_01_F", 60],
	["B_Heli_Transport_01_camo_F", 60],
	["I_Heli_Transport_02_F", 120],
//	Vans
	["C_Van_01_fuel_F", 10],
	["C_Van_01_transport_F", 20],
	["C_Van_01_box_F", 40],
//	Offroads
	["C_Offroad_01_F", 15],
	["B_G_Offroad_01_F", 15],	
	["B_G_Offroad_01_armed_F", 10],
//	Cars
	["C_SUV_01_F", 15],
	["C_Hatchback_01_F", 10],
	["C_Hatchback_01_sport_F", 10],
//	ATVs
    ["C_Quadbike_01_F", 5],
    ["B_Quadbike_01_F", 5],
    ["O_Quadbike_01_F", 5],    
	["I_Quadbike_01_F", 5],	
	["B_G_Quadbike_01_F", 5],	
//	Boats
	["B_G_Boat_Transport_01_F", 5],
	["B_Boat_Transport_01_F", 5],
	["O_Boat_Transport_01_F", 5],
	["I_Boat_Transport_01_F", 5],
	["B_Lifeboat", 5],
	["O_Lifeboat", 5],
	["C_Rubberboat", 5],
	["C_Boat_Civil_01_F", 10],
	["C_Boat_Civil_01_rescue_F", 10],
	["C_Boat_Civil_01_police_F", 10],
	["O_Boat_Armed_01_hmg_F", 15],
	["B_Boat_Armed_01_minigun_F", 15],
	["I_Boat_Armed_01_minigun_F", 15]
];

/**
 * List of class names of transportable objects.
 * The second element of the arrays is the cost capacity (in relation with the capacity of the vehicles). 
*/
 
R3F_LOG_CFG_objets_transportables =  [
//	ATVs
	["B_Quadbike_01_F", 20],
    ["O_Quadbike_01_F", 20],
    ["C_Quadbike_01_F", 20],
    ["I_Quadbike_01_F", 20],
	["B_G_Quadbike_01_F", 20],
//	Crates
	["Box_NATO_Ammo_F", 5],
	["Box_NATO_Wps_F", 5],
	["Box_NATO_Grenades_F", 5],
	["Box_NATO_WpsLaunch_F", 10],
	["Box_NATO_AmmoOrd_F", 5],
	["Box_NATO_WpsSpecial_F", 5],
	["Box_NATO_Support_F", 5],
	["Box_East_Ammo_F", 5],
	["Box_East_Wps_F", 5],
	["Box_East_Grenades_F", 5],
	["Box_East_WpsLaunch_F", 10],
	["Box_East_AmmoOrd_F", 5],
	["Box_East_WpsSpecial_F", 5],
	["Box_East_Support_F", 5],
	["Box_East_AmmoVeh_F", 5],
	["Box_IND_Ammo_F", 5],
	["Box_IND_Wps_F", 5],
	["Box_IND_Grenades_F", 5],
	["Box_IND_WpsLaunch_F", 10],
	["Box_IND_AmmoOrd_F", 5],
	["Box_IND_WpsSpecial_F", 5],
	["Box_IND_Support_F", 5],
	["Box_IND_AmmoVeh_F", 5],
//	Structures
	["Land_Sacks_goods_F", 5],
	["Land_Pipes_small_F", 5],
	["Land_Pipes_large_F", 5],
	["Land_MetalBarrel_F", 5],
	["Land_IronPipes_F", 5],
	["Land_ConcretePipe_F", 15],
	["Land_BagFence_Corner_F", 2],
	["Land_BagFence_End_F", 2],
	["Land_BagFence_Long_F", 5],
	["Land_BagFence_Round_F", 5],
	["Land_BagFence_Short_F", 2],
	["Land_CncBarrier_F", 5],
	["Land_CncBarrier_stripes_F", 5],	
	["Land_CncBarrierMedium_F", 5],
	["Land_CncBarrierMedium4_F", 15],
	["Land_CncWall1_F", 10],
	["Land_CncWall4_F", 20],
	["Land_CncShelter_F", 10],	
	["Land_HBarrier_1_F", 5],
	["Land_HBarrier_3_F", 10],
	["Land_HBarrier_5_F", 15],
	["Land_HBarrierBig_F", 25],
	["Land_HBarrierWall_corner_F", 15],
	["Land_HBarrierWall4_F", 10],
	["Land_HBarrierWall6_F", 15],
	["Land_HBarrierWall_corridor_F", 15],
	["Land_HBarrierTower_F", 25],
	["Land_Crash_barrier_F", 5],
	["Land_LampHalogen_F", 10],
	["Land_CanisterFuel_F", 2],
	["Land_CanisterPlastic_F", 2],
	["Land_Cargo_House_V1_F", 20],
	["Land_Cargo_HQ_V1_F", 40],
	["Land_Cargo_Patrol_V1_F", 30],
	["I_supplyCrate_F", 10],	
	["Land_BarGate_F", 10],
	["Land_RampConcrete_F", 20],	
	["Land_RampConcreteHigh_F", 30],	
	["Land_Obstacle_Bridge_F", 5],	
	["Land_New_WiredFence_10m_F", 5],	
	["Land_BagBunker_Small_F", 15],
	["Land_BagBunker_Large_F", 30],	
	["Land_BagBunker_Tower_F", 20],	
	["Land_Concrete_SmallWall_4m_F", 5],
	["Land_Concrete_SmallWall_8m_F", 10],
	["Land_i_Garage_V1_F", 20],
	["Land_dp_smallTank_F", 30],	
	["Land_dp_bigTank_F", 40],
	["Land_ReservoirTower_F", 60],
	["Land_Cargo_Tower_V1_F", 120],
	["Land_FuelStation_Feed_F", 25]
];

/****** MOVABLE-BY-PLAYER OBJECTS ******/

/*
 * List of class names of objects moveables by player.
*/

R3F_LOG_CFG_objets_deplacables = [
//	ATVs
	"B_Quadbike_01_F",
    "O_Quadbike_01_F",
    "C_Quadbike_01_F",
    "I_Quadbike_01_F",
	"B_G_Quadbike_01_F",
//	Crates
	"Box_NATO_Ammo_F",
	"Box_NATO_Wps_F",
	"Box_NATO_Grenades_F",
	"Box_NATO_WpsLaunch_F",
	"Box_NATO_AmmoOrd_F",
	"Box_NATO_WpsSpecial_F",
	"Box_NATO_Support_F",
	"Box_NATO_AmmoVeh_F",
	"Box_East_Ammo_F",
	"Box_East_Wps_F",
	"Box_East_Grenades_F",
	"Box_East_WpsLaunch_F",
	"Box_East_AmmoOrd_F",
	"Box_East_WpsSpecial_F",
	"Box_East_Support_F",
	"Box_East_AmmoVeh_F",
	"Box_IND_Ammo_F",
	"Box_IND_Wps_F",
	"Box_IND_Grenades_F",
	"Box_IND_WpsLaunch_F",
	"Box_IND_AmmoOrd_F",
	"Box_IND_WpsSpecial_F",
	"Box_IND_Support_F",
	"Box_IND_AmmoVeh_F",
//	Structures
	"Land_Sacks_goods_F",
	"Land_Pipes_small_F",
	"Land_Pipes_large_F",
	"Land_MetalBarrel_F",
	"Land_IronPipes_F",
	"Land_ConcretePipe_F",
	"Land_BagFence_Corner_F",
	"Land_BagFence_End_F",
	"Land_BagFence_Long_F",
	"Land_BagFence_Round_F",
	"Land_BagFence_Short_F",
	"Land_BagBunker_Small_F",
	"Land_CncBarrier_F",
	"Land_CncBarrierMedium_F",
	"Land_CncBarrierMedium4_F",
	"Land_CncWall1_F",
	"Land_CncWall4_F",
	"Land_HBarrier_3_F",
	"Land_HBarrier_5_F",
	"Land_HBarrierBig_F",
	"Land_HBarrier_1_F",
	"Land_Crash_barrier_F",
	"Land_LampHalogen_F",
	"Land_CanisterFuel_F",
	"Land_CanisterPlastic_F",
	"Land_Cargo_House_V1_F",
	"Land_Cargo_HQ_V1_F",
	"Land_Cargo_Patrol_V1_F",
	"I_supplyCrate_F",
	"Land_BarGate_F",
	"Land_RampConcrete_F",
	"Land_RampConcreteHigh_F",
	"Land_Obstacle_Bridge_F",
	"Land_New_WiredFence_10m_F",
	"Land_BagBunker_Large_F",
	"Land_BagBunker_Tower_F",
	"Land_CncBarrier_stripes_F",
	"Land_CncShelter_F",
	"Land_Concrete_SmallWall_4m_F",
	"Land_Concrete_SmallWall_8m_F",
	"Land_HBarrierWall_corner_F",
	"Land_HBarrierWall4_F",
	"Land_HBarrierWall6_F",
	"Land_HBarrierWall_corridor_F",
	"Land_HBarrierTower_F",
	"Land_i_Garage_V1_F",
	"Land_dp_smallTank_F",
	"Land_dp_bigTank_F",
	"Land_ReservoirTower_F",
	"Land_Cargo_Tower_V1_F",
	"Land_FuelStation_Feed_F"
];

/*
 * List of files adding objects in the arrays of logistics configuration (e.g. R3F_LOG_CFG_remorqueurs)
 * Add an include to the new file here if you want to use the logistics with a new addon.
 */
//#include "addons_config\arma2_CO_objects.sqf"			//Not used any more I suppose ;)
