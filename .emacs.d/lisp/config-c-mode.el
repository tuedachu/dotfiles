
;; C mode
(semantic-mode 1)

(with-eval-after-load 'c-mode
  (define-key c-mode-map (kbd "M-.") 'semantic-ia-fast-jump))


(provide 'config-c-mode)
