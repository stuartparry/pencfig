;; Find and load the correct package.el


;; Spoof an alternative http user agent in case emacs is restricted
;(require 'url-http)
;(defun url-http-user-agent-string ()
;  "User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36
;")
;(setq url-mime-charset-string "en-US,en;q=0.8")
;(setq url-mime-encoding-string "gzip, deflate, sdch")

;; When switching between Emacs 23 and 24, we always use the bundled package.el in Emacs 24
;(let ((package-el-site-lisp-dir
;       (expand-file-name "site-lisp/package" user-emacs-directory)))
;  (when (and (file-directory-p package-el-site-lisp-dir)
;             (> emacs-major-version 23))
;    (message "Removing local package.el from load-path to avoid shadowing bundled version")
;    (setq load-path (remove package-el-site-lisp-dir load-path))))


(require 'package)

;; Local repos as backup (via git from https://github.com/syl20bnr/spacemacs-elpa-mirror.git) if internet
;; connection is not available
;;;(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("gnu" . "~/.emacs.d/mirror-elpa/gnu/"))
(add-to-list 'package-archives '("melpa" . "~/.emacs.d/mirror-elpa/melpa/"))
(add-to-list 'package-archives '("melpa-stable" . "~/.emacs.d/mirror-elpa/melpa-stable/"))
(add-to-list 'package-archives '("org" . "~/.emacs.d/mirror-elpa/org/"))
;; Standard package repositories
;(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
;
;;;(add-to-list 'package-archives '("elpy" . "https://jorgenschaefer.github.io/packages/"))
;;;(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))

;; Pin some packages to specific repositories.
;(setq package-pinned-packages '((gtags . "marmalade")
;                                (php-extras . "marmalade")))

(provide 'init-repos)
