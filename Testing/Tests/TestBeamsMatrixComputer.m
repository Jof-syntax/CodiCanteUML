function TestBeamsMatrixComputer
InputData = load('TestData/Input data/TestClassDataBeamsMatrixComputer.mat').s;
test = BeamsMatrixComputer(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataBeamsMatrixComputerResult.mat').beamsMatrix;
computeError(test, expectedResult, 'TestBeamsMatrixComputer');
end

