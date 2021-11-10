function TestGlobalFExtComputer
InputData = load('TestData/Input data/TestClassDataGlobalFExtComputer.mat').s;
test = GlobalFExtComputer(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataGGlobalFExtComputerResult.mat').a;
computeError(test, expectedResult, 'TestGlobalFExtComputer');
end

