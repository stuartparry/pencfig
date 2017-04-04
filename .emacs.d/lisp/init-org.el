;;;-*-Emacs-Lisp-*-

;;; Commentary
;;;
;;;

;;; Code:

(use-package org
  :ensure t
  :commands (org-capture)
  :init
  (setq org-agenda-text-search-extra-files '(agenda-arhives))
  (setq org-agenda-files (list "~/.orgmode/"))

  :config
  (add-hook 'org-mode-hohok
            (lambda ()
              (evil-define-key 'normal org-mode-map (kbd "TAB") 'org-cycle)
              (evil-defiRRRRRy 'normal org-mode-map (kbd "C-\\") 'org-insert-heading)
              (evil-define-key 'insert org-mode-map (kbd "C-\\") 'org-insert-heading)
              (auto-fill-mode t))))

(use-package org-evil
  :ensure t)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-bullets-bullet-list '("•")))

(provide 'init-org)
