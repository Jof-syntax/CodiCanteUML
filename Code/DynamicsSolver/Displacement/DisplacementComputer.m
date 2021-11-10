classdef DisplacementComputer < handle
    
    properties  (Access = public)
        displacement
    end
    
    properties (Access = private)
        data
        ur
        ul
        vl
        vr
        KLL
        KLR
        fExtL
        A
        B
    end
    
    methods (Access = public)
        
        function obj = DisplacementComputer(cParams)
            obj.init(cParams);
        end
        
        function a = compute(obj)
            obj.computeDofSplitterComputer();
            obj.computeSplitterMatrix();
            obj.computeAB();
            obj.computeSolver();
            obj.computeDisplacementAssociation();
            a.displacement = obj.displacement;
        end
        
    end
    
    methods (Access = private)
        
        function init(obj, cParams)
            obj.data = cParams;
        end
        
        function computeDofSplitterComputer(obj)
            s = obj.createDofSplitterComputer();
            a = DofSplitterComputer(s);
            a.compute();
            obj.vl = a.vl;
            obj.ur = a.ur;
            obj.vr = a.vr;
        end
        
        function computeSplitterMatrix(obj)
            s = obj.createSplitterMatrix();
            a = SplitterMatrix(s);
            a.compute();
            obj.KLL = a.KLL;
            obj.KLR = a.KLR;
            obj.fExtL = a.fExtL;
        end
        
        function computeAB(obj)
            s = obj.createAB();
            a = ABComputer(s);
            a.compute();
            obj.A = a.A;
            obj.B = a.B;
        end
        
        function computeSolver(obj)
            s = obj.createSolver();
            a = Solver.create(s);
            obj.ul = a.solution;
        end
        
        function computeDisplacementAssociation(obj)
            s = obj.createDisplacementAssociation();
            a = NodeAndDisplacementAssociator(s);
            a.compute();
            obj.displacement = a.u;
        end
        
        function s = createDofSplitterComputer(obj)
            s.dim     = obj.data.dim;
            s.fixNode = obj.data.fixNode;
        end
        
        function s = createSplitterMatrix(obj)
            s.KG   = obj.data.KG;
            s.fExt = obj.data.fExt;
            s.vr   = obj.vr;
            s.vl   = obj.vl;
        end
        
        function s = createAB(obj)
            s.KLL   = obj.KLL;
            s.fExtL = obj.fExtL;
            s.KLR   = obj.KLR;
            s.ur    = obj.ur;
        end
        
        function s = createSolver(obj)
            s.A    = obj.A;
            s.B    = obj.B;
            s.type = obj.data.type;
        end
        
        function s = createDisplacementAssociation(obj)
            s.ul = obj.ul;
            s.vl = obj.vl;
            s.vr = obj.vr;
            s.ur = obj.ur;
        end
            
    end
    
    
end

