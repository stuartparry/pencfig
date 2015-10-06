;;;-*-Emacs-Lisp-*-

;;; Commentary:
;;;
;;;

;;; Code:

(maybe-require-package 'auctex)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
`
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(provide 'init-auctex)
