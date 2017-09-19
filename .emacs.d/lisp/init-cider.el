;;;-*-Emacs-Lisp-*-

;;; Commentary:
;;;

;;; Code:

(use-package cider
  :ensure t
  :pin melpa-stable
  
  :config
  ;
  (setq cider-overlays-use-font-lock t)

  (use-package helm-cider
               
    :ensure t))
 

(provide 'init-cider)
