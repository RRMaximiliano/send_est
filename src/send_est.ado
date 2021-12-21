*! version 0.0.1

* send estimates number to tex for input
  capture program drop send_est
  program send_est 
    syntax using/, local(string) 
      
    local lcl = "`local'"
      
    file open  newfile using "`using'", write replace
    file write newfile "`lcl'"
    file close newfile
    
    display as res `"Exported value: `lcl'"'
    display as txt `"Estimates saved to: {browse "`using'":`using'} "' 
    display as txt ""
  end
