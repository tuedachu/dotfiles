
(require 'company)
(require 'company-capf)

(defun tuedachu-racket-mode-setup ()
  (setq eldoc-documentation-function 'racket-eldoc-function)
  (set (make-local-variable 'company-backends) '(company-capf))
  (company-mode))

(add-hook 'racket-mode-hook 'tuedachu-racket-mode-setup)

(autoload 'helm-company "helm-company")
(with-eval-after-load 'company
  (define-key company-mode-map (kbd "<M-tab>") 'helm-company)
  (define-key company-active-map (kbd "<M-tab>") 'helm-company))

(setq company-idle-delay nil)

(provide 'config-racket-mode)
