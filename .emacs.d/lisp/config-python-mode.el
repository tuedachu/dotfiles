(require 'elpy)
;;(elpy-enable)

(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))

;;Remove indentation highlighting
(setq elpy-modules (delete 'elpy-module-highlight-indentation elpy-modules))

(setq python-indent-guess-indent-offset nil)

;;Use flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(add-hook 'python-mode-hook
          (lambda()
            (setq company-idle-delay nil)
            (setq company-tooltip-idle-delay nil)))


(define-key elpy-mode-map (kbd "C-x C-e") 'elpy-shell-send-statement)
(define-key elpy-mode-map (kbd "<f5>") 'compile)
(add-hook 'elpy-mode-hook
          (lambda ()
            (set (make-local-variable 'compile-command)
                 (concat "python " (file-name-nondirectory buffer-file-name)))))
