;;;-*-Emacs-Lisp-*-

;;; Commentary:
;;;

;;; Code:

(use-package vdiff
  :ensure t
  :defer t
  :config
  ; Lock scrolling by default when starting vdiff
  (setq vdiff-lock-scrolling t)
  ; Diff program/command to use
  (setq vdiff-diff-program "diff")
  ; Extra arguments to pass to diff
;;  (setq vdiff-diff-program-args "")
  ; Unchanged lines to leave unfolded around a fold
  (setq vdiff-fold-padding 4)
  ; Minimum number of lines to fold
  (setq vdiff-min-fold-size 4)
  ; If non-nil, allow closing new folds around point after updates.
  (setq vdiff-may-close-fold-on-point t)
  ; Function that returns the string printed for a closed fold. The arguments
  ; passed are the number of lines folded, the text on the first line, and the
  ; width of the buffer.
  (setq vdiff-fold-string-function 'vdiff-fold-string-default)
  ; Default syntax table class code to use for identifying "words" in
  ; `vdiff-refine-this-change'. Some useful options are
  ; 
  ; "w"   (default) words
  ; "w_"  symbols (words plus symbol constituents)
  ; 
  ; For more information see
  ; https://www.gnu.org/software/emacs/manual/html_node/elisp/Syntax-Class-Table.html
  (setq vdiff-default-refinement-syntax-code "w")
  ; If non-nil, automatically refine all hunks.
  (setq vdiff-auto-refine nil)
  ; How to represent subtractions (i.e., deleted lines). The
  ; default is full which means add the same number of (fake) lines
  ; as those that were removed. The choice single means add only one
  ; fake line. The choice fringe means don't add lines but do
  ; indicate the subtraction location in the fringe.
  (setq vdiff-subtraction-style 'full)
  ;; Character to use for filling subtraction lines. See also
  ;; `vdiff-subtraction-style'.
  (setq vdiff-subtraction-fill-char ?-))

(provide 'init-vdiff)
