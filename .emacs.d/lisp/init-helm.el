;;;-*-Emacs-Lisp-*-

;;; Commentary:
;;;

;;; Code:

(use-package helm
  :ensure t
  :diminish helm-mode
  :config
  (setq helm-mode-fuzzy-matching t)
  (setq helm-autoresize-mode t)
  (setq helm-buffer-max-length 40)

  ; Always uee Helm
  (helm-mode 1)
  
  (define-key global-map [remap find-file] 'helm-find-files)
  (define-key global-map [remap occur] 'helm-occur)
  (define-key global-map [remap list-buffers] 'helm-buffers-list)
  (define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (unless (boundp 'completion-in-region-function)
      (define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
      (define-key emacs-lisp-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point))
  (setq helm-locate-fuzzy-match nil)

  (use-package helm-ls-git
    :ensure t
    :diminish helm-ls-git-mode)

  (use-package helm-swoop
    :ensure t
    :config
    ;; Instead of helm-multi-swoop-all, you can also use helm-multi-swoop-current-mode
    (define-key helm-swoop-map (kbd "M-m") 'helm-multi-swoop-current-mode-from-helm-swoop)

    ;; Move up and down like isearch
    (define-key helm-swoop-map (kbd "C-p") 'helm-previous-line)
    (define-key helm-swoop-map (kbd "C-n") 'helm-next-line)
    (define-key helm-multi-swoop-map (kbd "C-p") 'helm-previous-line)
    (define-key helm-multi-swoop-map (kbd "C-n") 'helm-next-line)

    ; If this value is t, split window inside the current window
    (setq helm-swoop-split-with-multiple-windows nil)

    ; Split direcion. 'split-window-vertically or 'split-window-horizontally
    (setq helm-swoop-split-direction 'split-window-vertically)

    ; If nil, you can slightly boost invoke speed in exchange for text color
    (setq helm-swoop-speed-or-color nil)

    ; If you prefer fuzzy matching
    (setq helm-swoop-use-fuzzy-match t)))

(provide 'init-helm)
