
(require 'elpy)

(elpy-enable)

;;Remove indentation highlighting
(setq elpy-modules (delete 'elpy-module-highlight-indentation elpy-modules))

(setq python-indent-guess-indent-offset nil)

;;Use flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;;pydoc
(define-key python-mode-map (kbd "C-?") 'helm-pydoc)

(autoload 'helm-company "helm-company")
(with-eval-after-load 'company
  (define-key company-mode-map (kbd "<M-tab>") 'helm-company)
  (define-key company-active-map (kbd "<M-tab>") 'helm-company))


(setq company-idle-delay nil)

(require 'company)


(provide 'config-python-mode)
