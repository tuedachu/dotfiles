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
            (setq company-tooltip-idle-delay nil)
            (display-line-numbers-mode)
            (setq fill-column 120)))



;; TODO: Create a help buffer to display
;; TODO: Format proper columns
;;
;; This is a decent idea for beginners who are on the learning curve with emacs
;;
;; (setq tuedachu/list-shortcuts-python nil)
;; (defun tuedachu/add-shortcut-to-python-map (shortcut symbol)
;;   "Define new keyboard binding and add the short-cut in the
;;     list."
;;   (define-key elpy-mode-map (kbd shortcut) symbol)
;;   (concat tuedachu/list-shortcuts-python
;;           "\n  - "
;;           shortcut
;;           "        "
;;           (symbol-name symbol)))




(define-key elpy-mode-map (kbd "C-x C-e") 'elpy-shell-send-statement)
(define-key elpy-mode-map (kbd "<f5>") 'compile)
(add-hook 'elpy-mode-hook
          (lambda ()
            (set (make-local-variable 'compile-command)
                 (concat "python " (file-name-nondirectory buffer-file-name)))))
