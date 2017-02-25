# Repro

In my experience, buttercup behaves unexpectedly when dealing with lexical binding:


test scenarios are organized in branches, to reproduce, switch to the branch and "make test". (ignore setq-local and master branches)

for M-x buttercup-run-at-point output, add this repo to load-path (ie with prep.el, modifying the directory inside) and M-x buttercup-run-at-point.


# file-local-only
  - contains one file and an associated test, lexical-binding set by a file-local variable
  - ```make test``` output: 
  ``` make
  -*- mode: compilation; default-directory: "~/proj/bug/buttercup/" -*-
Compilation started at Sat Feb 25 13:27:35

make -k test
emacs -batch -l prep.el -f buttercup-run-discover
Loading /usr/share/emacs/site-lisp/site-start.d/autoconf-init.el (source)...
Loading /usr/share/emacs/site-lisp/site-start.d/desktop-entry-mode-init.el (source)...
Loading /usr/share/emacs/site-lisp/site-start.d/git-init.el (source)...
Loading /usr/share/emacs/site-lisp/site-start.d/mercurial-site-start.el (source)...
Running 1 specs.

file-local's bar
  should return 5 on being called

Ran 1 specs, 0 failed, in 0.0 seconds.

Compilation finished at Sat Feb 25 13:27:35

  ```
  - M-x buttercup-run-at-point output:
  ```
  Running 1 specs.

file-local's bar
  should return 5 on being called  FAILED

========================================
file-local's bar should return 5 on being called

Traceback (most recent call last):
  ((lambda (arg) (apply func arg)) (5))
  (apply func arg)
error: (void-variable func)


Ran 1 specs, 1 failed, in 0.0 seconds.

  ```
  
# two-file-local
  - contains two files with lexical binding set by file-locals.
  - ```make test``` output:
  ``` make
  -*- mode: compilation; default-directory: "~/proj/bug/buttercup/" -*-
Compilation started at Sat Feb 25 13:30:23

make -k test
emacs -batch -l prep.el -f buttercup-run-discover
Loading /usr/share/emacs/site-lisp/site-start.d/autoconf-init.el (source)...
Loading /usr/share/emacs/site-lisp/site-start.d/desktop-entry-mode-init.el (source)...
Loading /usr/share/emacs/site-lisp/site-start.d/git-init.el (source)...
Loading /usr/share/emacs/site-lisp/site-start.d/mercurial-site-start.el (source)...
Running 2 specs.

file-local's bar
  should return 5 on being called

file-local2's other-bar
  should return 5 on being called

Ran 2 specs, 0 failed, in 0.0 seconds.

Compilation finished at Sat Feb 25 13:30:23

  ```
  - M-x buttercup-run-at-point output:
  ```
  Running 1 specs.

file-local's bar
  should return 5 on being called  FAILED

========================================
file-local's bar should return 5 on being called

Traceback (most recent call last):
  ((lambda (arg) (apply func arg)) (5))
  (apply func arg)
error: (void-variable func)


Ran 1 specs, 1 failed, in 0.0 seconds.


Running 1 specs.

file-local2's other-bar
  should return 5 on being called

Ran 1 specs, 0 failed, in 0.0 seconds.

  ```
  
