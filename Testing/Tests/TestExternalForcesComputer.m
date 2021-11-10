function TestExternalForcesComputer
InputData = load('TestData/Input data/TestClassDataExternalForcesComputer.mat').s;
test = ExternalForcesComputer(InputData);
test.compute();
test = test.fExt;
expectedResult = load('TestData/Output data/TestClassDataExternalForcesComputerResult.mat').ans;
computeError(test, expectedResult, 'TestExternalForcesComputer');
end

