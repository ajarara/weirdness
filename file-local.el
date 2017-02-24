;;; -*- lexical-binding: t -*-

(defun foo (func)
  (lambda (arg)
    (apply func arg)))

(defun bar ()
  (funcall (foo 'eval) '(5)))



(provide 'file-local)
;;; file-local.el ends here



