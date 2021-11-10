function TestStiffnessMatrixComputer
InputData = load('TestData/Input data/TestClassDataBeamsMatrixComputer.mat').s;
test = StiffnessMatrixComputer(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataBeamsMatrixComputerResult.mat').beamsMatrix;
computeError(test, expectedResult, 'TestStiffnessMatrixComputer');
end

