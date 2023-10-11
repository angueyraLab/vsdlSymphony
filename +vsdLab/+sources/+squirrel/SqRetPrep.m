classdef SqRetPrep < vsdLab.sources.RetPrep
    
    methods
        
        function obj = SqRetPrep()
            import symphonyui.core.*;
            obj.addAllowableParentType('vsdLab.sources.squirrel.Squirrel');
        end
        
    end
    
end

