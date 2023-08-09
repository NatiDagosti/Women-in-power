******************************************************************************************************************************************************************************************************************************************************************************************
**********************************************************************************************
**********************************************************************************************
***************************************************ENERGY GRAPHS******************************
**********************************************************************************************
clear all

use "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\energy graph"

drop countrycode

reshape long yr@, i(countryname) j(energy)


rename energy year
rename yr energy

drop if energy==.

generate highincome=0
replace highincome=1 if countryname=="Andorra" | countryname=="Antigua and Barbuda" | countryname=="Australia" | countryname=="Austria" | countryname=="Bahamas, The" | countryname=="Bahrain" | countryname=="Barbados" | countryname=="Belgium" | countryname=="Brunei Darussalam" | countryname=="Canada" | countryname=="Chile" | countryname=="Croatia" | countryname=="Cyprus" | countryname=="Czech Republic" | countryname=="Denmark" | countryname=="Estonia" | countryname=="Finland" | countryname=="France" | countryname=="Germany" | countryname=="Greece" | countryname=="Hungary" | countryname=="Iceland" | countryname=="Ireland" | countryname=="Isle of Man" | countryname=="Israel" | countryname=="Italy" | countryname=="Japan" | countryname=="Korea, Rep." | countryname=="Kuwait" | countryname=="Latvia" | countryname=="Liechtenstein" | countryname=="Lithuania" | countryname=="Luxembourg" | countryname=="Malta" | countryname=="Monaco" | countryname=="Netherlands" | countryname=="New Zealand" | countryname=="Norway" | countryname=="Oman" | countryname=="Palau" | countryname=="Panama" | countryname=="Poland" | countryname=="Portugal" | countryname=="Qatar" | countryname=="San Marino" | countryname=="Saudi Arabia" | countryname=="Seychelles" | countryname=="Singapore" | countryname=="Slovak Republic" | countryname=="Slovenia" | countryname=="Spain" | countryname=="St. Kitts and Nevis" | countryname=="Sweden" | countryname=="Switzerland" | countryname=="Trinidad and Tobago" | countryname=="United Arab Emirates" | countryname=="United Kingdom" | countryname=="United States" | countryname=="Uruguay" | countryname=="Bermuda" | countryname=="British Virgin Islands" | countryname=="Cayman Islands" | countryname=="Channel Islands" | countryname=="Curacao" | countryname=="Faroe Islands"| countryname=="French Polynesia" | countryname=="Gibraltar" | countryname=="Greenland" | countryname=="Guam" | countryname=="Hong Kong SAR, China" | countryname=="Macao" | countryname=="New Caledonia" | countryname=="Northern Mariana Islands" | countryname=="Puerto Rico" | countryname=="Sint Maarten (Dutch part)" | countryname=="St. Martin (French Part)" | countryname=="Turks and Caicos Islands" | countryname=="Virgin Islands (U.S.)" | countryname=="Aruba" |countryname=="Macao SAR, China"


generate upperincome=0
replace upperincome=1 if countryname== "Albania" | countryname== "American Samoa" | countryname=="Argentina" | countryname=="Armenia" | countryname=="Azerbaijan" | countryname=="Belarus" | countryname=="Belize" | countryname=="Bosnia and Herzegovina" | countryname=="Botswana" | countryname=="Brazil" | countryname=="Bulgaria" | countryname=="China" | countryname=="Colombia" | countryname=="Costa Rica" | countryname=="Cuba" | countryname=="Dominica" | countryname=="Dominican Republic" | countryname=="Equatorial Guinea" | countryname=="Ecuador" | countryname=="Fiji" | countryname=="Gabon" | countryname=="Georgia" | countryname=="Grenada" | countryname=="Guatemala" | countryname=="Guyana" | countryname=="Indonesia" | countryname=="Iran, Islamic Rep." | countryname=="Iraq" | countryname=="Jamaica" | countryname=="Jordan" | countryname=="Kazakhstan" | countryname=="Kosovo" | countryname=="Lebanon" | countryname=="Libya" | countryname=="Malaysia" | countryname== "Maldives" | countryname=="Marshall Islands" | countryname=="Mexico" | countryname=="Montenegro" | countryname=="Namibia" | countryname=="North Macedonia" | countryname=="Paraguay" | countryname=="Peru" | countryname=="Russian Federation" | countryname=="Samoa" | countryname=="Serbia" | countryname=="South Africa" | countryname=="St. Lucia" | countryname=="St. Vincent and the Grenadines" | countryname=="Suriname" | countryname=="Thailand" | countryname=="Tonga" | countryname=="Turkey" | countryname=="Turkmenistan" | countryname=="Tuvalu" | countryname=="Venezuela, RB" | countryname=="Mauritius" | countryname=="Nauru" | countryname=="Romania" 

