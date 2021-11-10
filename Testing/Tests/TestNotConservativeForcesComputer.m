function TestNotConservativeForcesComputer
InputData = load('TestData/Input data/TestClassDataNotConservativeForcesComputer.mat').s;
test = NotConservativeForcesComputer(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataNotConservativeForcesComputerResult.mat').a;
computeError(test, expectedResult, 'TestNotConservativeForcesComputer');
end

