*********************
*Australia
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Australia.xlsx", cellrange(A5:J33) firstrow

rename A year
generate country="Australia"

drop in 3

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.
replace Geothermal=0 if Geothermal==.
replace Solarthermal=0 if Solarthermal==.
replace Coal=0 if Coal==.
replace Oil=0 if Oil==.
replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.
replace Hydro=0 if Hydro==.
generate Waste=0
generate Othersources=0 
generate Tide=0 
generate Nuclear=0

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Australia", replace

*********************
*Austria
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Austria.xlsx", cellrange(A5:K33) firstrow

rename A year
generate country="Austria"

drop in 3

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.
replace Coal=0 if Coal==.
replace Oil=0 if Oil==.
replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.
replace Hydro=0 if Hydro==.
replace Othersources=0 if Othersources==.
replace Waste=0 if Waste==.
replace Geothermal=0 if Geothermal==.
generate Solarthermal=0 
generate Tide=0 
generate Nuclear=0

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Austria", replace

*********************
*Bahrain
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Bahrain.xlsx", cellrange(A5:C32) firstrow

rename A year
generate country="Bahrain"

drop in 3

generate SolarPV=0 
generate Wind=0 
generate Geothermal=0 
generate Solarthermal=0
generate Coal=0 

replace Oil="0" if Oil=="." | Oil==""
destring Oil, replace

replace Naturalgas=0 if Naturalgas==.
generate Waste=0
generate Biofuels=0 
generate Hydro=0 
generate Othersources=0 
generate Tide=0 
generate Nuclear=0

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Bahrain", replace

*********************
*Belgium
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Belgium.xlsx", cellrange(A5:K33) firstrow

rename A year
generate country="Belgium"

drop in 3

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.
generate Geothermal=0 
generate Solarthermal=0
replace Coal=0 if Coal==.
replace Oil=0 if Oil==.
replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.
replace Hydro=0 if Hydro==. 
replace Othersources=0 if Othersources==.
replace Waste=0 if Waste==.
generate Tide=0 
replace Nuclear=0 if Nuclear==.

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Belgium", replace

*********************
*Brazil
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Brazil.xlsx", cellrange(A5:K32) firstrow

rename A year
generate country="Brazil"

drop in 3

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.
replace Waste=0 if Waste==.
generate Geothermal=0 
generate Solarthermal=0

replace Oil=0 if Oil==.
destring Oil, replace

replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==. 
replace Hydro=0 if Hydro==.
replace Othersources=0 if Othersources==.
generate Tide=0 
replace Coal=0 if Coal==.
replace Nuclear=0 if Nuclear==.

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Brazil", replace


*********************
*Brunei_Darussalam
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Brunei_Darussalam.xlsx", cellrange(A5:E32) firstrow

rename A year
generate country="Brunei_Darussalam"

drop in 3

replace SolarPV=0 if SolarPV==.
generate Wind=0 
generate Waste=0
generate Geothermal=0 
generate Solarthermal=0
replace Coal=0 if Coal==.
replace Oil=0 if Oil==.
replace Naturalgas=0 if Naturalgas==.
generate Biofuels=0 
generate Hydro=0 
generate Othersources=0 
generate Tide=0
generate Nuclear=0 

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Brunei_Darussalam", replace

*********************
*Canada
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Canada.xlsx", cellrange(A5:L33) firstrow

rename A year
generate country="Canada"

drop in 3

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.
replace Waste=0 if Waste==.
generate Geothermal=0 
generate Solarthermal=0
replace Coal=0 if Coal==.
replace Oil=0 if Oil==.
replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.
replace Hydro=0 if Hydro==.
replace Othersources=0 if Othersources==.
replace Tide=0 if Tide==.
replace Nuclear=0 if Nuclear==.

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Canada", replace

*********************
*Chile
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Chile.xlsx", cellrange(A5:J33) firstrow

rename A year
generate country="Chile"

drop in 3

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.
generate Waste=0 
replace Geothermal=0 if Geothermal==.
generate Solarthermal=0 
replace Coal=0 if Coal==.
replace Oil=0 if Oil==.
replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.
replace Hydro=0 if Hydro==.
replace Othersources=0 if Othersources==.
generate Tide=0 
generate Nuclear=0 

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Chile", replace

