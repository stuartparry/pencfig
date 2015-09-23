;;;-*-Emacs-Lisp-*-

;;; Commentary:
;;;
;;;

;;; Code:

;; This must come before configuration on installed packages. DO NOT REMOVE
( package-initialize)


;; Search paths
;;
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))


;; The basic essentials
;;

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
(scroll-bar-mode -1)
; Visually indicate matching parenthese;
(show-paren-mode 1)
; Text wraps at word boundaries and curly arrows are used to indicate continuation
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
; Turn off build-in version control support
(eval-after-load "vc" '(setq vc-handled-backends nil))
; Turn off visible bell
(setq visible-bell nil)
; Do NOT use tabs for indentation globally - TABS ARE EVIL!!!
(setq-default indent-tabs-mode nil)
; Set tab width to 4
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default cperl-indent-level 4)
;set font size
(set-face-attribute 'default nil :height 90)
; Custom customizations file
(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)
; Sort out default crappy 'half screen jump' scrolling - almost
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)
; Sanely produce backups/autosaves in a single directory
(setq backup-directory-alist '((".*" . "~/.emacs_saves"))):
(setq auto-save-file-name-transforms '((".*" "~/.emacs_saves" t)))
(setq backup-by-copying t
      delete-old-versions t
      kept-new-versoins 6
      kept-old-versions 2
      version-control2)
; Use hunspell for spellchecking
(setq-default ispell-program-name "/usr/bin/hunspell")
(setq-default ispell-dictionary "british")

; Configuration
;;
(require 'init-repos)
(require 'init-theme)
(require 'init-evil)
(require 'init-helm)
(require 'init-projectile)
(require 'init-powerline)
(require 'init-org)
(require 'init-linum)
(require 'init-yasnippet)
(require 'init-autocomplete)
(require 'init-cider)
;(require 'init-slime)    ; No Common Lisp here!
;(require 'init-flycheck) ; Needs more work to make this reliable
(require 'init-magit)
(require 'init-filetypes)
;(require 'init-modetypes) ; Currently empty

(provide 'emacs)
