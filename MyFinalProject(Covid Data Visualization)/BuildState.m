classdef BuildState < covid_math
	
	% BuildState - A class to handle COVID-19 data for a specific state or region.
    %
    %   This class organizes COVID-19 data for a specific state or region,
    %   extending functionality from the covid_math superclass for data processing.
    %
    % Properties:
    %   StateName - Name of the state or region.
    %   StatePosition - Position of the state or region's data in the COVID-19 dataset.
    %
    % Methods:
    %   BuildState - Constructor method that initializes the BuildState object using provided COVID-19 data, state name, and position.
    %
properties
StateName   
StatePosition
end
methods
    function obj=BuildState(covid_data,state,state_position)
        
        obj@covid_math(covid_data,state_position);

        obj.StateName=state;
        obj.StatePosition=state_position;
    end

end
end