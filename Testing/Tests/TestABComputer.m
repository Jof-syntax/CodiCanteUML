function TestABComputer
InputData = load('TestData/Input data/TestClassDataABComputer.mat').cParams;
test = ABComputer(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataABComputerResult.mat').test;
computeError(test, expectedResult, 'TestABComputer');
end

