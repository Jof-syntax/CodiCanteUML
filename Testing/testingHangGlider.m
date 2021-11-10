function testingHangGlider()
%% test
clc;

% ClassGliderAnalyser
InputData = load('TestData/Input data/TestClassDataGliderAnalyser.mat').cParams;
test = GliderAnalyser(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataGliderAnalyserResult.mat').test;
computeError(test, expectedResult, 'TestGliderAnalyser');
 
% ClassBeamDisplacement_Direct
InputData = load('TestData/Input data/TestClassDataBeamDisplacement.mat').s; 
a = BeamDisplacementComputer(InputData);
a.compute();
test = a;
expectedResult = load('TestData/Output data/TestClassDataBeamDisplacementResult.mat').test;
computeError(test, expectedResult, 'TestBeamDisplacement_Direct');

% ClassBeamDisplacement_Iterative
InputData = load('TestClassDataBeamDisplacement_Iterative').InputData; 
a = BeamDisplacementComputer(InputData);
a.compute();
test = a;
expectedResult = load('TestData/Output data/TestClassDataBeamDisplacementResultIterative.mat').test;
computeError(test, expectedResult, 'TestBeamDisplacement_Iterative');

% ClassGliderGeometry
test = GliderGeometry();
expectedResult = load('TestData/Output data/TestClassDataGliderGeometryResult.mat').ans;
computeError(test, expectedResult, 'TestGliderGeometry');

% ClassGliderMaterial
InputData = load('TestData/Input data/TestClassDataGliderMaterials.mat').s;
test = GliderMaterial(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataGliderMaterialResult.mat').test;
computeError(test, expectedResult, 'TestGliderMaterial');

% ClassExternalInfluence
InputData = load('TestData/Input data/TestClassDataExternalInfluence.mat').s;
test = ExternalInfluence(InputData);
expectedResult = load('TestData/Output data/TestClassDataExternalInfluenceResult.mat').b;
computeError(test, expectedResult, 'TestExternalInfluence');

% ClassStructreSafety
InputData = load('TestData/Input data/TestClassDataStructreSafety.mat').s;
test = StructreSafety(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataStructreSafetyResult.mat').safetyStress;
computeError(test, expectedResult, 'TestStructreSafety');

% ClassGliderMass
InputData = load('TestData/Input data/TestClassGliderMass.mat').s;
test = GliderMass(InputData);
test.compute();
test = test.mass;
expectedResult = load('TestData/Output data/TestClassGliderMassResult.mat').ans;
computeError(test, expectedResult, 'TestGliderMass');

% ClassDimension
InputData = load('TestData/Input data/TestClassDimension.mat').s;
test = Dimension(InputData);
test.compute();
test = test.dim;
expectedResult = load('TestData/Output data/TestClassDimensionResult.mat').ans;
computeError(test, expectedResult, 'TestDimension');

% ClassExternalForcesComputer
InputData = load('TestData/Input data/TestClassDataExternalForcesComputer.mat').s;
test = ExternalForcesComputer(InputData);
test.compute();
test = test.fExt;
expectedResult = load('TestData/Output data/TestClassDataExternalForcesComputerResult.mat').ans;
computeError(test, expectedResult, 'TestExternalForcesComputer');

% ClassBeamsMatrixComputer
InputData = load('TestData/Input data/TestClassDataBeamsMatrixComputer.mat').s;
test = BeamsMatrixComputer(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataBeamsMatrixComputerResult.mat').beamsMatrix;
computeError(test, expectedResult, 'TestBeamsMatrixComputer');

% ClassGliderForcesComputer
InputData = load('TestData/Input data/TestClassDataGliderForcesComputer.mat').s;
test = GliderForcesComputer(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataGliderForcesComputerResult.mat').a;
computeError(test, expectedResult, 'TestGliderForcesComputer');

% ClassGliderAccelerationComputer
InputData = load('TestData/Input data/TestClassDataGliderAccelerationComputer.mat').s;
test = GliderAccelerationComputer(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataGliderAccelerationComputerResult.mat').a;
computeError(test, expectedResult, 'TestGliderAccelerationComputer');

% ClassGlobalFExtComputer
InputData = load('TestData/Input data/TestClassDataGlobalFExtComputer.mat').s;
test = GlobalFExtComputer(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataGGlobalFExtComputerResult.mat').a;
computeError(test, expectedResult, 'TestGlobalFExtComputer');

% ClassConservativeForcesComputer
InputData = load('TestData/Input data/TestClassDataConservativeForcesComputer.mat').s;
test = ConservativeForcesComputer(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataConservativeForcesComputerResult.mat').a;
computeError(test, expectedResult, 'TestConservativeForcesComputer');

% ClassNotConservativeForcesComputer
InputData = load('TestData/Input data/TestClassDataNotConservativeForcesComputer.mat').s;
test = NotConservativeForcesComputer(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataNotConservativeForcesComputerResult.mat').a;
computeError(test, expectedResult, 'TestNotConservativeForcesComputer');

% ClassCGComputer
InputData = load('TestData/Input data/TestClassDataCGComputer.mat').s;
test = CGComputer(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataCGComputerResult.mat').a;
computeError(test, expectedResult, 'TestCGComputer');

% ClassMatrixOperator
InputData = load('TestData/Input data/TestClassDataMatrixOperator.mat').cParams;
test = MatrixOperator(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataMatrixOperatorResult.mat').test;
computeError(test, expectedResult, 'TestMatrixOperator');

% ClassDofSplitterComputer
InputData = load('TestData/Input data/TestClassDataVrUrVlComputer.mat').cParams;
test = DofSplitterComputer(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataVrUrVlComputerResult.mat').test;
computeError(test, expectedResult, 'DofSplitterComputer');

% ClassABComputer
InputData = load('TestData/Input data/TestClassDataABComputer.mat').cParams;
test = ABComputer(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataABComputerResult.mat').test;
computeError(test, expectedResult, 'TestABComputer');

% ClassSplitterMatrix
InputData = load('TestData/Input data/TestClassDataSplitterMatrix.mat').cParams;
test = SplitterMatrix(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataSplitterMatrixResult.mat').test;
computeError(test, expectedResult, 'TestSplitterMatrix');

% ClassNodeAndDisplacementAssociator
InputData = load('TestData/Input data/TestClassDataNodeAndDisplacementAssociator.mat').cParams;
test = NodeAndDisplacementAssociator(InputData);
test.compute();
expectedResult = load('TestData/Output data/TestClassDataNodeAndDisplacementAssociatorResult.mat').test;
computeError(test, expectedResult, 'TestNodeAndDisplacementAssociator');


end