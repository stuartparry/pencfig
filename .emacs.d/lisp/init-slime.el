(when (maybe-require-package 'slime)
  (setq inferior-lisp-program "/usr/bin/sbcl")
  (setq slime-contribs '(slime-fancy)))

(provide 'init-slime)
