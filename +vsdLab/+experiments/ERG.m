classdef ERG < symphonyui.core.persistent.descriptions.ExperimentDescription
    
    methods
        
        function obj = ERG()
            import symphonyui.core.*;
            
            obj.addProperty('experimenter', '', ...
                'description', 'Who performed the experiment');
            obj.addProperty('project', '', ...
                'description', 'Project the experiment belongs to');
            obj.addProperty('institution', 'UMD', ...
                'description', 'Institution where the experiment was performed');
            obj.addProperty('lab', 'vsdLab', ...
                'description', 'Lab where experiment was performed');
        end
        
    end
    
end

