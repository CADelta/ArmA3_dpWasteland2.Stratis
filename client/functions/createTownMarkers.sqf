//	@file Version: 1.0
//	@file Name: createTownMarkers.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 28/11/2012 05:19
//	@file Args:

{
    _pos = getMarkerPos (_x select 0);
    _markerName = format["marker%1",_forEachIndex];
	deleteMarkerLocal _markerName;
	_marker = createMarkerLocal [_markerName, _pos];
	_marker setMarkerShapeLocal "ELLIPSE";
	_marker setMarkerSizeLocal [_x select 1, _x select 1];
	_marker setMarkerColorLocal "ColorBlack";
    _marker setMarkerBrushLocal "SolidBorder";
	_marker setMarkerAlphaLocal 0.3;   
}forEach cityList;

/*
for "_x" from 1 to 118 do
{
	_pos = getMarkerPos format ["Spawn_%1", _x];

	// Circle zone   
    _markerName = format["marker_spawn_%1",_x];
    deleteMarkerLocal _markerName;
	_marker = createMarkerLocal [_markerName, _pos];
	_markerName setMarkerShapeLocal "ELLIPSE";
    _markerName setMarkerColorLocal "ColorBlue";
	_markerName setMarkerSizeLocal [10, 10];
	_markerName setMarkerBrushLocal "SolidBorder";
	_markerName setMarkerAlphaLocal 0.5;
	
	// title    
    _markerName = format["marker_spawn_title_%1",_x];
    deleteMarkerLocal _markerName;
	_marker = createMarkerLocal [_markerName, _pos];
	_markerName setMarkerShapeLocal "ICON";
    _markerName setMarkerTypeLocal "mil_dot";
    _markerName setMarkerColorLocal "ColorBlue";
	_markerName setMarkerSizeLocal [1,1];
	_markerName setMarkerTextLocal format["marker_spawn_%1",_x];
};

for "_i" from 0 to 24 do
{
	_pos = getMarkerPos format ["heliSpawn_%1", _i];
		
    _markerName = format["marker_spawnheli_%1",_i];
	deleteMarkerLocal _markerName;
	_marker = createMarkerLocal [_markerName, _pos];
	_markerName setMarkerShapeLocal "ICON";
	_markerName setMarkerTypeLocal "mil_dot";
	_markerName setMarkerColorLocal "ColorRed";
	_markerName setMarkerSizeLocal [1.25, 1.25];
	_markerName setMarkerTextLocal format["Heli %1", _i];
};
*/