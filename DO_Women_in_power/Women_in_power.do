

clear all

log using final_version, replace

*****************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
***************************************************************************************************************************WITHOUT HYDRO*******************************************
***************41 countries*************************************************
***********************************************************************************************************************************************************************************
clear all
set more off

use "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\energywb(nohydro) ready"


merge 1:1 countryname year using  "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\seats ready" 
drop _merge 
merge 1:1 countryname year using "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\parties ready"
drop _merge
merge 1:1 countryname year using  "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\Political Rights ready"
drop _merge
merge 1:1 countryname year using  "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\civil liberties ready"
drop _merge
merge 1:1 countryname year using  "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\GDP pc constant 2010 ready"
drop _merge
merge 1:1 countryname year using "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\final RDD Renewables Gov ready 2"
drop _merge

describe


replace energywb_nohydro=0 if countryname=="Bahamas"
replace energywb_nohydro=0 if countryname=="Barbados"

drop if energywb_nohydro==. | seats==. | gdp==. | typeparty==. | pol_rights==. | civil_lib==.

keep if countryname=="Andorra" | countryname=="Antigua and Barbuda" | countryname=="Australia" | countryname=="Austria" | countryname=="Bahamas" | countryname=="Bahrain" | countryname=="Barbados" | countryname=="Belgium" | countryname=="Brunei Darussalam" | countryname=="Canada" | countryname=="Chile" | countryname=="Croatia" | countryname=="Cyprus" | countryname=="Czech Republic" | countryname=="Denmark" | countryname=="Estonia" | countryname=="Finland" | countryname=="France" | countryname=="Germany" | countryname=="Greece" | countryname=="Hungary" | countryname=="Iceland" | countryname=="Ireland" | countryname=="Isle of Man" | countryname=="Israel" | countryname=="Italy" | countryname=="Japan" | countryname=="Korea, Rep." | countryname=="Kuwait" | countryname=="Latvia" | countryname=="Liechtenstein" | countryname=="Lithuania" | countryname=="Luxembourg" | countryname=="Malta" | countryname=="Monaco" | countryname=="Netherlands" | countryname=="New Zealand" | countryname=="Norway" | countryname=="Oman" | countryname=="Palau" | countryname=="Panama" | countryname=="Poland" | countryname=="Portugal" | countryname=="Qatar" | countryname=="San Marino" | countryname=="Saudi Arabia" | countryname=="Seychelles" | countryname=="Singapore" | countryname=="Slovak Republic" | countryname=="Slovenia" | countryname=="Spain" | countryname=="St. Kitts and Nevis" | countryname=="Sweden" | countryname=="Switzerland" | countryname=="Trinidad and Tobago" | countryname=="United Arab Emirates" | countryname=="United Kingdom" | countryname=="United States" | countryname=="Uruguay" | countryname=="Bermuda" | countryname=="British Virgin Islands" | countryname=="Cayman Islands" | countryname=="Channel Islands" | countryname=="Curaçao" | countryname=="Faroe Islands"| countryname=="French Polynesia" | countryname=="Gibraltar" | countryname=="Greenland" | countryname=="Guam" | countryname=="Hong Kong" | countryname=="Macao" | countryname=="New Caledonia" | countryname=="Northern Mariana Islands" | countryname=="Puerto Rico" | countryname=="Sint Maarten (Dutch part)" | countryname=="St. Martin (French Part)" | countryname=="Turks and Caicos Islands" | countryname=="Virgin Islands (U.S.)" 
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
replace interaction=1 if countryname=="Korea, Rep." & year>=2000 
replace interaction=1 if countryname=="Poland" & year>=2011
replace interaction=1 if countryname=="Portugal" & year>=2006
replace interaction=1 if countryname=="Slovenia" & year>=2005
replace interaction=1 if countryname=="Spain" & year>=2007
replace interaction=1 if countryname=="Uruguay" & year>=2009

replace interaction=1 if countryname=="Panama" & year>=1997

*replace interaction=1 if countryname=="Brazil" & year>=1997
*replace interaction=1 if countryname=="Indonesia" & year>=2012
*replace interaction=1 if countryname=="Mexico" & year>=1996

******************************************************************************************************************************************************************************************IV -CLUSTER - HIGH INCOME********************

