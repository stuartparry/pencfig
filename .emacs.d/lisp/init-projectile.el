(when (maybe-require-package 'projectile)
  (projectile-global-mode)
  (setq projectile-enable-caching t)

  (if (featurep 'helm)
    (when (maybe-require-package 'helm-projectile)
     (helm-projectile-on))))

(provide 'init-projectile)
