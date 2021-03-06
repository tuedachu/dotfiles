(require 'mu4e)
(require 'smtpmail)

;; (with-eval-after-load 'mu4e (require 'mu4e-conversation))
;; (global-mu4e-conversation-mode)



(setq mu4e-maildir "/home/tuedachu/mail")
(setq mu4e-get-mail-command "mbsync -a")

(setq mu4e-hide-index-messages t)

(setq mu4e-change-filenames-when-moving t)

(setq mu4e-headers-fields '((:human-date . 16)
			    (:flags . 6)
			    (:size  . 6)
			    (:from  . 22)
			    (:subject)))

(setq mu4e-headers-date-format "%F %R")
(setq mu4e-headers-time-format "%R")

(setq mu4e-headers-include-related t)

(setq mu4e-drafts-folder
      (lambda (msg)
        (cond
         ((or (and msg
		   (string-prefix-p "/perso/" (mu4e-message-field msg :maildir)))
	      (string= user-mail-address "arnaud.hoffmann90@gmail.com")) "/perso/[Gmail]/.Drafts")
         (t "/tuedachu/[Gmail]/.Drafts")))
      mu4e-sent-folder
      (lambda (msg)
        (cond
         ((or (and msg
		   (string-prefix-p "/perso/" (mu4e-message-field msg :maildir)))
	      (string= user-mail-address "arnaud.hoffmann90@gmail.com")) "/perso/[Gmail]/.Sent Mail")
         ((or (and msg
		   (string-prefix-p "/tuedachu/" (mu4e-message-field msg :maildir)))
	      (string= user-mail-address "tuedachu@gmail.com")) "/tuedachu/[Gmail]/.Sent Mail")
         (t "/mail/Sent")))
      mu4e-trash-folder
      (lambda (msg)
	(cond
	 ((string-prefix-p "/perso/" (mu4e-message-field msg :maildir))
	  "/perso/[Gmail]/.Trash")
         ((string-prefix-p "/tuedachu/" (mu4e-message-field msg :maildir))
	  "/tuedachu/[Gmail]/.Trash")
	 (t "/mail/Trash"))))

(setq mu4e-update-interval 120)

(require 'org-contacts)
(setq org-contacts-files '("/home/tuedachu/perso/contacts.org.gpg"))
(setq mu4e-org-contacts-file "~/perso/contacts.org.gpg")
(setq mu4e-compose-complete-only-personal nil
      mu4e-compose-complete-addresses t)

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
	   :vars '((user-mail-address	    . "arnaud.hoffmann90@gmail.com"  )
		   (user-full-name	    . "Arnaud Hoffmann" )
		   (mu4e-compose-signature . "Arnaud")
		   (smtpmail-smtp-server .  "smtp.gmail.com")
		   (smtpmail-smtp-service . 465)
		   (smtpmail-smtp-user    . "arnaud.hoffmann90@gmail.com")
		   (smtpmail-stream-type . ssl)))
	 ,(make-mu4e-context
	   :name "tuedachu"
	   :match-func (lambda (msg)
			 (when msg
			   (mu4e-message-contact-field-matches msg
							       '(:from :to) "tuedachu@gmail.com")))
	   :vars '((user-mail-address	     . "tuedachu@gmail.com" )
		   (user-full-name	     . "Arnaud Hoffmann" )
		   (mu4e-compose-signature  .
					    (concat
					     "Arnaud Hoffmann\n"
					     "aka tuedachu\n"))
		   (smtpmail-smtp-server .  "smtp.gmail.com")
		   (smtpmail-smtp-service . 465)
		   (smtpmail-smtp-user    . "tuedachu@gmail.com")
		   (smtpmail-stream-type . ssl)))
         ,(make-mu4e-context
	   :name "mail"
	   :match-func (lambda (msg)
			 (when msg
			   (mu4e-message-contact-field-matches msg
							       '(:from :to) "mail@tuedachu.xyz")))
	   :vars '((user-mail-address	     . "mail@tuedachu.xyz" )
		   (user-full-name	     . "Arnaud Hoffmann" )
		   (mu4e-compose-signature  . "Arnaud")
		   (smtpmail-smtp-server .  "mail.gandi.net")
		   (smtpmail-smtp-service . 465)
		   (smtpmail-smtp-user    . "mail@tuedachu.xyz")
		   (smtpmail-stream-type . ssl)))))


;;; This sets `mu4e-user-mail-address-list' to the concatenation of all
;;; `user-mail-address' values for all contexts.
;;; Required when using multiple addresses and if we don't want to
;;; reply to ourselves.
(setq mu4e-user-mail-address-list
      (delq nil
            (mapcar (lambda (context)
                      (when (mu4e-context-vars context)
                        (cdr (assq 'user-mail-address (mu4e-context-vars context)))))
                    mu4e-contexts)))



(global-set-key (kbd "C-M-s") 'helm-mu)


;; TODO: Flag the mail read after being delted
;; set mark 'read', call 'x' and then 'move to trash' again
(defun tuedachu-mu4e-headers-move-to-trash ()
  (interactive)
  (mu4e-mark-set 'move (funcall mu4e-trash-folder (mu4e-message-at-point)))
  (mu4e-headers-next))

(defun tuedachu-mu4e-view-move-to-trash ()
  (interactive)
  (mu4e~view-quit-buffer)
  (mu4e-mark-set 'move (funcall mu4e-trash-folder (mu4e-message-at-point)))
  (mu4e-headers-next))

(define-key mu4e-view-mode-map (kbd "d") 'tuedachu-mu4e-view-move-to-trash)
(define-key mu4e-headers-mode-map (kbd "d") 'tuedachu-mu4e-headers-move-to-trash)
(define-key mu4e-compose-mode-map (kbd "C-M-e") 'mml-secure-message-sign-encrypt)

(setq mml-secure-openpgp-encrypt-to-self t)

(minibuffer-message "Finished loading mu4e config...")
(provide 'config-mu4e)
