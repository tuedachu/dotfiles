;; Inspired from 'https://emacs.cafe/emacs/javascript/setup/2017/04/23/emacs-setup-javascript.html'

;; (define-key js2-mode-map (kbd "M-.") (lambda()
;;                                        (interactive)
;;                                        (helm-grep-do-git-grep t)))


(require 'company)
(require 'company-tern)

(defun tuedachu-js-mode-setup ()
  (tern-mode t)
  (set (make-local-variable 'company-backends) '(company-tern))
  (company-mode))

(add-hook 'js2-mode-hook 'tuedachu-js-mode-setup)
(add-hook 'js2-mode-hook 'prettier-js-mode)

(autoload 'helm-company "helm-company")
(with-eval-after-load 'company
  (define-key company-mode-map (kbd "<M-tab>") 'helm-company)
  (define-key company-active-map (kbd "<M-tab>") 'helm-company))

(setq company-idle-delay nil)

(defun delete-tern-process ()
  (interactive)
  (delete-process "Tern"))

;; Disable completion keybindings, as we use xref-js2 instead
;; (define-key tern-mode-keymap (kbd "M-.") nil)
;; (define-key tern-mode-keymap (kbd "M-,") nil)


(add-hook 'mmm-mode-hook
          (lambda ()
            (set-face-background 'mmm-default-submode-face nil)))

(add-hook 'vue-mode-hook
          'prettier-js-mode)

(provide 'config-js-mode)
