function TestMatrixOperator
InputData = load('TestData/Input data/TestClassDataMatrixOperator.mat').cParams;
test = DisplacementComputer(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataMatrixOperatorResult.mat').test;
computeError(test, expectedResult, 'TestMatrixOperator');
end

