function TestConservativeForcesComputer
InputData = load('TestData/Input data/TestClassDataConservativeForcesComputer.mat').s;
test = ConservativeForcesComputer(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataConservativeForcesComputerResult.mat').a;
computeError(test, expectedResult, 'TestConservativeForcesComputer');
end

