;;;-*-Emacs-Lisp-*-

;;; Commentary:
;;;
;;;

;;; Code
(when (maybe-require-package 'yasnippet)
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"
                           "~/.emacs.d/yasnippets"))

  (yas-global-mode)

  ; Remove default keybinding
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)

  ; Set keybinding to SHIFT+TAB
  (define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)
  (define-key yas-minor-mode-map (kbd "<escape>") 'yas-exit-snippet))

(provide 'init-yasnippet)
