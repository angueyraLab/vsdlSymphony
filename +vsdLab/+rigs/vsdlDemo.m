classdef vsdlDemo < symphonyui.core.descriptions.RigDescription

    methods

        function obj = vsdlDemo()
            import symphonyui.builtin.daqs.*;
            import symphonyui.builtin.devices.*;

            daq = NiDaqController();
            obj.daqController = daq;

            % Add a MultiClamp 700B device with name = Amp, channel = 1
            % amp = MultiClampDevice('Amp', 1).bindStream(daq.getStream('ao0')).bindStream(daq.getStream('ai0'));
            amp = UnitConvertingDevice('Amp', 'V').bindStream(daq.getStream('ao0')).bindStream(daq.getStream('ai0'));
            % amp = UnitConvertingDevice('Amp', 'V').bindStream(daq.getStream('ai0'));
            obj.addDevice(amp);

            % Add a LED device with name = Green LED, units = volts
            green = UnitConvertingDevice('Green LED', 'V').bindStream(daq.getStream('ao1'));
            obj.addDevice(green);
        end

    end

end