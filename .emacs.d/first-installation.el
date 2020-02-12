(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("org" ."http://orgmode.org/elpa/"))
(package-initialize)

(setq package-selected-packages '(auctex auto-complete-auctex company-go company-jedi company-tern company-web dash-functional edit-indirect elisp-def elpy exwm find-file-in-project fish-completion flycheck ghub go-eldoc go-mode graphql helm-company company helm-emms emms helm-mu helm-pass helm-pydoc helm-system-packages helm helm-core highlight-indentation ht htmlize ivy jedi auto-complete jedi-core epc ctable concurrent js2-mode lua-mode lv magit git-commit magit-popup markdown-mode mmm-mode mu4e-conversation org-plus-contrib package-lint paredit password-store auth-source-pass f dash pdf-tools pinentry pkg-info epl popup prettier-js py-autopep8 pydoc python-environment deferred pyvenv quack racket-mode faceup s scheme-complete spinner ssass-mode tablist tern transient transmission let-alist treepy undo-tree use-package bind-key web-completion-data web-mode wgrep-helm wgrep with-editor async ws-butler xelb yaml-mode yasnippet))

(package-refresh-contents)
(package-install-selected-packages)
