classdef SqRetCell < vsdLab.sources.RetCell
    
    methods
        
        function obj = SqRetCell()
            import symphonyui.core.*;
            obj.addAllowableParentType('vsdLab.sources.squirrel.SqRetPrep');
        end
        
    end
    
end