function TestGliderAnalyser
InputData = load('TestData/Input data/TestClassDataGliderAnalyser.mat').cParams;
test = GliderAnalyser(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataGliderAnalyserResult.mat').test;
computeError(test, expectedResult, 'TestGliderAnalyser');
end

