
;; Unbind <C-z>
(global-set-key (kbd "C-z") nil)


(global-set-key (kbd "C-x C-c") 'save-buffers-kill-emacs)


(with-eval-after-load 'c-mode
  (define-key c-mode-map (kbd "M-.") 'semantic-ia-fast-jump))

;; comment line
(global-set-key (kbd "M-;") 'comment-line)
