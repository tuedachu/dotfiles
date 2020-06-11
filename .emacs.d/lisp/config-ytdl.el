(require 'ytdl)

(setq ytdl-music-folder (expand-file-name "~/perso/music")
      ytdl-video-folder (expand-file-name "~/perso/videos")
      ytdl-always-query-default-filename t
      ytdl-always-ask-delete-confirmation t)

;; (ytdl-add-field-in-download-type-list "podcasts"
;;                                        "p"
;;                                        (expand-file-name "~/perso/podcasts")
;;                                        nil)

;; (ytdl-add-field-in-download-type-list "movie insider"
;;                                        "i"
;;                                        (expand-file-name "~/perso/movie-insider")
;;                                        nil)

;; (ytdl-add-field-in-download-type-list "thinkerviews"
;;                                        "t"
;;                                        (expand-file-name "~/perso/thinkerviews")
;;                                        nil)