*********************
*China
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-China.xlsx", cellrange(A5:M32) firstrow

rename A year
generate country="China"

drop in 3

replace Coal=0 if Coal==.
replace Oil=0 if Oil==.
replace Naturalgas=0 if Naturalgas==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.
replace Waste=0 if Waste==.
replace Geothermal=0 if Geothermal==.
replace Solarthermal=0 if Solarthermal==.

replace Biofuels=0 if Biofuels==.
replace Hydro=0 if Hydro==.
generate Othersources=0 
replace Tide=0 if Tide==.
replace Nuclear=0 if Nuclear==.

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_China", replace


*********************
*Croatia
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Croatia.xlsx", cellrange(A5:I32) firstrow

rename A year
generate country="Croatia"

drop in 3

replace Coal=0 if Coal==.
replace Oil=0 if Oil==.
replace Naturalgas=0 if Naturalgas==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.
generate Waste=0 
replace Geothermal=0 if Geothermal==.
generate Solarthermal=0 

replace Biofuels=0 if Biofuels==.
replace Hydro=0 if Hydro==.
generate Othersources=0 
generate Tide=0 
generate Nuclear=0 

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Croatia", replace


*********************
*Curacao
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Curacao.xlsx", cellrange(A5:D32) firstrow

rename A year
generate country="Curacao"

drop in 3

generate Coal=0 
replace Oil=0 if Oil==.
generate Naturalgas=0 

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.
generate Waste=0 
generate Geothermal=0 
generate Solarthermal=0

generate Biofuels=0 
generate Hydro=0 
generate Othersources=0 
generate Tide=0 
generate Nuclear=0

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100 

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Curacao", replace


*********************
*Cyprus
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Cyprus.xlsx", cellrange(A5:E32) firstrow

rename A year
generate country="Cyprus"

drop in 3

generate Coal=0 
replace Oil=0 if Oil==.
generate Naturalgas=0 

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.
generate Waste=0 
generate Geothermal=0 
generate Solarthermal=0

replace Biofuels=0 if Biofuels==.
generate Hydro=0 
generate Othersources=0 
generate Tide=0 
generate Nuclear=0

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Cyprus", replace

*********************
*Czech_Republic
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Czech_Republic.xlsx", cellrange(A5:K33) firstrow

rename A year
generate country="Czech_Republic"

drop in 3

replace Coal=0 if Coal==.
replace Oil=0 if Oil==.
replace Naturalgas=0 if Naturalgas==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.
replace Waste=0 if Waste==.
generate Geothermal=0 
generate Solarthermal=0

replace Biofuels=0 if Biofuels==.
replace Hydro=0 if Hydro==.
replace Othersources="0" if Othersources=="." | Othersources==""
destring Othersources, replace
generate Tide=0 
replace Nuclear=0 if Nuclear==.

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Czech_Republic", replace


*********************
*Denmark
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Denmark.xlsx", cellrange(A5:J33) firstrow

rename A year
generate country="Denmark"

drop in 3

replace Coal=0 if Coal==.
replace Oil=0 if Oil==.
replace Naturalgas=0 if Naturalgas==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.
replace Waste=0 if Waste==.
generate Geothermal=0 
generate Solarthermal=0

replace Biofuels=0 if Biofuels==.
replace Hydro=0 if Hydro==.
replace Othersources=0 if Othersources==.
generate Tide=0 
generate Nuclear=0 

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Denmark", replace

*********************
*Estonia
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Estonia.xlsx", cellrange(A5:I33) firstrow

rename A year
generate country="Estonia"

drop in 3

replace Coal=0 if Coal==.
replace Oil=0 if Oil==.
replace Naturalgas=0 if Naturalgas==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.
replace Waste=0 if Waste==.
generate Geothermal=0 
generate Solarthermal=0

replace Biofuels=0 if Biofuels==.
replace Hydro=0 if Hydro==.
generate Othersources=0 
generate Tide=0 
generate Nuclear=0 

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Estonia", replace

*********************
*Finland
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Finland.xlsx", cellrange(A5:K33) firstrow

rename A year
generate country="Finland"

drop in 3

