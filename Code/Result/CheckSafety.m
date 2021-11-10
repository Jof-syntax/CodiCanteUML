classdef CheckSafety < handle
    
    properties (Access = public)
        Safety
    end
    
    properties (Access = private)
        data
    end
    
    methods (Access = public)
        
        function obj = CheckSafety(cParams)
            obj.init(cParams);
        end

        function compute(obj)
            obj.Safety = obj.computeSafety();
        end
        
    end
    
    methods (Access = private)
        
        function init(obj, cParams)
            obj.data.stress = cParams.stress;
            obj.data.criticStress = cParams.criticStress;
            obj.data.dim = cParams.dim;
        end
        
        function safeBeam = computeSafety(obj)
            sigcri = obj.data.criticStress;
            sig = obj.data.stress;
            dim = obj.data.dim;
            safeBeam = zeros(dim.nel, 2);
            for e = 1:dim.nel
                safeBeam(e,1) = e;
                if sig(e)<0
                    if sigcri(e) > abs(sig(e))
                        safeBeam(e,2) = 0;
                    else
                        safeBeam(e,2) = 1;
                    end
                end
            end
        end
        
    end
    
end

