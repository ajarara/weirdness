# Repro

In my experience, buttercup behaves unexpectedly when dealing with lexical binding:


test scenarios are organized in branches, to reproduce, switch to the branch and "make test". 

for M-x buttercup-run-at-point output, add this repo to load-path (ie with prep.el, modifying the directory inside) and M-x buttercup-run-at-point.


- file-local-only:
  - contains one file and an associated test, lexical-binding set by a file-local variable
  - ```make test``` output: 
  ``` make
  ```
  - M-x buttercup-run-at-point output:
  
- setq-local-only:
  - analogous to the above, contains one file and an associated test, but lexical binding set by (setq lexical-binding t)
  - ```make test``` output:
  ``` make
  ```
  - M-x buttercup-run-at-point output:
  
- two-file-local:
  - contains two files with lexical binding set by file-locals.
  - ```make test``` output:
  ``` make
  ```
  - M-x buttercup-run-at-point output:
  
- master: tests file-local lexical binding in conjunction with (setq lexical-binding t)
  - ```make test``` output:
  ``` make
  ```
  - M-x buttercup-run-at-point output:
  

