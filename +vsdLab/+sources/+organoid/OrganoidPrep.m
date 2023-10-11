classdef OrganoidPrep < vsdLab.sources.RetPrep
    
    methods
        
        function obj = OrganoidPrep()
            import symphonyui.core.*;
            obj.addAllowableParentType('vsdLab.sources.organoid.Organoid');
        end
        
    end
    
end

