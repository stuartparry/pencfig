;;;-*-Emacs-Lisp-*-

;;; Commentary:
;;;

;;; Code:

(use-package yasnippet
  :ensure t
  :commands (yas-global-mode)
  :config
    (define-key yas-minor-mode-map (kbd "<tab>") nil)
    (define-key yas-minor-mode-map (kbd "TAB") nil)
    (define-key yas-minor-mode-map (kbd "<C-tab>") 'yas-expand))

(provide 'init-yasnippet)
