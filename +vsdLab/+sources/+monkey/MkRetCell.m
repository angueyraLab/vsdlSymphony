classdef MkRetCell < vsdLab.sources.RetCell
    
    methods
        
        function obj = MkRetCell()
            import symphonyui.core.*;
            obj.addAllowableParentType('vsdLab.sources.monkey.MkRetPrep');
        end
        
    end
    
end