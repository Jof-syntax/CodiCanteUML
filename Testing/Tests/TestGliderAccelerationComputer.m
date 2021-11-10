function TestGliderAccelerationComputer
InputData = load('TestData/Input data/TestClassDataGliderAccelerationComputer.mat').s;
test = GliderAccelerationComputer(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataGliderAccelerationComputerResult.mat').a;
computeError(test, expectedResult, 'TestGliderAccelerationComputer');
end

