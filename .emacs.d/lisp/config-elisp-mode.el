
(defun tuedachu/eval-buffer()
  "Execute the current buffer as Lisp code.
Top level forms are evaluated with `eval-defun' so that `defvar'
`defcustom' forms reset their default values."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (not (eobp))
      (forward-sexp)
      (eval-defun nil))))

(define-key emacs-lisp-mode-map (kbd "<f12>") 'tuedachu/eval-buffer)

(defun tuedachu/indent()
  (indent-region (point-min) (point-max)))

(add-hook 'before-save-hook #'tuedachu/indent)

