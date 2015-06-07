uiSleep 10;

if (isServer) then {
	_comm1 = createVehicle ["Land_Communication_F", getMarkerPos "comm1", [], 0, ""];
	_commname1 = "comm1";
	missionNamespace setVariable [_commname1,_comm1];
	publicVariable _commname1;
};

waituntil { !isNil "comm1" };

_null = [player, "tsk2", ["Scout reports suggests that the enemy insurgents has a communications camp in the mountains far west of our very own airbase. It needs to be shut down.", "Comms Tower", "Comms Tower"], "opfor2", true] spawn BIS_fnc_taskCreate;

_unit2 = comm1;
waituntil {
	!alive _unit2;
};
_null = ["tsk2", "SUCCEEDED"] spawn BIS_fnc_taskSetState; task2done=true;

Player sidechat "Tower Destroyed";
uiSleep 60;
	null=[]execVM "tasks\RandomArray.sqf";