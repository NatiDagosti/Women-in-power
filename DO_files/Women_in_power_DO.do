

clear all

log using final_version, replace

*****************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************WITHOUT HYDRO*******************************************
***************41 countries*************************************************
***********************************************************************************************************************************************************************************
clear all
set more off

cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power"

use "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\IEA_final"


merge 1:1 countryname year using  "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\seats_ready" 
drop _merge 
*the difference in observations are year<1997 + year>2020 + a few high income countries that have no information in electricity production: Andorra, Antigua and Barbuda,  Bahamas, Barbados, Bermuda, British Virgin Islands, Cayman Islands, Channel Islands, Faroe Islands, French Polynesia, Greenland,  Guam, Isle of Man, Liechtenstein, Macao, Monaco, New Caledonia, Northern Mariana Islands, Palau, Puerto Rico, San Marino, Seychelles, Sint Maarten (Dutch part), St. Kitts and Nevis, Turks and Caicos Islands, Virgin Islands (U.S.)


merge 1:1 countryname year using "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\parties_ready"
drop _merge
*the difference in observations are year<1997 + a few high income countries that have no information in electricity production: Bahamas, BArbados and Turks and Caicos Island, + some countries that have no niformation on parties: Curacao, Gibraltar, and Hong Kong

merge 1:1 countryname year using  "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\Political_Rights_ready"
drop _merge
* the difference in observations are year<1997 + year>2020 + a few high income countries that have no information in electricity production Andorra, Antigua and Barbuda, Bahamas, Barbados, Liechtenstein, Monaco, Palau, San Marino, Seychelles, St. Kitts and Nevis, + no information in political rights: Curaçao, Gibraltar, Hong Kong.

merge 1:1 countryname year using  "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\civil_liberties_ready"
drop _merge
* the difference in observations are year<1997 + year>2020 + a few high income countries that have no information in electricity production Andorra, Antigua and Barbuda, Bahamas, Barbados, Liechtenstein, Monaco, Palau, San Marino, Seychelles, St. Kitts and Nevis, + no information in political rights: Curaçao, Gibraltar, Hong Kong.

merge 1:1 countryname year using  "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\GDP_pc_constant_2015 ready"
drop _merge
*the difference in observations are year<1997 + year>2020 + a few high income countries that have no information in electricity production: Andorra, Antigua and Barbuda,  Bahamas, Barbados, Bermuda, British Virgin Islands, Cayman Islands, Channel Islands, Faroe Islands, French Polynesia, Greenland,  Guam, Isle of Man, Liechtenstein, Macao, Monaco, New Caledonia, Northern Mariana Islands, Palau, Puerto Rico, San Marino, Seychelles, Sint Maarten (Dutch part), St. Kitts and Nevis, Turks and Caicos Islands, Virgin Islands (U.S.)

*merge 1:1 countryname year using "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\pop_tot_ready"
*drop _merge

describe


drop if total_e==. | seats==. | gdp==. | typeparty=="" | typeparty=="." | pol_rights==. | civil_lib==.

**# Bookmark #1
keep if countryname=="Andorra" | countryname=="Antigua and Barbuda" | countryname=="Australia" | countryname=="Austria" | countryname=="Bahamas" | countryname=="Bahrain" | countryname=="Barbados" | countryname=="Belgium" | countryname=="Brunei Darussalam" | countryname=="Canada" | countryname=="Chile" | countryname=="Croatia" | countryname=="Cyprus" | countryname=="Czechia" | countryname=="Denmark" | countryname=="Estonia" | countryname=="Finland" | countryname=="France" | countryname=="Germany" | countryname=="Greece" | countryname=="Hungary" | countryname=="Iceland" | countryname=="Ireland" | countryname=="Isle of Man" | countryname=="Israel" | countryname=="Italy" | countryname=="Japan" | countryname=="Korea, Rep." | countryname=="Kuwait" | countryname=="Latvia" | countryname=="Liechtenstein" | countryname=="Lithuania" | countryname=="Luxembourg" | countryname=="Malta" | countryname=="Monaco" | countryname=="Netherlands" | countryname=="New Zealand" | countryname=="Norway" | countryname=="Oman" | countryname=="Palau" | countryname=="Panama" | countryname=="Poland" | countryname=="Portugal" | countryname=="Qatar" | countryname=="San Marino" | countryname=="Saudi Arabia" | countryname=="Seychelles" | countryname=="Singapore" | countryname=="Slovak Republic" | countryname=="Slovenia" | countryname=="Spain" | countryname=="St. Kitts and Nevis" | countryname=="Sweden" | countryname=="Switzerland" | countryname=="Trinidad and Tobago" | countryname=="United Arab Emirates" | countryname=="United Kingdom" | countryname=="United States" | countryname=="Uruguay" | countryname=="Bermuda" | countryname=="British Virgin Islands" | countryname=="Cayman Islands" | countryname=="Channel Islands" | countryname=="Curaçao" | countryname=="Faroe Islands"| countryname=="French Polynesia" | countryname=="Gibraltar" | countryname=="Greenland" | countryname=="Guam" | countryname=="Hong Kong" | countryname=="Macao" | countryname=="New Caledonia" | countryname=="Northern Mariana Islands" | countryname=="Puerto Rico" | countryname=="Sint Maarten (Dutch part)" | countryname=="St. Martin (French Part)" | countryname=="Turks and Caicos Islands" | countryname=="Virgin Islands (U.S.)" 
*|countryname=="India" | countryname=="Brazil" | countryname=="China" | countryname=="Indonesia" | countryname=="Mexico" | countryname=="Philippines" | countryname=="South Africa" | countryname=="Thailand" | countryname=="Turkey" 




****************************************************************************
*************Dummy of gender quota ****************
*****************************************************************************

generate interaction=0
replace interaction=1 if countryname=="Belgium" & year>=1997
replace interaction=1 if countryname=="Chile" & year>=2015
replace interaction=1 if countryname=="Croatia" & year>=2008
replace interaction=1 if countryname=="France" & year>=1999
replace interaction=1 if countryname=="Greece" & year>=2012
replace interaction=1 if countryname=="Ireland" & year>=2012
replace interaction=1 if countryname=="Italy" & year >=2017
replace interaction=1 if countryname=="Korea, Rep." & year>=2000 
replace interaction=1 if countryname=="Luxembourg" & year>=2016
replace interaction=1 if countryname=="Panama" & year>=2007
replace interaction=1 if countryname=="Poland" & year>=2011
replace interaction=1 if countryname=="Portugal" & year>=2006
replace interaction=1 if countryname=="Slovenia" & year>=2005
replace interaction=1 if countryname=="Spain" & year>=2007
replace interaction=1 if countryname=="Uruguay" & year>=2009


******************************************************************************************************************************************************************************************IV -CLUSTER - HIGH INCOME********************

encode countryname, generate(country)
generate loggdp=log(gdp)

xtset country year


tab year, generate(dyear)
tab country, generate(dcountry)
tab typeparty, generate(dparty)

summarize

*Do it with solar, wind and tide first
*Then add hydro
*Then add biomass

