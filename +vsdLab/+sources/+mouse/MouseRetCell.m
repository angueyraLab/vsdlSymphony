classdef MouseRetCell < vsdLab.sources.RetCell
    
    methods
        
        function obj = MouseRetCell()
            import symphonyui.core.*;
            obj.addAllowableParentType('vsdLab.sources.mouse.MouseRetPrep');
        end
        
    end
    
end