encode countryname, generate(country)
generate loggdp=log(gdp)

xtset country year


tab year, generate(dyear)
tab country, generate(dcountry)
tab typeparty, generate(dparty)

summarize

xtivreg2 energywb_nohydro dyear* (seats=interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 


xtivreg2 energywb_nohydro loggdp dyear* (seats=interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 



xtivreg2 energywb_nohydro loggdp dparty* dyear* (seats=interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest dparty1, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty2, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)


xtivreg2 energywb_nohydro loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest dparty1, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty2, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest civil_lib, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)




***********************************************************************************************************************************************************************************************************REDUCED FORM************************************************************

xtivreg2 energywb_nohydro interaction dyear*, fe cluster(country)


xtivreg2 energywb_nohydro interaction  loggdp  dyear*, fe cluster(country)

xtivreg2 energywb_nohydro interaction  loggdp dparty* dyear*, fe cluster(country)

xtivreg2 energywb_nohydro interaction  loggdp dparty* civil_lib dyear*, fe cluster(country)


******************************************************************************************************************************************************************************************WITHOUT IV***********************************


xtreg energywb_nohydro seats loggdp dparty* civil_lib  i.year, fe vce(cluster country)
boottest seats, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321) 
boottest loggdp, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321) 
boottest dparty1, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321)
boottest dparty2, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321)
boottest civil_lib, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321)


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

generate dummy_3= 1 - dummy_2

generate type3= dummy_3*seats
generate inst_3 = dummy_3*interaction


xtivreg2 energywb_nohydro loggdp dparty* civil_lib dyear* (seats type3 =interaction inst_3), fe cluster(country) first 

boottest seats, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321) nograph
boottest type3, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321) nograph
boottest loggdp, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321) nograph
boottest dparty1, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321) nograph
boottest dparty2, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321) nograph
boottest civil_lib, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321) nograph


************ beta without the standardeviation*******************************************
************************************************************************************************************************************************************************************

summ

generate z_energywb_nohydro = (energywb_nohydro -  5.542838)/ 7.77492 
generate z_seats= (seats-21.39957)/10.79363
generate z_loggdp=(loggdp-10.25179)/0.6308401
generate z_civil_lib=(civil_lib-1.319149)/0.5372376


generate z_party1=(dparty1 - 0.4851064 )/0.500133 
generate z_party2=(dparty2 - 0.1404255 )/0.3476746 
generate z_party3=(dparty3 - 0.3744681 )/0.4843289

generate z_interactio=(interaction - 0.1588652 ) / 0.3658099

xtivreg2 z_energywb_nohydro z_loggdp z_party1 z_party2 z_civil_lib dyear* (z_seats=interaction), fe cluster(country) first
//2.282179  


xtivreg2 energywb_nohydro loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first

generate check = (1.64391 *10.79363)/7.77492
tab check
// 2.282179

***compare treatment with control group

preserve
keep energywb_nohydro seats loggdp dparty* civil_lib interaction
summ if interaction==1
summ if interaction==0
restore

**************Women*civil liberties interaction**************
generate women_liberties=seats*civil_lib
generate interaction_2= interaction*civil_lib

xtivreg2 energywb_nohydro loggdp dparty* civil_lib women_liberties dyear* (seats women_liberties =interaction interaction_2), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321) nograph
boottest women_liberties, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321) nograph
boottest loggdp, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321) nograph
boottest dparty1, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321) nograph
boottest dparty2, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321) nograph
boottest civil_lib, boottype(wild) bootcluster(country) cluster(country)  reps(9999) seed(321) nograph



********************************************************************************************
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
replace votes=1950 if countryname=="Barbados"
replace votes=1952 if countryname=="Greece"
replace votes=1960 if countryname=="Canada"
replace votes=1960 if countryname=="Cyprus"
replace votes=1962 if countryname=="Australia"
replace votes=1962 if countryname=="Bahamas"
replace votes=1976 if countryname=="Portugal"

generate instrument=year-votes

summ

xtivreg2 energywb_nohydro  dyear2 dyear3 dyear4 dyear5 dyear6 dyear7 dyear8 dyear9 dyear10 dyear11 dyear12 dyear12 dyear14 dyear15 dyear16 dyear17 dyear18 dyear19 dyear20 (seats=instrument), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)

