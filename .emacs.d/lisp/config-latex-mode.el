(require 'tex-mik)
(load "auctex.el")

(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(setq TeX-PDF-mode t)

(define-key LaTeX-mode-map (kbd "C-c C-o") 'tex-latex-block)
(define-key LaTeX-mode-map (kbd "<M-tab>") 'completion-at-point)

(message "Finished loading config...")

(provide 'config-latex-mode)