xtivreg2 s_w_t dyear* (seats=interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 


xtivreg2 s_w_t loggdp dyear* (seats=interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 



xtivreg2 s_w_t loggdp dparty* dyear* (seats=interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest dparty1, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty2, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)


xtivreg2 s_w_t loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest dparty1, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty2, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest civil_lib, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)



******************************************************************************************************************************************************************************************WITHOUT IV***********************************


xtreg s_w_t seats loggdp dparty* civil_lib  i.year, fe vce(cluster country)
boottest seats, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321) 
boottest loggdp, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321) 
boottest dparty1, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321)
boottest dparty2, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321)
boottest civil_lib, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321)



*******************************************************************************************
*******************************************************************************************************************************try other instrument*************************************
****************************************************************************************************************************************************************************************

generate votes=1893
replace votes=1906 if countryname=="Finland"
replace votes=1913 if countryname=="Norway"
replace votes=1915 if countryname=="Denmark"
replace votes=1915 if countryname=="Iceland"
replace votes=1917 if countryname=="Estonia"
replace votes=1917 if countryname=="Latvia"
replace votes=1917 if countryname=="Lithuania"
replace votes=1918 if countryname=="Austria"
replace votes=1918 if countryname=="Germany"
replace votes=1918 if countryname=="Hungary"
replace votes=1918 if countryname=="Poland"
replace votes=1919 if countryname=="Luxembourg"
replace votes=1919 if countryname=="Netherlands"
replace votes=1919 if countryname=="Sweden"
replace votes=1920 if countryname=="Czech Republic"
replace votes=1920 if countryname=="Slovak Republic"
replace votes=1920 if countryname=="United States"
replace votes=1922 if countryname=="Ireland"
replace votes=1928 if countryname=="United Kingdom"
replace votes=1931 if countryname=="Spain"
replace votes=1932 if countryname=="Uruguay"
replace votes=1945 if countryname=="Croatia"
replace votes=1945 if countryname=="France"
replace votes=1945 if countryname=="Italy"
replace votes=1945 if countryname=="Slovenia"
replace votes=1946 if countryname=="Japan"
replace votes=1946 if countryname=="Panama"
replace votes=1946 if countryname=="Trinidad and Tobago"
replace votes=1947 if countryname=="Malta"
replace votes=1948 if countryname=="Belgium"
replace votes=1948 if countryname=="Israel"
replace votes=1948 if countryname=="Korea, Rep."
replace votes=1949 if countryname=="Chile"
replace votes=1952 if countryname=="Greece"
replace votes=1960 if countryname=="Canada"
replace votes=1960 if countryname=="Cyprus"
replace votes=1962 if countryname=="Australia"
replace votes=1976 if countryname=="Portugal"

generate instrument=year-votes

summ

xtivreg2 s_w_t  dyear2 dyear3 dyear4 dyear5 dyear6 dyear7 dyear8 dyear9 dyear10 dyear11 dyear12 dyear13 dyear14 dyear15 dyear16 dyear17 dyear18 dyear19 dyear20 dyear21 dyear22 dyear23   (seats=instrument), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)

xtivreg2 s_w_t loggdp   dyear2 dyear3 dyear4 dyear5 dyear6 dyear7 dyear8 dyear9 dyear10 dyear11 dyear12 dyear13 dyear14 dyear15 dyear16 dyear17 dyear18 dyear19 dyear20 dyear21 dyear22 dyear23  (seats=instrument), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)

xtivreg2 s_w_t loggdp dparty*  dyear2 dyear3 dyear4 dyear5 dyear6 dyear7 dyear8 dyear9 dyear10 dyear11 dyear12 dyear13 dyear14 dyear15 dyear16 dyear17 dyear18 dyear19 dyear20 dyear21 dyear22 dyear23  (seats=instrument), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty1, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty2, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)

xtivreg2 s_w_t loggdp dparty* civil_lib dyear2 dyear3 dyear4 dyear5 dyear6 dyear7 dyear8 dyear9 dyear10 dyear11 dyear12 dyear13 dyear14 dyear15 dyear16 dyear17 dyear18 dyear19 dyear20 dyear21 dyear22 dyear23   (seats=instrument), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty1, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty2, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest civil_lib, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)



************************************************************************************************************************************************************************************************************************************************************************************
************************OVERIDENTIFICATION TEST - HANSEN
xtivreg2 s_w_t  dyear2 dyear3 dyear4 dyear5 dyear6 dyear7 dyear8 dyear9 dyear10 dyear11 dyear12 dyear13 dyear14 dyear15 dyear16 dyear17 dyear18 dyear19 dyear20 dyear21 dyear22 dyear23  (seats=instrument interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)

xtivreg2 s_w_t loggdp dyear2 dyear3 dyear4 dyear5 dyear6 dyear7 dyear8 dyear9 dyear10 dyear11 dyear12 dyear13 dyear14 dyear15 dyear16 dyear17 dyear18 dyear19 dyear20 dyear21 dyear22 dyear23 (seats=instrument interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)

xtivreg2 s_w_t loggdp dparty*  dyear2 dyear3 dyear4 dyear5 dyear6 dyear7 dyear8 dyear9 dyear10 dyear11 dyear12 dyear13 dyear14 dyear15 dyear16 dyear17 dyear18 dyear19 dyear20 dyear21 dyear22 dyear23  (seats=instrument interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty1, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty2, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)

xtivreg2 s_w_t loggdp dparty* civil_lib  dyear2 dyear3 dyear4 dyear5 dyear6 dyear7 dyear8 dyear9 dyear10 dyear11 dyear12 dyear13 dyear14 dyear15 dyear16 dyear17 dyear18 dyear19 dyear20 dyear21 dyear22 dyear23 (seats=instrument interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty1, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty2, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest civil_lib, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)


// I am not able to reject the null hypothesis 

***********************************************************************************************************************************************************************************************************REDUCED FORM************************************************************

xtivreg2 s_w_t interaction instrument dyear*, fe cluster(country)


xtivreg2 s_w_t interaction  instrument loggdp  dyear*, fe cluster(country)

xtivreg2 s_w_t interaction instrument loggdp dparty* dyear*, fe cluster(country)

xtivreg2 s_w_t interaction  instrument loggdp dparty* civil_lib dyear*, fe cluster(country)



**********************************************************************************TRY GOVERNMENT**********************
***********************************************************
generate gov_type="Parliamentary republic"
replace gov_type="constitutional federal republic" if countryname=="United States"
replace gov_type="Constitutional monarchy" if countryname=="Luxembourg" 
replace gov_type="Federal parliamentary democracy under a constitutional monarchy" if countryname=="Australia" | countryname=="Belgium" | countryname=="Canada" 
replace gov_type="Federal parliamentary republic" if countryname=="Austria" | countryname=="Germany"
replace gov_type="Parliamentary constitutional monarchy" if countryname=="Denmark" | countryname=="Japan" | countryname=="Netherland" |countryname=="Norway" | countryname=="Spain" | countryname=="Sweden" | countryname=="United Kingdom"
replace gov_type="Parliamentary democracy" if countryname=="Israel"
replace gov_type="Parliamentary democracy under a constitutional monarchy" if countryname=="Bahamas" | countryname=="Barbados" | countryname=="New Zealand"
replace gov_type="Presidential Republic" if countryname=="Chile" | countryname=="Cyprus" | countryname=="Korea,Rep." | countryname=="Panama" | countryname=="Uruguay"
replace gov_type="Semi-presidentail republic" if countryname=="France" | countryname=="Lithuania" | countryname=="Portugal"


