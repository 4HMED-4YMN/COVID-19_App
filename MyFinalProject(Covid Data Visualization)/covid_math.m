classdef covid_math < handle

    % covid_math - A class to compute COVID-19 statistics from data.
    %
    %   This class processes COVID-19 data to compute cumulative and daily
    %   statistics including cases and deaths.
    %
    % Properties:
    %   CumulativeCases - Cumulative COVID-19 cases over time.
    %   CumulativeDeaths - Cumulative COVID-19 deaths over time.
    %   DailyCases - Daily new COVID-19 cases over time.
    %   DailyDeaths - Daily new COVID-19 deaths over time.
    %
    % Methods:
    %   covid_math - Constructor method that initializes the covid_math object using provided COVID-19 data and position.
    %
   
    properties
        CumulativeCases   
        CumulativeDeaths  
        DailyCases        
        DailyDeaths       
        
    end
    
    methods
        function obj=covid_math(covid_data,pos)

            NoOfDays=length(covid_data(1,3:end));

            obj.CumulativeCases=zeros(1,NoOfDays);
            obj.CumulativeDeaths=zeros(1,NoOfDays);
            obj.DailyCases=zeros(1,NoOfDays);
            obj.DailyDeaths=zeros(1,NoOfDays);


            for ii=1:NoOfDays % No. of Days

                obj.CumulativeCases(ii)=covid_data{pos,ii+2}(1);

                obj.CumulativeDeaths(ii)=covid_data{pos,ii+2}(2);

                if ii==1
                    obj.DailyCases(ii)=obj.CumulativeCases(ii);
                    obj.DailyDeaths(ii)=obj.CumulativeDeaths(ii);
                else
                    obj.DailyCases(ii)=obj.CumulativeCases(ii)-obj.CumulativeCases(ii-1);

                    obj.DailyDeaths(ii)=obj.CumulativeDeaths(ii)-obj.CumulativeDeaths(ii-1);
                end
            end
            obj.DailyCases(obj.DailyCases<0)=0;
            obj.DailyDeaths(obj.DailyDeaths<0)=0;
        end
    
    end

end