;; Filetypes
;;

;; prog-mode
(autoload 'flyspell-mode  "flyspell" "On-the-fly spelling checker." t)
(autoload 'flyspell-prog-mode  "flyspell" "On-the-fly spelling checker." t)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'message-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'flyspell-mode)

;; Python
(when (maybe-require-package 'python-mode)
  (autoload 'python-mode "python-mode" "Python Mode." t)
  (flycheck-mode))

;; Clojure
(when (maybe-require-package 'clojure-mode)
  (autoload 'clojure-mode "clojure-mode" "Clojure Mode." t)
  (add-hook 'clojure-mode-hook
    (lambda ()
      (#'smart-parens-strict-mode))))

; Shell
(autoload 'sh-mode "sh-script" "Shell Script Mode." t)
(add-hook 'sh-mode-hook
  (lambda ()
    (setq sh-basic-offset 2)
    (setq sh-indentation 2)))

(provide 'init-filetypes)
