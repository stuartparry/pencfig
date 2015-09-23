;;;-*-Emacs-Lisp-*-

;;; Commentary:
;;;
;;;

;;; Code:

(maybe-require-package 'helm-helm-commands)
(maybe-require-package 'helm-gtags)
(maybe-require-package 'helm-mode-manager)

(when (maybe-require-package 'helm)
  
  ; Always uee Helm
  (setq helm-buffers-fuzzy-matching t)
  (helm-mode 1)
  
)

(provide 'init-helm)
