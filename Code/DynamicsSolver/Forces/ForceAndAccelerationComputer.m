classdef ForceAndAccelerationComputer < handle
    
    properties (Access = public)
        aceleration
        gliderForces
    end
    
    properties (Access = private)
        data
    end
    
    methods (Access = public)
        
        function obj = ForceAndAccelerationComputer(cParams)
            obj.init(cParams);
        end
        
        function compute(obj)
            obj.aceleration  = obj.computeGliderAcceleration();
            obj.gliderForces = obj.computeGliderForces();
        end
        
    end
    
    methods (Access = public)
        
        function init(obj, cParams)
            obj.data = cParams;
        end
        
        function aceleration = computeGliderAcceleration(obj)
            mass = obj.data.mass;
            pilotWeight = obj.data.pilotWeight;
            totalMass = mass + pilotWeight;
            g = obj.data.g;
            D = obj.data.D;
            L = obj.data.L;
            T = obj.data.T;
            W = totalMass*g;
            aceleration.X = (T - D) / totalMass;
            aceleration.Z = (L - W) / totalMass;
        end
        
        function gliderForces = computeGliderForces(obj)
            mass = obj.data.mass;
            pilotWeight = obj.data.pilotWeight;
            totalMass = mass + pilotWeight;
            g = obj.data.g;
            D = obj.data.D;
            L = obj.data.L;
            T = obj.data.T;
            W = totalMass*g;
            gliderForces(1) = W;
            gliderForces(2) = D;
            gliderForces(3) = L;
            gliderForces(4) = T;
        end
        
    end
end

