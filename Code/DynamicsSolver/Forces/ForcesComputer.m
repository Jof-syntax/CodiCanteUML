classdef ForcesComputer < handle
    
    properties (Access = public)
        forces
    end
    
    properties (Access = private)
        data
    end
    
    
    methods (Access = public)
        
        function obj = ForcesComputer(cParams)
            obj.init(cParams);
        end
        
        function compute(obj)
        end
        
    end
    
    methods (Access = private)
        
        function init(obj, cParams)
            obj.cParams = cParams;
        end
        
        
    end
    
end

