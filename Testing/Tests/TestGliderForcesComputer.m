function TestGliderForcesComputer
InputData = load('TestData/Input data/TestClassDataGliderForcesComputer.mat').s;
test = GliderForcesComputer(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataGliderForcesComputerResult.mat').a;
computeError(test, expectedResult, 'TestGliderForcesComputer');
end