generate middleincome=0
replace middleincome=1 if countryname=="Angola" | countryname=="Algeria" | countryname=="Bangladesh" | countryname=="Benin" | countryname=="Bhutan" | countryname=="Bolivia" | countryname=="Cabo Verde" | countryname=="Cambodia" | countryname=="Cameroon" | countryname=="Comoros" | countryname=="Congo, Rep." | countryname=="Cote d'Ivoire" | countryname=="Djibouti" | countryname=="Egypt, Arab Rep." | countryname=="El Salvador" | countryname=="Eswatini" | countryname=="Ghana" | countryname=="Honduras" | countryname=="India" | countryname=="Kenya" | countryname=="Kiribati" | countryname=="Kyrgyz Republic" | countryname=="Lao PDR" | countryname=="Lesotho" | countryname=="Mauritania" | countryname=="Micronesia, Fed. Sts." | countryname=="Moldova" | countryname=="Mongolia" | countryname=="Morocco" | countryname=="Myanmar" | countryname=="Nepal" | countryname=="Nicaragua" | countryname=="Nigeria" | countryname=="Pakistan" | countryname=="Papua New Guinea" | countryname=="Philippines" | countryname=="Sao Tome and Principe" | countryname=="Senegal" | countryname=="Solomon Islands" | countryname=="Sri Lanka" | countryname=="Tanzania" | countryname=="Timor-Leste" | countryname=="Tunisia" | countryname=="Ukraine" | countryname=="Uzbekistan" | countryname=="Vanuatu" | countryname=="Vietnam" | countryname=="West Bank and Gaza" | countryname=="Zambia" | countryname=="Zimbabwe"


generate lowincome=0
replace lowincome=1 if countryname=="Afghanistan" | countryname=="Burkina Faso" | countryname=="Burundi" | countryname=="Central African Republic" | countryname=="Chad" | countryname=="Congo, Dem. Rep." | countryname=="Eritrea" | countryname=="Ethiopia" | countryname=="Gambia, The" | countryname=="Guinea" | countryname=="Guinea-Bissau" | countryname=="Haiti" | countryname=="Korea, Dem. People’s Rep." | countryname=="Liberia" | countryname=="Madagascar" | countryname=="Malawi" | countryname=="Mali" | countryname=="Mozambique" | countryname=="Niger" | countryname=="Rwanda" | countryname=="Sierra Leone" | countryname=="Somalia" | countryname=="South Sudan" | countryname=="Sudan" | countryname=="Syrian Arab Republic" | countryname=="Tajikistan" | countryname=="Togo" | countryname=="Uganda" | countryname=="Yemen, Rep."

generate sum= highincome + upperincome + middleincome + lowincome
tab countryname if sum==0
drop if sum==0

generate incomegroup="high income"
replace incomegroup="upper income" if  upperincome==1
replace incomegroup="middle income" if  middleincome==1
replace incomegroup="low income" if  lowincome==1

order countryname year energy

preserve
collapse energy, by(year incomegroup)
keep if incomegroup=="high income"
twoway (line energy year) 
graph save "Graph" "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\graphs\graphs\renewable_energy.gph", replace
restore


