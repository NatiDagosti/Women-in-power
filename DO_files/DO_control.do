**************ARRANGE DATA DO*********************


*************Seats***********

clear all

set more off

cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok"

import delimited "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\API_SG.GEN.PARL.ZS_DS2_en_csv_v2_5994703\API_SG.GEN.PARL.ZS_DS2_en_csv_v2_5994703.csv"

*eliminate the first 2 rows
drop if _n==2
drop if _n==1

rename v1 countryname
rename v2 country_code
rename v3 indicator_name
rename v4 indicator_code

rename v5 yr_1960
rename v6 yr_1961
rename v7 yr_1962
rename v8 yr_1963
rename v9 yr_1964
rename v10 yr_1965
rename v11 yr_1966
rename v12 yr_1967
rename v13 yr_1968
rename v14 yr_1969

rename v15 yr_1970
rename v16 yr_1971
rename v17 yr_1972
rename v18 yr_1973
rename v19 yr_1974
rename v20 yr_1975
rename v21 yr_1976
rename v22 yr_1977
rename v23 yr_1978
rename v24 yr_1979

rename v25 yr_1980
rename v26 yr_1981
rename v27 yr_1982
rename v28 yr_1983
rename v29 yr_1984
rename v30 yr_1985
rename v31 yr_1986
rename v32 yr_1987
rename v33 yr_1988
rename v34 yr_1989

rename v35 yr_1990
rename v36 yr_1991
rename v37 yr_1992
rename v38 yr_1993
rename v39 yr_1994
rename v40 yr_1995
rename v41 yr_1996
rename v42 yr_1997
rename v43 yr_1998
rename v44 yr_1999

rename v45 yr_2000
rename v46 yr_2001
rename v47 yr_2002
rename v48 yr_2003
rename v49 yr_2004
rename v50 yr_2005
rename v51 yr_2006
rename v52 yr_2007
rename v53 yr_2008
rename v54 yr_2009

rename v55 yr_2010
rename v56 yr_2011
rename v57 yr_2012
rename v58 yr_2013
rename v59 yr_2014
rename v60 yr_2015
rename v61 yr_2016
rename v62 yr_2017
rename v63 yr_2018
rename v64 yr_2019

rename v65 yr_2020
rename v66 yr_2021
rename v67 yr_2022
rename v68 yr_2023

drop if _n==1

replace countryname = "Bahamas" if countryname=="Bahamas, The"
replace countryname = "Hong Kong" if countryname=="Hong Kong SAR, China"
replace countryname = "Macao" if countryname=="Macao SAR, China"
replace countryname = "Democratic Republic of the Congo" if countryname =="Congo, Dem. Rep."
replace countryname = "Côte d'Ivoire" if countryname == "Cote d'Ivoire"
replace countryname = "Curaçao" if countryname == "Curacao"
replace countryname = "Egypt" if countryname == "Egypt, Arab Rep."
replace countryname = "Gambia" if countryname == "Gambia, The"
replace countryname = "Lao People's Democratic Republic" if countryname == "Lao PDR"
replace countryname = "Republic of Moldova" if countryname=="Moldova"
replace countryname = "Viet Nam" if countryname=="Vietnam"

sort countryname

***No observations***
drop if countryname==""

