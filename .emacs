(package-initialize)

;; Custom variables
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (darkburn)))
 '(custom-safe-themes
   (quote
    ("c3e567dedaa800e869d879c4df8478237d6ea31fd04464086fd674c864fe4d71" "ad9fc392386f4859d28fe4ef3803585b51557838dbc072762117adad37e83585" default)))
 '(menu-bar-mode nil)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

;; Faces
;;
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#111111" :foreground "#DCDCCC" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

;; General config
;;
;; Tabs
(setq-default c-basic-offset 8)
(setq-default tab-width 8)
(setq-default indent-tabs-mode nil)
;; Buffers/Files
(setq-default truncate-lines t)
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)
;; Enable disabled commands
(put 'downcase-region 'disabled nil)
;; Parentheses
(show-paren-mode t)
;; Do not move cursor when moving from insert to normal
(setq evil-move-cursor-back nil)

;; Powerline
;;
(require 'powerline)
(powerline-default-theme)


;; EVIL mode
;;
(require 'evil-leader)
(require 'evil)
(evil-mode 1)
(evil-leader/set-key
  "be" 'buffer-menu
  "bw" 'kill-buffer)
(evil-leader/set-leader "\"")
(global-evil-leader-mode)
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(setq evil-want-fine-undo t)

;; ORG mode
;;
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/.orgmode/main.org"
                             "~/.orgmode/house.org"
                             "~/.orgmode/projects.org"
                             "~/.orgmode/priorities.org"
                             "~/.orgmode/sortstuff.org"))

;; Verilog mode
;;
(setq verilog-indent-level 2
      verilog-indent-level-module 0
      verilog-indent-level-declaration 0
      verilog-indent-level-declaration-macros t
      verilog-indent-level-behavioral 2
      verilog-indent-level-directive 2
      verilog-case-indent 2
      verilog-auto-newline nil
      verilog-auto-indent-on-newline nil
      verilog-tab-always-indent nil
      verilog-auto-endcomments nil
      verilog-minimum-comment-distance 40
      verilog-indent-begin-after-if nil
      verilog-auto-lineup nil
      )

(setq pascal-auto-lineup '(case declaration))

;; Python mode
;;
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list `auto-mode-alist `("\\.py\\'" . python-mode))
(add-to-list `interpreter-mode-alist `("python" . python-mode))