preserve
collapse energy, by(year)
twoway (line energy year) 
 graph save "Graph" "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\graphs\graphs\renewable_energy_high_income_countries.gph", replace
restore


********************************************************************************************************************************************************************
*************************************************** Female Seats ******************************
**********************************************************************************************

clear all

use "C:\Users\natal\OneDrive\Documents\Second year paper\gender and energy\Data\seats ready.dta"


generate highincome=0
replace highincome=1 if countryname=="Andorra" | countryname=="Antigua and Barbuda" | countryname=="Australia" | countryname=="Austria" | countryname=="Bahamas, The" | countryname=="Bahrain" | countryname=="Barbados" | countryname=="Belgium" | countryname=="Brunei Darussalam" | countryname=="Canada" | countryname=="Chile" | countryname=="Croatia" | countryname=="Cyprus" | countryname=="Czech Republic" | countryname=="Denmark" | countryname=="Estonia" | countryname=="Finland" | countryname=="France" | countryname=="Germany" | countryname=="Greece" | countryname=="Hungary" | countryname=="Iceland" | countryname=="Ireland" | countryname=="Isle of Man" | countryname=="Israel" | countryname=="Italy" | countryname=="Japan" | countryname=="Korea, Rep." | countryname=="Kuwait" | countryname=="Latvia" | countryname=="Liechtenstein" | countryname=="Lithuania" | countryname=="Luxembourg" | countryname=="Malta" | countryname=="Monaco" | countryname=="Netherlands" | countryname=="New Zealand" | countryname=="Norway" | countryname=="Oman" | countryname=="Palau" | countryname=="Panama" | countryname=="Poland" | countryname=="Portugal" | countryname=="Qatar" | countryname=="San Marino" | countryname=="Saudi Arabia" | countryname=="Seychelles" | countryname=="Singapore" | countryname=="Slovak Republic" | countryname=="Slovenia" | countryname=="Spain" | countryname=="St. Kitts and Nevis" | countryname=="Sweden" | countryname=="Switzerland" | countryname=="Trinidad and Tobago" | countryname=="United Arab Emirates" | countryname=="United Kingdom" | countryname=="United States" | countryname=="Uruguay" | countryname=="Bermuda" | countryname=="British Virgin Islands" | countryname=="Cayman Islands" | countryname=="Channel Islands" | countryname=="Curacao" | countryname=="Faroe Islands"| countryname=="French Polynesia" | countryname=="Gibraltar" | countryname=="Greenland" | countryname=="Guam" | countryname=="Hong Kong SAR, China" | countryname=="Macao" | countryname=="New Caledonia" | countryname=="Northern Mariana Islands" | countryname=="Puerto Rico" | countryname=="Sint Maarten (Dutch part)" | countryname=="St. Martin (French Part)" | countryname=="Turks and Caicos Islands" | countryname=="Virgin Islands (U.S.)" | countryname=="Aruba" |countryname=="Macao SAR, China"


generate upperincome=0
replace upperincome=1 if countryname== "Albania" | countryname== "American Samoa" | countryname=="Argentina" | countryname=="Armenia" | countryname=="Azerbaijan" | countryname=="Belarus" | countryname=="Belize" | countryname=="Bosnia and Herzegovina" | countryname=="Botswana" | countryname=="Brazil" | countryname=="Bulgaria" | countryname=="China" | countryname=="Colombia" | countryname=="Costa Rica" | countryname=="Cuba" | countryname=="Dominica" | countryname=="Dominican Republic" | countryname=="Equatorial Guinea" | countryname=="Ecuador" | countryname=="Fiji" | countryname=="Gabon" | countryname=="Georgia" | countryname=="Grenada" | countryname=="Guatemala" | countryname=="Guyana" | countryname=="Indonesia" | countryname=="Iran, Islamic Rep." | countryname=="Iraq" | countryname=="Jamaica" | countryname=="Jordan" | countryname=="Kazakhstan" | countryname=="Kosovo" | countryname=="Lebanon" | countryname=="Libya" | countryname=="Malaysia" | countryname== "Maldives" | countryname=="Marshall Islands" | countryname=="Mexico" | countryname=="Montenegro" | countryname=="Namibia" | countryname=="North Macedonia" | countryname=="Paraguay" | countryname=="Peru" | countryname=="Russian Federation" | countryname=="Samoa" | countryname=="Serbia" | countryname=="South Africa" | countryname=="St. Lucia" | countryname=="St. Vincent and the Grenadines" | countryname=="Suriname" | countryname=="Thailand" | countryname=="Tonga" | countryname=="Turkey" | countryname=="Turkmenistan" | countryname=="Tuvalu" | countryname=="Venezuela, RB" | countryname=="Mauritius" | countryname=="Nauru" | countryname=="Romania" 

