if (!isNil "_headgear") then {
    _unit addHeadgear _headgear;
};

if (!isNil "_goggles") then {
    _unit addGoggles _goggles;
};

if (!isNil "_uniform") then { 
    _unit forceAddUniform _uniform;
};

if (!isNil "_vest") then {
    _unit addVest _vest;
};

if (!isNil "_backpack") then {
    _unit addBackpack _backpack;
    clearMagazineCargo (unitBackpack _unit);
};

_m = [];
if (!isNil "_magsPrimary") then {_m = _m + _magsPrimary};
if (!isNil "_magsSecondary") then {_m = _m + _magsSecondary};
if (!isNil "_magHandgun") then {_m = _m + _magHandgun};

_u = [];
if (!isNil "_uniformItems") then {_u = _u + _uniformItems};
if (!isNil "_uniformMagazines") then {_u = _u + _uniformMagazines};
if (!isNil "_uniformWeapons") then {_u = _u + _uniformWeapons};

_v = [];
if (!isNil "_vestItems") then {_v = _v + _vestItems};
if (!isNil "_vestMagazines") then {_v = _v + _vestMagazines};
if (!isNil "_vestWeapons") then {_v = _v + _vestWeapons};

_b = [];
if (!isNil "_backpackItems") then {_b = _b + _backpackItems};
if (!isNil "_backpackMagazines") then {_b = _b + _backpackMagazines};
if (!isNil "_backpackWeapons") then {_b = _b + _backpackWeapons};

if (!isNil "_m") then {
	{
		_unit addMagazine _x;
	} foreach (_m);
};

if (!isNil "_weapons") then {
	{
		_unit addWeapon _x;
	} foreach (_weapons);
};

if (!isNil "_primaryWeaponItems") then {
	{
		_unit addPrimaryWeaponItem _x;
	} foreach (_primaryWeaponItems);
};

if (!isNil "_secondaryWeaponItems") then {
	{
		_unit addSecondaryWeaponItem _x;
	} foreach (_secondaryWeaponItems);
};

if (!isNil "_handgunItems") then {
	{
		_unit addHandgunItem _x;
	} foreach (_handgunItems);
};

if (!isNil "_u") then {
	{
		(uniformContainer _unit) addItemCargoGlobal [((_u) select _forEachIndex) select 0, ((_u) select _forEachIndex) select 1];
	} foreach (_u);
};

if (!isNil "_v") then {
	{
		(vestContainer _unit) addItemCargoGlobal [((_v) select _forEachIndex) select 0, ((_v) select _forEachIndex) select 1];
	} foreach (_v);
};

if (!isNil "_b") then {
	{
		(backpackContainer _unit) addItemCargoGlobal [((_b) select _forEachIndex) select 0, ((_b) select _forEachIndex) select 1];
	} foreach (_b);
};

if (!isNil "_assignedItems") then {
	{
		_unit linkItem _x;
	} foreach _assignedItems;
};

if (!isNil "_insignia") then {
    [_unit,_insignia] call BIS_fnc_setUnitInsignia;
};

if ((primaryWeapon _unit) != (currentWeapon _unit)) then {
    _unit selectweapon primaryweapon _unit;
};

if (isclass (configfile >> "CfgPatches" >> "AGM_Core")) then {
    [_unit, currentWeapon _unit, currentMuzzle _unit] call AGM_SafeMode_fnc_lockSafety;
};

if (isclass (configfile >> "CfgPatches" >> "ACE_main")) then {
    [_unit, currentWeapon _unit, currentMuzzle _unit] call ACE_SafeMode_fnc_lockSafety;
};