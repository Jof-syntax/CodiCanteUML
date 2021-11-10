classdef ABComputer < handle
    
    properties (Access = public)
        A
        B
    end
    
    properties (Access = private)
        data
    end
    
    methods (Access = public)
        
        function obj = ABComputer(cParams)
            obj.init(cParams);
        end
        
        function a = compute(obj)
            obj.computeA();
            obj.computeB();
            a.A = obj.A;
            a.B = obj.B;
        end
        
    end
    
    methods (Access = private)
        
        function init(obj, cParams)
            obj.data = cParams;
        end
        
        function computeB(obj)
            fExtL = obj.data.fExtL;
            KLR = obj.data.KLR;
            ur = obj.data.ur;
            B = fExtL-KLR*ur;
            obj.B = B;
        end
        
        function computeA(obj)
            A = obj.data.KLL;
            obj.A = A;
        end
        
    end
end

