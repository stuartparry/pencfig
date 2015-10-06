;;;-*-Emacs-Lisp-*-

;;; Commentary:
;;;
;;;

;;; Code:

(defun my-set-theme ()
  (load-theme 'bubbleberry t))

(if (daemonp)
  (add-hook 'after-make-frame-functions
    (lambda (frame)
      (select-frame frame)          
      (my-set-theme)))
  (my-set-theme))
(provide 'init-theme)
