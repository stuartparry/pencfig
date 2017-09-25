;;; init.el
;-*-Emacs-Lisp-*-

;;; Commentary:
;;
;;; Code:


;; Setup package.el and add the lisp sub-dir of .emacs.d to the load-path
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Search paths
(let ((files (directory-files-and-attributes "~/.emacs.d/lisp" t)))
  (dolist (file files)
    (let ((filename (car file))
          (dir (nth 1 file)))
      (when (and dir
                 (not (string-suffix-p "." filename)))
        (add-to-list 'load-path (car file))))))

;; Theme sub-dir path
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))
;;;;(add-to-list 'exec-path "/usr/local/bin")

;; Setup elisp package repositories
(require 'init-repos)

;; DO NOT REMOVE - must be before the configuration of any other packages
(package-initialize)

;; use-package - of course
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))


;; Configure some standard behaviour

; Enable disabled commands
(put 'downcase-region 'disabled nil)
; Suppress annoying advice redefinition warnings
(setq ad-redefinition-action 'accept)
; Remove uneccessary and annoying startup cludge
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)
; Don't need space consuming menus, scroll and tool bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
; Visually indicate matching parentheses
(show-paren-mode 1)
; Text wraps at word boundaries and curly arrows are used to indicate continuation
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
; Version control support
;;;(eval-after-load "vc" '(setq vc-handled-backends nil))
(setq wc-follow-symlinks t)
; Turn off visible/audible bells
(setq visible-bell nil)
(setq ring-bell-function 'ignore)
; Do not use tabs for indentation - just don't ... really DON'T!
(setq-default indent-tabs-mode nil)
; Set tab width to 8
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default cperl-indent-level 4)
; Set font size
(set-face-attribute 'default nil :height 100)
;; Keep customisation out of the main configuuration file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)
; Sort out default crappy 'half screen jump' scrolling - almost
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscrolll nil)
; Sanely produce backups/autosaves in a single directory
;(defvar backup-dir "~/.emacs.d/backups/")
;(setq make-backup-files nil)
(setq backup-directory-alist '((".*" . "~/.emacs_saves"))):
(setq auto-save-file-name-transforms '((".*" "~/.emacs_saves" t)))
(setq backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 4
      version-control t)
; Stop asking me if I want to open large files, your're a ****ing text editor - it's your primary ****ing job!!:
(setq large-file-warning-threshold nil)
(setq split-width-threshold nil)
; Also display column number (line number display on by default)
(column-number-mode t)
; Visual line mode
(visual-line-mode)
; Default to case sensitivity
(setq-default case-fold-search t)
; Use hunspell for spellchecking
(setq-default ispell-program-name "/usr/bin/hunspell")
(setq-default ispell-dictionary "british") ; must set environment variable LANG to 'en_GB'
; Set title of frame
(setq frame-title-format "EVIL - %b")
;; Allow confusing functions
(put 'narrow-to-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

;; Prevent lag inducing garbage collection while in mini-buffer, return to default on exit
(defun my-minibuffer-setup-hook ()
  "Increase GC cons threshold."
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  "Set GC cons threshold to its default value."
  (setq gc-cons-threshold 800000))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)

;; Use pcomplete because it helps in org-mode
(add-to-list 'completion-at-point-functions 'pcomplete)

;; CTAGS
(setq path-to-ctags "/tools/bin/ctags")
; Update from within emacs

;;; Package configs
(use-package auto-complete
  :ensure t
  :diminish t)

(use-package tex
  :ensure auctex
  :diminish t
  :defer
  :init
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil))

(use-package linum-relative
  :ensure t
  :diminish t
  :config
  (global-linum-mode 1)
  (linum-relative-off))

(use-package fill-column-indicator
  :ensure t
  :config
  (setq fci-rule-column 90))

(use-package minimap
  :ensure t
  :diminish t
  :commands (minimap-mode)
  :init
  (setq minimap-window-location 'right)
  (setq minimap-update-delay 0))

(use-package magit
  :ensure t
  :defer t)

(require 'init-vdiff)
(require 'init-evil)
(require 'init-theme)
(require 'init-powerline)
(require 'init-yasnippet)
(require 'init-cider)
(require 'init-haskell)
(require 'init-jedi)
(require 'init-org)
;;;(require 'init-flycheck) ;; Needs work to get this working!
(require 'init-helm)
(require 'init-helm-projectile)
(require 'init-folding)


;;; Org Mode
;(require 'init-org)
;
;(use-package dired
;  :config
;  (require 'dired-x)
;  (setq dired-omit-files "^\\.?#\\|^\\.[^.].*")
;
;  (add-hook 'dired-mode-hook (lambda ()
;                               (dired-omit-mode t)))
;  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
;  (define-key dired-mode-map (kbd "^")   (lambda () (interactive) (find-alternate-file "..")))
;  (define-key dired-mode-map (kbd "C-.") 'dired-omit-mode)
;  (define-key dired-mode-map (kbd "/")   'counsel-grep-or-swiper))
;
;(use-package elpy
;  :ensure t
;  :config
;  (elpy-enable))
;
;(use-package rainbow-mode
;  :ensure t
;  :commands rainbow-mode)
;
;(use-package dictionary :ensure t)
;
;(use-package flycheck
;  :ensure t
;  :commands flycheck-mode)
;
;(use-package yasnippet
;  :ensure t
;  :defer t
;  :config
;  (yas-reload-all)
;  (setq yas-snippet-dirs '("~/.emacs.d/snippets"
;                           "~/.emacs.d/remote-snippets"))
;  (setq tab-always-indent 'complete)
;  (setq yas-prompt-functions '(yas-completing-prompt
;                               yas-ido-prompt
;                               yas-dropdown-prompt))
;  (define-key yas-minor-mode-map (kbd "<escape>") 'yas-exit-snippet))
;
;(use-package projectile
;  :ensure t
;  :defer 1
;  :config
;  (projectile-global-mode)
;  (setq projectile-enable-caching t))
;
;(use-package magit
;  :ensure t
;  :defer t
;  :config
;  (setq magit-branch-arguments nil)
;  (setq magit-push-always-verify nil)
;  (setq magit-last-seen-setup-instructions "1.4.0")
;  (magit-define-popup-switch 'magit-log-popup ?f "first parent" "--first-parent"))
;
;;;; Flycheck mode:
;(add-hook 'flycheck-mode-hook
;          (lambda ()
;            (evil-define-key 'normal flycheck-mode-map (kbd "]e") 'flycheck-next-error)
;            (evil-define-key 'normal flycheck-mode-map (kbd "[e") 'flycheck-previous-error)))
;
;(add-hook 'python-mode-hook
;          (lambda ()
;            ;; I'm rudely redefining this function to do a comparison of `point'
;            ;; to the end marker of the `comint-last-prompt' because the original
;            ;; method of using `looking-back' to match the prompt was never
;            ;; matching, which hangs the shell startup forever.
;            (defun python-shell-accept-process-output (process &optional timeout regexp)
;              "Redefined to actually work."
;              (let ((regexp (or regexp comint-prompt-regexp)))
;                (catch 'found
;                  (while t
;                    (when (not (accept-process-output process timeout))
;                      (throw 'found nil))
;                    (when (= (point) (cdr (python-util-comint-last-prompt)))
;                      (throw 'found t))))))
;
;            ;; Additional settings follow.
;            (add-to-list 'write-file-functions 'delete-trailing-whitespace)))
;
;;;; Emacs Lisp mode:
;(add-hook 'emacs-lisp-mode-hook
;          (lambda ()
;            (yas-minor-mode t)
;            (eldoc-mode)
;            (highlight-symbol-mode)
;            (define-key emacs-lisp-mode-map (kbd "<C-return>") 'eval-last-sexp)))
;
(provide 'init)
;;; init.el ends here
