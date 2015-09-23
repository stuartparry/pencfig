(if (daemonp)
  (add-hook 'after-make-frame-functions
    (lambda (frame)
      (with-selected-frame frame
        (load-theme 'bubbleberry t))))
  (load-theme 'bubbleberry t))

(provide 'init-theme)
