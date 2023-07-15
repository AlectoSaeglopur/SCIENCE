
%% Define class (NB: shall have the same name of the file)
classdef class_wave

    %%  Class attributes
    % Public attributes
    properties(Access=public)
        Ncyc                                                                        % Number of cycles [.]
        Fc                                                                          % Carrier frequency [Hz]
        Fs                                                                          % Sample rate [Sa/s]
        Type                                                                        % Waveform type (sinusois, square, etc)
    end
    % Private attributes (NB: not visible if using disp(Sgn1), for example)
    properties(Access=private)
        AxisX
        AxisY
    end

    %% Class methods
    % Public attributes
    methods(Access=public)
        
        % Class constructor (NB: shall have the same name of the class).
        function obj = class_wave( Fs )
            obj.Fc = NaN;
            obj.Fs = Fs;
            obj.Type = NaN;
            obj.Ncyc = NaN;
            obj.AxisX = NaN;
            obj.AxisY = NaN;
        end
        
        % Function togetthevalue of AxisX attribute multiplied by scaling factor.
        function Val = get_AxisX( obj, ScFct )
            Val = ScFct*obj.AxisX;
        end
        
        % Function togetthevalue of AxisY attribute.
        function Val = get_AxisY( obj )
            Val = obj.AxisY;
        end

        % Function to set the value of Ncyc attribute.
        function obj = set_Ncyc( obj, Val )
            obj.Ncyc = Val;
        end
        
        % Function to set the value of Fc attribute.
        function obj = set_Fc( obj, Val )
            obj.Fc = Val;
        end
        
        % Function to set the value of Type attribute.
        function obj = set_Type( obj, Val )
            obj.Type = Val;
        end

        % Function to calculate X-axis.
        function obj = calc_AxisX( obj )
            if isnan(obj.Ncyc) || isnan(obj.Fc)
                fprintf('calc_AxisX | ERROR: must specify Ncyc and Fc.\n')
            else
                obj.AxisX = 1/obj.Fs*(0:obj.Ncyc*obj.Fs/obj.Fc-1);
            end
        end

        % Function to calculate Y-axis.
        function obj = calc_AxisY( obj )
            switch obj.Type
                case 'Sin'
                    obj.AxisY = sin(2*pi*obj.Fc*obj.AxisX);
                otherwise
                    fprintf('calc_AxisY | ERROR: invalid Type.\n')
            end
        end

    end
end
