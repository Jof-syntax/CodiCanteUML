function TestBeamDisplacement_Iterative
InputData = load('TestClassDataBeamDisplacement_Iterative').InputData; 
a = BeamDisplacementComputer(InputData);
a.compute();
test = a;
expectedResult = load('TestData/Output data/TestClassDataBeamDisplacementResultIterative.mat').test;
computeError(test, expectedResult, 'TestBeamDisplacement_Iterative');
end

