;;;-*-Emacs-Lisp-*-

;;; Commentary:
;;;
;;;

;;; Code
(when (maybe-require-package 'yasnippet)
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"
                           "~/.emacs.d/yasnippets"))
  (yas-global-mode t)
  
  ; Remove default keybinding
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)

  ; Set keybinding to SHIFT+TAB
  (define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand))

(provide 'init-yasnippet)
