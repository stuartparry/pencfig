;;;-*-Emacs-Lisp-*-

;;; Commentary:
;;;
;;;

;;; Code:
(use-package abyss-theme
  :ensure t
  :config
  (progn (load-theme 'abyss t nil)))

(use-package bubbleberry-theme
  :ensure t
  :config
  (progn (load-theme 'bubbleberry t nil)))

(use-package busybee-theme
  :ensure t
  :config
  (progn (load-theme 'busybee t nil)))

; Currently broken - Undefined color: color-231
;(use-package distinguished-theme
;  :ensure t
;  :config
;  (progn (load-theme 'distinguished t nil)))

(use-package firebelly-theme
  :ensure t
  :config
  (progn (load-theme 'firebelly t nil)))

(use-package monochrome-theme
  :ensure t
  :config
  (progn (load-theme 'monochrome t nil)))

(use-package noctilux-theme
  :ensure t
  :config
  (progn (load-theme 'noctilux t nil)))

(use-package quasi-monochrome-theme
  :ensure t
  :config
  (progn (load-theme 'quasi-monochrome t nil)))

;(use-package cycle-themes
;  :ensure t
;  :init
;  (setq cycle-themes-theme-list '(bubbleberry busybee distinguished firebelly whiteboard
;                                  monochrome noctilux quasi-monochrome abyss wheatgrass))
;  :config
;  (cycle-themes-mode 1))

(defun sp/set-theme (theme)
  (load-theme theme t nil))
  
(setq sp/initial-theme 'bubbleberry)
(if (daemonp)
  (add-hook 'after-make-frame-functions
            (lambda (frame)
              (select-frame frame)
              (load-theme sp/initial-theme t nil)))
  (load-theme sp/initial-theme t nil))

(provide 'init-theme)
