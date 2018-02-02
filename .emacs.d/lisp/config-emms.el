;; EMMS
(require 'emms-setup)
(emms-all)
(require 'emms-player-mpv)
(add-to-list 'emms-player-list 'emms-player-mpv)
(require 'emms-info-libtag)
(setq emms-info-functions '(emms-info-libtag))
(setq emms-source-file-default-directory "~/music")
(add-to-list 'emms-player-mpv-parameters "--no-audio-display")

(provide 'config-emms)
