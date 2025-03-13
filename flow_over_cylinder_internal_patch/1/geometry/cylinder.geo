SetFactory("OpenCASCADE");
Merge "cylinder.stp";
//+
Physical Volume("fluid_1", 43) = {2};
//+
Physical Volume("fluid_2", 44) = {3};
//+
Physical Volume("fluid_3", 45) = {1};
//+
Physical Surface("cylinder", 46) = {18, 13};
//+
Physical Surface("inlet", 47) = {10};
//+
Physical Surface("outlet", 48) = {3};
//+
Physical Surface("front", 49) = {16, 8, 4};
//+
Physical Surface("back", 50) = {20, 12, 6};
//+
Physical Surface("upper_wall", 51) = {9, 19, 5};
//+
Physical Surface("lower_wall", 52) = {11, 15, 2};
//+
Physical Surface("internal_3.1", 53) = {1};
//+
Physical Surface("internal_1.1", 54) = {7};
//+
Physical Surface("internal_2.1", 55) = {17};
//+
Physical Surface("internal_2.2", 56) = {14};
