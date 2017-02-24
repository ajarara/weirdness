# Buttercup bug

It seems that buttercup doesn't honor lexical binding.

Three test cases:
  * lexical binding set as a file local
  * lexical binding set as such:
  ``` elisp
  (setq lexical-binding t)
  ```
  * lexical-let?
  No one uses this so it's fine if unsupported
