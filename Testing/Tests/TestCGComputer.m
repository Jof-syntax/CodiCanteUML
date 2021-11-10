function TestCGComputer
InputData = load('TestData/Input data/TestClassDataCGComputer.mat').s;
test = CGComputer(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataCGComputerResult.mat').a;
computeError(test, expectedResult, 'TestCGComputer');
end

