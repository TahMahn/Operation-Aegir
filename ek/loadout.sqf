private ["_unit","_typeofUnit","_headgear","_goggles","_uniform","_vest","_backPack","_magsPrimary","_magsSecondary","_magHandgun","_weapons","_primaryWeaponItems","_secondaryWeaponItems","_handgunItems","_uniformItems","_uniformMagazines","_uniformWeapons","_vestItems","_vestMagazines","_vestWeapons","_backpackItems","_backpackMagazines","_backpackWeapons","_assignedItems","_m","_u","_v","_b","_insignia","_dA"];

_typeofUnit = toLower (_this select 0);
_unit = _this select 1;
_dA = getNumber (missionConfigFile >> "disabledAI");
waituntil {isServer || !(isNull player)};
waituntil {!isnil "bis_fnc_init"};
if (_dA == 1) then {
        #include "fnc_removeGear.sqf"
        switch (_typeofUnit) do {
                #include "case.sqf"
            };
        #include "fnc_addGear.sqf"
    };
_isJIP = [] call BIS_fnc_didJIP;
if (_isJIP || !(local _unit)) then {
        0
    }
    else
    {
        #include "fnc_removeGear.sqf"
        switch (_typeofUnit) do {
                #include "case.sqf"
            };
        #include "fnc_addGear.sqf"
    };