**eliminate of the database to be able to append
drop if countryname== "Arab World" 
drop if countryname== "Caribbean small states"
drop if countryname== "Central Europe and the Baltics"
drop if countryname== "East Asia & Pacific"
drop if countryname== "East Asia & Pacific (IDA & IBRD countries)"
drop if countryname== "East Asia & Pacific (excluding high income)"
drop if countryname== "Early-demographic dividend"
drop if countryname== "Euro area"
drop if countryname== "Europe & Central Asia"
drop if countryname== "Europe & Central Asia (IDA & IBRD countries)"
drop if countryname== "Europe & Central Asia (excluding high income)"
drop if countryname== "European Union"
drop if countryname== "Fragile and conflict affected situations"
drop if countryname== "Heavily indebted poor countries (HIPC)"
drop if countryname== "IBRD only"
drop if countryname== "IDA & IBRD total"
drop if countryname== "IDA blend"
drop if countryname== "IDA only"
drop if countryname== "IDA total"
drop if countryname== "Kosovo"
drop if countryname== "Late-demographic dividend"
drop if countryname== "Latin America & Caribbean (excluding high income)"
drop if countryname== "Latin America & the Caribbean (IDA & IBRD countries)"
drop if countryname== "Least developed countries: UN classification"
drop if countryname== "Middle East & North Africa"
drop if countryname== "Middle East & North Africa (excluding high income)"
drop if countryname== "Middle East & North Africa (IDA & IBRD countries)"
drop if countryname== "Middle East & North Africa (excluding high income)"
drop if countryname== "North America"
drop if countryname== "Not classified"
drop if countryname== "Other small states"
drop if countryname== "Pacific island small states"
drop if countryname== "Post-demographic dividend"
drop if countryname== "Pre-demographic dividend"
drop if countryname== "Sub-Saharan Africa (IDA & IBRD countries)"
drop if countryname== "Sub-Saharan Africa (excluding high income)"
drop if countryname== "Small states"
drop if countryname== "South Asia (IDA & IBRD)"
drop if countryname== "South Asia"
drop if countryname== "West Bank and Gaza"
drop if countryname== "OECD members"
drop if countryname=="Low & middle income"
drop if countryname=="High income"
drop if countryname=="Low income"
drop if countryname=="Lower middle income"
drop if countryname=="Middle income"
drop if countryname=="Upper middle income"
drop if countryname=="World"


reshape long yr_@, i(countryname) j(seats)

*****In order to be able to merge the database****

rename seats year
rename yr_ seats

describe

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\seats_ready", replace


**************************************************************************************** 

********GDP per capita constant  20105US$***********

clear all

set more off

cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok"

import delimited "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\API_NY.GDP.PCAP.KD_DS2_en_csv_v2_5994684\API_NY.GDP.PCAP.KD_DS2_en_csv_v2_5994684.csv"

*eliminate the first 2 rows
drop if _n==2
drop if _n==1

rename v1 countryname
rename v2 country_code
rename v3 indicator_name
rename v4 indicator_code

rename v5 yr_1960
rename v6 yr_1961
rename v7 yr_1962
rename v8 yr_1963
rename v9 yr_1964
rename v10 yr_1965
rename v11 yr_1966
rename v12 yr_1967
rename v13 yr_1968
rename v14 yr_1969

rename v15 yr_1970
rename v16 yr_1971
rename v17 yr_1972
rename v18 yr_1973
rename v19 yr_1974
rename v20 yr_1975
rename v21 yr_1976
rename v22 yr_1977
rename v23 yr_1978
rename v24 yr_1979

rename v25 yr_1980
rename v26 yr_1981
rename v27 yr_1982
rename v28 yr_1983
rename v29 yr_1984
rename v30 yr_1985
rename v31 yr_1986
rename v32 yr_1987
rename v33 yr_1988
rename v34 yr_1989

rename v35 yr_1990
rename v36 yr_1991
rename v37 yr_1992
rename v38 yr_1993
rename v39 yr_1994
rename v40 yr_1995
rename v41 yr_1996
rename v42 yr_1997
rename v43 yr_1998
rename v44 yr_1999

rename v45 yr_2000
rename v46 yr_2001
rename v47 yr_2002
rename v48 yr_2003
rename v49 yr_2004
rename v50 yr_2005
rename v51 yr_2006
rename v52 yr_2007
rename v53 yr_2008
rename v54 yr_2009

rename v55 yr_2010
rename v56 yr_2011
rename v57 yr_2012
rename v58 yr_2013
rename v59 yr_2014
rename v60 yr_2015
rename v61 yr_2016
rename v62 yr_2017
rename v63 yr_2018
rename v64 yr_2019

rename v65 yr_2020
rename v66 yr_2021
rename v67 yr_2022
rename v68 yr_2023

drop if _n==1

