classdef GliderAnalyser < handle
    
    properties (Access = public)
        stress
    end
    
    properties (Access = private)
        gliderGeometry
        gliderMaterial
        externalInfluence
        displacement
        dim
        tD
    end
    
    properties (Access = private)
        cParams
    end
    
    methods (Access = public)
        
        function obj = GliderAnalyser(cParams)
            obj.init(cParams);
            obj.create();
        end
        
        function compute(obj)
            obj.computeBeamDisplacement();
            obj.computeSafeStressChecker();
        end
        
        function plot(obj)
            s = createPlot(obj);
            PlotBarStress(s);
        end
        
    end
    
    methods (Access = private)
        
        function create(obj)
            obj.createGeometry();
            obj.createMaterials();
            obj.createExternalInfluence();
        end
        
        function computeBeamDisplacement(obj)
            s = obj.createBeamDisplacement();
            b = BeamDisplacementComputer(s);
            b.compute();
            obj.displacement = b.displacement;
            obj.tD = b.tD;
            obj.dim = b.dim;
        end
        
        function init(obj, cParams)
            obj.cParams = cParams;
        end
        
        function createGeometry(obj)
            obj.gliderGeometry = GliderGeometry();
        end
        
        function createMaterials(obj)
            s = createGliderMaterial(obj);
            g = GliderMaterial(s);
            g.compute();
            obj.gliderMaterial = g;
        end
        
        
        function computeSafeStressChecker(obj)
            s = createStructreSafety(obj);
            ss = StructreSafety(s);
            ss.compute();
            obj.stress.safeBeam = ss.stress.safeBeam;
            obj.stress.sigCri   = ss.stress.sigCri;
            obj.stress.sig      = ss.stress.sig;
        end
        
        function createExternalInfluence(obj)
            s = obj.cParams;
            obj.externalInfluence = ExternalInfluence(s);
        end
        
        function s  = createStructreSafety(obj)
            s.x     = obj.gliderGeometry.x;
            s.tN    = obj.gliderGeometry.tN;
            s.mat   = obj.gliderMaterial.mat;
            s.tMat  = obj.gliderMaterial.tMat;
            s.dim   = obj.dim;
            s.tD    = obj.tD;
            s.u     = obj.displacement;
        end
        
        function s = createGliderMaterial(obj)
            s.geometry  = obj.gliderGeometry.geometry;
        end
        
        function s  = createPlot(obj)
            s.x     = obj.gliderGeometry.x;
            s.tN    = obj.gliderGeometry.tN;
            s.sig   = obj.stress.sig;
            s.u     = obj.displacement;
        end
        
        function s = createBeamDisplacement(obj)
            s.type          = obj.cParams.type;
            s.fixNode       = obj.gliderGeometry.fixNode;
            s.fExterior     = obj.externalInfluence.fExterior;
            s.mat           = obj.gliderMaterial.mat;
            s.tMat          = obj.gliderMaterial.tMat;
            s.g             = obj.externalInfluence.g;
            s.x             = obj.gliderGeometry.x;
            s.tN            = obj.gliderGeometry.tN;
            s.pilotWeight   = obj.externalInfluence.pilotWeight;
            s.W             = obj.gliderGeometry.geometry.W;
            s.H             = obj.gliderGeometry.geometry.H;
            s.gust          = obj.externalInfluence.gust;
        end
        
    end
end