generate middleincome=0
replace middleincome=1 if countryname=="Angola" | countryname=="Algeria" | countryname=="Bangladesh" | countryname=="Benin" | countryname=="Bhutan" | countryname=="Bolivia" | countryname=="Cabo Verde" | countryname=="Cambodia" | countryname=="Cameroon" | countryname=="Comoros" | countryname=="Congo, Rep." | countryname=="Cote d'Ivoire" | countryname=="Djibouti" | countryname=="Egypt, Arab Rep." | countryname=="El Salvador" | countryname=="Eswatini" | countryname=="Ghana" | countryname=="Honduras" | countryname=="India" | countryname=="Kenya" | countryname=="Kiribati" | countryname=="Kyrgyz Republic" | countryname=="Lao PDR" | countryname=="Lesotho" | countryname=="Mauritania" | countryname=="Micronesia, Fed. Sts." | countryname=="Moldova" | countryname=="Mongolia" | countryname=="Morocco" | countryname=="Myanmar" | countryname=="Nepal" | countryname=="Nicaragua" | countryname=="Nigeria" | countryname=="Pakistan" | countryname=="Papua New Guinea" | countryname=="Philippines" | countryname=="Sao Tome and Principe" | countryname=="Senegal" | countryname=="Solomon Islands" | countryname=="Sri Lanka" | countryname=="Tanzania" | countryname=="Timor-Leste" | countryname=="Tunisia" | countryname=="Ukraine" | countryname=="Uzbekistan" | countryname=="Vanuatu" | countryname=="Vietnam" | countryname=="West Bank and Gaza" | countryname=="Zambia" | countryname=="Zimbabwe"

generate lowincome=0
replace lowincome=1 if countryname=="Afghanistan" | countryname=="Burkina Faso" | countryname=="Burundi" | countryname=="Central African Republic" | countryname=="Chad" | countryname=="Congo, Dem. Rep." | countryname=="Eritrea" | countryname=="Ethiopia" | countryname=="Gambia, The" | countryname=="Guinea" | countryname=="Guinea-Bissau" | countryname=="Haiti" | countryname=="Korea, Dem. People's Rep." | countryname=="Liberia" | countryname=="Madagascar" | countryname=="Malawi" | countryname=="Mali" | countryname=="Mozambique" | countryname=="Niger" | countryname=="Rwanda" | countryname=="Sierra Leone" | countryname=="Somalia" | countryname=="South Sudan" | countryname=="Sudan" | countryname=="Syrian Arab Republic" | countryname=="Tajikistan" | countryname=="Togo" | countryname=="Uganda" | countryname=="Yemen, Rep."

generate sum= highincome + upperincome + middleincome + lowincome
tab countryname if sum==0
drop if sum==0

generate incomegroup="high income"
replace incomegroup="upper income" if  upperincome==1
replace incomegroup="middle income" if  middleincome==1
replace incomegroup="low income" if  lowincome==1



preserve
collapse seats, by(year incomegroup)
keep if incomegroup=="high income"
twoway (line seats year) 
restore