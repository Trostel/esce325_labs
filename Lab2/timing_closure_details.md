# Generated Design
## Netlist post-fitting
![Post-Fitting Netlist](./pictures/post_fitting_netlist.png)  

## RTL
![RTL](./pictures/rtl.png)  

## On-Chip layout
![Layout](./pictures/zoomed_chip_layout.png)  

# Utilization g60_arccos
 - Logic utilization (in ALMs): 6/32,070 (< 1%)
 - Total registers: 10  
 - Total pins: 20/457 (4%)
 - Total DSP blocks: 4/87 (5%)

# Timing Analysis
All slack values are end point total slack times.

## Requested Fmax = 250 MHz | T_ck = 4 ns   
  - Fast 1100 mV 0C  Model **Hold slack** = +0.900 ns  
  - Slow 1100 mV 85C Model **Setup slack** = -14.937 ns  
  - Slow 1100 mV 85C Model **End Points TNS** = -146.934 ns  
  - Slow 1100 mV 85C Model **Fmax** = 51.59 MHz  

![Top Failing Paths](./pictures/4ns_tck_top_failing_paths.png)

## Requested Fmax = 125 MHz | T_ck = 8 ns  
  - Fast 1100 mV 0C  Model **Hold slack** = +0.899 ns  
  - Slow 1100 mV 85C Model **Setup slack** = -10.722 ns  
  - Slow 1100 mV 85C Model **End Points TNS** = -104.966 ns  
  - Slow 1100 mV 85C Model **Fmax** = 53.41 MHz

![Top Failing Paths](./pictures/8ns_tck_top_failing_paths.png)

## Requested Fmax = 50 MHz | T_ck = 20 ns
  - Fast 1100 mV 0C  Model **Hold slack** = +0.899 ns    
  - Slow 1100 mV 85C Model **Setup slack** = +1.301 ns  
  - Slow 1100 mV 85C Model **Fmax** = 53.48 MHz