xtivreg2 energywb_nohydro loggdp   dyear2 dyear3 dyear4 dyear5 dyear6 dyear7 dyear8 dyear9 dyear10 dyear11 dyear12 dyear12 dyear14 dyear15 dyear16 dyear17 dyear18 dyear19 dyear20 (seats=instrument), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)

xtivreg2 energywb_nohydro loggdp dparty*  dyear2 dyear3 dyear4 dyear5 dyear6 dyear7 dyear8 dyear9 dyear10 dyear11 dyear12 dyear12 dyear14 dyear15 dyear16 dyear17 dyear18 dyear19 dyear20 (seats=instrument), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty1, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty2, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)

xtivreg2 energywb_nohydro loggdp dparty* civil_lib  dyear2 dyear3 dyear4 dyear5 dyear6 dyear7 dyear8 dyear9 dyear10 dyear11 dyear12 dyear12 dyear14 dyear15 dyear16 dyear17 dyear18 dyear19 dyear20 (seats=instrument), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty1, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty2, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest civil_lib, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)



************************************************************************************************************************************************************************************************************************************************************************************
************************OVERIDENTIFICATION TEST - HANSEN

xtivreg2 energywb loggdp dparty* civil_lib  dyear2 dyear3 dyear4 dyear5 dyear6 dyear7 dyear8 dyear9 dyear10 dyear11 dyear12 dyear12 dyear14 dyear15 dyear16 dyear17 dyear18 dyear19 dyear20 (seats=instrument interaction), fe cluster(country) first


// I am not able to reject the null hypothesis 






******************************************************************************************************************************************************************************************Robustness****************************************************************************************************************************************************************************

********************Robustness check*****************************************
*******************CHANGE THE YEAR OF LAW QUOTAS FOR 2 YEARS***************
*****************************************************************************
*************Dummy of gender quota ****************
*****************************************************************************

generate robust1=0
replace robust1=1 if countryname=="Belgium" & year>=1990 // 1997 
replace robust1=1 if countryname=="Chile" & year>=2013 // 2015
replace robust1=1 if countryname=="Croatia" & year>=2006 //2008
replace robust1=1 if countryname=="France" & year>=1997 // 1999
replace robust1=1 if countryname=="Greece" & year>=2010 // 2012
replace robust1=1 if countryname=="Ireland" & year>=2010 // 2012
replace robust1=1 if countryname=="Korea, Rep." & year>=1998 //2000
replace robust1=1 if countryname=="Poland" & year>=2009 // 2011
replace robust1=1 if countryname=="Portugal" & year>=2004 // 2006
replace robust1=1 if countryname=="Slovenia" & year>=2003 //2005
replace robust1=1 if countryname=="Spain" & year>=2005 // 2007
replace robust1=1 if countryname=="Uruguay" & year>=2007 // 2009
replace robust1=1 if countryname=="Panama" & year>=1990 // 1997


xtivreg2 energywb_nohydro loggdp dparty* civil_lib dyear* (seats=robust1), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest dparty1, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty2, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest civil_lib, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)

********************Robustness check*****************************************
*******************CHANGE THE YEAR OF LAW QUOTAS FOR 4 YEARS***************
*****************************************************************************
*************Dummy of gender quota ****************
*****************************************************************************


generate robust2=0
replace robust2=1 if countryname=="Belgium" & year>=1988 // 1997 
replace robust2=1 if countryname=="Chile" & year>=2011 // 2015
replace robust2=1 if countryname=="Croatia" & year>=2004 //2008
replace robust2=1 if countryname=="France" & year>=1990 // 1999
replace robust2=1 if countryname=="Greece" & year>=2008 // 2012
replace robust2=1 if countryname=="Ireland" & year>=2008 // 2012
replace robust2=1 if countryname=="Korea, Rep." & year>=1990 //2000
replace robust2=1 if countryname=="Poland" & year>=2007 // 2011
replace robust2=1 if countryname=="Portugal" & year>=2002 // 2006
replace robust2=1 if countryname=="Slovenia" & year>=2001 // 2005
replace robust2=1 if countryname=="Spain" & year>=2003 // 2007
replace robust2=1 if countryname=="Uruguay" & year>=2007 // 2009
replace robust2=1 if countryname=="Panama" & year>=1990 // 1997


