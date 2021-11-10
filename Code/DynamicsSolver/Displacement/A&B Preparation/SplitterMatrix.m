classdef SplitterMatrix < handle
    
    properties (Access = public)
        fExtL
        KLL
        KLR
    end
    
    properties (Access = private)
        data
    end
    
    methods (Access = public)
        
        function obj = SplitterMatrix(cParams)
            obj.init(cParams);
        end
        
        function a = compute(obj)
            obj.computeSplitter();
            a.fExtL = obj.fExtL;
            a.KLL = obj.KLL;
            a.KLR = obj.KLR;
        end
        
    end
    
    methods (Access = private)
        
        function init(obj, cParams)
            obj.data = cParams;
        end
        
        function computeSplitter(obj)
            KG = obj.data.KG;
            fExt = obj.data.fExt;
            vr = obj.data.vr;
            vl = obj.data.vl;
            fExtL = fExt(vl,1);
            KLL = KG(vl,vl);
            KLR = KG(vl,vr);
            obj.fExtL = fExtL;
            obj.KLL = KLL;
            obj.KLR = KLR;
        end
        
    end
end