generate dummy_2=1
replace dummy_2=0 if gov_type=="Parliamentary republic" | gov_type=="Federal parliamentary democracy under a constitutional monarchy" | gov_type=="Federal parliamentary republic" | gov_type=="Parliamentary constitutional monarchy" | gov_type=="Parliamentary democracy" | gov_type=="Parliamentary democracy under a constitutional monarchy" 


generate type3=dummy_2*seats
generate inst_3 = dummy_2*interaction


xtivreg2 s_w_t loggdp dparty* civil_lib  dyear2 dyear3 dyear4 dyear5 dyear6 dyear7 dyear8 dyear9 dyear10 dyear11 dyear12 dyear13 dyear14 dyear15 dyear16 dyear17 dyear18 dyear19 dyear20 dyear21 dyear22 dyear23 (seats type3=instrument interaction inst_3), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest type3, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321) nograph
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty1, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty2, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest civil_lib, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)


*****The fact that they are from the presidential has a negative impact on the renewable energy production, but is not significative****


**************Women*civil liberties interaction**************
generate women_liberties=seats*civil_lib
generate interaction_2= interaction*civil_lib

xtivreg2 s_w_t loggdp dparty* civil_lib women_liberties dyear* (seats women_liberties =interaction interaction_2), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321) nograph
boottest women_liberties, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321) nograph
boottest loggdp, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321) nograph
boottest dparty1, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321) nograph
boottest dparty2, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321) nograph
boottest civil_lib, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321) nograph




******************************************************************************************************************************************************************************************Robustness****************************************************************************************************************************************************************************

********************Robustness check*****************************************
*******************DO THE QUOTA YEAR A RANDOM CHOICE***************

*also tried with 123456789 and is not significative p-value 0.3*


preserve
set seed 123
collapse s_w_bio_h_t, by(countryname)
generate robustr=runiformint(1990,2020) 
restore


generate robustr=0
replace robustr=1 if countryname=="Belgium" & year>=2020
replace robustr=1 if countryname=="Croatia" & year>=1996
replace robustr=1 if countryname=="Chile" & year>=1996
replace robustr=1 if countryname=="France" & year>=2008
replace robustr=1 if countryname=="Greece" & year>=2010
replace robustr=1 if countryname=="Ireland" & year>=2009
replace robustr=1 if countryname=="Italy" & year >=2016
replace robustr=1 if countryname=="Korea, Rep." & year>=2015
replace robustr=1 if countryname=="Luxembourg" & year>=2008
replace robustr=1 if countryname=="Panama" & year>=2020
replace robustr=1 if countryname=="Poland" & year>=2006
replace robustr=1 if countryname=="Portugal" & year>=2017
replace robustr=1 if countryname=="Slovenia" & year>=2019
replace robustr=1 if countryname=="Spain" & year>=2004
replace robustr=1 if countryname=="Uruguay" & year>=2002


xtivreg2 s_w_t loggdp dparty* civil_lib dyear* (seats=robustr), fe cluster(country) first 
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest dparty1, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty2, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest civil_lib, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)

***********************************drop each country at a time

preserve
xtivreg2 s_w_t loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
estimates store O
restore

preserve
drop if countryname=="Belgium"
xtivreg2 s_w_t loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store A
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
restore

preserve
drop if countryname=="Croatia"
xtivreg2 s_w_t loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store B
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
restore

preserve
drop if countryname=="Chile"
xtivreg2 s_w_t loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store C
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
restore

preserve
drop if countryname=="France"
xtivreg2 s_w_t loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store D
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
restore

preserve
drop if countryname=="Greece"
xtivreg2 s_w_t loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store E
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
restore

preserve
drop if countryname=="Ireland"
xtivreg2 s_w_t loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store F
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
restore

preserve
drop if countryname=="Italy"
xtivreg2 s_w_t loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store G
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
restore

preserve
drop if countryname=="Korea, Rep."
xtivreg2 s_w_t loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store H
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
restore

preserve
drop if countryname=="Luxembourg"
xtivreg2 s_w_t loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store I
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
restore

preserve
drop if countryname=="Panama"
xtivreg2 s_w_t loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store J 
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
restore


preserve
drop if countryname=="Poland"
xtivreg2 s_w_t loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store K
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
restore

preserve
drop if countryname=="Portugal"
xtivreg2 s_w_t loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store L
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
restore


preserve
drop if countryname=="Slovenia"
xtivreg2 s_w_t loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store M
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
restore


preserve
drop if countryname=="Spain"
xtivreg2 s_w_t loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store N
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
restore

preserve
drop if countryname=="Uruguay"
xtivreg2 s_w_t loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store U
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
restore

coefplot O A B C D E F G H I J K L M N U, drop(_cons loggdp dparty* civil_lib dyear*) keep(*:) xline(0)


 
****************************************************************************************************************************************************************************************
************************************************************************************************************************Add other countries:******************************
***************************************************************************************************************************************************************************************
***Brazil, China and India
clear all
set more off

cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power"

use "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\IEA_final"

merge 1:1 countryname year using  "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\seats_ready" 
drop _merge 


merge 1:1 countryname year using "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\parties_ready"
drop _merge

merge 1:1 countryname year using  "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\Political_Rights_ready"
drop _merge


merge 1:1 countryname year using  "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\civil_liberties_ready"
drop _merge

merge 1:1 countryname year using  "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\GDP_pc_constant_2015 ready"
drop _merge

describe

drop if total_e==. | seats==. | gdp==. | typeparty=="." | typeparty==""  | pol_rights==. | civil_lib==.

