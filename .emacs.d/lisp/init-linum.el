;;;-*-Emacs-Lisp-*-

;;; Commentary:
;;;
;;;

;;; Code:

; Define line number face
(defface linum-current
  '((t (:inherit linum :weight bold :underline "#555")))
  "The current line number.")

(defun my-linum-get-format-string ()
  (let* ((width (max 4 (1+ (length (number-to-string
                                    (count-lines (point-min) (point-max)))))))
         (format (concat "%" (number-to-string width) "d "))
         (current-line-format (concat "%-" (number-to-string width) "d ")))
    (setq my-linum-format-string format)
    (setq my-linum-current-line-format-string current-line-format)))

(defvar my-linum-current-line-number 0)

(setq linum-format 'my-linum-relative-line-numbers)

(defun my-linum-relative-line-numbers (line-number)
  (let* ((offset (abs (- line-number my-linum-current-line-number)))
         (linum-display-value (if (= 0 offset)
                                  my-linum-current-line-number offset))
         (format-string (if (= my-linum-current-line-number line-number) my-linum-current-line-format-string my-linum-format-string))
         (face (if (= my-linum-current-line-number line-number) 'linum-current 'linum)))
    (propertize (format format-string linum-display-value) 'face face)))

(defadvice linum-update (around my-linum-update)
  (let ((my-linum-current-line-number (line-number-at-pos))) ad-do-it))

(ad-activate 'linum-update)
(defun set-linum-format ()
  (setq linum-format 'my-linum-relative-line-numbers))
  
(add-hook 'linum-before-numbering-hook 'my-linum-get-format-string)
(add-hook 'linum-before-numbering-hook
          (lambda ()
            (set-linum-format)
            (remove-hook 'linum-before-numbering-hook 'set-linum-format)))
  
; Set up relative line numbering
(global-linum-mode t)

(provide 'init-linum)
