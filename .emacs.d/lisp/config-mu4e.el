(require 'mu4e)


(setq mu4e-maildir "/home/tuedachu/.cache/mail")
(setq mu4e-get-mail-command "mbsync -a")
(setq mu4e-sent-folder "/tuedachu/sent")
(setq mu4e-trash-folder "/tuedachu/trash")
(setq mu4e-drafts-folder "/tuedachu/drafts")

(setq mu4e-update-interval 60)

; To speed up indexing process
;(setq
;       mu4e-index-cleanup nil      ;; don't do a full cleanup check
;       mu4e-index-lazy-check t)    ;; don't consider up-to-date dirs

;; Directory to save attachments
(setq mu4e-attachment-dir  "~/Downloads") ;the directorty could be returned by a user defined function.

(setq smtpmail-queue-dir "~/.cache/mail/queued") ; location to store the queued messages

;; Message signature
(setq mu4e-compose-signature "Arnaud Hoffmann")
(setq mu4e-compose-signature-auto-include t)

;; Don't include myself in the reply
(setq mu4e-compose-dont-reply-to-self t)
(add-to-list 'mu4e-user-mail-address-list "tuedachu@gmail.com")