keep if countryname=="Andorra" | countryname=="Antigua and Barbuda" | countryname=="Australia" | countryname=="Austria" | countryname=="Bahamas" | countryname=="Bahrain" | countryname=="Barbados" | countryname=="Belgium" | countryname=="Brunei Darussalam" | countryname=="Canada" | countryname=="Chile" | countryname=="Croatia" | countryname=="Cyprus" | countryname=="Czech Republic" | countryname=="Denmark" | countryname=="Estonia" | countryname=="Finland" | countryname=="France" | countryname=="Germany" | countryname=="Greece" | countryname=="Hungary" | countryname=="Iceland" | countryname=="Ireland" | countryname=="Isle of Man" | countryname=="Israel" | countryname=="Italy" | countryname=="Japan" | countryname=="Korea, Rep." | countryname=="Kuwait" | countryname=="Latvia" | countryname=="Liechtenstein" | countryname=="Lithuania" | countryname=="Luxembourg" | countryname=="Malta" | countryname=="Monaco" | countryname=="Netherlands" | countryname=="New Zealand" | countryname=="Norway" | countryname=="Oman" | countryname=="Palau" | countryname=="Panama" | countryname=="Poland" | countryname=="Portugal" | countryname=="Qatar" | countryname=="San Marino" | countryname=="Saudi Arabia" | countryname=="Seychelles" | countryname=="Singapore" | countryname=="Slovak Republic" | countryname=="Slovenia" | countryname=="Spain" | countryname=="St. Kitts and Nevis" | countryname=="Sweden" | countryname=="Switzerland" | countryname=="Trinidad and Tobago" | countryname=="United Arab Emirates" | countryname=="United Kingdom" | countryname=="United States" | countryname=="Uruguay" | countryname=="Bermuda" | countryname=="British Virgin Islands" | countryname=="Cayman Islands" | countryname=="Channel Islands" | countryname=="Curaçao" | countryname=="Faroe Islands"| countryname=="French Polynesia" | countryname=="Gibraltar" | countryname=="Greenland" | countryname=="Guam" | countryname=="Hong Kong" | countryname=="Macao" | countryname=="New Caledonia" | countryname=="Northern Mariana Islands" | countryname=="Puerto Rico" | countryname=="Sint Maarten (Dutch part)" | countryname=="St. Martin (French Part)" | countryname=="Turks and Caicos Islands" | countryname=="Virgin Islands (U.S.)" |countryname=="India" | countryname=="Brazil" | countryname=="China"  




****************************************************************************
*************Dummy of gender quota ****************
*****************************************************************************

generate interaction=0
replace interaction=1 if countryname=="Belgium" & year>=1997
replace interaction=1 if countryname=="Chile" & year>=2015
replace interaction=1 if countryname=="Croatia" & year>=2008
replace interaction=1 if countryname=="France" & year>=1999
replace interaction=1 if countryname=="Greece" & year>=2012
replace interaction=1 if countryname=="Ireland" & year>=2012
replace interaction=1 if countryname=="Korea, Rep." & year>=2000 
replace interaction=1 if countryname=="Poland" & year>=2011
replace interaction=1 if countryname=="Portugal" & year>=2006
replace interaction=1 if countryname=="Slovenia" & year>=2005
replace interaction=1 if countryname=="Spain" & year>=2007
replace interaction=1 if countryname=="Uruguay" & year>=2009

replace interaction=1 if countryname=="Panama" & year>=1997


replace interaction=1 if countryname=="Brazil" & year>=1997
replace interaction=1 if countryname=="Indonesia" & year>=2012
replace interaction=1 if countryname=="Mexico" & year>=1996

*****************second instrument

generate votes=1893
replace votes=1906 if countryname=="Finland"
replace votes=1913 if countryname=="Norway"
replace votes=1915 if countryname=="Denmark"
replace votes=1915 if countryname=="Iceland"
replace votes=1917 if countryname=="Estonia"
replace votes=1917 if countryname=="Latvia"
replace votes=1917 if countryname=="Lithuania"
replace votes=1918 if countryname=="Austria"
replace votes=1918 if countryname=="Germany"
replace votes=1918 if countryname=="Hungary"
replace votes=1918 if countryname=="Poland"
replace votes=1919 if countryname=="Luxembourg"
replace votes=1919 if countryname=="Netherlands"
replace votes=1919 if countryname=="Sweden"
replace votes=1920 if countryname=="Czech Republic"
replace votes=1920 if countryname=="Slovak Republic"
replace votes=1920 if countryname=="United States"
replace votes=1922 if countryname=="Ireland"
replace votes=1928 if countryname=="United Kingdom"
replace votes=1931 if countryname=="Spain"
replace votes=1932 if countryname=="Uruguay"
replace votes=1945 if countryname=="Croatia"
replace votes=1945 if countryname=="France"
replace votes=1945 if countryname=="Italy"
replace votes=1945 if countryname=="Slovenia"
replace votes=1946 if countryname=="Japan"
replace votes=1946 if countryname=="Panama"
replace votes=1946 if countryname=="Trinidad and Tobago"
replace votes=1947 if countryname=="Malta"
replace votes=1948 if countryname=="Belgium"
replace votes=1948 if countryname=="Israel"
replace votes=1948 if countryname=="Korea, Rep."
replace votes=1949 if countryname=="Chile"
replace votes=1952 if countryname=="Greece"
replace votes=1960 if countryname=="Canada"
replace votes=1960 if countryname=="Cyprus"
replace votes=1962 if countryname=="Australia"
replace votes=1976 if countryname=="Portugal"

replace votes=1996 if countryname=="India"
replace votes=1932 if countryname=="Brazil"
replace votes=1947 if countryname=="China"

generate instrument=year-votes


******************************************************************************************************************************************************************************************IV -CLUSTER - HIGH INCOME********************

encode countryname, generate(country)
generate loggdp=log(gdp)

xtset country year


tab year, generate(dyear)
tab country, generate(dcountry)
tab typeparty, generate(dparty)


xtivreg2 s_w_t loggdp dparty* civil_lib dyear2 dyear3 dyear4 dyear5 dyear6 dyear7 dyear8 dyear9 dyear10 dyear11 dyear12 dyear13 dyear14 dyear15 dyear16 dyear17 dyear18 dyear19 dyear20 dyear21 dyear22 dyear23  (seats=interaction instrument), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest dparty1, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty2, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest civil_lib, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)


****Add 9 more countries
clear all
set more off

cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power"

use "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\IEA_final"

merge 1:1 countryname year using  "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\seats_ready" 
drop _merge 


merge 1:1 countryname year using "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\parties_ready"
drop _merge

merge 1:1 countryname year using  "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\Political_Rights_ready"
drop _merge


merge 1:1 countryname year using  "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\civil_liberties_ready"
drop _merge

merge 1:1 countryname year using  "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\GDP_pc_constant_2015 ready"
drop _merge

describe

drop if total_e==. | seats==. | gdp==. | typeparty=="." | typeparty==""  | pol_rights==. | civil_lib==.


