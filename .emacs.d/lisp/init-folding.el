;;;-*-Emacs-Lisp-*-

;;; Commentary:
;;;

;;; Code:
(use-package folding
  :ensure t
  :diminish
  :config
  (folding-install-hooks)
  (defun my-always-fold ()
    (setq-local folded-file t))
  (advice-add #'folding-mode-find-file :before #'my-always-fold))
  ;;(folding-mode-add-find-file-hook))

;; Overide the defauls found in folding.el
  (defvar folding-mode-marks-alist nil)
  (folding-add-to-marks-list 'Fundamental-mode       "#{{{" "#}}}" nil t)
  (folding-add-to-marks-list 'asm-mode               "; {{{" "; }}}" nil t)
  (folding-add-to-marks-list 'awk-mode               "# {{{" "# }}}" nil t)
  (folding-add-to-marks-list 'LaTeX-mode             "%{{{"         "%}}}" nil t)
  (folding-add-to-marks-list 'TeX-mode               "%{{{"         "%}}}" nil t)
  (folding-add-to-marks-list 'bib�tex-mode           "@Comment {{{" "@Comment }}} */" nil t)
  (folding-add-to-marks-list 'c++-mode               "// {{{" "// }}}" nil t)
  (folding-add-to-marks-list 'c-mode                 "/* {{{" "/* }}} */" " */" t)
  (folding-add-to-marks-list 'cperl-mode             "# {{{"  "# }}}" nil t)
  (folding-add-to-marks-list 'emacs-lisp-mode        ";;{{{"  ";;}}}" nil t)
  (folding-add-to-marks-list 'erlang-mode            "%%{{{"  "%%}}}" nil t)
  (folding-add-to-marks-list 'fortran-mode           "! {{{"  "! }}}" nil t)
  (folding-add-to-marks-list 'f90-mode               "! {{{"  "! }}}" nil t)
  (folding-add-to-marks-list 'generic-mode           ";# "          ";\$" nil t)
  (folding-add-to-marks-list 'gofer-mode             "-- {{{" "-- }}}" nil t)
  (folding-add-to-marks-list 'html-mode   "<!-- [[[ " "<!-- ]]] -->" " -->" t)
  (folding-add-to-marks-list 'java-mode              "//{{{" "//}}}" nil t)
  (folding-add-to-marks-list 'ksh-mode               "# {{{"  "# }}}" nil t)
  (folding-add-to-marks-list 'latex-mode             "%{{{"   "%}}}" nil t)
  (folding-add-to-marks-list 'lisp-interaction-mode  ";;{{{"  ";;}}}" nil t)
  (folding-add-to-marks-list 'lisp-mode              ";;{{{"  ";;}}}" nil t)
  (folding-add-to-marks-list 'makefile-mode          "# {{{"  "# }}}" nil t)
  (folding-add-to-marks-list 'perl-mode              "# {{{"  "# }}}" nil t)
  (folding-add-to-marks-list 'plain-TeX-mode         "%{{{"   "%}}}" nil t)
  (folding-add-to-marks-list 'plain-tex-mode         "%{{{"   "%}}}" nil t)
  (folding-add-to-marks-list 'sql-mode               "-- {{{"  "-- }}}" nil t)
  (folding-add-to-marks-list 'tcl-mode               "#{{{"   "#}}}" nil t)
  (folding-add-to-marks-list 'tex-mode               "%{{{"   "%}}}" nil t)
  (folding-add-to-marks-list 'texinfo-mode   "@c {{{" "@c {{{endfold}}}" " }}}" t)
  (folding-add-to-marks-list 'text-mode              "{{{"    "}}}" nil t)
  (folding-add-to-marks-list 'vhdl-mode              "#{{{"  "#}}}" nil t)
  (folding-add-to-marks-list 'verilog-mode           "//{{{"  "//}}}" nil t)
  (folding-add-to-marks-list 'vlog-mode              "//{{{"  "//}}}" nil t)
  (folding-add-to-marks-list 'org-mode               "#{{{"  "#}}}" nil t)


  (define-key evil-normal-state-map "za" 'folding-toggle-show-hide)
  (define-key evil-normal-state-map "zM" 'folding-whole-buffer)
  (define-key evil-normal-state-map "zR" 'folding-open-buffer)
  (define-key evil-normal-state-map "zm" 'folding-hide-current-subtree)
  (define-key evil-normal-state-map "zr" 'folding-show-current-subtree)
  (define-key evil-normal-state-map "zo" 'folding-show-current-entry)
  (define-key evil-normal-state-map "zc" 'folding-hide-current-entry)
  (define-key evil-normal-state-map "zj" 'folding-next-visible-heading)
  (define-key evil-normal-state-map "zk" 'folding-previous-visible-heading)

  ;; (define-key evil-normal-state-map "zf" 'folding-fold-region)
  (define-key evil-normal-state-map "zf"
  (lambda ()
    "create fold, exit from shifting and add comment to it"
    (interactive)
    (folding-fold-region (region-beginning) (region-end))
    (folding-shift-out)
    (folding-toggle-show-hide)
    (evil-append-line 1)
    (insert " FoldingComment")
    (evil-normal-state)
    (evil-backward-WORD-begin)
  ))

  (folding-mode nil t) 
(provide 'init-folding)
