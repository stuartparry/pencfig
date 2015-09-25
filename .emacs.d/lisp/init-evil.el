(when (maybe-require-package 'evil-leader)

  ; Evil leader must be loaded before evil (as documented).
  (global-evil-leader-mode)

  (setq evil-leader/in-all-states 1)
  (evil-leader/set-key
    "aa" 'align-regexp
    "a=" 'my-align-single-equal-als
    "bw"  (lambda () (interactive) (evil-ex-call-command nil "bdelete" nil))
    "cb"  (lambda () (interactive) (load-theme 'bubbleberry t))
    "cn"  (lambda () (interactive) (load-theme 'noctilux t))
    "eo"  'delete-other-windows  ;; C-w o
    "er"  (lambda () (interactive) (font-lock-fontify-buffer) (redraw-display))
    "ev"  'global-visual-line-mode
    "ew"  'toggle-truncate-lines
    "fc"  'flycheck-mode
    "gr"  'gtags-reindex
    "gf"  'gtags-find-tag
    "gt"  'ggtags-mode           ;; Toggle GGTAGS mode
    "hm"  'helm-mini             ;; Switch to another buffer
    "hi"  'helm-imenu            ;; Jump to function in buffer
    "hx"  'helm-M-x
    "ts"  'delete-trailing-whitespace
    "tw"  'whitespace-mode       ;; Show invisible characters
    "ty"  'yank-to-x-clipboard))
 
(when (maybe-require-package 'evil-jumper)
  (global-evil-jumper-mode))

(maybe-require-package 'evil-surround)
(maybe-require-package 'evil-indent-textobject)

(when (maybe-require-package 'evil-smartparens)
  (evil-smartparens-mode))

(when (maybe-require-package 'evil-commentary)
  (evil-commentary-mode))

(when (maybe-require-package 'evil-matchit)
  (global-evil-matchit-mode 1))

(maybe-require-package 'evil-org)

(when (maybe-require-package 'evil-lisp-state)
  (setq evil-lisp-state-leader-prefix "l"))

(when (maybe-require-package 'evil)
  (evil-mode 1)

  ;; My personal evil settings.
  (setq-default evil-want-C-i-jump t)
  (setq-default evil-symbol-word-search t)

  (evil-add-hjkl-bindings occur-mode-map 'emacs
    (kbd "/")       'evil-search-forward
    (kbd "n")       'evil-search-next
    (kbd "N")       'evil-search-previous
    (kbd "C-w C-w") 'other-window)

  (evil-add-hjkl-bindings org-agenda-mode-map 'emacs
    "RET" 'org-agenda-switch-to)

  ;; Global bindings.
  (define-key evil-normal-state-map (kbd "C-S-p") 'helm-projectile-switch-project)
  (define-key evil-normal-state-map (kbd "C-p")  'helm-projectile)
  (define-key evil-normal-state-map (kbd "-")     'helm-find-files)
  (define-key evil-normal-state-map
    (kbd "C-k")
    (lambda ()
      (interactive)
      (evil-scroll-up nil)))
  (define-key evil-normal-state-map
    (kbd "C-j")
    (lambda ()
      (interactive)
      (evil-scroll-down nil)))

  (defun minibuffer-keyboard-quit ()
    "Abort recursive edit.
  In Delete Selection mode, if the mark is active, just deactivate it;
  then it takes a second \\[keyboard-quit] to abort the minibuffer."
    (interactive)
    (if (and delete-selection-mode transient-mark-mode mark-active)
        (setq deactivate-mark  t)
      (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
      (abort-recursive-edit)))

  ;; Make escape quit everything, whenever possible.
  (define-key evil-normal-state-map [escape] 'keyboard-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

  ;; My own Ex commands.
  (evil-ex-define-cmd "om" 'om-status))

(provide 'init-evil)