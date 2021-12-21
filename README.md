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

## Author

In case you would like to contact me, you can email me at: [rodriguezramirez@worldbank.org](mailto:rodriguezramirez@worldbank.org)
