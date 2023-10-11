classdef MkRetPrep < vsdLab.sources.RetPrep
    
    methods
        
        function obj = MkRetPrep()
            import symphonyui.core.*;
            obj.addAllowableParentType('vsdLab.sources.monkey.Monkey');
        end
        
    end
    
end

