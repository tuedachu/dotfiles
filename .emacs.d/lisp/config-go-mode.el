
;go-fmt
(setq gofmt-command "goimports")
(add-hook 'before-save-hook #'gofmt-before-save)

(defun tuedachu-go-mode-setup ()
  (go-eldoc-setup)
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode))

(add-hook 'go-mode-hook 'tuedachu-go-mode-setup)

(define-key go-mode-map (kbd "M-.") 'godef-jump)

(autoload 'helm-company "helm-company")
(with-eval-after-load 'company
  (define-key company-mode-map (kbd "<M-tab>") 'helm-company)
  (define-key company-active-map (kbd "<M-tab>") 'helm-company))


(setq company-idle-delay nil)

(require 'company) 
(require 'company-go)



(provide 'config-go-mode)
