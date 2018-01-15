(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(package-initialize)

(require 'exwm)
(require 'exwm-config)

(exwm-input-set-key (kbd "<s-return>") 'eshell)

(add-hook 'exwm-update-class-hook
	  (lambda ()
	    (exwm-workspace-rename-buffer exwm-class-name)))
;; 's-r': Reset
(exwm-input-set-key (kbd "s-r") #'exwm-reset)
;; 's-w': Switch workspace
(exwm-input-set-key (kbd "s-w") #'exwm-workspace-switch)
;; 's-N': Switch to certain workspace
(dotimes (i 10)
  (exwm-input-set-key (kbd (format "s-%d" i))
		      `(lambda ()
			 (interactive)
			 (exwm-workspace-switch-create ,i))))
;; 's-&': Launch application
(exwm-input-set-key (kbd "s-&")
		    (lambda (command)
		      (interactive (list (read-shell-command "$ ")))
		      (start-process-shell-command command nil command)))
;; Enable EXWM
(exwm-enable)
;; Other configurations
(exwm-config-misc)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (with-editor org-plus-contrib exwm))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-face-attribute 'default nil :foreground "white" :background "black")
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono")) 
(setq org-agenda-files '("~/perso/notes.org"))


(ido-mode)
(windmove-default-keybindings)

(add-to-list 'eshell-visual-commands "htop")
(add-to-list 'eshell-visual-commands "watch")

(defalias 'yes-or-no-p 'y-or-n-p)
