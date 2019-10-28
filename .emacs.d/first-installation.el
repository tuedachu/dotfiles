(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("org" ."http://orgmode.org/elpa/"))
(package-initialize)

(setq package-selected-packages '(elisp-def package-lint dash elpy helm lv with-editor auto-complete company-go company-jedi company-tern dash-functional elpy emms-player-mpv exwm find-file-in-project fish-completion flycheck ghub go-eldoc go-mode graphql helm-company company helm-emms helm-mu helm-pass helm-pydoc helm-system-packages helm helm-core highlight-indentation htmlize ivy jedi-core epc ctable concurrent js2-mode lua-mode lv magit git-commit magit-popup markdown-mode mu4e-conversation org-plus-contrib paredit password-store auth-source-pass f pdf-tools pinentry pkg-info epl popup py-autopep8 pydoc python-environment deferred pyvenv quack racket-mode faceup s scheme-complete tablist tern transient dash transmission let-alist treepy undo-tree use-package bind-key web-mode wgrep-helm wgrep with-editor async ws-butler xelb yasnippet ydl4e emms))

(package-refresh-contents)
(package-install-selected-packages)