keep if countryname=="Andorra" | countryname=="Antigua and Barbuda" | countryname=="Australia" | countryname=="Austria" | countryname=="Bahamas" | countryname=="Bahrain" | countryname=="Barbados" | countryname=="Belgium" | countryname=="Brunei Darussalam" | countryname=="Canada" | countryname=="Chile" | countryname=="Croatia" | countryname=="Cyprus" | countryname=="Czech Republic" | countryname=="Denmark" | countryname=="Estonia" | countryname=="Finland" | countryname=="France" | countryname=="Germany" | countryname=="Greece" | countryname=="Hungary" | countryname=="Iceland" | countryname=="Ireland" | countryname=="Isle of Man" | countryname=="Israel" | countryname=="Italy" | countryname=="Japan" | countryname=="Korea, Rep." | countryname=="Kuwait" | countryname=="Latvia" | countryname=="Liechtenstein" | countryname=="Lithuania" | countryname=="Luxembourg" | countryname=="Malta" | countryname=="Monaco" | countryname=="Netherlands" | countryname=="New Zealand" | countryname=="Norway" | countryname=="Oman" | countryname=="Palau" | countryname=="Panama" | countryname=="Poland" | countryname=="Portugal" | countryname=="Qatar" | countryname=="San Marino" | countryname=="Saudi Arabia" | countryname=="Seychelles" | countryname=="Singapore" | countryname=="Slovak Republic" | countryname=="Slovenia" | countryname=="Spain" | countryname=="St. Kitts and Nevis" | countryname=="Sweden" | countryname=="Switzerland" | countryname=="Trinidad and Tobago" | countryname=="United Arab Emirates" | countryname=="United Kingdom" | countryname=="United States" | countryname=="Uruguay" | countryname=="Bermuda" | countryname=="British Virgin Islands" | countryname=="Cayman Islands" | countryname=="Channel Islands" | countryname=="Curaçao" | countryname=="Faroe Islands"| countryname=="French Polynesia" | countryname=="Gibraltar" | countryname=="Greenland" | countryname=="Guam" | countryname=="Hong Kong" | countryname=="Macao" | countryname=="New Caledonia" | countryname=="Northern Mariana Islands" | countryname=="Puerto Rico" | countryname=="Sint Maarten (Dutch part)" | countryname=="St. Martin (French Part)" | countryname=="Turks and Caicos Islands" | countryname=="Virgin Islands (U.S.)" |countryname=="India" | countryname=="Brazil" | countryname=="China" | countryname=="Indonesia" | countryname=="Mexico" | countryname=="Philippines" | countryname=="South Africa" | countryname=="Thailand" | countryname=="Turkey" 




****************************************************************************
*************Dummy of gender quota ****************
*****************************************************************************

generate interaction=0
replace interaction=1 if countryname=="Belgium" & year>=1997
replace interaction=1 if countryname=="Chile" & year>=2015
replace interaction=1 if countryname=="Croatia" & year>=2008
replace interaction=1 if countryname=="France" & year>=1999
replace interaction=1 if countryname=="Greece" & year>=2012
replace interaction=1 if countryname=="Ireland" & year>=2012
replace interaction=1 if countryname=="Italy" & year >=2017
replace interaction=1 if countryname=="Korea, Rep." & year>=2000 
replace interaction=1 if countryname=="Luxembourg" & year>=2016
replace interaction=1 if countryname=="Panama" & year>=2007
replace interaction=1 if countryname=="Poland" & year>=2011
replace interaction=1 if countryname=="Portugal" & year>=2006
replace interaction=1 if countryname=="Slovenia" & year>=2005
replace interaction=1 if countryname=="Spain" & year>=2007
replace interaction=1 if countryname=="Uruguay" & year>=2009

replace interaction=1 if countryname=="Brazil" & year>=1997
replace interaction=1 if countryname=="Indonesia" & year>=2012
replace interaction=1 if countryname=="Mexico" & year>=1996

*****************second instrument

generate votes=1893
replace votes=1906 if countryname=="Finland"
replace votes=1913 if countryname=="Norway"
replace votes=1915 if countryname=="Denmark"
replace votes=1915 if countryname=="Iceland"
replace votes=1917 if countryname=="Estonia"
replace votes=1917 if countryname=="Latvia"
replace votes=1917 if countryname=="Lithuania"
replace votes=1918 if countryname=="Austria"
replace votes=1918 if countryname=="Germany"
replace votes=1918 if countryname=="Hungary"
replace votes=1918 if countryname=="Poland"
replace votes=1919 if countryname=="Luxembourg"
replace votes=1919 if countryname=="Netherlands"
replace votes=1919 if countryname=="Sweden"
replace votes=1920 if countryname=="Czech Republic"
replace votes=1920 if countryname=="Slovak Republic"
replace votes=1920 if countryname=="United States"
replace votes=1922 if countryname=="Ireland"
replace votes=1928 if countryname=="United Kingdom"
replace votes=1931 if countryname=="Spain"
replace votes=1932 if countryname=="Uruguay"
replace votes=1945 if countryname=="Croatia"
replace votes=1945 if countryname=="France"
replace votes=1945 if countryname=="Italy"
replace votes=1945 if countryname=="Slovenia"
replace votes=1946 if countryname=="Japan"
replace votes=1946 if countryname=="Panama"
replace votes=1946 if countryname=="Trinidad and Tobago"
replace votes=1947 if countryname=="Malta"
replace votes=1948 if countryname=="Belgium"
replace votes=1948 if countryname=="Israel"
replace votes=1948 if countryname=="Korea, Rep."
replace votes=1949 if countryname=="Chile"
replace votes=1952 if countryname=="Greece"
replace votes=1960 if countryname=="Canada"
replace votes=1960 if countryname=="Cyprus"
replace votes=1962 if countryname=="Australia"
replace votes=1976 if countryname=="Portugal"

replace votes=1996 if countryname=="India"
replace votes=1932 if countryname=="Brazil"
replace votes=1947 if countryname=="China"

replace votes=1945 if countryname=="Indonesia"
replace votes=1953 if countryname=="Mexico"
replace votes=1937 if countryname=="Philippines"
replace votes=1993 if countryname=="South Africa"
replace votes=1932 if countryname=="Thailand"
replace votes=1930 if countryname=="Turkey"

generate instrument=year-votes

******************************************************************************************************************************************************************************************IV -CLUSTER - HIGH INCOME********************

encode countryname, generate(country)
generate loggdp=log(gdp)

xtset country year


tab year, generate(dyear)
tab country, generate(dcountry)
tab typeparty, generate(dparty)


xtivreg2 s_w_t loggdp dparty* civil_lib dyear2 dyear3 dyear4 dyear5 dyear6 dyear7 dyear8 dyear9 dyear10 dyear11 dyear12 dyear13 dyear14 dyear15 dyear16 dyear17 dyear18 dyear19 dyear20 dyear21 dyear22 dyear23  (seats=interaction instrument), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest dparty1, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty2, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest civil_lib, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)




****************************************************************************************************************************************************************************************
************************************************************************************************************************WITH HYDRO:******************************
***************************************************************************************************************************************************************************************
clear all
set more off

cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power"

use "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\IEA_final"


merge 1:1 countryname year using  "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\seats_ready" 
drop _merge 
*the difference in observations are year<1997 + year>2020 + a few high income countries that have no information in electricity production: Andorra, Antigua and Barbuda,  Bahamas, Barbados, Bermuda, British Virgin Islands, Cayman Islands, Channel Islands, Faroe Islands, French Polynesia, Greenland,  Guam, Isle of Man, Liechtenstein, Macao, Monaco, New Caledonia, Northern Mariana Islands, Palau, Puerto Rico, San Marino, Seychelles, Sint Maarten (Dutch part), St. Kitts and Nevis, Turks and Caicos Islands, Virgin Islands (U.S.)


merge 1:1 countryname year using "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\parties_ready"
drop _merge
*the difference in observations are year<1997 + a few high income countries that have no information in electricity production: Bahamas, BArbados and Turks and Caicos Island, + some countries that have no niformation on parties: Curacao, Gibraltar, and Hong Kong

