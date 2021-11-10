classdef BeamDisplacementComputer < handle

    properties (Access = public)
        displacement
        dim
        tD
    end

    properties (Access = private)
        data
        type
        mass
        KG
        fExt
    end

    methods (Access = public)

        function obj = BeamDisplacementComputer(cParams)
            obj.init(cParams);
            obj.create();
        end

        function a = compute(obj)
            obj.computeStifnessMatrix();
            obj.computeForcesNodesDistribution();
            obj.computeBeamsDisplacement();
            a = obj.displacement;
        end

    end

    methods (Access = private)

        function init(obj, cParams)
            obj.data = cParams;
        end

        function create(obj)
            obj.calculateDim();
            obj.calculateMass();
        end

        function calculateDim(obj)
            s = obj.createDim();
            a = Dimension(s);
            a.compute();
            obj.dim = a.dim;
        end

        function calculateMass(obj)
            s = obj.createMass();
            a = GliderMass(s);
            a.compute();
            obj.mass = a.mass;
        end

        function computeStifnessMatrix(obj)
            s = obj.createBeamMatrix();
            a = BeamsMatrixComputer(s);
            a.compute();
            obj.KG = a.KG;
            obj.tD = a.tD;
        end

        function computeForcesNodesDistribution(obj)
            s = obj.createExternalForces();
            a = ExternalForcesComputer(s);
            a.compute();
            obj.fExt = a.fExt;
        end

        function computeBeamsDisplacement(obj)
            s = obj.createMatrixOperator();
            a = MatrixOperator(s);
            a.compute();
            obj.displacement = a.displacement;
        end

        function s  = createMass(obj)
            s.dim   = obj.dim;
            s.mat   = obj.data.mat;
            s.tMat  = obj.data.tMat;
            s.tN    = obj.data.tN;
            s.x     = obj.data.x;
        end

        function s  = createDim(obj)
            s.x     = obj.data.x;
            s.tN    = obj.data.tN;
        end

        function s  = createBeamMatrix(obj)
            s.dim   = obj.dim;
            s.tN    = obj.data.tN;
            s.x     = obj.data.x;
            s.mat   = obj.data.mat;
            s.tMat  = obj.data.tMat;
        end

        function s = createExternalForces(obj)
            s.fExterior     = obj.data.fExterior;
            s.mat           = obj.data.mat;
            s.tMat          = obj.data.tMat;
            s.dim           = obj.dim;
            s.g             = obj.data.g;
            s.x             = obj.data.x;
            s.tN            = obj.data.tN;
            s.pilotWeight   = obj.data.pilotWeight;
            s.g             = obj.data.g;
            s.mass          = obj.mass;
            s.W             = obj.data.W;
            s.H             = obj.data.H;
            s.gust          = obj.data.gust;
        end

        function s = createMatrixOperator(obj)
            s.type      = obj.data.type;
            s.dim       = obj.dim;
            s.fixNode   = obj.data.fixNode;
            s.KG        = obj.KG;
            s.fExt      = obj.fExt;
        end

    end
end

