(when (maybe-require-package 'gtags)
  (maybe-require-package 'helm-gtags)

  (helm-gtags-mode))

  

(provide 'init-cider)
