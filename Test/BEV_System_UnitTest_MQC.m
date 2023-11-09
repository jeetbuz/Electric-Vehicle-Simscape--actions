classdef BEV_System_UnitTest_MQC < matlab.unittest.TestCase
    %% Class implementation of unit test

    % Copyright 2023 The MathWorks, Inc.

    %% Simple tests ... just run runnables


    % Copyright 2023 The MathWorks, Inc.

    properties
        openfigureListBefore;
    end

    methods(TestMethodSetup)
        function listOpenFigures(test)
            % List all open figures
            test.openfigureListBefore = findall(0,'Type','Figure');
        end

        function setupWorkingFolder(test)
            % Set up working folder
            import matlab.unittest.fixtures.WorkingFolderFixture;
            test.applyFixture(WorkingFolderFixture);
        end
    end


    methods (Test)


        %% Harness folder

        function MQC_System_1(testCase)
            mdl = "BEVsystemModel";
            load_system(mdl)
            testCase.addTeardown(@()close_system(mdl, 0));
            sim(mdl);

        end

        function MQC_System_2(testCase)
            mdl = "BEVsystemModel";
            load_system(mdl)
            set_param('BEVsystemModel/Vehicle', 'ReferencedSubsystem', 'VehicleElec')
            testCase.addTeardown(@()close_system(mdl, 0));
            sim(mdl);

        end

        function MQC_System_3(testCase)
            mdl = "BEVsystemModel";
            load_system(mdl)
            set_param('BEVsystemModel/Vehicle', 'ReferencedSubsystem', 'VehicleElectroThermal')
            set_param('BEVsystemModel/Vehicle/Battery', 'ReferencedSubsystem', 'BatteryPlantModel_Table')
            testCase.addTeardown(@()close_system(mdl, 0));
            sim(mdl);

        end

        function test_BEVRangeEstimationMainMLX(test)
            %The test runs the |.mlx| file and makes sure that there are
            %no errors or warning thrown.
            test.verifyWarningFree(@()run_BEVRangeEstimationMain, "'BEVRangeEstimationMain mlx'  should execute wihtout any warning or error.");
        end
        function test_BEVBatterySizingMainMLX(test)
            %The test runs the |.mlx| file and makes sure that there are
            %no errors or warning thrown.
            test.verifyWarningFree(@()run_BEVBatterySizingMain, "'BEVRangeEstimationMain mlx'  should execute wihtout any warning or error.");
        end
    end

end  % classdef



function run_BEVRangeEstimationMain()
% Function runs the |.mlx| script.
BEVRangeEstimationMain;
end

function run_BEVBatterySizingMain()
% Function runs the |.mlx| script.
BEVBatterySizingMain;
end
