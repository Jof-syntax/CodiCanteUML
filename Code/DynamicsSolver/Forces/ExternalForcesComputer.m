classdef ExternalForcesComputer < handle
    
    properties (Access = public)
        fExt
    end
    
    properties (Access = private)
        cg
        gliderForces
        conservativeForces
        notConservativeForces
        fData
        aceleration
    end
    
    properties (Access = private)
        data
    end
    
    methods (Access = public)
        
        function obj = ExternalForcesComputer(cParams)
            obj.init(cParams);
        end
        
        function a = compute(obj)
            obj.computeForces();
            obj.computeAceleration();
            obj.computeFExt();
            a = obj.fExt;
        end
        
    end
    
    methods (Access = private)
        
        function init(obj, cParams)
            obj.data = cParams;
        end
        
        function computeForces(obj)
            obj.computeConservativeForces();
            obj.computeCG();
            obj.computeNotConservativeForces();
            obj.computeGliderForces();
        end
        
        function computeCG(obj)
            s = createCGComputer(obj);
            a = CGComputer(s);
            a.compute();
            obj.cg = a.cg;
        end
        
        function computeNotConservativeForces(obj)
            s = createNotConservativeF(obj);
            a = NotConservativeForcesComputer(s);
            a.compute();
            obj.notConservativeForces = a;
        end
        
        function computeConservativeForces(obj)
            s = obj.createConservativeForcesComputer();
            a = ConservativeForcesComputer(s);
            a.compute();
            obj.conservativeForces = a.conservativeForces;
        end
        
        function computeFExt(obj)
            s = obj.createGlobalFExtComputer();
            a = GlobalFExtComputer(s);
            a.compute();
            obj.fExt = a.fExt;
        end
        
        function computeAceleration(obj)
            s = obj.createGliderComputer();
            a = GliderAccelerationComputer(s);
            a.compute();
            obj.aceleration = a.aceleration;
        end
        
        function computeGliderForces(obj)
            s = obj.createGliderComputer();
            a = GliderForcesComputer(s);
            a.compute();
            obj.gliderForces = a.gliderForces;
        end

        function s = createGliderComputer(obj)
            s.mass        = obj.data.mass;
            s.pilotWeight = obj.data.pilotWeight;
            s.g           = obj.data.g;
            s.D           = obj.notConservativeForces.Drag;
            s.L           = obj.notConservativeForces.Lift;
            s.T           = obj.notConservativeForces.Thrust;
        end
        
        function s = createNotConservativeF(obj)
            s.data                    = obj.data;
            s.data.cg                 = obj.cg;
            s.data.conservativeForces = obj.conservativeForces;
        end
        
        function s = createGlobalFExtComputer(obj)
            s.gliderForces  = obj.gliderForces;
            s.aceleration   = obj.aceleration;
            s.pilotWeight   = obj.data.pilotWeight;
            s.mat           = obj.data.mat;
            s.tMat          = obj.data.tMat;
            s.dim           = obj.data.dim;
            s.tN            = obj.data.tN;
            s.fData         = obj.conservativeForces;
            s.x             = obj.data.x;
        end
        
        function s = createCGComputer(obj)
            s.conservativeForces = obj.conservativeForces;
            s.pilotWeight        = obj.data.pilotWeight;
            s.dim                = obj.data.dim;
            s.g                  = obj.data.g;
            s.x                  = obj.data.x;
            s.mass               = obj.data.mass;
        end
        
        function s = createConservativeForcesComputer(obj)
            s = obj.data;
        end
        
    end
end