replace countryname = "Bahamas" if countryname=="Bahamas, The"
replace countryname = "Hong Kong" if countryname=="Hong Kong SAR, China"
replace countryname = "Macao" if countryname=="Macao SAR, China"
replace countryname = "Democratic Republic of the Congo" if countryname =="Congo, Dem. Rep."
replace countryname = "Côte d'Ivoire" if countryname == "Cote d'Ivoire"
replace countryname = "Curaçao" if countryname == "Curacao"
replace countryname = "Egypt" if countryname == "Egypt, Arab Rep."
replace countryname = "Gambia" if countryname == "Gambia, The"
replace countryname = "Lao People's Democratic Republic" if countryname == "Lao PDR"
replace countryname = "Republic of Moldova" if countryname=="Moldova"
replace countryname = "Viet Nam" if countryname=="Vietnam"

sort countryname

**eliminate of the database to be able to append
drop if countryname== "Arab World" 
drop if countryname== "Caribbean small states"
drop if countryname== "Central Europe and the Baltics"
drop if countryname== "East Asia & Pacific"
drop if countryname== "East Asia & Pacific (IDA & IBRD countries)"
drop if countryname== "East Asia & Pacific (excluding high income)"
drop if countryname== "Early-demographic dividend"
drop if countryname== "Euro area"
drop if countryname== "Europe & Central Asia"
drop if countryname== "Europe & Central Asia (IDA & IBRD countries)"
drop if countryname== "Europe & Central Asia (excluding high income)"
drop if countryname== "European Union"
drop if countryname== "Fragile and conflict affected situations"
drop if countryname== "Heavily indebted poor countries (HIPC)"
drop if countryname== "IBRD only"
drop if countryname== "IDA & IBRD total"
drop if countryname== "IDA blend"
drop if countryname== "IDA only"
drop if countryname== "IDA total"
drop if countryname== "Kosovo"
drop if countryname== "Late-demographic dividend"
drop if countryname== "Latin America & Caribbean (excluding high income)"
drop if countryname== "Latin America & the Caribbean (IDA & IBRD countries)"
drop if countryname== "Least developed countries: UN classification"
drop if countryname== "Middle East & North Africa"
drop if countryname== "Middle East & North Africa (excluding high income)"
drop if countryname== "Middle East & North Africa (IDA & IBRD countries)"
drop if countryname== "Middle East & North Africa (excluding high income)"
drop if countryname== "North America"
drop if countryname== "Not classified"
drop if countryname== "Other small states"
drop if countryname== "Pacific island small states"
drop if countryname== "Post-demographic dividend"
drop if countryname== "Pre-demographic dividend"
drop if countryname== "Sub-Saharan Africa (IDA & IBRD countries)"
drop if countryname== "Sub-Saharan Africa (excluding high income)"
drop if countryname== "Small states"
drop if countryname== "South Asia (IDA & IBRD)"
drop if countryname== "South Asia"
drop if countryname== "West Bank and Gaza"
drop if countryname=="OECD members"
drop if countryname=="Low & middle income"
drop if countryname=="High income"
drop if countryname=="Low income"
drop if countryname=="Lower middle income"
drop if countryname=="Middle income"
drop if countryname=="Upper middle income"
drop if countryname=="World"


*****In order to be able to merge the database****
reshape long yr_@, i(countryname) j(gdp)


rename gdp year
rename yr_ gdp

describe

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\GDP_pc_constant_2015 ready", replace

**********************************************************************************************************************************

************* parties
clear all

set more off

cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok"

import excel "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\The-Database-of-Political-Institutions-2020-DPI2020\DPI2020\DPI2020.xlsx", cellrange(a1:DY8201) firstrow

tab execrlc

rename execrlc typeparty 
label variable typeparty "Right (1); Left (3); Center (2); No information (0); No executive (4)"

replace typeparty="." if typeparty=="-999"
replace typeparty="." if typeparty=="0"


