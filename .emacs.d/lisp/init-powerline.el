;;;-*-Emacs-Lisp-*-

;;; Commentary
;;;
;;;

;;; Code;

(use-package powerline
  :ensure t
  :config
  (use-package powerline-evil
    :ensure t
    :config
    (powerline-center-evil-theme)))

(provide 'init-powerline)
