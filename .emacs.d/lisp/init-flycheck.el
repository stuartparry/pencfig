;;;-*-Emacs-Lisp-*-

;;; Commentary:
;;;
;;;

;;; Code:


(when (maybe-require-package 'flycheck)
  (add-hook 'flycheck-mode-hook
    (lambda ()
      (evil-define-key 'normal flycheck-mode-map (kbd "]e") 'flycheck-next-error)
      (evil-define-key 'normal flycheck-mode-map (kbd "[e") 'flycheck-previsous-error))))

(provide 'init-flycheck)
