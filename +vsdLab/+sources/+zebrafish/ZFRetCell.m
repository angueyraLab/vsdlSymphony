classdef ZFRetCell < vsdLab.sources.RetCell
    
    methods
        
        function obj = ZFRetCell()
            import symphonyui.core.*;
            obj.addAllowableParentType('vsdLab.sources.zebrafish.ZFRetPrep');
        end
        
    end
    
end
