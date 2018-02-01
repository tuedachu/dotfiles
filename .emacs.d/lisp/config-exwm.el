(require 'exwm)
(require 'exwm-config)
(exwm-enable)
(exwm-config-misc)

(defun tuedachu-exwm-rename-buffer ()
  (exwm-workspace-rename-buffer exwm-title))

(add-hook 'exwm-update-title-hook 'tuedachu-exwm-rename-buffer)

;; Function to automatically toggle between internal/external screens
(defun tuedachu-change-screen-hook ()
  (with-temp-buffer
    (call-process "xrandr" nil t nil)
    (beginning-of-buffer)
    (if (search-forward "VGA1 connected" nil 'noerror)
        (start-process-shell-command
         "xrandr" nil "xrandr --output VGA1 --primary --auto --output LVDS1 --off")
      (start-process-shell-command
       "xrandr" nil "xrandr --output LVDS1 --auto"))))

(require 'exwm-randr)
(setq exwm-randr-workspace-output-plist '(0 "VGA1"))
(add-hook 'exwm-randr-screen-change-hook 'tuedachu-change-screen-hook)
(exwm-randr-enable)

; Start a new eshell with Super + <Return> 
(exwm-input-set-key (kbd "<s-return>") 'eshell)

;; Slock
(exwm-input-set-key (kbd "s-l") (lambda ()
				  (interactive)
				  (call-process "slock")))

;; EMMS shortcut
(exwm-input-set-key (kbd "s-e") 'emms-smart-browse)

;; keybindings to move among exwm windows
(exwm-input-set-key (kbd "<s-up>") 'windmove-up)
(exwm-input-set-key (kbd "<s-down>") 'windmove-down)
(exwm-input-set-key (kbd "<s-right>") 'windmove-right)
(exwm-input-set-key (kbd "<s-left>") 'windmove-left)
(exwm-input--update-global-prefix-keys)
;;(setq exwm-input-line-mode-passthrough nil)

;; 's-&': Launch application
(exwm-input-set-key (kbd "s-&")
		    (lambda (command)
		      (interactive (list (read-shell-command "$ ")))
		      (start-process-shell-command command nil command)))

;; 's-b' : Change buffer (C-x b)
(exwm-input-set-key (kbd "s-b") 'helm-mini)

;; 's-f : Open file  (C-x C-f)
(exwm-input-set-key (kbd "s-f") 'helm-find-files)

;; C-x k : Kill this buffer
(exwm-input-set-key (kbd "C-x k") 'kill-this-buffer)

;; 's-r': Reset
(exwm-input-set-key (kbd "s-r") #'exwm-reset)

;; 's-w': Switch workspace
(exwm-input-set-key (kbd "s-w") #'exwm-workspace-switch)

;; amixer
(exwm-input-set-key (kbd "s-=") (lambda ()
				  (interactive)
				  (call-process "amixer" nil nil nil "set" "Master" "5%+")))

(exwm-input-set-key (kbd "s--") (lambda ()
				  (interactive)
				  (call-process "amixer" nil nil nil "set" "Master" "5%-")))
