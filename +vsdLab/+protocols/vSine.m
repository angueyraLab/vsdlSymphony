classdef vSine < vsdLab.protocols.vsdLabAutoRCProtocol %vsdLab.protocols.vsdLabAutoRCNoiseSineProtocol
    
    properties
        amp                             % Output amplifier
        preTime = 50                    % Sinusoid leading duration (ms)
        stimTime = 500                  % Sinusoid duration (ms)
        tailTime = 50                   % Sinusoid trailing duration (ms)
        sineAmplitude = 2               % Sinusoid amplitude (mV or pA)
        sineMean = -60                  % Sinusoid mean (mV or pA)
        sineFreq = 5                    % Sinusoid frequency (Hz)
        phaseShift = 0                  % Sinusoid phase
        numberOfAverages = uint16(1)    % Number of epochs
        interpulseInterval = 0          % Duration between pulses (s)
    end
    
    properties (Hidden)
        ampType
        plotData
    end
    
    methods
        
        function didSetRig(obj)
%             didSetRig@vsdLab.protocols.vsdLabAutoRCNoiseSineProtocol(obj);
            didSetRig@vsdLab.protocols.vsdLabAutoRCProtocol(obj);
            
            [obj.amp, obj.ampType] = obj.createDeviceNamesProperty('Amp');
        end
        
        function p = getPreview(obj, panel)
            p = symphonyui.builtin.previews.StimuliPreview(panel, @()obj.createAmpStimulus());
        end
        
        function prepareRun(obj)
            prepareRun@vsdLab.protocols.vsdLabAutoRCProtocol(obj);
            
            obj.showFigure('vsdLab.figures.DataFigure', obj.rig.getDevice(obj.amp));
            obj.showFigure('vsdLab.figures.AverageFigure', obj.rig.getDevice(obj.amp),'prepts',obj.timeToPts(obj.preTime));
            obj.showFigure('vsdLab.figures.ResponseStatisticsFigure', obj.rig.getDevice(obj.amp), {@mean, @var}, ...
                'baselineRegion', [0 obj.preTime], ...
                'measurementRegion', [0 obj.preTime]);%'measurementRegion', [obj.preTime obj.preTime+obj.stimTime]);
            obj.showFigure('vsdLab.figures.ProgressFigure', obj.numberOfAverages);
        end
        
        function stim = createAmpStimulus(obj)
            gen = symphonyui.builtin.stimuli.SineGenerator();
            
            gen.preTime = obj.preTime;
            gen.stimTime = obj.stimTime;
            gen.tailTime = obj.tailTime;
            gen.period = 1000/obj.sineFreq; % converting to ms
            gen.phase = obj.phaseShift;
            gen.mean = obj.rig.getDevice(obj.amp).background.quantity;
            gen.amplitude = obj.sineAmplitude;
            gen.sampleRate = obj.sampleRate;
            gen.units = obj.rig.getDevice(obj.amp).background.displayUnits;
            
            stim = gen.generate();
        end
        
        function prepareEpoch(obj, epoch)
            prepareEpoch@vsdLab.protocols.vsdLabAutoRCProtocol(obj, epoch);
            if obj.runRC
                % Superclass runs RC epoch
            else %run normally
                epoch.addStimulus(obj.rig.getDevice(obj.amp), obj.createAmpStimulus());
                epoch.addResponse(obj.rig.getDevice(obj.amp));
            end
        end
        
        function prepareInterval(obj, interval)
            prepareInterval@vsdLab.protocols.vsdLabAutoRCProtocol(obj, interval);
            
            device = obj.rig.getDevice(obj.amp);
            interval.addDirectCurrentStimulus(device, device.background, obj.interpulseInterval, obj.sampleRate);
        end
        
        function tf = shouldContinuePreparingEpochs(obj)
            tf = obj.numEpochsPrepared < obj.numberOfAverages;
        end
        
        function tf = shouldContinueRun(obj)
            tf = obj.numEpochsCompleted < obj.numberOfAverages;
        end
        
    end
    
end

