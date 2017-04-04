;;;-*-Emacs-Lisp-*-

;;; Commentary:
;;;

;;; Code:

(use-package helm-projectile
  :commands
  (helm-projectile helm-projectile-switch-project)
  :ensure t
  :init
  (use-package projectile
    :ensure t
    :defer 1
    :diminish projectile-mode
    :config
    (projectile-global-mode)
    (helm-projectile-on)
    (setq projectile-enable-caching t)))

    (use-package bpr
      :ensure t)

    (evil-define-key 'normal gtags-select-mode-map (kbd "RET") 'gtags -select-tag)
    (evil-define-key 'normal gtags-select-mode-map (kbd "q") 'kill -buffer-and-window)

    (defun tags-reindex ()
      "Initiate a re-index for entire projectile project"
      (interactive)
      (let ((tags-filename (concat (projectile-project-root) "TAGS")))
        (if (file-exists-p  tags-filename)
          (tags-index-update projectile-project-root)
          (tags-index-initial projectile-project-root))))

;    (defun tags-file-reindex ()
;      "Initiate a indexing of a particular file for a projectile project"
;      (interactive)
;      (let ((tags-filename (concat (projectile-project-root) "TAGS"))
;            (src-filename (read-file-name "File to index:")))
;        (if (file-exists-p  tags-filename)
;          (tags-index-update projectile-project-root src-filename)
;          (tags-index-initial projectile-project-root src-filename))))

    (defun tags-index-initial (path)
      "Generate initial TAGS files for PATH"
      (let ((bpr-process-directory path))
        (bpr-spawn "ctags -e -R --extra=+fq --fields=+iaS")))

    (defun tags-index-update (path)
      "Update TAGS in PATH"
      (let ((bpr-process-directory path))
        (bpr-spawn "ctags -e -R --append --extra=+fq --fields=+iaS")))

(provide 'init-helm-projectile)
