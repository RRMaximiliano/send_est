**send_est - send estimates to LaTeX**
=====

## Description

`send_est` is a command that send estimates to either LaTeX or any other file binary file using Stata's `file` command.

## Install

```stata
net install send_est, from("https://raw.githubusercontent.com/rrmaximiliano/send_est/main") replace
```

## Usage

The syntax is as follows:

```stata
send_est using "file_to_be_exported.tex", local(estimate)
```

### Example

```stata
sysuse auto, clear 

count if foreign == 1
send_est using "foreign_N.tex", local(`r(N')
```

After you have exported your estimate to, for example, LaTeX you can include in your manuscript using the `input' command.

```tex
The total number of foreign cars is \input{foreign_N.tex}\unskip.
```

### Coefficients

```stata
sysuse auto, clear

reg price foreign
local tempn = round(_b[foreign],0.02)
send_est using "foreign_b.tex", local(`tempn')
```

Output:

```stata
. sysuse auto, clear
(1978 Automobile Data)

. reg price foreign

      Source |       SS           df       MS      Number of obs   =        74
-------------+----------------------------------   F(1, 72)        =      0.17
       Model |  1507382.66         1  1507382.66   Prob > F        =    0.6802
    Residual |   633558013        72  8799416.85   R-squared       =    0.0024
-------------+----------------------------------   Adj R-squared   =   -0.0115
       Total |   635065396        73  8699525.97   Root MSE        =    2966.4

------------------------------------------------------------------------------
       price |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
     foreign |   312.2587   754.4488     0.41   0.680    -1191.708    1816.225
       _cons |   6072.423    411.363    14.76   0.000     5252.386     6892.46
------------------------------------------------------------------------------

. local tempn = round(_b[foreign],0.02)

. send_est using "foreign_b.tex", local(`tempn')
(note: file foreign_b.tex not found)
Exported value: 312.26
Estimates saved to: foreign_b.tex 
```

## Author

In case you would like to contact me, you can email me at: [rodriguezramirez@worldbank.org](mailto:rodriguezramirez@worldbank.org)
