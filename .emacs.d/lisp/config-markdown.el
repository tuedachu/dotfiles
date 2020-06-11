(defun tuedachu/markdown-inline-math()
  (interactive)
  (insert "\\\\(\\\\)")
  (goto-char (- (point) 3)))

(defun tuedachu/markdown-equation()
  (interactive)
  (insert "\\begin{equation}\n\n\\end{equation}\n")
  (goto-line (- (line-number-at-pos) 2)))

(defun tuedachu/markdown-CN+()
  (interactive)
  (insert (concat "\\\\(\\mathrm{C_{"
                  (read-from-minibuffer "N+ fraction: ")
                  "+}}\\\\)")))


(define-key markdown-mode-map (kbd "C-z C-z") 'tuedachu/markdown-inline-math)
(define-key markdown-mode-map (kbd "C-z C-e") 'tuedachu/markdown-equation)
(define-key markdown-mode-map (kbd "C-z C-c") 'tuedachu/markdown-CN+)


(provide 'config-markdown)
