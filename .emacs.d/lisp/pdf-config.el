(require 'pdf-view)



(setq pdf-view-midnight-colors `(,(face-attribute 'default :foreground) .
                                 ,(face-attribute 'default :background)))

(add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode))

;; (add-hook 'pdf-view-mode-hook (lambda ()
;;                                 (pdf-view-midnight-minor-mode)))
