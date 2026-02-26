****************************************************
* baseline_cleaning.do
* Sample Stata cleaning script for coffee baseline
* Author: Daniel Mutembesa (sample prepared for application)
****************************************************

* 1) Load data
* Replace with your exported SurveyCTO dataset path
use "coffee_baseline.dta", clear

* 2) Basic checks
assert !missing(farmer_id)
duplicates report farmer_id

* 3) Drop records missing key fields
drop if missing(farmer_id) | missing(district)

* 4) Encode categorical variables (if needed)
* Example if district is string:
capture confirm string variable district
if _rc==0 {
    encode district, gen(district_id)
}

* 5) CSA adoption index (binary yes/no coded as 1/0 or strings)
* If yes/no are strings:
capture confirm string variable uses_mulch
if _rc==0 {
    gen uses_mulch_bin = (lower(uses_mulch)=="yes")
    gen uses_shade_bin = (lower(uses_shade)=="yes")
}
else {
    gen uses_mulch_bin = uses_mulch
    gen uses_shade_bin = uses_shade
}

gen csa_index = uses_mulch_bin + uses_shade_bin
label var csa_index "CSA adoption index (0-2)"

* 6) Yield per tree (guard against divide by zero)
gen yield_per_tree = .
replace yield_per_tree = last_yield / coffee_trees if coffee_trees>0
label var yield_per_tree "Harvest (kg) per coffee tree"

* 7) Example RCT indicator (illustrative)
* Replace with real treatment assignment rules
gen treatment = (district=="wakiso")
label var treatment "Illustrative treatment indicator"

* 8) Summary statistics
sum age land_size coffee_trees last_yield yield_per_tree csa_index treatment

* 9) Save cleaned dataset
save "coffee_cleaned.dta", replace

* 10) Export analysis-ready CSV (optional)
export delimited using "coffee_cleaned.csv", replace
