;;;-*-Emacs-Lisp-*-

;;; Commentary:
;;;
;;;

;;; Code:

(when (maybe-require-package 'cider)
  (add-hook 'cider-mode-hook 
    (lambda ()
      (eldoc-mode)
      (setq nrepl-log-messages t)
      (setq nrepl-hide-special-buffers t)
      (setq cider-test-show-report-on-success t))))

(provide 'init-cider)
