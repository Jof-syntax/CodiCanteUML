function TestVrUrVlComputer
InputData = load('TestData/Input data/TestClassDataVrUrVlComputer.mat').cParams;
test = VrUrVlComputer(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataVrUrVlComputerResult.mat').test;
computeError(test, expectedResult, 'TestVrUrVlComputer');
end

