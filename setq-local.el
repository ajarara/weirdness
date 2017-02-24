(setq-local lexical-binding t)

(defun foo (func)
  (lambda (arg)
    (apply func arg)))

(defun bar ()
  (funcall (foo 'eval) '(5)))



(provide 'setq-local)
;;; setq-local.el ends here



