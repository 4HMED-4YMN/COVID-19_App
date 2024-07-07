# COVID-19_App

The goal of this project is to create a MATLAB program that processes and visualizes COVID-19 pandemic data . The data (obtained from the [Coronavirus Resource Center](https://coronavirus.jhu.edu/map.html) at the Johns Hopkins University) is available from the .mat file attached (`covid_data2.mat`)

| ![](https://raw.githubusercontent.com/4HMED-4YMN/COVID-19_App/main/Pasted%20image%2020240707155141.png) | ![](https://raw.githubusercontent.com/4HMED-4YMN/COVID-19_App/main/Pasted%20image%2020240707155104.png) |
| ------------------------------------ | ------------------------------------ |

---
#### `covid_data2.mat` 
A large cell array It contains the global case and death counts by country and state and by date. Specifically, the first row of the cell array specifies what each column contains: Country and State followed by a number of dates starting from "1/22/20," that is, January 22, 2020. Each data cell for a given country and date contains a 2-element vector of doubles: the first element is the cumulative case count, while the second is the cumulative number of deaths.
![](https://github.com/4HMED-4YMN/COVID-19_App/blob/main/Pasted%20image%2020240707154241.png?raw=true)

---
>There are  4 Classes to process data directly from a COVID-19 data set

[`BuildGlobal.m`](#buildglobalm)

[`BuildCountry.m`](#buildcountrym)

[`BuildStates.m`](#buildstatesm)

[`covid_math.m`](#covid_mathm)

>After processing the data it is a straight forward process to build the GUI using MATLAB  App Designer 

---
### `BuildGlobal.m` 
>The `BuildGlobal` class is designed to aggregate COVID-19 statistics globally from country-specific data. It constructs objects for each country and calculates cumulative and daily statistics across all countries.

#### Overview
This MATLAB class processes COVID-19 data, organizing it into country-specific objects (`BuildCountry`) and aggregating global statistics such as cumulative cases, cumulative deaths, daily cases, and daily deaths.

#### Class Structure
##### Properties

- **Countries**: Cell array of `BuildCountry` objects for each country.
- **CountriesNames**: Names of countries extracted from the COVID-19 data.
- **GlobalCumulativeCases**: Cumulative COVID-19 cases globally over time.
- **GlobalCumulativeDeaths**: Cumulative COVID-19 deaths globally over time.
- **GlobalDailyCases**: Daily new COVID-19 cases globally over time.
- **GlobalDailyDeaths**: Daily new COVID-19 deaths globally over time.
- **Dates**: Dates corresponding to the COVID-19 data.

##### Methods

- **BuildGlobal**: Constructor method that initializes the `BuildGlobal` object using provided COVID-19 data.

---
### `BuildCountry.m`
>The `BuildCountry` class extends functionality from `covid_math` to organize COVID-19 data for a specific country, including its states (if available).

#### Overview
This MATLAB class processes COVID-19 data to extract information specific to a country and its states (if applicable). It initializes properties such as the country name, position in the data, number of states, and a list of state objects (`BuildState`) for further analysis.

#### Class Structure

##### Properties

- **CountryName**: Name of the country.
- **CountryPosition**: Position of the country's data in the COVID-19 dataset.
- **NoOfStates**: Number of states or regions within the country.
- **StatesList**: Cell array of `BuildState` objects representing each state's COVID-19 statistics.
- **StatesListNames**: Names of the states or regions within the country.

##### Methods

- **BuildCountry**: Constructor method that initializes the `BuildCountry` object using provided COVID-19 data and the country name.

---
### `BuildStates.m`
>The `BuildState` class manages COVID-19 data for a specific state or region, extending functionality from the `covid_math` superclass for data processing.

#### Overview
This MATLAB class organizes COVID-19 data for a specific state or region, including properties for the state or region name and its position in the dataset.

#### Class Structure
##### Properties

- **StateName**: Name of the state or region.
- **StatePosition**: Position of the state or region's data in the COVID-19 dataset.

##### Methods

- **BuildState**: Constructor method that initializes the `BuildState` object using provided COVID-19 data, state name, and position.

---
### `covid_math.m`
>The `covid_math` class computes COVID-19 statistics including cumulative and daily cases and deaths from provided data.

#### Overview
This MATLAB class processes COVID-19 data to compute cumulative and daily statistics for cases and deaths over time.

#### Class Structure

##### Properties

- **CumulativeCases**: Cumulative COVID-19 cases over time.
- **CumulativeDeaths**: Cumulative COVID-19 deaths over time.
- **DailyCases**: Daily new COVID-19 cases over time.
- **DailyDeaths**: Daily new COVID-19 deaths over time.

##### Methods

- **covid_math**: Constructor method that initializes the `covid_math` object using provided COVID-19 data and a specific position.

---
