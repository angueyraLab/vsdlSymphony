classdef (Abstract) vsdLabProtocolStage < vsdLab.protocols.vsdLabProtocol
    
    methods (Abstract)
        p = createPresentation(obj);
    end
    
    methods
        
        function prepareEpoch(obj, epoch)
            prepareEpoch@vsdlab.protocols.vsdLabProtocol(obj, epoch);
%             epoch.shouldWaitForTrigger = true; %external trigger start Symphony
            
%             % frame monitor from spatial stimulus for timing issues
%             frameMonitor = obj.rig.getDevices('Frame Monitor');
%             if ~isempty(frameMonitor)
%                 epoch.addResponse(frameMonitor{1});
%             end
        end
        
        function controllerDidStartHardware(obj)
            controllerDidStartHardware@vsdlab.protocols.vsdLabProtocol(obj);
            obj.rig.getDevice('Stage').play(obj.createPresentation());
        end
        
        function tf = shouldContinuePreloadingEpochs(obj) %#ok<MANU>
            tf = false;
        end
        
        function tf = shouldWaitToContinuePreparingEpochs(obj)
            tf = obj.numEpochsPrepared > obj.numEpochsCompleted || obj.numIntervalsPrepared > obj.numIntervalsCompleted;
        end
        
        function completeRun(obj)
            completeRun@vsdlab.protocols.vsdLabProtocol(obj);
            obj.rig.getDevice('Stage').clearMemory();
        end
        
        function [tf, msg] = isValid(obj)
            [tf, msg] = isValid@vsdlab.protocols.vsdLabProtocol(obj);
            if tf
                tf = ~isempty(obj.rig.getDevices('Stage'));
                msg = 'No stage';
            end
        end
        
    end
    
end

