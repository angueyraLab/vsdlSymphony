classdef OrganoidCell < vsdLab.sources.RetCell
    
    methods
        
        function obj = OrganoidCell()
            import symphonyui.core.*;
            obj.addAllowableParentType('vsdLab.sources.organoid.OrganoidPrep');
        end
        
    end
    
end