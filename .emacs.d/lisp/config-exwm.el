
; Start a new eshell with Super + <Return> 
(exwm-input-set-key (kbd "<s-return>") 'eshell)

;; EMMS shortcut
(exwm-input-set-key (kbd "s-e") 'emms-smart-browse)

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