replace Coal=0 if Coal==.
replace Oil=0 if Oil==.
replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.
replace Waste=0 if Waste==.
generate Geothermal=0 
generate Solarthermal=0


replace Hydro=0 if Hydro==.
replace Othersources=0 if Othersources==.
generate Tide=0 
replace Nuclear=0 if Nuclear==.

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Finland", replace

*********************
*France
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-France.xlsx", cellrange(A5:M33) firstrow

rename A year
generate country="France"

drop in 3

replace Coal=0 if Coal==.
replace Oil=0 if Oil==.
replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.
replace Waste=0 if Waste==.
replace Geothermal=0 if Geothermal==.
generate Solarthermal=0 


replace Hydro=0 if Hydro==.
replace Othersources=0 if Othersources==.
replace Tide=0 if Tide==.
replace Nuclear=0 if Nuclear==.

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_France", replace


*********************
*Germany
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Germany.xlsx", cellrange(A5:L33) firstrow

rename A year
generate country="Germany"

drop in 3

replace Coal=0 if Coal==.
replace Oil=0 if Oil==.
replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.
replace Waste=0 if Waste==.
replace Geothermal=0 if Geothermal==.
generate Solarthermal=0 


replace Hydro=0 if Hydro==.
replace Othersources=0 if Othersources==.
generate Tide=0 
replace Nuclear=0 if Nuclear==.

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Germany", replace


*********************
*Gibraltar
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Gibraltar.xlsx", cellrange(A5:C32) firstrow

rename A year
generate country="Gibraltar"

drop in 3

generate Coal=0 
replace Oil=0 if Oil==.
replace Naturalgas=0 if Naturalgas==.
generate Biofuels=0 

generate SolarPV=0
generate Wind=0 
generate Waste=0 
generate Geothermal=0 
generate Solarthermal=0

generate Hydro=0 
generate Othersources=0 
generate Tide=0 
generate Nuclear=0 

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Gibraltar", replace


*********************
*Greece
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Greece.xlsx", cellrange(A5:I33) firstrow

rename A year
generate country="Greece"

drop in 3

replace Coal=0 if Coal==.
replace Oil=0 if Oil==.
replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.

replace Waste="0" if Waste=="." | Waste==""
destring Waste, replace

generate Geothermal=0 
generate Solarthermal=0
replace Hydro=0 if Hydro==.
generate Othersources=0 
generate Tide=0 
generate Nuclear=0 

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100
	
save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Greece", replace


*********************
*Hong_Kong
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Hong_Kong.xlsx", cellrange(A5:H32) firstrow

rename A year
generate country="Hong_Kong"

drop in 3

replace Coal=0 if Coal==.
replace Oil=0 if Oil==.
replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.
replace Waste=0 if Waste==.
generate Geothermal=0 
generate Solarthermal=0

generate Hydro=0 
generate Othersources=0 
generate Tide=0 
generate Nuclear=0

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Hong_Kong", replace


*********************
*Hungary
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Hungary.xlsx", cellrange(A5:L33) firstrow

rename A year
generate country="Hungary"

drop in 3

replace Coal=0 if Coal==.
replace Oil=0 if Oil==.
replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.
replace Waste=0 if Waste==.
replace Geothermal=0 if Geothermal==.
generate Solarthermal=0 

replace Hydro=0 if Hydro==. 
replace Othersources=0 if Othersources==.
generate Tide=0 
replace Nuclear=0 if Nuclear==. 

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Hungary", replace


*********************
*Iceland
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Iceland.xlsx", cellrange(A5:G33) firstrow

rename A year
generate country="Iceland"

drop in 3

generate Coal=0 
replace Oil=0 if Oil==.
generate Naturalgas=0 
replace Biofuels=0 if Biofuels==.

generate SolarPV=0 
replace Wind=0 if Wind==.
replace Waste=0 if Waste==.
replace Geothermal=0 if Geothermal==.
generate Solarthermal=0 

replace Hydro=0 if Hydro==.
generate Othersources=0 
generate Tide=0 
generate Nuclear=0 

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Iceland", replace


*********************
*India
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-India.xlsx", cellrange(A5:J32) firstrow

rename A year
generate country="India"

