(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(package-initialize)

(setq package-selected-packages '(ws-butler web-mode company-tern tern js2-mode helm-pass helm-company company-go company go-eldoc pdf-tools undo-tree lua-mode markdown-mode helm-mu go-mode emms-player-mpv wgrep-helm wgrep helm-emms transmission fish-completion magit helm-system-packages helm with-editor org-plus-contrib exwm))


(package-refresh-contents)
(package-install-selected-packages)
