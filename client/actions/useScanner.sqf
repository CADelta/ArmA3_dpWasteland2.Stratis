ScannerProgress = 30;
if (scannerBattery > ScannerProgress) then 
{
	// allow scanning to work
	scanningInProgress = true;
};
		
while {scanningInProgress} do
{
	if (ScannerProgress mod 8 == 2) then
	{
		player say3D "scannerBeep";
		playSound "A3\Sounds_F\sfx\Beep_Target.wss";
		//_position = getPosATL player; 
		//_position set [2, (_position select 2) + 3];
		//playSound3D ["A3\Sounds_F\sfx\Beep_Target.wss", player, false, _position, 1, 1, 2];
	};
	scannerBattery = scannerBattery - 2;
	if (scannerBattery < 0) then {scannerBattery = 0;};

	ScannerProgress = ScannerProgress -1;
	if (ScannerProgress == 0) then {scanningInProgress = false;};
	
	sleep 1;
};
