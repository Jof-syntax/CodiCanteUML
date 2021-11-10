function TestSplitterMatrix
InputData = load('TestData/Input data/TestClassDataSplitterMatrix.mat').cParams;
test = SplitterMatrix(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataSplitterMatrixResult.mat').test;
computeError(test, expectedResult, 'TestSplitterMatrix');
end