drop in 3

replace Coal=0 if Coal==.
replace Oil=0 if Oil==.
replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.

replace Wind=0 if Wind==.
replace Waste=0 if Waste==.
generate Geothermal=0 
generate Solarthermal=0

replace Hydro=0 if Hydro==.
generate Othersources=0 
generate Tide=0 
replace Nuclear=0 if Nuclear==.

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_India", replace



*********************
*Indonesia
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Indonesia.xlsx", cellrange(A5:J32) firstrow

rename A year
generate country="Indonesia"

drop in 3

replace Coal=0 if Coal==.
replace Oil=0 if Oil==.
replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.

replace Wind="0" if Wind=="." | Wind==""
destring Wind, replace

replace Waste=0 if Waste==.
destring Waste, replace

replace Geothermal=0 if Geothermal==.
generate Solarthermal=0

replace Hydro=0 if Hydro==.
generate Othersources=0 
generate Tide=0 
generate Nuclear=0 

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Indonesia", replace


*********************
*Ireland
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Ireland.xlsx", cellrange(A5:I33) firstrow

rename A year
generate country="Ireland"

drop in 3


replace Coal=0 if Coal==.
replace Oil=0 if Oil==.
replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.

replace Waste=0 if Waste==.

generate Geothermal=0 
generate Solarthermal=0

replace Hydro=0 if Hydro==.
generate Othersources=0 
generate Tide=0 
generate Nuclear=0 

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Ireland", replace


*********************
*Israel
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Israel.xlsx", cellrange(A5:J33) firstrow

rename A year
generate country="Israel"

drop in 3


replace Coal=0 if Coal==.
replace Oil=0 if Oil==.
replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.

replace Wind="0" if Wind=="." | Wind==""
destring Wind, replace

generate Waste=0
generate Geothermal=0 
replace Solarthermal=0 if Solarthermal==.

replace Hydro=0 if Hydro==.

replace Othersources="0" if Othersources=="." | Othersources==""
destring Othersources, replace

generate Tide=0 
generate Nuclear=0 

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Israel", replace


*********************
*Italy
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Italy.xlsx", cellrange(A5:K33) firstrow

rename A year
generate country="Italy"

drop in 3

replace Coal=0 if Coal==.
replace Oil=0 if Oil==.
replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.

replace Wind=0 if Wind==.

replace Waste=0 if Waste==.
replace Geothermal=0 if Geothermal==.
generate Solarthermal=0

replace Hydro=0 if Hydro==.

replace Othersources=0 if Othersources==.

generate Tide=0 
generate Nuclear=0 

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Italy", replace


*********************
*Japan
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Japan.xlsx", cellrange(A5:L33) firstrow

rename A year
generate country="Japan"

drop in 3

replace Coal=0 if Coal==.
replace Oil=0 if Oil==.
replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.

replace Wind=0 if Wind==.

replace Waste=0 if Waste==.
replace Geothermal=0 if Geothermal==.
generate Solarthermal=0 

replace Hydro=0 if Hydro==.

replace Othersources=0 if Othersources==.

generate Tide=0
replace Nuclear="0" if Nuclear=="." | Nuclear==""
destring Nuclear, replace

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Japan", replace


*********************
*Korea
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Korea.xlsx", cellrange(A5:L33) firstrow

rename A year
generate country="Korea"

drop in 3

replace Coal=0 if Coal==.
replace Oil=0 if Oil==.
replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.

replace Wind=0 if Wind==.

replace Waste=0 if Waste==.
generate Geothermal=0 
generate Solarthermal=0 

replace Hydro=0 if Hydro==.

replace Othersources=0 if Othersources==.

replace Tide=0 if Tide==.
replace Nuclear=0 if Nuclear==.

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Korea", replace


*********************
*Kuwait
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Kuwait.xlsx", cellrange(A5:F32) firstrow

rename A year
generate country="Kuwait"

drop in 3

generate Coal=0 
replace Oil=0 if Oil==.
replace Naturalgas=0 if Naturalgas==.
generate Biofuels=0 

replace SolarPV=0 if SolarPV==.

replace Wind=0 if Wind==.

generate Waste=0 
generate Geothermal=0 
replace Solarthermal=0 if Solarthermal==.

