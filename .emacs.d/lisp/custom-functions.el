;; custom-functions.el starts here

;; Definition of custom functions

(defun org-contacts()
  (interactive)
  (require 'helm-org-contacts)
  (helm-org-contacts-show))

(provide 'custom-functions)
;; custom-functions.el ends here



(defun today ()
  "Insert at point today's date in YYYY-MM-DD format."
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))


(defun tuedachu/publish-website ()
  (interactive)
  (switch-to-buffer (find-file "/home/tuedachu/website/publish.el"))
  (tuedachu/eval-buffer)
  (kill-buffer))

(exwm-input-set-key (kbd "<f11>") 'tuedachu/publish-website)

(defun tuedachu/update-emacs-package-list ()
  "Update the list of Emacs packages."
  (interactive)
  (write-region (concat "(require 'package)\n"
                        "(add-to-list 'package-archives '(\"melpa\" . \"http://melpa.milkbox.net/packages/\"))\n"
                        "(add-to-list 'package-archives '(\"org\" .\"http://orgmode.org/elpa/\"))\n"
                        "(package-initialize)\n\n"
                        "(setq package-selected-packages '("
                        (mapconcat 'identity (eshell-stringify-list package-activated-list) " ")
                        "))\n\n"
                        "(package-refresh-contents)\n"
                        "(package-install-selected-packages)\n")
                nil
                "/home/tuedachu/dotfiles/.emacs.d/first-installation.el"))

(defun tuedachu/revert-buffer-no-asking ()
  (interactive)
  (revert-buffer nil t))
(exwm-input-set-key (kbd "C-®") 'tuedachu/revert-buffer-no-asking)


(defun tuedachu/butler-clean-buffer ()
  (interactive)
  (ws-butler-clean-region (point-min) (point-max)))


(defun spotify()
  (interactive)
  (start-process-shell-command "spotify" nil "spotify"))

(defun whitson-git-config()
  (interactive)
  (insert "[user]\n\temail = arnaud@whitson.com\n\tname = Arnaud Hoffmann"))
