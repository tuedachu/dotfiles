
(require 'org)
(setq org-archive-location "~/perso/TODO_archives.org.gpg::")

(define-key org-mode-map (kbd "s-a") 'org-archive-subtree)

(setq eq-counter 0)
(defun tuedachu/create-equation()
  (interactive)
  (setq eq-counter (1+ eq-counter))
  (insert  "\\begin{equation}\n")
  (insert  (concat "\\label{eq:" (int-to-string eq-counter) "}\n\n"))
  (insert "\\end{equation}\n")
  (previous-line)
  (previous-line))


(add-hook 'org-mode-hook (lambda ()
                           (add-hook 'before-save-hook
                                     #'tuedachu/indent
                                     nil
                                     'make-it-local)))



(setq org-src-preserve-indentation t)

(provide 'config-org-mode)