replace countryname="American Samoa" if countryname=="Samoa"
replace countryname="Bosnia and Herzegovina" if countryname=="Bosnia-Herz"
replace countryname="Brunei Darussalam" if countryname=="Brunei"
replace countryname="Cabo Verde" if countryname=="C. Verde Is."
replace countryname="Central African Republic" if countryname=="Cent. Af. Rep."
replace countryname="Comoros" if countryname=="Comoro Is."
replace countryname="Congo, Rep." if countryname=="Congo"
replace countryname="Democratic Republic of the Congo" if countryname=="Congo (DRC)"
replace countryname="Czech Republic" if countryname=="Czechia"
replace countryname="Czech Republic" if countryname=="Czech Rep."
replace countryname="Côte d'Ivoire" if countryname=="Cote d'Ivoire"
replace countryname="Dominican Republic" if countryname=="Dom. Rep."
replace countryname="Equatorial Guinea" if countryname=="Eq. Guinea"
replace countryname="Germany" if countryname=="FRG/Germany"
replace countryname="Iran, Islamic Rep." if countryname=="Iran"
replace countryname="Kyrgyz Republic" if countryname=="Kyrgyzstan"
replace countryname="Lao People's Democratic Republic" if countryname=="Laos"
replace countryname="North Macedonia" if countryname=="Macedonia"
replace countryname="Republic of Moldova" if countryname=="Moldova"
replace countryname="Yemen, Rep." if countryname=="Yemen"
replace countryname="Viet Nam" if countryname=="Vietnam"
replace countryname="Venezuela, RB" if countryname=="Venezuela"
replace countryname="United States" if countryname=="USA"
replace countryname="United Kingdom" if countryname=="UK"
replace countryname="United Arab Emirates" if countryname=="UAE"
replace countryname="United States" if countryname=="USA"
replace countryname="Syrian Arab Republic" if countryname=="Syria"
replace countryname = "Eswatini" if countryname=="Swaziland"
replace countryname = "Russian Federation" if countryname=="Russia"
replace countryname = "Solomon Islands" if countryname=="Solomon Is."
replace countryname = "Slovak Republic" if countryname=="Slovakia"
replace countryname = "South Africa" if countryname=="S. Africa"
replace countryname = "Korea, Rep." if countryname=="ROK"
replace countryname = "China" if countryname=="PRC"
replace countryname = "Korea, Dem. People's Rep." if countryname=="PRK"
replace countryname = "Papua New Guinea" if countryname=="P. N. Guinea"
replace countryname = "Trinidad and Tobago" if countryname=="Trinidad-Tobago"
replace countryname = "Turks and Caicos Islands" if countryname == "Turk Cyprus"

drop if countryname=="GDR"
drop if countryname=="Yemen (PDR)"
drop if countryname=="Yugoslavia"
drop if countryname=="Turk Cyprus"
drop if countryname=="Taiwan"
drop if countryname=="Soviet Union"

sort countryname year
rename year date

gen year=year(date)

order countryname year

replace countryname="Turkiye" if countryname=="Turkey"
replace countryname="Czechia" if countryname=="Czech Republic"

describe

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\parties_ready", replace


********************************************************************************************************************************

********************Freedom House - Political Rights************************

clear all

set more off

cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok"

import excel "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\Country_and_Territory_Ratings_and_Statuses_FIW_1973-2023 .xlsx", sheet("Country Ratings, Statuses ") cellrange(A2:EU208) 

keep A BA BD BG BJ BM BP BS BV BY CB CE CH CK CN CQ CT CW CZ DC DF DI DL DO DR DU DX EA ED EG EJ EM EP ES

rename A countryname

rename BA yr_1990
rename BD yr_1991
rename BG yr_1992
rename BJ yr_1993
rename BM yr_1994
rename BP yr_1995
rename BS yr_1996
rename BV yr_1997
rename BY yr_1998
rename CB yr_1999
rename CE yr_2000
rename CH yr_2001
rename CK yr_2002
rename CN yr_2003
rename CQ yr_2004
rename CT yr_2005
rename CW yr_2006
rename CZ yr_2007
rename DC yr_2008
rename DF yr_2009
rename DI yr_2010
rename DL yr_2011
rename DO yr_2012
rename DR yr_2013
rename DU yr_2014
rename DX yr_2015
rename EA yr_2016
rename ED yr_2017
rename EG yr_2018
rename EJ yr_2019
rename EM yr_2020
rename EP yr_2021
rename ES yr_2022

