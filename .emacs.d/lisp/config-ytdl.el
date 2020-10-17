(require 'ytdl)

(setq ytdl-music-folder (expand-file-name "~/videos/music")
      ytdl-video-folder (expand-file-name "~/videos/videos")
      ytdl-always-query-default-filename 'yes
      ytdl-always-ask-delete-confirmation t)


(ytdl-add-field-in-download-type-list "movie insider"
                                      "i"
                                      (expand-file-name "~/videos/movie-insider")
                                      nil)

(ytdl-add-field-in-download-type-list "thinkerviews"
                                      "t"
                                      (expand-file-name "~/videos/thinkerviews")
                                      nil)


(ytdl-add-field-in-download-type-list "meurice"
                                      "m"
                                      (expand-file-name "~/videos/meurice")
                                      nil)

(ytdl-add-field-in-download-type-list "John Oliver"
                                      "o"
                                      (expand-file-name "~/videos/John-Oliver")
                                      nil)


(ytdl-add-field-in-download-type-list "Ted"
                                      "T"
                                      (expand-file-name "~/videos/Ted")
                                      nil)

(ytdl-add-field-in-download-type-list "Snowden"
                                      "s"
                                      (expand-file-name "~/videos/Snowden")
                                      nil)

(ytdl-add-field-in-download-type-list "low-tech"
                                      "l"
                                      (expand-file-name "~/videos/low-tech")
                                      nil)

(ytdl-add-field-in-download-type-list "permaculture"
                                      "p"
                                      (expand-file-name "~/videos/permaculture/")
                                      nil)


(ytdl-add-field-in-download-type-list "collapsologie"
                                      "p"
                                      (expand-file-name "~/videos/collapsologie/")
                                      nil)

(ytdl-add-field-in-download-type-list "lindy-hop"
                                      "l"
                                      (expand-file-name "~/videos/lindy-hop/")
                                      nil)
