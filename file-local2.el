;;; -*- lexical-binding: t -*-

(defun other-foo (func)
  (lambda (arg)
    (apply func arg)))

(defun other-bar ()
  (funcall (other-foo 'eval) '(5)))



(provide 'file-local2)
;;; file-local2.el ends here



