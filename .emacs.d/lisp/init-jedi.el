;;;-*-Emacs-Lisp-*-

;;; Commentary:
;;;

;;; Code:

(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup))

(provide 'init-jedi)
