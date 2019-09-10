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
