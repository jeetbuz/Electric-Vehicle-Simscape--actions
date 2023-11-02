classdef BatteryHV_UnitTest_MQC < matlab.unittest.TestCase
%% Class implementation of unit test
%
% These are tests to achieve the Minimum Quality Criteria (MQC).
% MQC is achieved when all runnables (models, scripts, functions) run
% without any errors.
%
% You can run this test by opening in MATLAB Editor and clicking
% Run Tests button or Run Current Test button.
% You can also run this test using test runner (the *_runtests.m script)


% Copyright 2023 The MathWorks, Inc.


%% Simple tests ... just run runnables

methods (Test)

    function MQC(testCase)
        mdl = "BatteryTestHarness";
        load_system(mdl)
        BatteryTestHarnessParam;
        testCase.addTeardown(@()close_system(mdl, 0));
        sim(mdl);

    end

end

end  % classdef