generate Hydro=0 
generate Othersources=0 
generate Tide=0 
generate Nuclear=0 

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Kuwait", replace


*********************
*Latvia
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Latvia.xlsx", cellrange(A5:H33) firstrow

rename A year
generate country="Latvia"

drop in 3

replace Coal="0" if Coal=="."
destring Coal, replace

replace Oil="0" if Oil=="."
destring Oil, replace

replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.

replace Wind=0 if Wind==.

generate Waste=0 
generate Geothermal=0 
generate Solarthermal=0

replace Hydro=0 if Hydro==.
generate Othersources=0 
generate Tide=0 
generate Nuclear=0 

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Latvia", replace


*********************
*Lithuania
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Lithuania.xlsx", cellrange(A5:K33) firstrow

rename A year
generate country="Lithuania"

drop in 3

replace Coal="0" if Coal=="." | Coal==""
destring Coal, replace
replace Oil=0 if Oil==.

replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.

replace Waste=0 if Waste==.
generate Geothermal=0 
generate Solarthermal=0

replace Hydro=0 if Hydro==.
replace Othersources=0 if Othersources==.
generate Tide=0 
replace Nuclear=0 if Nuclear==.

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Lithuania", replace


*********************
*Luxembourg
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Luxembourg.xlsx", cellrange(A5:I33) firstrow

rename A year
generate country="Luxembourg"

drop in 3

replace Coal=0 if Coal==. 

replace Oil="0" if Oil=="." | Oil==""
destring Oil, replace

replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.

replace Waste=0 if Waste==.
generate Geothermal=0 
generate Solarthermal=0

replace Hydro=0 if Hydro==.
generate Othersources=0 
generate Tide=0 
generate Nuclear=0 

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Luxembourg", replace


*********************
*Malta
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Malta.xlsx", cellrange(A5:F32) firstrow

rename A year
generate country="Malta"

drop in 3

replace Coal=0 if Coal==. 
replace Oil=0 if Oil==.


replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
generate Wind=0 

generate Waste=0 
generate Geothermal=0 
generate Solarthermal=0

generate Hydro=0 
generate Othersources=0 
generate Tide=0 
generate Nuclear=0 

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Malta", replace


*********************
*Mexico
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Mexico.xlsx", cellrange(A5:L33) firstrow

rename A year
generate country="Mexico"

drop in 3

replace Coal=0 if Coal==. 
replace Oil=0 if Oil==.


replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.

replace Waste=0 if Waste==.
replace Geothermal=0 if Geothermal==.
generate Solarthermal=0

replace Hydro=0 if Hydro==.
replace Othersources=0 if Othersources==.
generate Tide=0 
replace Nuclear=0 if Nuclear==. 

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Mexico", replace


*********************
*Netherlands
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Netherlands.xlsx", cellrange(A5:K33) firstrow

rename A year
generate country="Netherlands"

drop in 3

replace Coal=0 if Coal==. 
replace Oil=0 if Oil==.


replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.

replace Waste=0 if Waste==.
generate Geothermal=0 
generate Solarthermal=0

replace Hydro=0 if Hydro==.
replace Othersources=0 if Othersources==.
generate Tide=0
replace Nuclear=0 if Nuclear==.

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Netherlands", replace


*********************
*New_Zealand
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-New_Zealand.xlsx", cellrange(A5:J33) firstrow

rename A year
generate country="New_Zealand"

drop in 3

replace Coal=0 if Coal==. 
replace Oil=0 if Oil==.


replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.

generate Waste=0
replace Geothermal=0 if Geothermal==.
generate Solarthermal=0

replace Hydro=0 if Hydro==.
replace Othersources=0 if Othersources==.
generate Tide=0 
generate Nuclear=0 

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_New_Zealand", replace


*********************
*Norway
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Norway.xlsx", cellrange(A5:J33) firstrow

rename A year
generate country="Norway"

drop in 3

replace Coal=0 if Coal==. 
replace Oil=0 if Oil==.


replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.

replace Waste=0 if Waste==.
generate Geothermal=0 
generate Solarthermal=0

