;;;-*-Emacs-Lisp-*-

;;; Commentary:
;;;
;;;

;;; Code:

(when (maybe-require-package 'auto-complete)
  (ac-config-default)

  (set-face-foreground 'popup-face "#bebdcb")
  (set-face-background 'popup-face "#2a2a2a")
  (set-face-foreground 'popup-menu-selection-face "#101010")
  (set-face-background 'popup-menu-selection-face "#7f7f7f")
  (set-face-foreground 'popup-tip-face "#070707")
  (set-face-background 'popup-tip-face "#728e68"))

(provide 'init-autocomplete)