merge 1:1 countryname year using  "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\Political_Rights_ready"
drop _merge
* the difference in observations are year<1997 + year>2020 + a few high income countries that have no information in electricity production Andorra, Antigua and Barbuda, Bahamas, Barbados, Liechtenstein, Monaco, Palau, San Marino, Seychelles, St. Kitts and Nevis, + no information in political rights: Curaçao, Gibraltar, Hong Kong.

merge 1:1 countryname year using  "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\civil_liberties_ready"
drop _merge
* the difference in observations are year<1997 + year>2020 + a few high income countries that have no information in electricity production Andorra, Antigua and Barbuda, Bahamas, Barbados, Liechtenstein, Monaco, Palau, San Marino, Seychelles, St. Kitts and Nevis, + no information in political rights: Curaçao, Gibraltar, Hong Kong.

merge 1:1 countryname year using  "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\GDP_pc_constant_2015 ready"
drop _merge
*the difference in observations are year<1997 + year>2020 + a few high income countries that have no information in electricity production: Andorra, Antigua and Barbuda,  Bahamas, Barbados, Bermuda, British Virgin Islands, Cayman Islands, Channel Islands, Faroe Islands, French Polynesia, Greenland,  Guam, Isle of Man, Liechtenstein, Macao, Monaco, New Caledonia, Northern Mariana Islands, Palau, Puerto Rico, San Marino, Seychelles, Sint Maarten (Dutch part), St. Kitts and Nevis, Turks and Caicos Islands, Virgin Islands (U.S.)

*merge 1:1 countryname year using "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\pop_tot_ready"
*drop _merge

describe


drop if total_e==. | seats==. | gdp==. | typeparty=="" | typeparty=="." | pol_rights==. | civil_lib==.

**# Bookmark #1
keep if countryname=="Andorra" | countryname=="Antigua and Barbuda" | countryname=="Australia" | countryname=="Austria" | countryname=="Bahamas" | countryname=="Bahrain" | countryname=="Barbados" | countryname=="Belgium" | countryname=="Brunei Darussalam" | countryname=="Canada" | countryname=="Chile" | countryname=="Croatia" | countryname=="Cyprus" | countryname=="Czechia" | countryname=="Denmark" | countryname=="Estonia" | countryname=="Finland" | countryname=="France" | countryname=="Germany" | countryname=="Greece" | countryname=="Hungary" | countryname=="Iceland" | countryname=="Ireland" | countryname=="Isle of Man" | countryname=="Israel" | countryname=="Italy" | countryname=="Japan" | countryname=="Korea, Rep." | countryname=="Kuwait" | countryname=="Latvia" | countryname=="Liechtenstein" | countryname=="Lithuania" | countryname=="Luxembourg" | countryname=="Malta" | countryname=="Monaco" | countryname=="Netherlands" | countryname=="New Zealand" | countryname=="Norway" | countryname=="Oman" | countryname=="Palau" | countryname=="Panama" | countryname=="Poland" | countryname=="Portugal" | countryname=="Qatar" | countryname=="San Marino" | countryname=="Saudi Arabia" | countryname=="Seychelles" | countryname=="Singapore" | countryname=="Slovak Republic" | countryname=="Slovenia" | countryname=="Spain" | countryname=="St. Kitts and Nevis" | countryname=="Sweden" | countryname=="Switzerland" | countryname=="Trinidad and Tobago" | countryname=="United Arab Emirates" | countryname=="United Kingdom" | countryname=="United States" | countryname=="Uruguay" | countryname=="Bermuda" | countryname=="British Virgin Islands" | countryname=="Cayman Islands" | countryname=="Channel Islands" | countryname=="Curaçao" | countryname=="Faroe Islands"| countryname=="French Polynesia" | countryname=="Gibraltar" | countryname=="Greenland" | countryname=="Guam" | countryname=="Hong Kong" | countryname=="Macao" | countryname=="New Caledonia" | countryname=="Northern Mariana Islands" | countryname=="Puerto Rico" | countryname=="Sint Maarten (Dutch part)" | countryname=="St. Martin (French Part)" | countryname=="Turks and Caicos Islands" | countryname=="Virgin Islands (U.S.)" 
*|countryname=="India" | countryname=="Brazil" | countryname=="China" | countryname=="Indonesia" | countryname=="Mexico" | countryname=="Philippines" | countryname=="South Africa" | countryname=="Thailand" | countryname=="Turkey" 




****************************************************************************
*************Dummy of gender quota ****************
*****************************************************************************

generate interaction=0
replace interaction=1 if countryname=="Belgium" & year>=1997
replace interaction=1 if countryname=="Chile" & year>=2015
replace interaction=1 if countryname=="Croatia" & year>=2008
replace interaction=1 if countryname=="France" & year>=1999
replace interaction=1 if countryname=="Greece" & year>=2012
replace interaction=1 if countryname=="Ireland" & year>=2012
replace interaction=1 if countryname=="Italy" & year >=2017
replace interaction=1 if countryname=="Korea, Rep." & year>=2000 
replace interaction=1 if countryname=="Luxembourg" & year>=2016
replace interaction=1 if countryname=="Panama" & year>=2007
replace interaction=1 if countryname=="Poland" & year>=2011
replace interaction=1 if countryname=="Portugal" & year>=2006
replace interaction=1 if countryname=="Slovenia" & year>=2005
replace interaction=1 if countryname=="Spain" & year>=2007
replace interaction=1 if countryname=="Uruguay" & year>=2009


******************************************************************************************************************************************************************************************IV -CLUSTER - HIGH INCOME********************

encode countryname, generate(country)
generate loggdp=log(gdp)

xtset country year


tab year, generate(dyear)
tab country, generate(dcountry)
tab typeparty, generate(dparty)


*******************************************************************************************
*******************************************************************************************************************************try other instrument*************************************
****************************************************************************************************************************************************************************************

generate votes=1893
replace votes=1906 if countryname=="Finland"
replace votes=1913 if countryname=="Norway"
replace votes=1915 if countryname=="Denmark"
replace votes=1915 if countryname=="Iceland"
replace votes=1917 if countryname=="Estonia"
replace votes=1917 if countryname=="Latvia"
replace votes=1917 if countryname=="Lithuania"
replace votes=1918 if countryname=="Austria"
replace votes=1918 if countryname=="Germany"
replace votes=1918 if countryname=="Hungary"
replace votes=1918 if countryname=="Poland"
replace votes=1919 if countryname=="Luxembourg"
replace votes=1919 if countryname=="Netherlands"
replace votes=1919 if countryname=="Sweden"
replace votes=1920 if countryname=="Czech Republic"
replace votes=1920 if countryname=="Slovak Republic"
replace votes=1920 if countryname=="United States"
replace votes=1922 if countryname=="Ireland"
replace votes=1928 if countryname=="United Kingdom"
replace votes=1931 if countryname=="Spain"
replace votes=1932 if countryname=="Uruguay"
replace votes=1945 if countryname=="Croatia"
replace votes=1945 if countryname=="France"
replace votes=1945 if countryname=="Italy"
replace votes=1945 if countryname=="Slovenia"
replace votes=1946 if countryname=="Japan"
replace votes=1946 if countryname=="Panama"
replace votes=1946 if countryname=="Trinidad and Tobago"
replace votes=1947 if countryname=="Malta"
replace votes=1948 if countryname=="Belgium"
replace votes=1948 if countryname=="Israel"
replace votes=1948 if countryname=="Korea, Rep."
replace votes=1949 if countryname=="Chile"
replace votes=1952 if countryname=="Greece"
replace votes=1960 if countryname=="Canada"
replace votes=1960 if countryname=="Cyprus"
replace votes=1962 if countryname=="Australia"
replace votes=1976 if countryname=="Portugal"

