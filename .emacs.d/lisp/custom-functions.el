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

;; (exwm-input-set-key (kbd "<f11>") 'tuedachu/publish-website)

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
  (message "Reverting buffer...")
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


(defvar git-changelog-tag-list
  (split-string (or (getenv "GIT_CHANGELOG_KEYWORDS")
                    "FEATURE PERF BUG DOC INTERNAL TEST STYLE REFACTOR CHORE")
                " ")
  "List of compatible tags for git-changelog")

(defun git-changelog-add-tag()
  (interactive)
  (insert (concat "["
                  (completing-read "Choose a compatible tag:"
                                   git-changelog-tag-list)
                  "] ")))

(exwm-input-set-key (kbd "s-a") 'git-changelog-add-tag)



;; go-to feature
(require 'cl-lib)
(defun tuedachu:list-all-subfolder (folder)
  (remove nil (mapcar (lambda (element)
                        (let ((full-path (concat folder
                                                 element)))
                          (if (and (file-directory-p full-path)
                                   (not (or (string= element ".")
                                            (string= element ".."))))
                              `(,element . ,full-path)
                            nil)))
                      (directory-files folder))))


(defvar tuedachu::goto-list
  nil
  "List of all goto candidates for `tuedachu::goto'.

Each element is (display-name . full path). ")

(setq tuedachu::goto-list (append (tuedachu:list-all-subfolder (expand-file-name "~/whitson/02-DEV/"))
                                  (tuedachu:list-all-subfolder (expand-file-name "~/projects/"))
                                  (mapcar (lambda (folder)
                                            `(,folder ,(expand-file-name folder)))
                                          '("~/music/"
                                            "~/projects/"
                                            "~/tuedachu-consulting/"
                                            "~/SOFTWARE/"
                                            "~/website"
                                            "~/whitson"
                                            "~/Downloads"
                                            "~/temp"))))

(require 'eshell)
(defun tuedachu:goto ()
  (interactive)
  (let* ((bufs (cl-loop for b in (mapcar 'buffer-name (buffer-list))
                        when (helm-ff--shell-interactive-buffer-p b)
                        collect b))
         (where-to-go (cdr (assoc (completing-read "Where do you want to go to? " (mapcar #'car
                                                                                          tuedachu::goto-list))
                                  tuedachu::goto-list)))
         (eshell-buffer-name (if (cdr bufs)
                                 (helm-comp-read "Switch to eshell buffer: " bufs
                                                 :must-match t)
                               (car bufs))))
    (switch-to-buffer eshell-buffer-name)
    (eshell/cd where-to-go)
    (eshell-reset)))

(exwm-input-set-key (kbd "s-SPC") 'tuedachu:goto)


(defun tuedachu:test-recipe()
  (interactive)
  (let* ((package-name (read-from-minibuffer "Name of the package: "))
         (repo (read-from-minibuffer "Repository: " (concat "tuedachu/"
                                                            package-name)))
         (fetcher (read-from-minibuffer "Fetcher: " "gitlab"))
         (branch (read-from-minibuffer "Branch: " "master")))
    (insert (concat "RECIPE='("
                    package-name
                    " :repo \""
                    repo
                    "\" :fetcher "
                    fetcher
                    " :branch \""
                    branch
                    "\")' make"))))
