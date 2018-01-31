(require 'mu4e)



(setq mu4e-maildir "/home/tuedachu/.cache/mail")
(setq mu4e-get-mail-command "mbsync -a")

(setq mu4e-hide-index-messages t)

(setq mu4e-drafts-folder
      (lambda (msg)
        (cond
         ((or (and msg
		   (string-prefix-p "/perso/" (mu4e-message-field msg :maildir)))
	      (string= user-mail-address "arnaud.hoffmann90@gmail.com")) "/perso/[Gmail]/.Drafts")
	 ((or (and msg
		   (string-prefix-p "/PZ/" (mu4e-message-field msg :maildir)))
	      (string= user-mail-address "arnaud@petrostreamz.com")) "/PZ/Brouillons")
         (t "/tuedachu/[Gmail]/.Drafts")))
      mu4e-sent-folder
      (lambda (msg)
        (cond
         ((or (and msg
		   (string-prefix-p "/perso/" (mu4e-message-field msg :maildir)))
	      (string= user-mail-address "arnaud.hoffmann90@gmail.com")) "/perso/[Gmail]/.Sent")
	 ((or (and msg
		   (string-prefix-p "/PZ/" (mu4e-message-field msg :maildir)))
	      (string= user-mail-address "arnaud@petrostreamz.com")) "/PZ/&AMk-l&AOk-ments envoy&AOk-s")
         (t "/tuedachu/[Gmail]/.Sent")))
      mu4e-trash-folder
      (lambda (msg)
	(cond
	 ((string-prefix-p "/perso/" (mu4e-message-field msg :maildir))
	  "/perso/[Gmail]/.Trash")
	 ((string-prefix-p "/PZ/" (mu4e-message-field msg :maildir))
	  "/PZ/&AMk-l&AOk-ments supprim&AOk-s")
	 "/tuedachu/[Gmail]/.Trash")))

(setq mu4e-update-interval 120)

(require 'org-contacts)
(add-to-list 'org-contacts-files "~/perso/contacts.org")

; To speed up indexing process
;(setq
;       mu4e-index-cleanup nil      ;; don't do a full cleanup check
;       mu4e-index-lazy-check t)    ;; don't consider up-to-date dirs

;; Directory to save attachments
(setq mu4e-attachment-dir  "~/Downloads") ;the directorty could be returned by a user defined function.

(setq smtpmail-queue-dir "~/.cache/mail/queued") ; location to store the queued messages

;; Message signature
(setq mu4e-compose-signature-auto-include t)

;; Don't include myself in the reply
(setq mu4e-compose-dont-reply-to-self t)
(add-to-list 'mu4e-user-mail-address-list "tuedachu@gmail.com")

(setq mu4e-view-show-addresses t)

(setq send-mail-function 'smtpmail-send-it)


;; Context
(setq mu4e-contexts
      `( ,(make-mu4e-context
	   :name "perso"
	   :match-func (lambda (msg)
			 (when msg
			   (mu4e-message-contact-field-matches msg
							       '(:from :to) "arnaud.hoffmann90@gmail.com")))
	   :vars '( ( user-mail-address	    . "arnaud.hoffmann90@gmail.com"  )
		    ( user-full-name	    . "Arnaud Hoffmann" )
		    ( mu4e-compose-signature . "Arnaud")
		    (smtpmail-smtp-server .  "smtp.gmail.com")
		    (smtpmail-smtp-service . 465)
		    (smtpmail-stream-type . ssl)))
	 ,(make-mu4e-context
	   :name "work"
	   :match-func (lambda (msg)
			 (when msg
			   (mu4e-message-contact-field-matches msg
							       '(:from :to) "tuedachu@gmail.com")))
	   :vars '( ( user-mail-address	     . "tuedachu@gmail.com" )
		    ( user-full-name	     . "Arnaud Hoffmann" )
		    ( mu4e-compose-signature  .
					      (concat
					       "Arnaud Hoffmann\n"
					       "aka tuedachu\n"))
		    (smtpmail-smtp-server .  "smtp.gmail.com")
		    (smtpmail-smtp-service . 465)
		    (smtpmail-stream-type . ssl)))
	 ,(make-mu4e-context
	   :name "PZ"
	   :match-func (lambda (msg)
			 (when msg
			   (mu4e-message-contact-field-matches msg
							       '(:from :to) "arnaud@petrostreamz.com")))
	   :vars '( ( user-mail-address	     . "arnaud@petrostreamz.com" )
		    ( user-full-name	     . "Arnaud Hoffmann" )
		    ( mu4e-compose-signature  .
					      (concat
					       "Arnaud Hoffmann\n"
					       "Senior Petroleum Engineer\n"))
		    (smtpmail-smtp-server .  "smtp.office365.com")
		    (smtpmail-smtp-service . 587)))))

;; set `mu4e-context-policy` and `mu4e-compose-policy` to tweak when mu4e should
;; guess or ask the correct context, e.g.

;; start with the first (default) context;
;; default is to ask-if-none (ask when there's no context yet, and none match)
;; (setq mu4e-context-policy 'pick-first)

;; compose with the current context is no context matches;
;; default is to ask
;; (setq mu4e-compose-context-policy nil)

