
## LIBRARIES ##

import matplotlib.pyplot as mpl                                             # requires "pip install matplot"
from numpy import divide, multiply, zeros



## PARAMETERS ##

init_house_cost = 300e3                                                     # initial house cost [€]
pch_discount = 0e3                                                         # purchase discount applied by constructor / seller [€]

vbonus_gross_disc = 0e3                                                    # various gross bonus discounts (e.g. antiseismic) [€]
vbonus_int_y = 4.5                                                          # bank interest on bonuses re-selling [%/year]
vbonus_per = 5                                                              # bank duration on bonuses re-selling [year]

agency_rate = 0.0                                                           # 3rd-party agency expenses percentage [%]
iva_tax_rate = 4.0                                                          # IVA tax percentage [%]
notar_exp = 5e3                                                             # notary expenses [€]
util_exp = 5e3                                                              # utilities connection expenses (aka "allacciamento utenze") [€]

mg_init_pay = 100e3                                                         # mortgage initial payment / deposit [€]
mg_inter_y = 3.8                                                            # bank yearly-interest on mortgage [%/year]
mg_duration = 20                                                            # mortgage duration [year]



## CONSTANTS ##

mg_no_pay_per_year = 12                                                     # number of mortgage payments per year [#/year] -> DO NOT CHANGE!
MG_IDX = dict([ 
    ('mgc_m',0),                                                            # array index for mortgage-capital paid each month
    ('int_m',1),                                                            # array index for mortgage-interests paid each month
    ('mgc_t',2),                                                            # array index for overall mortgage-capital paid so far
    ('hcp_t',3),                                                            # array index for overall house capital paid so far
    ])



## PROCESSING ##

vbonus_net_disc = vbonus_gross_disc*(1-(vbonus_int_y/100)*vbonus_per)       # various net bonus discounts [€]
final_house_cost = init_house_cost-vbonus_net_disc-pch_discount             # final house cost (NB: assuming bonuses are directly deducted from house cost) [€]                   

iva_exp = final_house_cost*(iva_tax_rate/100)                               # iva-tax net expenses [€]
agency_exp = final_house_cost*(agency_rate/100)                             # agency net expenses [€]
tot_init_payment = mg_init_pay+iva_exp+agency_exp+notar_exp+util_exp        # total initial payment (house deposit plus expenses) [€]

mg_amount = final_house_cost-mg_init_pay                                    # mortgage amount requested to bank [€]
mg_inter_m = (mg_inter_y/100)/mg_no_pay_per_year                            # bank monthly-interest on mortgage [(%/100)/mounth]
mg_montly_pay = mg_amount/((1+1/mg_inter_m)*(1-1/((1+mg_inter_m) \
    **(mg_no_pay_per_year*mg_duration))))                                   # fixed mortgage monthly payment based on depreciation formula (aka "ammortamento") [€]

tot_no_mg_payments = mg_duration*mg_no_pay_per_year                         # total number of mortgage monthly payments [mounth]
mg_history = zeros((len(MG_IDX),tot_no_mg_payments),dtype=float)            # mortgage history matrix
for j in range(tot_no_mg_payments) :
    cap_perc = 1/((1+mg_inter_m)**(tot_no_mg_payments-j))
    int_perc = 1-cap_perc
    mg_history[MG_IDX['mgc_m']][j] = cap_perc
    mg_history[MG_IDX['int_m']][j] = int_perc
    mg_history[MG_IDX['mgc_t']][j] = mg_montly_pay*sum(mg_history[MG_IDX['mgc_m']][:j+1])
    mg_history[MG_IDX['hcp_t']][j] = mg_history[MG_IDX['mgc_t']][j]+mg_init_pay



## RESULTS ##

