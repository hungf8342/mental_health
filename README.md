# ma154-project5-teammentalhealth
ma154-project5-teammentalhealth created by GitHub Classroom

Group Members & Roles:
Frances Hung - Director of Computation, Facilitator 
Cheryl Yau - Director of Research, Task Manager
Candice Wang - Director of Report, Project Manager

Title of Project: 
Mapping Community Need for Mental Health Services

Purpose: 
This projects aims to measure the need for mental health services by region, and provide a visualization insight to whether certain communities are underserved. This is potentially useful for nonprofits, and healthcare professionals working in this space. Further, by overlaying this information with other demographic data of the region, this may be useful for research into demographic factors that may be linked to mental health need, stigma and service provision. Lastly, we will construct a logistic regression model to predict suicide rate.

Data: 
We will need to map out demand and supply of mental health services. 

-Demand
Due to the stigma surrounding mental illnesses, we believe that many people turn to Google search rather than trained professionals to self-diagnose when facing mental health struggles. Due to the sensitive nature of this topic, it is difficult to assess how many people in a given region face mental health concerns and what the most pressing mental health problems are for different regions, through means like survey and poll. As such, Google Searches may be a powerful source of information to map demand. We will find the data for Google searches about mental health issues using Google Trends data, accessed using gtrendsR package. We hope to gather search information for different different cities in the state of California and work with geographical data in shapefiles. We will also look for other data sources that attempt to map mental health need. 
California Health Interview Survey 
Telephone survey that provides population-based, standardized health-related data (including mental health)  from households selected from all 58 counties in the state
* need to create an account to access data 
http://healthpolicy.ucla.edu/chis/data/Pages/public-use-data.aspx 
Other data sources (to keep-in-view)
https://www.samhsa.gov/data/sites/default/files/State_BHBarometers_2014_1/BHBarometer-CA.pdf 
http://www.calbhbc.com/data-notebooks.html 
http://www.tacinc.org/media/22510/CA%20Mental%20Health%20Executive%20Summary.docx.pdf 
http://www.dhcs.ca.gov/provgovpart/Documents/CaliforniaPrevalenceEstimates.pdf 

-Supply 
We plan to obtain a dataset of registered mental health services providers from the US Department of Health and Human Services annual survey about mental health treatment facilities 
https://data.chhs.ca.gov/dataset/licensed-healthcare-facility-listing/resource/0efcdfc8-9623-4155-9de5-d08d5d986a49 

-Demographics
We also plan to get demographic information from the census bureau corresponding to the region divisions, such as income, education level, and health insurance coverage.
California population count, and forecast 
http://www.dof.ca.gov/Forecasting/Demographics/ 
The National Historical Geographic Information System (NHGIS) provides population, housing, agricultural, and economic data, along with GIS-compatible boundary files, for geographic units in the United States from 1790 to the present
https://www.nhgis.org/ 
https://www.ipums.org/ 
California poverty count, at various levels of aggregation, 2013-2015
http://www.ppic.org/data-set/california-poverty-by-county-and-legislative-district/ 

-Suicide rate
Leading causes of death, including suicide, by zipcode in CA
https://data.chhs.ca.gov/dataset/leading-causes-of-death-by-zip-code-1999-2013

Variables:
Density of searches pertaining to “depression” and “suicide” respectively, by region 
To map prevalence of the issue, compared to other regions 
Top searches (by volume) related to mental health within one region 
To assess the most pressing mental health problems within each region 
Mental health service providers in the region 
Rate of suicide in the region
Demographic data 

Parameters: 
Geographical scope - California state
Fixed time frame for scraping searches e.g. “the past year”
Zipcode (for suicide rate data)

End Product:
This project will produce a GIS map with layers of top search terms for each region, density of specific terms such as depression across different cities, demographic map of different demographic variables, and density of existing mental health services.
We will also make a logistic regression model to predict suicide rate by aggregated zipcodes (most cities encompass at least 15 zipcodes).  Choosing from the variables selected above, we can use feature selection (perhaps forward selection/backward elimination) to narrow down predictors for the model.