xtivreg2 energywb_nohydro loggdp dparty* civil_lib dyear* (seats=robust2), fe cluster(country) first  
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest dparty1, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty2, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest civil_lib, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)


********************Robustness check*****************************************
*******************DO THE QUOTA YEAR A RANDOM CHOICE***************

*also tried with 123456789 and is not significative p-value 0.3*

/*
preserve
set seed 321
collapse energy, by(countryname)
generate robustr=runiformint(1990,2015) 
restore
*/

generate robustr=0
replace robustr=1 if countryname=="Belgium" & year>=1998
replace robustr=1 if countryname=="Croatia" & year>=2015
replace robustr=1 if countryname=="Chile" & year>=1995
replace robustr=1 if countryname=="France" & year>=2013
replace robustr=1 if countryname=="Greece" & year>=2012
replace robustr=1 if countryname=="Ireland" & year>=1998
replace robustr=1 if countryname=="Korea, Rep." & year>=1993
replace robustr=1 if countryname=="Poland" & year>=2015
replace robustr=1 if countryname=="Portugal" & year>=2004
replace robustr=1 if countryname=="Slovenia" & year>=2014
replace robustr=1 if countryname=="Spain" & year>=1997
replace robustr=1 if countryname=="Uruguay" & year>=2000
replace robustr=1 if countryname=="Panama" & year>=2002


xtivreg2 energywb_nohydro loggdp dparty* civil_lib dyear* (seats=robustr), fe cluster(country) first 
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest dparty1, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty2, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest civil_lib, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)


********************Robustness check**************************************
********************DROP YEAR 1990****************************************

preserve
drop if year==1990

*xtivreg2 energywb_nohydro loggdp typeparty civil_lib dyear* (seats=interaction), fe cluster(country) first 

xtivreg2 energywb_nohydro loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest dparty1, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty2, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest civil_lib, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
restore

*************************************difference in means

generate yr1990= dyear1*seats


xtivreg2 energywb_nohydro loggdp dparty* civil_lib  yr1990 dyear* (seats=interaction), fe cluster(country) first
boottest yr1990, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest dparty1, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty2, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest civil_lib, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)



***********************************drop each country at a time

preserve
xtivreg2 energywb_nohydro loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
estimates store O
restore

preserve
drop if countryname=="Belgium"
xtivreg2 energywb_nohydro loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store A
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
restore

preserve
drop if countryname=="Croatia"
xtivreg2 energywb_nohydro loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store B
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
restore

preserve
drop if countryname=="France"
xtivreg2 energywb_nohydro loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store C
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
restore

preserve
drop if countryname=="Greece"
xtivreg2 energywb_nohydro loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store D
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
restore

preserve
drop if countryname=="Ireland"
xtivreg2 energywb_nohydro loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store E
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
restore

preserve
drop if countryname=="Korea, Rep."
xtivreg2 energywb_nohydro loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store F
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
restore

preserve
drop if countryname=="Poland"
xtivreg2 energywb_nohydro loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store G
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
restore

preserve
drop if countryname=="Portugal"
xtivreg2 energywb_nohydro loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store H
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
restore


preserve
drop if countryname=="Slovenia"
xtivreg2 energywb_nohydro loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store I
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
restore


preserve
drop if countryname=="Spain"
xtivreg2 energywb_nohydro loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store J
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
restore

preserve
drop if countryname=="Uruguay"
xtivreg2 energywb_nohydro loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store K
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
restore


preserve
drop if countryname=="Panama"
xtivreg2 energywb_nohydro loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store L 
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
restore

preserve
drop if countryname=="Chile"
xtivreg2 energywb_nohydro loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first 
estimates store M
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
restore


coefplot O A B C D E F G H I L M, drop(_cons loggdp dparty* civil_lib dyear*) keep(*:) xline(0)


 
****************************************************************************************************************************************************************************************
************************************************************************************************************************Add other countries:******************************
***************************************************************************************************************************************************************************************
***Brazil, China and India
clear all
set more off

use "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\energywb(nohydro) ready"


