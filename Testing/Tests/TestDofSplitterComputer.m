function TestDofSplitterComputer
InputData = load('TestData/Input data/TestClassDataVrUrVlComputer.mat').cParams;
test = DofSplitterComputer(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataVrUrVlComputerResult.mat').test;
computeError(test, expectedResult, 'TestDofSplitterComputer');
end

