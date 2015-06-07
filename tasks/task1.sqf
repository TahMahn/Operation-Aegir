uiSleep 10;

_groupTarget = createGroup independent;
_target1 = "LOP_ISTS_Infantry_SL" createUnit [getMarkerPos "target1", _groupTarget, "target1 = this; this setDir 283;"];
hint format ["%1",target1];

_wp = _groupTarget addWaypoint [getMarkerPos "target1", 0];
_wp setWaypointType "HOLD";

Player sidechat "Target Assigned";

waitUntil { !isNil "target1" };

_null = [player, "tsk1", ["We recently received intel that a high ranking officer of the ISTS is visiting one of their bases near Feeruz Abad, Task Force Aegis has been tasked to eliminate this officer.", "HVT", "HVT"], "opfor1", true] spawn BIS_fnc_taskCreate;

_unit = target1;
waituntil {
	!alive _unit;
};

call {
	if (!(alive target1) && !(alive otarget1)) exitWith { Player sidechat "Main and secondary targets eliminated, an award awaits you at the airbase."; };
	if (!alive target1) exitWith { Player sidechat "Target Eliminated"; }
};

uiSleep 5;

_null = ["tsk3", "SUCCEEDED"] spawn BIS_fnc_taskSetState; task3done=true;

uiSleep 60;
	null=[]execVM "tasks\RandomArray.sqf";