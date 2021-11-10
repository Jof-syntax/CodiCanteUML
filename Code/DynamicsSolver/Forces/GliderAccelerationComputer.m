classdef GliderAccelerationComputer < handle
    
    properties (Access = public)
        aceleration
    end
    
    properties (Access = private)
        data
    end
    
    methods (Access = public)
        
        function obj = GliderAccelerationComputer(cParams)
            obj.init(cParams);
        end
        
        function a = compute(obj)
            obj.computeGliderAceleration();
            a = obj.aceleration;
        end
        
    end
        
    methods (Access = public)
        
        function init(obj, cParams)
            obj.data = cParams;
        end
        
        function computeGliderAceleration(obj)
            mass = obj.data.mass;
            pilotWeight = obj.data.pilotWeight;
            totalMass = mass+pilotWeight;
            g = obj.data.g;
            D = obj.data.D;
            L = obj.data.L;
            T = obj.data.T;
            W = totalMass*g;
            aceleration.X = (T - D) / totalMass;
            aceleration.Z = (L - W) / totalMass;
            obj.aceleration = aceleration;
        end
        
    end
end