replace Hydro=0 if Hydro==.
replace Othersources=0 if Othersources==.
generate Tide=0 
generate Nuclear=0

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Norway", replace

*********************
*Oman
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Oman.xlsx", cellrange(A5:D32) firstrow

rename A year
generate country="Oman"

drop in 3

generate Coal=0  
replace Oil=0 if Oil==.


replace Naturalgas=0 if Naturalgas==.
generate Biofuels=0 

replace SolarPV=0 if SolarPV==.
generate Wind=0 

generate Waste=0 
generate Geothermal=0 
generate Solarthermal=0

generate Hydro=0 
generate Othersources=0 
generate Tide=0 
generate Nuclear=0

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Oman", replace

*********************
*Panama
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Panama.xlsx", cellrange(A5:H32) firstrow

rename A year
generate country="Panama"

drop in 3

replace Coal=0 if Coal==. 
replace Oil=0 if Oil==.

replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.

generate Waste=0 
generate Geothermal=0 
generate Solarthermal=0

replace Hydro=0 if Hydro==.
generate Othersources=0 
generate Tide=0 
generate Nuclear=0

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Panama", replace


*********************
*Philippines
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Philippines.xlsx", cellrange(A5:J32) firstrow

rename A year
generate country="Philippines"

drop in 3

replace Coal=0 if Coal==. 
replace Oil=0 if Oil==.

replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.

replace Waste=0 if Waste==.
replace Geothermal=0 if Geothermal==.
generate Solarthermal=0

replace Hydro=0 if Hydro==.
generate Othersources=0 
generate Tide=0 
generate Nuclear=0

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Philippines", replace

*********************
*Poland
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Poland.xlsx", cellrange(A5:J33) firstrow

rename A year
generate country="Poland"

drop in 3

replace Coal=0 if Coal==. 
replace Oil=0 if Oil==.

replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.

replace Waste=0 if Waste==. 
generate Geothermal=0 
generate Solarthermal=0

replace Hydro=0 if Hydro==.
replace Othersources=0 if Othersources==.
generate Tide=0 
generate Nuclear=0

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100


save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Poland", replace


*********************
*Portugal
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Portugal.xlsx", cellrange(A5:K33) firstrow

rename A year
generate country="Portugal"

drop in 3

replace Coal=0 if Coal==. 
replace Oil=0 if Oil==.

replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.

replace Waste=0 if Waste==.
replace Geothermal=0 if Geothermal==.
generate Solarthermal=0

replace Hydro=0 if Hydro==.
replace Othersources=0 if Othersources==.
generate Tide=0 
generate Nuclear=0

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Portugal", replace

*********************
*Qatar
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Qatar.xlsx", cellrange(A5:B32) firstrow

rename A year
generate country="Qatar"

drop in 3

generate Coal=0  
generate Oil=0 

replace Naturalgas=0 if Naturalgas==.
generate Biofuels=0 

generate SolarPV=0
generate Wind=0 

generate Waste=0 
generate Geothermal=0 
generate Solarthermal=0 

generate Hydro=0 
generate Othersources=0 
generate Tide=0 
generate Nuclear=0

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Qatar", replace

*********************
*Republic_of_Turkiye
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Republic_of_Turkiye.xlsx", cellrange(A5:K33) firstrow

rename A year
generate country="Turkiye"

drop in 3

replace Coal=0 if Coal==. 
replace Oil=0 if Oil==.

replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.

replace Waste=0 if Waste==.
replace Geothermal=0 if Geothermal==.
generate Solarthermal=0 

replace Hydro=0 if Hydro==.
replace Othersources=0 if Othersources==.
generate Tide=0 
generate Nuclear=0

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Turkiye", replace


*********************
*Saudi_Arabia
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Saudi_Arabia.xlsx", cellrange(A5:D32) firstrow

rename A year
generate country="Saudi Arabia"

drop in 3

generate Coal=0  
replace Oil=0 if Oil==.

replace Naturalgas=0 if Naturalgas==.
generate Biofuels=0
generate Wind=0

generate Waste=0 
generate Geothermal=0 
generate Solarthermal=0 

generate Hydro=0 
generate Othersources=0 
generate Tide=0 
generate Nuclear=0

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV+ Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Saudi_Arabia", replace


