(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x 

(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(global-set-key (kbd "C-x C-f") 'helm-find-files)

(defun tuedachu/find-files-in-home ()
  "Fuzzy find files in home directory  using the function 'helm-find'."
  (interactive)
  (let ((default-directory "~"))
    (helm-find nil)))
  
(global-set-key (kbd "s-f") 'tuedachu/find-files-in-home)

(global-set-key (kbd "M-s f") 'helm-semantic-or-imenu)
(global-set-key (kbd "M-s o") 'helm-occur)

(global-set-key (kbd "C-h a") 'helm-apropos)
(setq helm-follow-mode-persistent t)

(add-to-list 'helm-source-names-using-follow "Occur")
(add-to-list 'helm-source-names-using-follow "Imenu")

(when (executable-find "curl")
  (setq helm-net-prefer-curl t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(setq helm-reuse-last-window-split-state t
      helm-window-prefer-horizontal-split t
      helm-split-window-default-side "right")

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)

(helm-mode 1)

(setq helm-findutils-search-full-path t)
