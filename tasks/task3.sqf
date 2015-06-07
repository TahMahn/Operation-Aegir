uiSleep 10;

if (isServer) then {
	_fueltank1 = createVehicle ["Land_dp_smallTank_F", getMarkerPos "fueltank1", [], 0, ""];
	_fuelname1 = "fueltank1";
	missionNamespace setVariable [_fuelname1,_fueltank1];
	publicVariable _fuelname1;

	_fueltank2 = createVehicle ["Land_dp_smallTank_F", getMarkerPos "fueltank2", [], 0, ""];
	_fuelname2 = "fueltank2";
	missionNamespace setVariable [_fuelname2,_fueltank2];
	publicVariable _fuelname2;
};

waituntil { !isNil "fueltank1" };

_null = [player, "tsk3", ["We've received intel on a enemy driven fuel depot somewhere between north-west of Imarat, or north-east of Bastam. Your job is to destroy the fuel silos.", "Fuel Depot", "Fuel Depot"], "opfor3", true] spawn BIS_fnc_taskCreate;

waituntil {
	!(alive fueltank1) && !(alive fueltank2);
};

_null = ["tsk3", "SUCCEEDED"] spawn BIS_fnc_taskSetState; task3done=true;

Player sidechat "Fuel tanks destroyed";
uiSleep 60;
	null=[]execVM "tasks\RandomArray.sqf";