*********************
*Singapore
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Singapore.xlsx", cellrange(A5:G32) firstrow

rename A year
generate country="Singapore"

drop in 3

replace Coal=0 if Coal==. 
replace Oil=0 if Oil==.

replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
generate Wind=0

replace Waste=0 if Waste==.
generate Geothermal=0 
generate Solarthermal=0 

generate Hydro=0 
generate Othersources=0 
generate Tide=0 
generate Nuclear=0

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV + Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Singapore", replace


*********************
*Slovak_Republic
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Slovak_Republic.xlsx", cellrange(A5:K33) firstrow

rename A year
generate country="Slovak Republic"

drop in 3

replace Coal=0 if Coal==. 
replace Oil=0 if Oil==.

replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.

replace Waste=0 if Waste==.
generate Geothermal=0 
generate Solarthermal=0 

replace Hydro=0 if Hydro==.
replace Othersources=0 if Othersources==.
generate Tide=0 
replace Nuclear=0 if Nuclear==.

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV + Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Slovak_Republic", replace


*********************
*Slovenia
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Slovenia.xlsx", cellrange(A5:J33) firstrow

rename A year
generate country="Slovenia"

drop in 3

replace Coal=0 if Coal==. 
replace Oil=0 if Oil==.

replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.

replace Waste=0 if Waste==.
generate Geothermal=0 
generate Solarthermal=0 

replace Hydro=0 if Hydro==.
generate Othersources=0
generate Tide=0 
replace Nuclear=0 if Nuclear==.

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV + Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Slovenia", replace


*********************
*South Africa
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-South_Africa.xlsx", cellrange(A5:I32) firstrow

rename A year
generate country="South Africa"

drop in 3

replace Coal=0 if Coal==. 
replace Oil=0 if Oil==.

generate Naturalgas=0 
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.

generate Waste=0 
generate Geothermal=0
replace Solarthermal=0 if Solarthermal==.

replace Hydro=0 if Hydro==.
generate Othersources=0
generate Tide=0 
replace Nuclear=0 if Nuclear==.

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV + Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_South_Africa", replace


*********************
*Spain
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Spain.xlsx", cellrange(A5:M33) firstrow

rename A year
generate country="Spain"

drop in 3

replace Coal=0 if Coal==. 
replace Oil=0 if Oil==.

replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.

replace Waste=0 if Waste==.
generate Geothermal=0
replace Solarthermal=0 if Solarthermal==.

replace Hydro=0 if Hydro==.
replace Othersources=0 if Othersources==.
replace Tide=0 if Tide==.
replace Nuclear=0 if Nuclear==.

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV + Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Spain", replace


*********************
*Sweden
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Sweden.xlsx", cellrange(A5:J33) firstrow

rename A year
generate country="Sweden"

drop in 3

replace Coal=0 if Coal==. 
replace Oil=0 if Oil==.

replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.

replace Waste=0 if Waste==.
generate Geothermal=0 
generate Solarthermal=0 

replace Hydro=0 if Hydro==.
generate Othersources=0 
generate Tide=0 
replace Nuclear=0 if Nuclear==.

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV + Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Sweden", replace


*********************
*Switzerland
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Switzerland.xlsx", cellrange(A5:J33) firstrow

rename A year
generate country="Switzerland"

drop in 3

replace Coal=0 if Coal==. 
replace Oil=0 if Oil==.

replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.

replace Waste=0 if Waste==.
generate Geothermal=0 
generate Solarthermal=0 

replace Hydro=0 if Hydro==.
generate Othersources=0 
generate Tide=0 
replace Nuclear=0 if Nuclear==.

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV + Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Switzerland", replace


*********************
*Thailand
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Thailand.xlsx", cellrange(A5:J32) firstrow

rename A year
generate country="Thailand"

drop in 3

replace Coal=0 if Coal==. 
replace Oil=0 if Oil==.

replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.

replace Waste=0 if Waste==.
replace Geothermal=0 if Geothermal==.
generate Solarthermal=0

replace Hydro=0 if Hydro==.
generate Othersources=0 
generate Tide=0 
generate Nuclear=0

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV + Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Thailand", replace


