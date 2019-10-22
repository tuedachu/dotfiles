(require 'py-autopep8)


(require 'elpy)
(elpy-enable)

;;Remove indentation highlighting
(setq elpy-modules (delete 'elpy-module-highlight-indentation elpy-modules))

(setq python-indent-guess-indent-offset nil)

;;Use flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; autopep8
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; ;; company
;; (require 'company)
;; (autoload 'helm-company "helm-company")
(set (make-local-variable 'company-backends) 'company-jedi)
;; (with-eval-after-load 'company
;;   (define-key company-mode-map (kbd "<M-tab>") 'helm-company)
;;   (define-key company-active-map (kbd "<M-tab>") 'helm-company))
;; (company-mode)

(setq company-idle-delay nil)

(define-key elpy-mode-map (kbd "C-x C-e") 'elpy-shell-send-statement)
(define-key elpy-mode-map (kbd "<f5>") 'compile)
(add-hook 'elpy-mode-hook
          (lambda ()
            (set (make-local-variable 'compile-command)
                 (concat "python " (file-name-nondirectory buffer-file-name)))))
