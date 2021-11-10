classdef NodeAndDisplacementAssociator < handle
    
    properties (Access = public)
        u
    end
    
    properties  (Access = private)
        data
    end
    
    methods (Access = public)
        
        function obj = NodeAndDisplacementAssociator(cParams)
            obj.init(cParams);
        end
        
        function a = compute(obj)
            obj.computeAssociation();
            a = obj.u;
        end
        
    end
    
    methods (Access = private)
        
        function init(obj, cParams)
            obj.data = cParams;
        end
        
        function u = computeAssociation(obj)
            ul = obj.data.ul;
            vl = obj.data.vl;
            vr = obj.data.vr;
            ur = obj.data.ur;
            u(vl,1) = ul;
            u(vr,1) = ur;
            obj.u = u;
        end
        
    end
end