generate instrument=year-votes

generate s_w_h_t = ((Solarthermal + SolarPV + Wind + Hydro + Tide)/total_e)*100

summ

xtivreg2 s_w_h_t  dyear2 dyear3 dyear4 dyear5 dyear6 dyear7 dyear8 dyear9 dyear10 dyear11 dyear12 dyear13 dyear14 dyear15 dyear16 dyear17 dyear18 dyear19 dyear20 dyear21 dyear22 dyear23 (seats=instrument interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)


xtivreg2 s_w_h_t loggdp dyear2 dyear3 dyear4 dyear5 dyear6 dyear7 dyear8 dyear9 dyear10 dyear11 dyear12 dyear13 dyear14 dyear15 dyear16 dyear17 dyear18 dyear19 dyear20 dyear21 dyear22 dyear23 (seats=instrument interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
 
 

xtivreg2 s_w_h_t loggdp dparty*  dyear2 dyear3 dyear4 dyear5 dyear6 dyear7 dyear8 dyear9 dyear10 dyear11 dyear12 dyear13 dyear14 dyear15 dyear16 dyear17 dyear18 dyear19 dyear20 dyear21 dyear22 dyear23 (seats=instrument interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty1, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty2, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)





xtivreg2 s_w_h_t loggdp dparty* civil_lib  dyear2 dyear3 dyear4 dyear5 dyear6 dyear7 dyear8 dyear9 dyear10 dyear11 dyear12 dyear13 dyear14 dyear15 dyear16 dyear17 dyear18 dyear19 dyear20 dyear21 dyear22 dyear23 (seats=instrument interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty1, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty2, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest civil_lib, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)


****************************************************************************************************************************************************************************************
************************************************************************************************************************WITH Biomass:******************************
***************************************************************************************************************************************************************************************
clear all
set more off

cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power"

use "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\IEA_final"


merge 1:1 countryname year using  "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\seats_ready" 
drop _merge 
*the difference in observations are year<1997 + year>2020 + a few high income countries that have no information in electricity production: Andorra, Antigua and Barbuda,  Bahamas, Barbados, Bermuda, British Virgin Islands, Cayman Islands, Channel Islands, Faroe Islands, French Polynesia, Greenland,  Guam, Isle of Man, Liechtenstein, Macao, Monaco, New Caledonia, Northern Mariana Islands, Palau, Puerto Rico, San Marino, Seychelles, Sint Maarten (Dutch part), St. Kitts and Nevis, Turks and Caicos Islands, Virgin Islands (U.S.)


merge 1:1 countryname year using "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\parties_ready"
drop _merge
*the difference in observations are year<1997 + a few high income countries that have no information in electricity production: Bahamas, BArbados and Turks and Caicos Island, + some countries that have no niformation on parties: Curacao, Gibraltar, and Hong Kong

merge 1:1 countryname year using  "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\Political_Rights_ready"
drop _merge
* the difference in observations are year<1997 + year>2020 + a few high income countries that have no information in electricity production Andorra, Antigua and Barbuda, Bahamas, Barbados, Liechtenstein, Monaco, Palau, San Marino, Seychelles, St. Kitts and Nevis, + no information in political rights: Curaçao, Gibraltar, Hong Kong.

merge 1:1 countryname year using  "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\civil_liberties_ready"
drop _merge
* the difference in observations are year<1997 + year>2020 + a few high income countries that have no information in electricity production Andorra, Antigua and Barbuda, Bahamas, Barbados, Liechtenstein, Monaco, Palau, San Marino, Seychelles, St. Kitts and Nevis, + no information in political rights: Curaçao, Gibraltar, Hong Kong.

merge 1:1 countryname year using  "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\GDP_pc_constant_2015 ready"
drop _merge
*the difference in observations are year<1997 + year>2020 + a few high income countries that have no information in electricity production: Andorra, Antigua and Barbuda,  Bahamas, Barbados, Bermuda, British Virgin Islands, Cayman Islands, Channel Islands, Faroe Islands, French Polynesia, Greenland,  Guam, Isle of Man, Liechtenstein, Macao, Monaco, New Caledonia, Northern Mariana Islands, Palau, Puerto Rico, San Marino, Seychelles, Sint Maarten (Dutch part), St. Kitts and Nevis, Turks and Caicos Islands, Virgin Islands (U.S.)

*merge 1:1 countryname year using "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\pop_tot_ready"
*drop _merge

describe


drop if total_e==. | seats==. | gdp==. | typeparty=="" | typeparty=="." | pol_rights==. | civil_lib==.

**# Bookmark #1
keep if countryname=="Andorra" | countryname=="Antigua and Barbuda" | countryname=="Australia" | countryname=="Austria" | countryname=="Bahamas" | countryname=="Bahrain" | countryname=="Barbados" | countryname=="Belgium" | countryname=="Brunei Darussalam" | countryname=="Canada" | countryname=="Chile" | countryname=="Croatia" | countryname=="Cyprus" | countryname=="Czechia" | countryname=="Denmark" | countryname=="Estonia" | countryname=="Finland" | countryname=="France" | countryname=="Germany" | countryname=="Greece" | countryname=="Hungary" | countryname=="Iceland" | countryname=="Ireland" | countryname=="Isle of Man" | countryname=="Israel" | countryname=="Italy" | countryname=="Japan" | countryname=="Korea, Rep." | countryname=="Kuwait" | countryname=="Latvia" | countryname=="Liechtenstein" | countryname=="Lithuania" | countryname=="Luxembourg" | countryname=="Malta" | countryname=="Monaco" | countryname=="Netherlands" | countryname=="New Zealand" | countryname=="Norway" | countryname=="Oman" | countryname=="Palau" | countryname=="Panama" | countryname=="Poland" | countryname=="Portugal" | countryname=="Qatar" | countryname=="San Marino" | countryname=="Saudi Arabia" | countryname=="Seychelles" | countryname=="Singapore" | countryname=="Slovak Republic" | countryname=="Slovenia" | countryname=="Spain" | countryname=="St. Kitts and Nevis" | countryname=="Sweden" | countryname=="Switzerland" | countryname=="Trinidad and Tobago" | countryname=="United Arab Emirates" | countryname=="United Kingdom" | countryname=="United States" | countryname=="Uruguay" | countryname=="Bermuda" | countryname=="British Virgin Islands" | countryname=="Cayman Islands" | countryname=="Channel Islands" | countryname=="Curaçao" | countryname=="Faroe Islands"| countryname=="French Polynesia" | countryname=="Gibraltar" | countryname=="Greenland" | countryname=="Guam" | countryname=="Hong Kong" | countryname=="Macao" | countryname=="New Caledonia" | countryname=="Northern Mariana Islands" | countryname=="Puerto Rico" | countryname=="Sint Maarten (Dutch part)" | countryname=="St. Martin (French Part)" | countryname=="Turks and Caicos Islands" | countryname=="Virgin Islands (U.S.)" 
*|countryname=="India" | countryname=="Brazil" | countryname=="China" | countryname=="Indonesia" | countryname=="Mexico" | countryname=="Philippines" | countryname=="South Africa" | countryname=="Thailand" | countryname=="Turkey" 




****************************************************************************
*************Dummy of gender quota ****************
*****************************************************************************

generate interaction=0
replace interaction=1 if countryname=="Belgium" & year>=1997
replace interaction=1 if countryname=="Chile" & year>=2015
replace interaction=1 if countryname=="Croatia" & year>=2008
replace interaction=1 if countryname=="France" & year>=1999
replace interaction=1 if countryname=="Greece" & year>=2012
replace interaction=1 if countryname=="Ireland" & year>=2012
replace interaction=1 if countryname=="Italy" & year >=2017
replace interaction=1 if countryname=="Korea, Rep." & year>=2000 
replace interaction=1 if countryname=="Luxembourg" & year>=2016
replace interaction=1 if countryname=="Panama" & year>=2007
replace interaction=1 if countryname=="Poland" & year>=2011
replace interaction=1 if countryname=="Portugal" & year>=2006
replace interaction=1 if countryname=="Slovenia" & year>=2005
replace interaction=1 if countryname=="Spain" & year>=2007
replace interaction=1 if countryname=="Uruguay" & year>=2009


******************************************************************************************************************************************************************************************IV -CLUSTER - HIGH INCOME********************

encode countryname, generate(country)
generate loggdp=log(gdp)

xtset country year


tab year, generate(dyear)
tab country, generate(dcountry)
tab typeparty, generate(dparty)


*******************************************************************************************
*******************************************************************************************************************************try other instrument*************************************
****************************************************************************************************************************************************************************************

generate votes=1893
replace votes=1906 if countryname=="Finland"
replace votes=1913 if countryname=="Norway"
replace votes=1915 if countryname=="Denmark"
replace votes=1915 if countryname=="Iceland"
replace votes=1917 if countryname=="Estonia"
replace votes=1917 if countryname=="Latvia"
replace votes=1917 if countryname=="Lithuania"
replace votes=1918 if countryname=="Austria"
replace votes=1918 if countryname=="Germany"
replace votes=1918 if countryname=="Hungary"
replace votes=1918 if countryname=="Poland"
replace votes=1919 if countryname=="Luxembourg"
replace votes=1919 if countryname=="Netherlands"
replace votes=1919 if countryname=="Sweden"
replace votes=1920 if countryname=="Czech Republic"
replace votes=1920 if countryname=="Slovak Republic"
replace votes=1920 if countryname=="United States"
replace votes=1922 if countryname=="Ireland"
replace votes=1928 if countryname=="United Kingdom"
replace votes=1931 if countryname=="Spain"
replace votes=1932 if countryname=="Uruguay"
replace votes=1945 if countryname=="Croatia"
replace votes=1945 if countryname=="France"
replace votes=1945 if countryname=="Italy"
replace votes=1945 if countryname=="Slovenia"
replace votes=1946 if countryname=="Japan"
replace votes=1946 if countryname=="Panama"
replace votes=1946 if countryname=="Trinidad and Tobago"
replace votes=1947 if countryname=="Malta"
replace votes=1948 if countryname=="Belgium"
replace votes=1948 if countryname=="Israel"
replace votes=1948 if countryname=="Korea, Rep."
replace votes=1949 if countryname=="Chile"
replace votes=1952 if countryname=="Greece"
replace votes=1960 if countryname=="Canada"
replace votes=1960 if countryname=="Cyprus"
replace votes=1962 if countryname=="Australia"
replace votes=1976 if countryname=="Portugal"

generate instrument=year-votes

summ

xtivreg2 s_w_bio_t dyear2 dyear3 dyear4 dyear5 dyear6 dyear7 dyear8 dyear9 dyear10 dyear11 dyear12 dyear13 dyear14 dyear15 dyear16 dyear17 dyear18 dyear19 dyear20 dyear21 dyear22 dyear23 (seats=instrument interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
 

xtivreg2 s_w_bio_t loggdp  dyear2 dyear3 dyear4 dyear5 dyear6 dyear7 dyear8 dyear9 dyear10 dyear11 dyear12 dyear13 dyear14 dyear15 dyear16 dyear17 dyear18 dyear19 dyear20 dyear21 dyear22 dyear23 (seats=instrument interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)

 

xtivreg2 s_w_bio_t loggdp dparty* dyear2 dyear3 dyear4 dyear5 dyear6 dyear7 dyear8 dyear9 dyear10 dyear11 dyear12 dyear13 dyear14 dyear15 dyear16 dyear17 dyear18 dyear19 dyear20 dyear21 dyear22 dyear23 (seats=instrument interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty1, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty2, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)



xtivreg2 s_w_bio_t loggdp dparty* civil_lib  dyear2 dyear3 dyear4 dyear5 dyear6 dyear7 dyear8 dyear9 dyear10 dyear11 dyear12 dyear13 dyear14 dyear15 dyear16 dyear17 dyear18 dyear19 dyear20 dyear21 dyear22 dyear23 (seats=instrument interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty1, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty2, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest civil_lib, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)

**************************************
**************graphs:
preserve
collapse seats, by(year)
twoway (line seats year) 
 graph save "Graph" "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\graphs\female_participation.gph", replace
restore

preserve
collapse s_w_t, by(year)
twoway (line s_w_t year) 
 graph save "Graph" "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\graphs\s_w_t.gph", replace
restore

preserve
keep if  countryname=="Austria" |  countryname=="Belgium"| countryname=="Croatia" | countryname=="Cyprus" | countryname=="Czechia" | countryname=="Denmark" | countryname=="Estonia" | countryname=="Finland" | countryname=="France" | countryname=="Germany" | countryname=="Greece" | countryname=="Hungary" | countryname=="Ireland"   | countryname=="Italy"  | countryname=="Latvia"  | countryname=="Lithuania" | countryname=="Luxembourg" | countryname=="Malta"  | countryname=="Netherlands" | countryname=="Poland" | countryname=="Portugal" | countryname=="Slovak Republic" | countryname=="Slovenia" | countryname=="Spain"  | countryname=="Sweden"
collapse s_w_t, by(year)
twoway (line s_w_t year) 
 graph save "Graph" "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\graphs\europe_s_w_t.gph", replace
restore




log close 

translate final_version.smcl final_version.pdf, replace
