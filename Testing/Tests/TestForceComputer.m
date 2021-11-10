function TestForcesComputer
InputData = load('TestData/Input data/TestClassDataExternalForcesComputer.mat').s;
test = ForcesComputer(InputData);
test.compute();
test = test.forces;
expectedResult = load('TestData/Output data/TestClassDataExternalForcesComputerResult.mat').ans;
computeError(test, expectedResult, 'ForcesComputer');
end

