(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(package-initialize)

;; start early.  
(pinentry-start)

(setq user-full-name "Arnaud Hoffmann")

(global-set-key (kbd "C-x C-c") 'save-buffers-kill-emacs)

(add-to-list 'load-path (concat user-emacs-directory "lisp"))

(load "config-exwm")
(load "config-helm")
(load "config-mu4e")

(with-eval-after-load 'emms (require 'config-emms))
(with-eval-after-load 'c-mode (require 'config-c-mode))

(setq custom-file "/tmp/emacs-custom-file.el")

(setq helm-source-names-using-follow '("All Eshell prompts" "Regexp Builder" "Variables" "Imenu" "Occur"))

(setq package-selected-packages '(undo-tree lua-mode markdown-mode helm-mu go-mode emms-player-mpv wgrep-helm wgrep helm-emms transmission fish-completion magit helm-system-packages helm with-editor org-plus-contrib exwm))

(set-face-attribute 'default nil :foreground "white" :background "black")
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono")) 

;; Unbind <C-z>
(global-set-key (kbd "C-z") nil)
;; comment line
(global-set-key (kbd "M-;") 'comment-line)

;Org files used for the agenda 
(setq org-agenda-files '("~/perso/notes.org"))

(load "patch-eshell")
(with-eval-after-load 'em-term
  (add-to-list 'eshell-visual-commands "htop")
  (add-to-list 'eshell-visual-commands "watch")
  (add-to-list 'eshell-visual-commands "gtypist")
  (add-to-list 'eshell-visual-commands "ncdu"))

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