print('\n -- Initial house cost\t\t= '+str(round(init_house_cost/1e3,1))+' k€')
print(' -- Purchase discount\t\t= -'+str(round(pch_discount/1e3,1))+' k€')
print(' -- Various bonuses\t\t= -'+str(round(vbonus_net_disc/1e3,1))+' k€')
print(' >> Final house cost\t\t= '+str(round(final_house_cost/1e3,1))+' k€')
print(' --------------------')
print(' -- Mortgage deposit ('+str(round(mg_init_pay/final_house_cost*100,1))+'%)\t= '+str(round(mg_init_pay/1e3,1))+' k€')
print(' -- IVA expenses ('+str(iva_tax_rate)+' %)\t= '+str(round(iva_exp/1e3,1))+' k€')
print(' -- Agency expenses ('+str(agency_rate)+' %)\t= '+str(round(agency_exp/1e3,1))+' k€')
print(' -- Notary expenses\t\t= '+str(round(notar_exp/1e3,1))+' k€')
print(' -- Utilities expenses\t\t= '+str(round(util_exp/1e3,1))+' k€')
print(' >> Total initial payment\t= '+str(round(tot_init_payment/1e3,1))+' k€')
print(' --------------------')
print(' -- Mortgage amount\t\t= '+str(round(mg_amount/1e3,1))+' k€')
print(' -- Mortgage interest rate\t= '+str(round(mg_inter_y,1))+' %/year')
print(' -- Mortgage duration\t\t= '+str(mg_duration)+' years')
print(' >> Mortgage monthly payment\t= '+str(round(mg_montly_pay,2))+' €')


fig, (ax1a, ax2) = mpl.subplots(1,2,num='HOUSE',dpi=100,figsize=(11,5))

xtime = divide(range(tot_no_mg_payments),mg_no_pay_per_year)
ymgc_m = multiply(mg_history[MG_IDX['mgc_m']][:],100)
yint_m = multiply(mg_history[MG_IDX['int_m']][:],100)
ax1a.plot(xtime, ymgc_m, label="Capital", color='orange', linestyle='-', linewidth=1.5, marker ='*',markersize=1.5)
ax1a.plot(xtime, yint_m, label="Interests", color='red', linestyle='-.', linewidth=1.5)
ax1a.legend(loc='center right')
ax1a.set_xlabel('Time [years]')
ax1a.set_ylabel('Percentage [%]')
ax1a.set_title('COMPONENTS OF MORTGAGE\nMONTHLY PAYMENTS ('+str(round(mg_montly_pay,2))+' €)')
ax1a.grid(color='silver', linestyle='--', linewidth=1)
ax1b = ax1a.twinx()
ax1b.set_ylabel('\nAmount [k€]')
ylim1b_min = 0 #min(mg_montly_pay/1e3*mg_history[MG_IDX['mgc_m']][0],mg_montly_pay/1e3*mg_history[MG_IDX['int_m']][-1])
ylim1b_max = max(mg_montly_pay/1e3*mg_history[MG_IDX['mgc_m']][-1],mg_montly_pay/1e3*mg_history[MG_IDX['int_m']][0])
ax1b.set_ylim((ylim1b_min,ylim1b_max))

ax2.plot(mg_duration,final_house_cost/1e3, color='limegreen', marker ='o',markersize=7)
ax2.plot(mg_duration,mg_amount/1e3, color='blue', marker ='o',markersize=7)
#ax2.plot([0, mg_duration], [final_house_cost/1e3, final_house_cost/1e3], color='limegreen', linestyle='--', linewidth=0.5)
ax2.plot(xtime, divide(mg_history[MG_IDX['hcp_t']][:],1e3), label="House", color='limegreen', linestyle='-', linewidth=1.5, marker ='*',markersize=1.5)
ax2.plot(xtime, divide(mg_history[MG_IDX['mgc_t']][:],1e3), label="Mortgage", color='blue', linestyle='-.', linewidth=1.5)
ax2.legend(loc='upper left')
ax2.set_xlabel('Time [years]')
#ax2.set_ylabel('Amount [k€]')
ax2.set_title('OWNED CAPITAL\n('+str(round(final_house_cost/1e3,1)) +' k€)')
ax2.grid(color='silver', linestyle='--', linewidth=1)

mpl.tight_layout()                                                          # tighten layout for better appearance
mpl.show(block=False)                                                       # show plots
mpl.pause(0.001)                                                            # pause execution for 1 ms
input("\nPress ENTER to exit")                                              # ask closing plots on terminal
mpl.close('all')                                                            # close all plots