merge 1:1 countryname year using  "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\seats ready" 
drop _merge 
merge 1:1 countryname year using "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\parties ready"
drop _merge
merge 1:1 countryname year using  "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\Political Rights ready"
drop _merge
merge 1:1 countryname year using  "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\civil liberties ready"
drop _merge
merge 1:1 countryname year using  "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\GDP pc constant 2010 ready"
drop _merge
merge 1:1 countryname year using "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\final RDD Renewables Gov ready 2"
drop _merge

describe

replace energywb_nohydro=0 if countryname=="Bahamas"
replace energywb_nohydro=0 if countryname=="Barbados"

drop if energywb_nohydro==. | seats==. | gdp==. | typeparty==. | pol_rights==. | civil_lib==.

keep if countryname=="Andorra" | countryname=="Antigua and Barbuda" | countryname=="Australia" | countryname=="Austria" | countryname=="Bahamas" | countryname=="Bahrain" | countryname=="Barbados" | countryname=="Belgium" | countryname=="Brunei Darussalam" | countryname=="Canada" | countryname=="Chile" | countryname=="Croatia" | countryname=="Cyprus" | countryname=="Czech Republic" | countryname=="Denmark" | countryname=="Estonia" | countryname=="Finland" | countryname=="France" | countryname=="Germany" | countryname=="Greece" | countryname=="Hungary" | countryname=="Iceland" | countryname=="Ireland" | countryname=="Isle of Man" | countryname=="Israel" | countryname=="Italy" | countryname=="Japan" | countryname=="Korea, Rep." | countryname=="Kuwait" | countryname=="Latvia" | countryname=="Liechtenstein" | countryname=="Lithuania" | countryname=="Luxembourg" | countryname=="Malta" | countryname=="Monaco" | countryname=="Netherlands" | countryname=="New Zealand" | countryname=="Norway" | countryname=="Oman" | countryname=="Palau" | countryname=="Panama" | countryname=="Poland" | countryname=="Portugal" | countryname=="Qatar" | countryname=="San Marino" | countryname=="Saudi Arabia" | countryname=="Seychelles" | countryname=="Singapore" | countryname=="Slovak Republic" | countryname=="Slovenia" | countryname=="Spain" | countryname=="St. Kitts and Nevis" | countryname=="Sweden" | countryname=="Switzerland" | countryname=="Trinidad and Tobago" | countryname=="United Arab Emirates" | countryname=="United Kingdom" | countryname=="United States" | countryname=="Uruguay" | countryname=="Bermuda" | countryname=="British Virgin Islands" | countryname=="Cayman Islands" | countryname=="Channel Islands" | countryname=="Curaçao" | countryname=="Faroe Islands"| countryname=="French Polynesia" | countryname=="Gibraltar" | countryname=="Greenland" | countryname=="Guam" | countryname=="Hong Kong" | countryname=="Macao" | countryname=="New Caledonia" | countryname=="Northern Mariana Islands" | countryname=="Puerto Rico" | countryname=="Sint Maarten (Dutch part)" | countryname=="St. Martin (French Part)" | countryname=="Turks and Caicos Islands" | countryname=="Virgin Islands (U.S.)" |countryname=="India" | countryname=="Brazil" | countryname=="China"  




****************************************************************************
*************Dummy of gender quota if the law requires >= 30%****************
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

******************************************************************************************************************************************************************************************IV -CLUSTER - HIGH INCOME********************

encode countryname, generate(country)
generate loggdp=log(gdp)

xtset country year


tab year, generate(dyear)
tab country, generate(dcountry)
tab typeparty, generate(dparty)


xtivreg2 energywb_nohydro loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest dparty1, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest dparty2, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)
boottest civil_lib, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321)


****al countries
clear all
set more off

use "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\energywb(nohydro) ready"


merge 1:1 countryname year using  "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\seats ready" 
drop _merge 
merge 1:1 countryname year using "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\parties ready"
drop _merge
merge 1:1 countryname year using  "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\Political Rights ready"
drop _merge
merge 1:1 countryname year using  "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\civil liberties ready"
drop _merge
merge 1:1 countryname year using  "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\GDP pc constant 2010 ready"
drop _merge
merge 1:1 countryname year using "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\final RDD Renewables Gov ready 2"
drop _merge

describe

replace energywb_nohydro=0 if countryname=="Bahamas"
replace energywb_nohydro=0 if countryname=="Barbados"

