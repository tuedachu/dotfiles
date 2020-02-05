(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("org" ."http://orgmode.org/elpa/"))
(package-initialize)

(setq package-selected-packages '(jedi helm helm-core org-plus-contrib racket-mode auctex auto-complete-auctex auto-complete company-go company-jedi company-tern dash-functional elisp-def elpy exwm find-file-in-project fish-completion flycheck ghub go-eldoc go-mode graphql helm-company company helm-emms emms helm-mu helm-pass helm-pydoc helm-system-packages helm helm-core highlight-indentation htmlize ivy jedi-core epc ctable concurrent js2-mode lua-mode lv magit git-commit magit-popup markdown-mode mu4e-conversation org-plus-contrib package-lint paredit password-store auth-source-pass f dash pdf-tools pinentry pkg-info epl popup py-autopep8 pydoc python-environment deferred pyvenv quack racket-mode faceup s scheme-complete tablist tern transient transmission let-alist treepy undo-tree use-package bind-key web-mode wgrep-helm wgrep with-editor async ws-butler xelb yaml-mode yasnippet))

(package-refresh-contents)
(package-install-selected-packages)
