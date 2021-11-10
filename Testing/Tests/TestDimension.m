function TestDimension
InputData = load('TestData/Input data/TestClassDimension.mat').s;
test = Dimension(InputData);
test.compute();
test = test.dim;
expectedResult = load('TestData/Output data/TestClassDimensionResult.mat').ans;
computeError(test, expectedResult, 'TestDimension');
end