drop if _n==2
drop if _n==1

replace countryname="American Samoa" if countryname=="Samoa"
replace countryname="Brunei Darussalam" if countryname=="Brunei"
replace countryname="Congo, Rep." if countryname=="Congo (Brazzaville)"
replace countryname="Democratic Republic of the Congo" if countryname=="Congo (Kinshasa)"
replace countryname="Côte d'Ivoire" if countryname=="Cote d'Ivoire"
replace countryname="Iran, Islamic Rep." if countryname=="Iran"
replace countryname="Kyrgyz Republic" if countryname=="Kyrgyzstan"
replace countryname="Lao People's Democratic Republic" if countryname=="Laos"
replace countryname="Republic of Moldova" if countryname=="Moldova"
replace countryname="Yemen, Rep." if countryname=="Yemen"
replace countryname="Viet Nam" if countryname=="Vietnam"
replace countryname="Venezuela, RB" if countryname=="Venezuela"
replace countryname="Syrian Arab Republic" if countryname=="Syria"
replace countryname = "Russian Federation" if countryname=="Russia"
replace countryname = "Slovak Republic" if countryname=="Slovakia"
replace countryname = "Korea, Rep." if countryname=="South Korea"
replace countryname = "Korea, Dem. People's Rep." if countryname=="North Korea"
replace countryname = "Gambia" if countryname=="The Gambia"
replace countryname = "Micronesia, Fed. Sts." if countryname=="Micronesia"


drop  if countryname =="Germany, E. "
drop  if countryname =="Germany, W. "
drop if countryname == "Serbia and Montenegro"
drop if countryname == "Czechoslovakia"
drop if countryname == "Taiwan"
drop if countryname == "USSR"
drop if countryname == "Vietnam, N."
drop if countryname == "Vietnam, S."
drop if countryname == "Yemen, N."
drop if countryname == "Yemen, S."
drop if countryname == "Yugoslavia"
drop if countryname == "Kosovo"


sort countryname


reshape long yr_@, i(countryname) j(pol_right)

rename pol_right year
rename yr_ pol_rights

replace pol_rights="." if pol_rights=="-"
destring pol_rights, replace

replace countryname="Czechia" if countryname=="Czech Republic"
replace countryname="Turkiye" if countryname=="Turkey"

describe

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\Political_Rights_ready", replace

**************ARRANGE DATA DO*********************
********************Freedom House - Civil Liberties************************

clear all

set more off

cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok"

import excel "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\Country_and_Territory_Ratings_and_Statuses_FIW_1973-2023 .xlsx", sheet("Country Ratings, Statuses ") cellrange(A2:EU208) 

keep A BB BE BH BK BN BQ BT BW BZ CC CF CI CL CO CR CU CX DA DD DG DJ DM DP DS DV DY EB EE EH EK EN EQ ET 

rename A countryname

rename BB yr_1990
rename BE yr_1991
rename BH yr_1992
rename BK yr_1993
rename BN yr_1994
rename BQ yr_1995
rename BT yr_1996
rename BW yr_1997
rename BZ yr_1998
rename CC yr_1999
rename CF yr_2000
rename CI yr_2001
rename CL yr_2002
rename CO yr_2003
rename CR yr_2004
rename CU yr_2005
rename CX yr_2006
rename DA yr_2007
rename DD yr_2008
rename DG yr_2009
rename DJ yr_2010
rename DM yr_2011
rename DP yr_2012
rename DS yr_2013
rename DV yr_2014
rename DY yr_2015
rename EB yr_2016
rename EE yr_2017
rename EH yr_2018
rename EK yr_2019
rename EN yr_2020
rename EQ yr_2021
rename ET yr_2022

*drop BA BD BG BJ BM BP BS BV BY CB CE CH CK CN CQ CT CW CZ DC DF DI DL DO DR DU DX EA ED EG EJ EM EP ES

