;;;-*-Emacs-Lisp-*-

;;; Commentary:
;;;
;;;

;;; Code:

(when (and (maybe-require-package 'powerline)
           (maybe-require-package 'powerline-evil))
  (powerline-default-theme))

(provide 'init-powerline)
