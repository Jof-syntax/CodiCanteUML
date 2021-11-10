function TestGliderMass
InputData = load('TestData/Input data/TestClassGliderMass.mat').s;
test = GliderMass(InputData);
test.compute();
test = test.mass;
expectedResult = load('TestData/Output data/TestClassGliderMassResult.mat').ans;
computeError(test, expectedResult, 'TestGliderMass');
end

