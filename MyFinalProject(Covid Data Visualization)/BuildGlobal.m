classdef BuildGlobal < handle

	% BuildGlobal - A class to build global COVID-19 statistics from country data.
    %
    %   This class processes COVID-19 data for multiple countries, aggregates
    %   the statistics globally, and provides methods to access and analyze
    %   the data.
    %
    % Properties:
    %   Countries - A cell array storing BuildCountry objects for each country.
    %   CountriesNames - Names of countries extracted from the COVID-19 data.
    %   GlobalCumulativeCases - Cumulative COVID-19 cases globally over time.
    %   GlobalCumulativeDeaths - Cumulative COVID-19 deaths globally over time.
    %   GlobalDailyCases - Daily new COVID-19 cases globally over time.
    %   GlobalDailyDeaths - Daily new COVID-19 deaths globally over time.
    %   Dates - Dates corresponding to the COVID-19 data.
    %
    % Methods:
    %   BuildGlobal - Constructor that initializes the BuildGlobal object using
    %                 provided COVID-19 data.
    %
    properties
        Countries
        CountriesNames
        GlobalCumulativeCases
        GlobalCumulativeDeaths
        GlobalDailyCases
        GlobalDailyDeaths
        Dates
    end
    methods
        function obj=BuildGlobal(covid_data)
            obj.CountriesNames=unique(covid_data(2:end,1))';
            obj.Countries=cell(1,length(obj.CountriesNames));
            obj.Dates=covid_data(1,3:end)';
            
            NoOfDays=length(covid_data)-2;
            
            obj.GlobalCumulativeCases=zeros(1,NoOfDays);
            obj.GlobalCumulativeDeaths=zeros(1,NoOfDays);
            obj.GlobalDailyCases=zeros(1,NoOfDays);
            obj.GlobalDailyDeaths=zeros(1,NoOfDays);
         
            for ii=1:length(obj.CountriesNames)

                obj.Countries{ii}=BuildCountry(covid_data,obj.CountriesNames{ii});

                obj.GlobalCumulativeCases = obj.GlobalCumulativeCases + obj.Countries{ii}.CumulativeCases;

                obj.GlobalCumulativeDeaths = obj.GlobalCumulativeDeaths + obj.Countries{ii}.CumulativeDeaths;

                obj.GlobalDailyCases = obj.GlobalDailyCases + obj.Countries{ii}.DailyCases;
                
                obj.GlobalDailyDeaths = obj.GlobalDailyDeaths + obj.Countries{ii}.DailyDeaths;

            end

            
        end


    end
end
