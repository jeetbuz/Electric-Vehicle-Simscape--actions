classdef MotorDriveUnit_UnitTest_MQC < matlab.unittest.TestCase
%% Class implementation of unit test

% Copyright 2023 The MathWorks, Inc.

%% Simple tests ... just run runnables

methods (Test)


    %% Harness folder

    function MQC_Harness_1(testCase)
        mdl = "MotorTestHarness";
        load_system(mdl)
        testCase.addTeardown(@()close_system(mdl, 0));
        sim(mdl);

    end

end

end  % classdef
