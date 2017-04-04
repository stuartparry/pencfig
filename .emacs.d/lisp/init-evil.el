

;;; Commentary:
;;;

;;; Code:

(defun config-evil-leader ()
  "Configure evil leader mode"
  (define-key evil-motion-state-map "," 'evil-execute-in-emacs-state)
  (evil-leader/set-leader "\\")
  (evil-leader/set-key
    ; auto complete leader bindings
    "ac"  'auto-complete-mode
    ; buffer operations leader bindings
    "bw"  'kill-this-buffer
    "be"  'helm-buffers-list
    ; company leader bindings
    "c."  'helm-etags-plus-select
    "c,"  'helm-etags-plus-history
    "c]"  'helm-etags-plus-history-go-back
    "c}"  'helm-etags-plus-history-go-forward
    ; nerd-commenter leader bindings
    "ni"  'evilnc-comment-or-uncomment-lines
    "nl"  'evilnc-quick-comment-or-uncomment-to-the-line
    "nc"  'evilnc-copy-and-comment-lines
    "np"  'evilnc-comment-or-uncomment-paragraphs
    "nr"  'comment-or-uncomment-region
    "nv"  'evilnc-toggle-invert-comment-line-by-line
    "n."  'evilnc-copy-and-comment-operator
    ; evaluation leader bindings
    "eb"  'eval-buffer                     
    "ec"  'eval-current-buffer
    "ed"  'eval-defun
    "ee"  'eval-expression
    "ep"  'eval-print-last-sexp
    "er"  'eval-region
    "es"  'eval-last-sexp
    ; fill columnt indicator leader binding
    "fc"  'fci-mode
    ; flycheck leader bindings
;;;    "fc"  'flycheck-mode
    ; helm leader bindings
    "ha"  'helm-apropos
    "hb"  'helm-buffers-bookmarks
    "hc"  'helm-filtered-bookmarks
    "hf"  'helm-find-files
    "hi"  'helm-imenu
    "hk"  'helm-show-kill-ring
    "hl"  'helm-buffers-list
    "hm"  'helm-mini
    "hx"  'helm-M-x
    ; mc leader bindings
    "kk"  'evil-mc-mode
    "kh"  'evil-mc-make-cursor-here
    "km"  'evil-mc-make-all-cursors
    "kp"  'evil-mc-pause-cursors
    "kr"  'evil-mc-resume-cursors
    "ku"  'evil-mc-undo-all-cursors
    ; magit leader bindings
    "m"   'global-magit-file-mode
    ; orgmode leader bindings
    "ot"  'org-set-tags
    "op"  '(lambda ()
             (interactive)
             (org-insert-property-drawer))
    "od"  'org-deadline
    "os"  'org-schedule
    "oa"  'org-agenda
    "on"  'org-narrow-to-subtree
    "oS"  'org-archive-subree
    ; helm-projectile leader bindings
    "pp"  'helm-projectile
    "pb"  'helm-projectile-switch-to-buffer
    "pd"  'helm-projectile-find-dir
    "pf"  'helm-projectile-find-file
    "pg"  'helm-projectile-grep
    "pr"  'helm-projectile-recentf
    "ps"  'helm-projectile-switch-project
    "pt"  'projectile-regenerate-tags
    ; helm swoop leder bindings
    "ss"  'helm-swoop
    "sb"  'helm-swoop-back-to-last-point
    "sm"  'helm-multi-swoop
    "sa"  'helm-multi-swoop-all
    ; theme-selection leader bindings
    "tc"  'cycle-themes
    "ta"  (lambda () (interactive) (load-theme 'busybee t))
    "tb"  (lambda () (interactive) (load-theme 'bubbleberry t))
    "tn"  (lambda () (interactive) (load-theme 'noctilux t))
    "tf"  (lambda () (interactive) (load-theme 'firebelly t))
    "td"  (lambda () (interactive) (load-theme 'distinguished t))
    "tm"  (lambda () (interactive) (load-theme 'monochrome t))
    "to"  (lambda () (interactive) (load-theme 'monochrome-bright t))
    "tq"  (lambda () (interactive) (load-theme 'quasi-monochrome t))
    "tz"  (lambda () (interactive) (load-theme 'whiteboard t))
    ; general leader bindings
    "xl"  'linum-relative-toggle
    "xr"  (lambda () (interactive) (font-lock-fontify-buffer) (redraw-display))
    "xt"  'toggle-truncate-line-mode
    "xv"  'global-visual-line-mode
    "xw"  'whitespace-mode
    "xm"  'minimap-mode
    "xo"  'occur
    "xp"  'multi-occur
    "xy"  'yank-to-x-clipboard
    ; yasnippet leader bindings
    "yy"  'yas-global-mode
    ; folding leader bindings
    "zc"  'folding-fold-region
    "za"  'folding-show-all
    "zr"  'folding-region-open-close
    "zt"  'folding-toggle-show-hide
    "ze"  'folding-toggle-enter-exit
))

(defun sp/move-key (src-keymap dest-keymap key)
  "Moves a binding from src keymap to dest keymap"
  (define-key dest-keymap key (lookup-key src-keymap key))
  (define-key src-keymap key nil))

(defun sp/config-evil ()
  "Configure evil mode."

  ;; Use Emacs state in these additional modes.
  (dolist (mode '(dired-mode
                  term-mode
                  helm-mode
                  helm-projectile-mode))
     (add-to-list 'evil-emacs-state-modes mode))
  (delete 'term-mode evil-insert-state-modes)

  ;; Use insert state in these additional modes.
  (dolist (mode '(magit-log-edit-mode))
    (add-to-list 'evil-insert-state-modes mode))

  (setq evil-overriding-maps '(ac-completing-map ac-menu-map))
  (setq evil-intercept-maps nil)

  ; VIM has this covered with normal movement commands so remove from
  ; the motion keymap
  (sp/move-key evil-motion-state-map evil-normal-state-map (kbd "RET"))
  (sp/move-key evil-motion-state-map evil-normal-state-map " ")

;  (add-to-list 'evil-buffer-regexps '("\\*Flycheck"))

  ; Global bindings
  (evil-define-key 'normal global-map (kbd "C-.") 'helm-etags-plus-select)
  (evil-define-key 'normal global-map (kbd "C-,") 'helm-etags-plus-history)
  (evil-define-key 'normal global-map (kbd "C-]") 'helm-etags-plus-history-go-back)
  (evil-define-key 'normal global-map (kbd "C-}") 'helm-etags-plus-history-go-forward)

  (defun sp/minibuffer-keyboard-quit ()
    "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
    (interactive)
    (if (and delete-selection-mode transient-mark-mode mark-active)
        (setq deactivate-mark  t)
      (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
      (abobrt-recursive-edit)))

  ;; Use escape to quit everything
;  (define-key evil-normal-state-map [escape] 'keyboard-escape-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit) 

  ;; Dired
;  (evil-define-key 'normal dired-mode-map (kbd "C-e") 'dired-toggle-read-only)
)

(use-package evil
  :ensure t
  :config
  (add-hook 'evil-mode-hook 'sp/config-evil)

  ; Setup a VIM style leader key
  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
    (config-evil-leader))

  ; Setup a vim style surround
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))

  ; Setup vim style folds
  (use-package evil-vimish-fold
    :ensure t
    :config
    (evil-vimish-fold-mode 1))

  ; Setup a vim style inc/dec numbers
  (use-package evil-numbers
    :ensure t
    :config
    (define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
    (define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt))

  ; Setup a vim style matchit
  (use-package evil-matchit
    :ensure t
    :config
    (global-evil-matchit-mode 1))

  ; Setup a vim style visual star
  (use-package evil-visualstar
    :ensure t
    :config
    (global-evil-visualstar-mode))

  (use-package evil-indent-textobject
    :ensure t)

  (use-package evil-nerd-commenter
    :ensure t)

  (use-package evil-mc
    :ensure t
    :config
    (evil-mc-mode 1))

  (use-package highlight)
  (use-package evil-search-highlight-persist
    :ensure t
    :config
    (global-evil-search-highlight-persist t))

  ; Use evil mode always
  (evil-mode 1)
)

(provide 'init-evil)

;;; init-evil.el ends here
