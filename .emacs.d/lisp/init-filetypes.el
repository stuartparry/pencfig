;;;-*-Emacs-Lisp-*-

;;; Commentary:
;;;
;;;

;;; Code:

;; Filetypes
;;

;; prog-mode
(require 'flyspell)
(autoload 'flyspell-mode  "flyspell" "On-the-fly spelling checker." t)
(autoload 'flyspell-prog-mode  "flyspell" "On-the-fly spelling checker." t)
(add-hook 'prog-mode-hook 'flyspell-prog-mode t)
(add-hook 'message-mode-hook 'flyspell-mode t)
(add-hook 'text-mode-hook 'flyspell-mode t)

;; Emacs Lisp
(add-hook 'emacs-lisp-modehook
  (lambda ()
    (define-key emacs-lisp-mode-map (kbd "<C-return>") 'eval-last-sexp)
    (turn-on-eldoc-mode)
    (highlight-symbol-mode)
    (helm-gtags-mode)))

;; Common Lisp
(add-hook 'lisp-interaction-mode
  (lambda ()
    (define-key lisp-interaction-mode-map (kbd "<C-return>") 'eval-last-sexp)
    (turn-on-eldoc-mode)
    (highlight-symbol-mode)
    (helm-gtags-mode)))

;; Python
(when (maybe-require-package 'python-mode)
  (autoload 'python-mode "python-mode" "Python Mode." t)
  (add-hook 'python-mode-hook
    (lambda ()
      (helm-gtags-mode)
      (flyspell-prog-mode)
      (helm-gtags-mode))))

;; Clojure
(when (maybe-require-package 'clojure-mode)
  (autoload 'clojure-mode "clojure-mode" "Clojure Mode." t)
  (add-hook 'clojure-mode-hook
    (lambda ()
      (smart-parens-strict-mode)
      (cider-mode)
      (helm-gtags-mode))))

; Shell
(autoload 'sh-mode "sh-script" "Shell Script Mode." t)
(add-hook 'sh-mode-hook
  (lambda ()
    (setq sh-basic-offset 2)
    (setq sh-indentation 2)))

(provide 'init-filetypes)
