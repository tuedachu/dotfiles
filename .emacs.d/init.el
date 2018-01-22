(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(package-initialize)

;; start early.
;;  
(pinentry-start)

(require 'exwm)
(require 'exwm-config)

;; Enable EXWM
(exwm-enable)
;; Other configurations
(exwm-config-misc)

;; keybindings to move among exwm windows
(exwm-input-set-key (kbd "<s-up>") 'windmove-up)
(exwm-input-set-key (kbd "<s-down>") 'windmove-down)
(exwm-input-set-key (kbd "<s-right>") 'windmove-right)
(exwm-input-set-key (kbd "<s-left>") 'windmove-left)
(exwm-input--update-global-prefix-keys)

(add-to-list 'load-path (concat user-emacs-directory "lisp"))
(load "keybindings")
(load "config-helm")
(load "config-mu4e")
(semantic-mode 1)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-source-names-using-follow (quote ("Regexp Builder" "Variables" "Imenu" "Occur")))
 '(package-selected-packages
   (quote
    (helm-system-packages helm with-editor org-plus-contrib exwm)))
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 25))
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

(with-eval-after-load 'em-term
  (add-to-list 'eshell-visual-commands "htop")
  (add-to-list 'eshell-visual-commands "watch"))

(defalias 'yes-or-no-p 'y-or-n-p)

;; All buffers created in EXWM mode are named "*EXWM*". You may want to change
;; it in `exwm-update-class-hook' and `exwm-update-title-hook', which are run
;; when a new window class name or title is available. Here's some advice on
;; this subject:
;; + Always use `exwm-workspace-rename-buffer` to avoid naming conflict.
;; + Only renaming buffer in one hook and avoid it in the other. There's no
;;   guarantee on the order in which they are run.
;; + For applications with multiple windows (e.g. GIMP), the class names of all
;;   windows are probably the same. Using window titles for them makes more
;;   sense.
;; + Some application change its title frequently (e.g. browser, terminal).
;;   Its class name may be more suitable for such case.

(defun tuedachu-exwm-rename-buffer ()
  (exwm-workspace-rename-buffer exwm-title))

;;(add-hook 'exwm-update-class-hook 'tuedachu-exwm-rename-buffer)

(add-hook 'exwm-update-title-hook 'tuedachu-exwm-rename-buffer)


