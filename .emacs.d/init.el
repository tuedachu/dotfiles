(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(package-initialize)

;;(ido-mode)
(require 'exwm)
(require 'exwm-config)

(add-to-list 'load-path (concat user-emacs-directory "lisp"))
(load "keybindings")
(load "config-helm")

(semantic-mode 1)

(add-hook 'exwm-update-class-hook
	  (lambda ()
	    (exwm-workspace-rename-buffer exwm-class-name)))

;; Enable EXWM
(exwm-enable)

;; Other configurations
(exwm-config-misc)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (helm with-editor org-plus-contrib exwm))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-face-attribute 'default nil :foreground "white" :background "black")
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono")) 

;Org files used for the agenda 
(setq org-agenda-files '("~/perso/notes.org"))


(windmove-default-keybindings)

(with-eval-after-load 'em-term
  (add-to-list 'eshell-visual-commands "htop")
  (add-to-list 'eshell-visual-commands "watch"))

(defalias 'yes-or-no-p 'y-or-n-p)


