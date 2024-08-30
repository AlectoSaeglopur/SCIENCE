
## LIBRARIES ##

import matplotlib.pyplot as mpl                                             # requires "pip install matplot"
from numpy import divide, multiply, zeros



## PARAMETERS ##

mg_amount = 180e3                                                           # mortgage amount requested to bank [€]
mg_inter_y = 2.7                                                            # bank yearly-interest on mortgage [%/year]
mg_duration = 25                                                            # mortgage duration [year]



## CONSTANTS ##

mg_no_pay_per_year = 12                                                     # number of mortgage payments per year [#/year] -> DO NOT CHANGE!
MG_IDX = dict([ 
    ('mgc_m',0),                                                            # array index for mortgage-capital paid each month
    ('int_m',1),                                                            # array index for mortgage-interests paid each month
    ('mgc_t',2),                                                            # array index for overall mortgage-capital paid so far
    ('int_t',3),                                                            # array index for overall mortgage interests paid so far
    ('hcp_t',4),                                                            # array index for overall house capital paid so far
    ])



## PROCESSING ##


mg_inter_m = (mg_inter_y/100)/mg_no_pay_per_year                            # bank monthly-interest on mortgage [(%/100)/mounth]
mg_montly_pay = mg_amount/((1+1/mg_inter_m)*(1-1/((1+mg_inter_m) \
    **(mg_no_pay_per_year*mg_duration))))                                   # fixed mortgage monthly payment based on depreciation formula (aka "ammortamento") [€]

mg_tot_no_payments = mg_duration*mg_no_pay_per_year                         # total number of mortgage monthly payments [mounth]
mg_history = zeros((len(MG_IDX),mg_tot_no_payments),dtype=float)            # mortgage history matrix
for j in range(mg_tot_no_payments) :
    cap_perc = 1/((1+mg_inter_m)**(mg_tot_no_payments-j))                   # capital percentage paid each month [%/100]
    int_perc = 1-cap_perc                                                   # interests percentage paid each month [%/100]
    mg_history[MG_IDX['mgc_m']][j] = cap_perc
    mg_history[MG_IDX['int_m']][j] = int_perc
    mg_history[MG_IDX['mgc_t']][j] = mg_montly_pay* \
        sum(mg_history[MG_IDX['mgc_m']][:j+1])
    mg_history[MG_IDX['int_t']][j] = mg_montly_pay* \
        sum(mg_history[MG_IDX['int_m']][:j+1])
#    mg_history[MG_IDX['hcp_t']][j] = mg_history[MG_IDX['mgc_t']][j]+ \
#        init_pay
mg_tot_int_paid = mg_montly_pay*sum(mg_history[MG_IDX['int_m']][:])         # total amount of interests paid during whole mortgage period [€]



## RESULTS ##

print(' -- Mortgage capital amount\t= '+str(round(mg_amount/1e3,1))+' k€')
print(' -- Mortgage interest rate\t= '+str(round(mg_inter_y,2))+' %/year')
print(' -- Mortgage duration\t\t= '+str(mg_duration)+' years')
print(' >> Mortgage monthly payment\t= '+str(round(mg_montly_pay,2))+' €')
print(' >> Overall mortgage interests\t= '+str(round(mg_montly_pay*sum(mg_history[MG_IDX['int_m']][:])/1e3,1))+' k€')

'''
fig, (ax1a, ax2) = mpl.subplots(1,2,num='HOUSE',dpi=100,figsize=(11,5))
xtime = divide(range(mg_tot_no_payments),mg_no_pay_per_year)
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

ax2.plot(xtime, divide(mg_history[MG_IDX['hcp_t']][:],1e3), label="House capital", color='limegreen', linestyle='-', linewidth=1.5, marker ='.',markersize=1.5)
ax2.plot(xtime, divide(mg_history[MG_IDX['mgc_t']][:],1e3), label="Mortgage capital", color='blue', linestyle='-.', linewidth=1.5)
ax2.plot(xtime, divide(mg_history[MG_IDX['int_t']][:],1e3), label="Mortgage interests", color='deepskyblue', linestyle='--', linewidth=1.5)
ax2.plot(mg_duration,net_house_cost/1e3, color='limegreen', marker ='o',markersize=7)
ax2.plot(mg_duration,mg_amount/1e3, color='blue', marker ='o',markersize=7)
ax2.plot(mg_duration,mg_tot_int_paid/1e3, color='deepskyblue', marker ='o',markersize=7)
ax2.legend(loc='upper left')
ax2.set_xlabel('Time [years]')
#ax2.set_ylabel('Amount [k€]')
ax2.set_title('OVERALL MORTGAGE\nREPAYMENTS')
ax2.grid(color='silver', linestyle='--', linewidth=1)

mpl.tight_layout()                                                          # tighten layout for better appearance
mpl.show(block=False)                                                       # show plots
mpl.pause(0.001)                                                            # pause execution for 1 ms
input("\nPress ENTER to exit")                                              # ask closing plots on terminal
mpl.close('all')                                                            # close all plots
'''
