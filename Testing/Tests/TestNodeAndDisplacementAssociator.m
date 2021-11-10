function TestNodeAndDisplacementAssociator
InputData = load('TestData/Input data/TestClassDataNodeAndDisplacementAssociator.mat').cParams;
test = NodeAndDisplacementAssociator(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataNodeAndDisplacementAssociatorResult.mat').test;
computeError(test, expectedResult, 'TestNodeAndDisplacementAssociator');
end