drop if energywb_nohydro==. | seats==. | gdp==. | typeparty==. | pol_rights==. | civil_lib==.

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

******************************************************************************************************************************************************************************************IV -CLUSTER - HIGH INCOME********************

encode countryname, generate(country)
generate loggdp=log(gdp)

xtset country year


tab year, generate(dyear)
tab country, generate(dcountry)
tab typeparty, generate(dparty)


xtivreg2 energywb_nohydro loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first
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

use "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\energy wb ready"


merge 1:1 countryname year using  "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\seats ready" 
drop _merge 
merge 1:1 countryname year using "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\parties ready"
drop _merge
merge 1:1 countryname year using  "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\Political Rights ready"
drop _merge
merge 1:1 countryname year using  "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\civil liberties ready"
drop _merge
merge 1:1 countryname year using  "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\GDP pc constant 2010 ready"
drop _merge
merge 1:1 countryname year using "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\final RDD Renewables Gov ready 2"
drop _merge
merge 1:1 countryname year using "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\energywb(nohydro) ready"
drop _merge

describe

drop if energywb==. | seats==. | gdp==. | typeparty==. | pol_rights==. | civil_lib==.

keep if countryname=="Andorra" | countryname=="Antigua and Barbuda" | countryname=="Australia" | countryname=="Austria" | countryname=="Bahamas" | countryname=="Bahrain" | countryname=="Barbados" | countryname=="Belgium" | countryname=="Brunei Darussalam" | countryname=="Canada" | countryname=="Chile" | countryname=="Croatia" | countryname=="Cyprus" | countryname=="Czech Republic" | countryname=="Denmark" | countryname=="Estonia" | countryname=="Finland" | countryname=="France" | countryname=="Germany" | countryname=="Greece" | countryname=="Hungary" | countryname=="Iceland" | countryname=="Ireland" | countryname=="Isle of Man" | countryname=="Israel" | countryname=="Italy" | countryname=="Japan" | countryname=="Korea, Rep." | countryname=="Kuwait" | countryname=="Latvia" | countryname=="Liechtenstein" | countryname=="Lithuania" | countryname=="Luxembourg" | countryname=="Malta" | countryname=="Monaco" | countryname=="Netherlands" | countryname=="New Zealand" | countryname=="Norway" | countryname=="Oman" | countryname=="Palau" | countryname=="Panama" | countryname=="Poland" | countryname=="Portugal" | countryname=="Qatar" | countryname=="San Marino" | countryname=="Saudi Arabia" | countryname=="Seychelles" | countryname=="Singapore" | countryname=="Slovak Republic" | countryname=="Slovenia" | countryname=="Spain" | countryname=="St. Kitts and Nevis" | countryname=="Sweden" | countryname=="Switzerland" | countryname=="Trinidad and Tobago" | countryname=="United Arab Emirates" | countryname=="United Kingdom" | countryname=="United States" | countryname=="Uruguay" | countryname=="Bermuda" | countryname=="British Virgin Islands" | countryname=="Cayman Islands" | countryname=="Channel Islands" | countryname=="Curaçao" | countryname=="Faroe Islands"| countryname=="French Polynesia" | countryname=="Gibraltar" | countryname=="Greenland" | countryname=="Guam" | countryname=="Hong Kong" | countryname=="Macao" | countryname=="New Caledonia" | countryname=="Northern Mariana Islands" | countryname=="Puerto Rico" | countryname=="Sint Maarten (Dutch part)" | countryname=="St. Martin (French Part)" | countryname=="Turks and Caicos Islands" | countryname=="Virgin Islands (U.S.)" 
*|countryname=="India" | countryname=="Brazil" | countryname=="China"




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

******************************************************************************************************************************************************************************************IV -CLUSTER - HIGH INCOME********************

encode countryname, generate(country)
generate loggdp=log(gdp)

xtset country year


tab year, generate(dyear)
tab country, generate(dcountry)


tab typeparty, generate(dparty)


summ

