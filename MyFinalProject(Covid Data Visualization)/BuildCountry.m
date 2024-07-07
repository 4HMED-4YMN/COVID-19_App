classdef BuildCountry < covid_math

    % BuildCountry - A class to handle COVID-19 data for a specific country and its states.
    %
    %   This class organizes COVID-19 data for a specific country, including
    %   its states (if available), and extends functionality from the
    %   covid_math superclass for data processing.
    %
    % Properties:
    %   CountryName - Name of the country.
    %   CountryPosition - Position of the country's data in the COVID-19 dataset.
    %   NoOfStates - Number of states or regions within the country.
    %   StatesList - Cell array of BuildState objects representing each state's COVID-19 statistics.
    %   StatesListNames - Names of the states or regions within the country.
    %
    % Methods:
    %   BuildCountry - Constructor method that initializes the BuildCountry object using provided COVID-19 data and the country name.
    %
properties
    CountryName
    CountryPosition
    NoOfStates
    StatesList
    StatesListNames
    
end
methods
    function obj=BuildCountry(covid_data,country)
        %Find country & State indicies; 
        list=covid_data(:,1);
        [~,x]=ismember(list,country);
        pos=find(x);

        obj@covid_math(covid_data,pos(1));

        obj.CountryName=country;        
        obj.NoOfStates=length(pos)-1;
        obj.StatesList=cell(1,obj.NoOfStates);
        


        if obj.NoOfStates==0
            obj.StatesList={};
        else
            for ii=1:length(pos)-1
                StatePosition=pos(ii+1);
                obj.StatesListNames{ii}=covid_data{StatePosition,2};
                obj.StatesList{ii}=BuildState(covid_data,obj.StatesListNames{ii},StatePosition);
                
            end

        end




    end
    
end

end
