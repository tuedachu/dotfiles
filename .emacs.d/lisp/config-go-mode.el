
;go-fmt
(setq gofmt-command "goimports")
(add-hook 'before-save-hook #'gofmt-before-save)

(defun tuedachu-go-mode-setup ()
  (go-eldoc-setup))

(add-hook 'go-mode-hook 'tuedachu-go-mode-setup)

(define-key go-mode-map (kbd "M-.") 'godef-jump)

(require 'company) 
(require 'company-go)
(require 'company-helm)


(provide 'config-go-mode)