drop if _n==2
drop if _n==1

replace countryname="American Samoa" if countryname=="Samoa"
replace countryname="Brunei Darussalam" if countryname=="Brunei"
replace countryname="Congo, Rep." if countryname=="Congo (Brazzaville)"
replace countryname="Democratic Republic of the Congo" if countryname=="Congo (Kinshasa)"
replace countryname="Côte d'Ivoire" if countryname=="Cote d'Ivoire"
replace countryname="Iran, Islamic Rep." if countryname=="Iran"
replace countryname="Kyrgyz Republic" if countryname=="Kyrgyzstan"
replace countryname="Lao People's Democratic Republic" if countryname=="Laos"
replace countryname="Republic of Moldova" if countryname=="Moldova"
replace countryname="Yemen, Rep." if countryname=="Yemen"
replace countryname="Viet Nam" if countryname=="Vietnam"
replace countryname="Venezuela, RB" if countryname=="Venezuela"
replace countryname="Syrian Arab Republic" if countryname=="Syria"
replace countryname = "Russian Federation" if countryname=="Russia"
replace countryname = "Slovak Republic" if countryname=="Slovakia"
replace countryname = "Korea, Rep." if countryname=="South Korea"
replace countryname = "Korea, Dem. People's Rep." if countryname=="North Korea"
replace countryname = "Gambia" if countryname=="The Gambia"
replace countryname = "Micronesia, Fed. Sts." if countryname=="Micronesia"


drop  if countryname =="Germany, E. "
drop  if countryname =="Germany, W. "
drop if countryname == "Serbia and Montenegro"
drop if countryname == "Czechoslovakia"
drop if countryname == "Taiwan"
drop if countryname == "USSR"
drop if countryname == "Vietnam, N."
drop if countryname == "Vietnam, S."
drop if countryname == "Yemen, N."
drop if countryname == "Yemen, S."
drop if countryname == "Yugoslavia"
drop if countryname == "Kosovo"


sort countryname


reshape long yr_@, i(countryname) j(civil_lib)

rename civil_lib year
rename yr_ civil_lib

replace civil_lib="." if civil_lib=="-"
destring civil_lib, replace

replace countryname="Czechia" if countryname=="Czech Republic"
replace countryname="Turkiye" if countryname=="Turkey"

describe

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\civil_liberties_ready", replace


************************************************************************************************************

******************************ARRANGE DATA DO*********************
***************************Urban population*******************************

clear all

set more off

cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok"

import delimited "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\API_SP.POP.TOTL_DS2_en_csv_v2_6011311\API_SP.POP.TOTL_DS2_en_csv_v2_6011311.csv"

*eliminate the first 2 rows
drop if _n==2
drop if _n==1

rename v1 countryname
rename v2 country_code
rename v3 indicator_name
rename v4 indicator_code

rename v5 yr_1960
rename v6 yr_1961
rename v7 yr_1962
rename v8 yr_1963
rename v9 yr_1964
rename v10 yr_1965
rename v11 yr_1966
rename v12 yr_1967
rename v13 yr_1968
rename v14 yr_1969

rename v15 yr_1970
rename v16 yr_1971
rename v17 yr_1972
rename v18 yr_1973
rename v19 yr_1974
rename v20 yr_1975
rename v21 yr_1976
rename v22 yr_1977
rename v23 yr_1978
rename v24 yr_1979

rename v25 yr_1980
rename v26 yr_1981
rename v27 yr_1982
rename v28 yr_1983
rename v29 yr_1984
rename v30 yr_1985
rename v31 yr_1986
rename v32 yr_1987
rename v33 yr_1988
rename v34 yr_1989

rename v35 yr_1990
rename v36 yr_1991
rename v37 yr_1992
rename v38 yr_1993
rename v39 yr_1994
rename v40 yr_1995
rename v41 yr_1996
rename v42 yr_1997
rename v43 yr_1998
rename v44 yr_1999

