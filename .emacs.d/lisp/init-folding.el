;;;-*-Emacs-Lisp-*-

;;; Commentary:
;;;

;;; Code:

(use-package folding
  :ensure t
  :config
  (folding-mode-add-find-file-hook))

(provide 'init-folding)
