function TestBeamDisplacement_Direct
InputData = load('TestData/Input data/TestClassDataBeamDisplacement.mat').s; 
a = BeamDisplacementComputer(InputData);
a.compute();
test = a;
expectedResult = load('TestData/Output data/TestClassDataBeamDisplacementResult.mat').test;
computeError(test, expectedResult, 'TestBeamDisplacement_Direct');
end