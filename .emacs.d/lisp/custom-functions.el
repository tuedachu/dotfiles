;; custom-functions.el starts here

;; Definition of custom functions

(defun org-contacts()
  (interactive)
  (require 'helm-org-contacts)
  (helm-org-contacts-show))

(provide 'custom-functions)
;; custom-functions.el ends here