rename v45 yr_2000
rename v46 yr_2001
rename v47 yr_2002
rename v48 yr_2003
rename v49 yr_2004
rename v50 yr_2005
rename v51 yr_2006
rename v52 yr_2007
rename v53 yr_2008
rename v54 yr_2009

rename v55 yr_2010
rename v56 yr_2011
rename v57 yr_2012
rename v58 yr_2013
rename v59 yr_2014
rename v60 yr_2015
rename v61 yr_2016
rename v62 yr_2017
rename v63 yr_2018
rename v64 yr_2019

rename v65 yr_2020
rename v66 yr_2021
rename v67 yr_2022
rename v68 yr_2023

drop if _n==1

replace countryname = "Bahamas" if countryname=="Bahamas, The"
replace countryname = "Hong Kong" if countryname=="Hong Kong SAR, China"
replace countryname = "Macao" if countryname=="Macao SAR, China"
replace countryname = "Democratic Republic of the Congo" if countryname =="Congo, Dem. Rep."
replace countryname = "Côte d'Ivoire" if countryname == "Cote d'Ivoire"
replace countryname = "Curaçao" if countryname == "Curacao"
replace countryname = "Egypt" if countryname == "Egypt, Arab Rep."
replace countryname = "Gambia" if countryname == "Gambia, The"
replace countryname = "Lao People's Democratic Republic" if countryname == "Lao PDR"
replace countryname = "Republic of Moldova" if countryname=="Moldova"
replace countryname = "Viet Nam" if countryname=="Vietnam"

sort countryname

***No observations***
drop if countryname==""

**eliminate of the database to be able to append
drop if countryname== "Arab World" 
drop if countryname== "Caribbean small states"
drop if countryname== "Central Europe and the Baltics"
drop if countryname== "East Asia & Pacific"
drop if countryname== "East Asia & Pacific (IDA & IBRD countries)"
drop if countryname== "East Asia & Pacific (excluding high income)"
drop if countryname== "Early-demographic dividend"
drop if countryname== "Euro area"
drop if countryname== "Europe & Central Asia"
drop if countryname== "Europe & Central Asia (IDA & IBRD countries)"
drop if countryname== "Europe & Central Asia (excluding high income)"
drop if countryname== "European Union"
drop if countryname== "Fragile and conflict affected situations"
drop if countryname== "Heavily indebted poor countries (HIPC)"
drop if countryname== "IBRD only"
drop if countryname== "IDA & IBRD total"
drop if countryname== "IDA blend"
drop if countryname== "IDA only"
drop if countryname== "IDA total"
drop if countryname== "Kosovo"
drop if countryname== "Late-demographic dividend"
drop if countryname== "Latin America & Caribbean (excluding high income)"
drop if countryname== "Latin America & the Caribbean (IDA & IBRD countries)"
drop if countryname== "Least developed countries: UN classification"
drop if countryname== "Middle East & North Africa"
drop if countryname== "Middle East & North Africa (excluding high income)"
drop if countryname== "Middle East & North Africa (IDA & IBRD countries)"
drop if countryname== "Middle East & North Africa (excluding high income)"
drop if countryname== "North America"
drop if countryname== "Not classified"
drop if countryname== "Other small states"
drop if countryname== "Pacific island small states"
drop if countryname== "Post-demographic dividend"
drop if countryname== "Pre-demographic dividend"
drop if countryname== "Sub-Saharan Africa (IDA & IBRD countries)"
drop if countryname== "Sub-Saharan Africa (excluding high income)"
drop if countryname== "Small states"
drop if countryname== "South Asia (IDA & IBRD)"
drop if countryname== "South Asia"
drop if countryname== "West Bank and Gaza"
drop if countryname== "OECD members"
drop if countryname=="Low & middle income"
drop if countryname=="High income"
drop if countryname=="Low income"
drop if countryname=="Lower middle income"
drop if countryname=="Middle income"
drop if countryname=="Upper middle income"
drop if countryname=="World"


reshape long yr_@, i(countryname) j(pop_tot)

*****In order to be able to merge the database****

rename pop_tot year
rename yr_ pop_tot

describe

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data_ok\pop_tot_ready", replace