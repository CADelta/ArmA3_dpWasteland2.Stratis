
scannerBattery = 100;
scanningInProgress = false;

while {true} do
{
	if (scannerBattery < 100 && !scanningInProgress) then 
	{
		scannerBattery = scannerBattery + 1;		// CAD - Takes double as long now to recharge. (Org. = + 1;)	** NOT USED ANYWAYS **
		if (scannerBattery > 100) then {scannerBattery = 100;};
	};
	sleep 2;		// CAD - Or maybe it's actually better just to increase the sleep to 2!? Trying that instead of "scannerBattery = scannerBattery + 0.5;" 
};