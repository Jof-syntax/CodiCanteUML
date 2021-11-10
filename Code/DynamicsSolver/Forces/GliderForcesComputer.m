classdef GliderForcesComputer < handle
    
    properties (Access = public)
        gliderForces
    end
    
    properties (Access = private)
        data
    end
    
    methods (Access = public)
        
        function obj = GliderForcesComputer(cParams)
            obj.init(cParams);
        end
        
        function compute(obj)
            obj.computeGliderForces();
        end
        
    end
    
    methods (Access = private)
        
        function init(obj, cParams)
            obj.data = cParams;
        end
        
       function computeGliderForces(obj)
            mass = obj.data.mass;
            pilotWeight = obj.data.pilotWeight;
            totalMass = mass+pilotWeight;
            g = obj.data.g;
            D = obj.data.D;
            L = obj.data.L;
            T = obj.data.T;
            W = totalMass*g;
            gliderForces(1) = W;
            gliderForces(2) = D;
            gliderForces(3) = L;
            gliderForces(4) = T;
            obj.gliderForces = gliderForces;
       end
        
    end
end

