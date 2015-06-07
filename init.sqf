execVM "briefing.sqf";

setTerrainGrid 50;

TaskArray=["tasks\task1.sqf","tasks\task2.sqf","tasks\task3.sqf"];
null=[]execVM "tasks\RandomArray.sqf";

_igiload = execVM "IgiLoad\IgiLoadInit.sqf";

task1done = false;
task2done = false;
task3done = false;

publicVariable "task1done";
publicVariable "task2done";
publicVariable "task3done";