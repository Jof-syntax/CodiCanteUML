function TestExternalInfluence
InputData = load('TestData/Input data/TestClassDataExternalInfluence.mat').s;
test = ExternalInfluence(InputData);
expectedResult = load('TestData/Output data/TestClassDataExternalInfluenceResult.mat').b;
computeError(test, expectedResult, 'TestExternalInfluence');
end

