(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(package-initialize)

;;; FROM ambrevar init.el
;;; Site Lisp folder for local packages and development.
;; We need to roll it out manually since we want it first in the `load-path',
;; while `normal-top-level-add-subdirs-to-load-path' appends it to the very end.
(defun ambrevar/package-refresh-load-path (path)
  "Add every non-hidden sub-folder of PATH to `load-path'."
  (when (file-directory-p path)
    (dolist (dir (directory-files path t "^[^\\.]"))
      (when (file-directory-p dir)
        (setq load-path (add-to-list 'load-path dir))
        (dolist (subdir (directory-files dir t "^[^\\.]"))
          (when (file-directory-p subdir)
            (setq load-path (add-to-list 'load-path subdir))))))))
(let ((site-lisp (expand-file-name "site-lisp/" "~/.emacs.d/")))
  (add-to-list 'load-path site-lisp)
  (ambrevar/package-refresh-load-path site-lisp))

(setq package-selected-packages '(pinentry mu4e-conversation ws-butler web-mode company-tern tern js2-mode helm-pass helm-company company-go company go-eldoc pdf-tools undo-tree lua-mode markdown-mode helm-mu go-mode emms-player-mpv wgrep-helm wgrep helm-emms transmission fish-completion magit helm-system-packages helm with-editor org-plus-contrib exwm))

;; start early.
(pinentry-start)

(setq user-full-name "Arnaud Hoffmann")

(global-set-key (kbd "C-x C-c") 'save-buffers-kill-emacs)

(add-to-list 'load-path (concat user-emacs-directory "lisp"))

(load "config-exwm")
(load "config-helm")
(load "config-elisp-mode")
(load "custom-functions")
(load "config-python-mode")
(load "config-ydl4e.el")

;;TODO: check indentation in org mode
(with-eval-after-load 'org-mode (require 'config-org-mode))
(with-eval-after-load 'emms (require 'config-emms))
(with-eval-after-load 'c-mode (require 'config-c-mode))
(with-eval-after-load 'go-mode (require 'config-go-mode))
(with-eval-after-load 'racket-mode (require 'config-racket-mode))


;;LaTeX
(add-to-list 'auto-mode-alist '("\\.tex?\\'" . LaTeX-mode))
(with-eval-after-load 'LaTeX-mode (require 'config-latex-mode))

;; html
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; javascript
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(with-eval-after-load 'js2-mode (require 'config-js-mode))

(setq custom-file "/tmp/emacs-custom-file.el")

(setq helm-source-names-using-follow '("All Eshell prompts" "Regexp Builder" "Variables" "Imenu" "Occur"))

(set-face-attribute 'default nil :foreground "white" :background "black")
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono"))

;; Unbind <C-z>
(global-set-key (kbd "C-z") nil)
;; comment line
(global-set-key (kbd "M-;") 'comment-line)

;; Bind menu to nothing
(global-set-key (kbd "<menu>") nil)

;; Org files used for the agenda
(setq org-agenda-files '("~/perso/TODO.org.gpg" "~/perso/birthday.org"))

;; TODO: move eshell config into a separate file
(load "patch-eshell")
(with-eval-after-load 'em-term
  (add-to-list 'eshell-visual-commands "htop")
  (add-to-list 'eshell-visual-commands "wifi-menu")
  (add-to-list 'eshell-visual-commands "watch")
  (add-to-list 'eshell-visual-commands "gtypist")
  (add-to-list 'eshell-visual-commands "ncdu"))

(setq eshell-kill-processes-on-exit t)


(defalias 'yes-or-no-p 'y-or-n-p)

(show-paren-mode)

(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; TODO: make it more lispie...
(when (and (executable-find "fish")
           (require 'fish-completion nil t))
  (global-fish-completion-mode))

(setq transmission-refresh-modes '(transmission-mode transmission-files-mode transmission-info-mode transmission-peers-mode)
      transmission-refresh-interval 1)


;; default browser
(setq browse-url-generic-program (executable-find "qutebrowser"))
(setq browse-url-browser-function 'browse-url-generic)


(setq make-backup-files nil)

(require 'undo-tree)
(global-undo-tree-mode)


;; (add-to-list 'load-path (concat user-emacs-directory "PhzCompMode"))
;; (load "config-phz")

;; Prevent to split vertically the window
(setq split-height-threshold nil)
(setq split-width-threshold 100)

(if (file-exists-p "lisp/myYoga-config.el")
    (load "myYoga-config.el"))
;;(require 'transfer-sh)

(setq magit-diff-refine-hunk 'all)
(put 'erase-buffer 'disabled nil)
(put 'emms-browser-delete-files 'disabled nil)

;; email
;; TODO: Find a solution to this issue
(defun email ()
  (interactive)
  (require 'config-mu4e)
  (mu4e))

;; Add pdf tools
;;(pdf-tools-install)
