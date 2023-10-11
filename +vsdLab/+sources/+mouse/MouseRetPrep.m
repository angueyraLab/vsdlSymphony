classdef MouseRetPrep < vsdLab.sources.RetPrep
    
    methods
        
        function obj = MouseRetPrep()
            import symphonyui.core.*;
            obj.addAllowableParentType('vsdLab.sources.mouse.Mouse');
        end
        
    end
    
end