*********************
*Trinidad_and_Tobago
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Trinidad_and_Tobago.xlsx", cellrange(A5:E32) firstrow

rename A year
generate country="Trinidad and Tobago"

drop in 3

generate Coal=0 
replace Oil=0 if Oil==.

replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
generate Wind=0

generate Waste=0 
generate Geothermal=0 
generate Solarthermal=0 

generate Hydro=0 
generate Othersources=0 
generate Tide=0 
generate Nuclear=0

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV + Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Trinidad_and_Tobago", replace

*********************
*United_Arab_Emirates
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-United_Arab_Emirates.xlsx", cellrange(A5:F32) firstrow

rename A year
generate country="United Arab Emirates"

drop in 3

generate Coal=0
replace Oil=0 if Oil==.

replace Naturalgas=0 if Naturalgas==.
generate Biofuels=0

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.

generate Waste=0
generate Geothermal=0 
replace Solarthermal=0 if Solarthermal==.

generate Hydro=0
generate Othersources=0 
generate Tide=0 
generate Nuclear=0

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV + Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_United_Arab_Emirates", replace


*********************
*United Kingdom
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-United_Kingdom.xlsx", cellrange(A5:K33) firstrow

rename A year
generate country="United Kingdom"

drop in 3

replace Coal=0 if Coal==. 
replace Oil=0 if Oil==.

replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.

replace Waste=0 if Waste==.
generate Geothermal=0 
generate Solarthermal=0 

replace Hydro=0 if Hydro==.
generate Othersources=0 
replace Tide=0 if Tide==.
replace Nuclear=0 if Nuclear==.

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV + Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_United_Kingdom", replace


*********************
*United States
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-United_States.xlsx", cellrange(A5:M33) firstrow

rename A year
generate country="United States"

drop in 3

replace Coal=0 if Coal==. 
replace Oil=0 if Oil==.

replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.

replace Waste=0 if Waste==.
replace Geothermal=0 if Geothermal==.
replace Solarthermal=0 if Solarthermal==.

replace Hydro=0 if Hydro==.
replace Othersources=0 if Othersources==.
generate Tide=0 
replace Nuclear=0 if Nuclear==.

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV + Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_United_States", replace



*********************
*Uruguay
*********************
clear all
cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\excel"

import excel "Electricity_generation_by_source-Uruguay.xlsx", cellrange(A5:G32) firstrow

rename A year
generate country="Uruguay"

drop in 3

generate Coal=0
replace Oil=0 if Oil==.

replace Naturalgas=0 if Naturalgas==.
replace Biofuels=0 if Biofuels==.

replace SolarPV=0 if SolarPV==.
replace Wind=0 if Wind==.

generate Waste=0
generate Geothermal=0 
generate Solarthermal=0 

replace Hydro=0 if Hydro==.
generate Othersources=0 
generate Tide=0 
generate Nuclear=0

generate total_e = Coal + Oil + Naturalgas + Biofuels + Hydro + Solarthermal + SolarPV + Geothermal + Waste + Othersources + Nuclear + Tide + Wind
	
	generate s_w_t = ((Solarthermal + SolarPV + Wind + Tide)/total_e)*100
	generate s_w_bio_t = ((Solarthermal + SolarPV + Wind + Biofuels + Tide)/total_e)*100
	generate s_w_bio_h_t = ((Solarthermal + SolarPV + Wind + Biofuels + Hydro + Tide)/total_e)*100

save "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data\country_Uruguay", replace




***********************
clear all

cd "C:\Users\natal\OneDrive - University of Edinburgh\women_in_power\data\IEA\arrange_data"


local files : dir "."  files "country_*.dta" 

foreach file in `files'{
		
append using `file'
	
	
 drop if year==2021		
}

*To control everything is fine, it should be 60 countries pero year
tab year country 

rename country countryname

replace countryname="Brunei Darussalam" if countryname=="Brunei_Darussalam"
replace countryname="Curaçao" if countryname=="Curacao"
replace countryname="Czechia" if countryname=="Czech_Republic"
replace countryname="Hong Kong" if countryname=="Hong_Kong"
replace countryname="Korea, Rep." if countryname=="Korea"
replace countryname="New Zealand" if countryname=="New_Zealand"

save IEA_final, replace