xtivreg2 energywb dyear* (seats=interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
 

xtivreg2 energywb loggdp dyear* (seats=interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
 

xtivreg2 energywb loggdp dparty*  dyear* (seats=interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest dparty1, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest dparty2, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 



xtivreg2 energywb loggdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first
boottest seats, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest loggdp, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest dparty1, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest dparty2, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 
boottest civil_lib, boottype(wild) bootcluster(country) cluster(country) ptype(equaltail) reps(9999) seed(321) 


**********************************************************************************************************************************************************************The whole sample: all countries*******************************
********************************************************************************************************************************************************

clear all
set more off

use "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\energywb(nohydro) ready"


merge 1:1 countryname year using  "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\seats ready" 
drop _merge 
merge 1:1 countryname year using "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\parties ready"
drop _merge
merge 1:1 countryname year using  "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\Political Rights ready"
drop _merge
merge 1:1 countryname year using  "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\civil liberties ready"
drop _merge
merge 1:1 countryname year using  "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\GDP pc constant 2010 ready"
drop _merge
merge 1:1 countryname year using "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\final RDD Renewables Gov ready 2"
drop _merge
merge 1:1 countryname year using "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\consump_rnenergy_ready"

describe

rename weights energy_weights
replace energywb_nohydro=0 if countryname=="Bahamas"
replace energywb_nohydro=0 if countryname=="Barbados"

drop if energywb_nohydro==. | seats==. | gdp==. | typeparty==. | pol_rights==. | civil_lib==.


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

replace interaction=1 if countryname=="Panama" & year>=1996

replace interaction=1 if countryname=="Brazil" & year>=1997
replace interaction=1 if countryname=="Indonesia" & year>=2012
replace interaction=1 if countryname=="Mexico" & year>=1996


replace interaction=1 if countryname=="Albania" & year>=2012
replace interaction=1 if countryname=="Algeria" & year>=2012
replace interaction=1 if countryname=="Angola" & year>=2010
replace interaction=1 if countryname=="Argentina" & year>=1991
replace interaction=1 if countryname=="Bolivia" & year>=1997
replace interaction=1 if countryname=="Bosnia and Herzegovina" & year>=1998
replace interaction=1 if countryname=="Burkina Faso" & year>=1998
replace interaction=1 if countryname=="Colombia" & year>=1998
replace interaction=1 if countryname=="Costa Rica" & year>=1998
replace interaction=1 if countryname=="Dominican Republic" & year>=1998
replace interaction=1 if countryname=="Ecuador" & year>=1998
replace interaction=1 if countryname=="El Salvador" & year>=1998
replace interaction=1 if countryname=="Guinea" & year>=1998
replace interaction=1 if countryname=="Leshoto" & year>=2005
replace interaction=1 if countryname=="Liberia" & year>=2014
replace interaction=1 if countryname=="Montenergo" & year>=2011
replace interaction=1 if countryname=="Nicaragua" & year>=2000
replace interaction=1 if countryname=="Peru" & year>=2000
replace interaction=1 if countryname=="Sao Tome Principe" & year>=2009
replace interaction=1 if countryname=="Senegal" & year>=2010
replace interaction=1 if countryname=="Serbia" & year>=2004
replace interaction=1 if countryname=="Timor-Leste" & year>=2009
replace interaction=1 if countryname=="Togo" & year>=2013
replace interaction=1 if countryname=="Tunisia" & year>=2014
replace interaction=1 if countryname=="Uzbekistan" & year>=2009
replace interaction=1 if countryname=="Venezuela, RB" & year>=1998
replace interaction=1 if countryname=="Guayana" & year>=2009
replace interaction=1 if countryname=="Haiti" & year>=2012
replace interaction=1 if countryname=="Mali" & year>=2015
replace interaction=1 if countryname=="North Macedonia" & year>=2002
******************************************************************************************************************************************************************************************IV -CLUSTER - HIGH INCOME********************

encode countryname, generate(country)
generate loggdp=log(gdp)

xtset country year


tab year, generate(dyear)
tab country, generate(dcountry)
tab typeparty, generate(dparty)


xtivreg2 energywb_nohydro dyear* (seats=interaction), fe cluster(country) first

xtivreg2 energywb_nohydro gdp dyear* (seats=interaction), fe cluster(country) first


xtivreg2 energywb_nohydro gdp dparty* dyear* (seats=interaction), fe cluster(country) first

xtivreg2 energywb_nohydro gdp dparty* civil_lib dyear* (seats=interaction), fe cluster(country) first



log close 

translate final_version.smcl final_version.pdf, replace
