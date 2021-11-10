function TestGliderGeometry
test = GliderGeometry();
expectedResult = load('TestData/Output data/TestClassDataGliderGeometryResult.mat').ans;
computeError(test, expectedResult, 'TestGliderGeometry');
end

