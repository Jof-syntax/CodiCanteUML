function TestGliderMaterial
InputData = load('TestData/Input data/TestClassDataGliderMaterials.mat').s;
test = GliderMaterial(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataGliderMaterialResult.mat').test;
computeError(test, expectedResult, 'TestGliderMaterial');
end

