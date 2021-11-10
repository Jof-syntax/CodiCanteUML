function TestStructreSafety
InputData = load('TestData/Input data/TestClassDataStructreSafety.mat').s;
test = StructreSafety(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataStructreSafetyResult.mat').safetyStress;
computeError(test, expectedResult, 'TestStructreSafety');
end

