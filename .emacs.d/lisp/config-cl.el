(setq inferior-lisp-program "/usr/bin/sbcl")


;; For cl-dbus.
(add-to-list
 'lisp-imenu-generic-expression
 (list (purecopy "D-Bus")
       (purecopy (concat "^\\s-*("
                         (eval-when-compile
                           (regexp-opt
                            (list "dbus:define-dbus-method")
                            t))
                         "\\s-+(\\([^)]+\\)"))
       2))

;; Read CLHS locally.
(or
 ;; Quicklisp package.
 (load "~/.quicklisp/clhs-use-local.el" 'noerror)
 ;; Unofficial Guix package (non-free license).
 (when (require 'clhs nil 'noerror)
   (clhs-setup)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Sly
(with-eval-after-load 'sly
  (setq sly-lisp-implementations
        '((sbcl ("sbcl" "--noinform"))
          (ccl ("ccl"))
          (ecl ("ecl"))))
  (with-eval-after-load 'sly-mrepl
    (setq sly-mrepl-history-file-name (expand-file-name "sly-mrepl-history" user-emacs-directory))
    (define-key sly-mrepl-mode-map (kbd "C-c M-o") 'sly-mrepl-clear-repl))

  (defun ambrevar/sly-load-reload-system ()
    (interactive)
    (funcall
     (if (sly-eval `(slynk-asdf:asdf-system-loaded-p ,(intern (sly-current-package))))
         #'sly-asdf-reload-system
       #'sly-asdf-load-system)
     (intern (sly-current-package))))
  (define-key lisp-mode-map (kbd "<f6>") 'ambrevar/sly-load-reload-system)

  (setq sly-command-switch-to-existing-lisp 'always)
  ;; REVIEW: With Emacs 27 we can:
  ;; (customize-set-variable 'helm-completion-style 'emacs)
  ;; (add-to-list 'completion-styles 'backend)
  ;; See https://github.com/emacs-helm/helm-sly/issues/2.
  (when (require 'helm-sly nil 'noerror)
    (add-hook 'sly-mrepl-hook #'helm-sly-disable-internal-completion)
    (global-helm-sly-mode)
    (add-to-list 'helm-source-names-using-follow "Lisp xrefs")))

(defun ambrevar/sly-switch-to-repl () ; TODO: Replace with `helm-defswitch'.
  (interactive)
  (require 'sly)
  (require 'helm-sly)
  (pcase (length sly-net-processes)
    (0 (sly))
    (_ (let ((output-buffer (sly-mrepl--find-buffer (sly-current-connection))))
         (cond
          ((and (eq (current-buffer) output-buffer)
                (require 'helm-sly nil 'no-error))
           (helm-sly-mini))
          (output-buffer
           (pop-to-buffer output-buffer))
          (t (sly nil nil t)))))))

(setq helm-completion-in-region-fuzzy-match t)
(setq helm-mode-fuzzy-match t)
(setq helm-lisp-fuzzy-completion t)
