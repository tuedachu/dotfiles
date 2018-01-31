

(defun tuedachu-change-screen-hook ()
  (with-temp-buffer
    (call-process "xrandr" nil t nil)
    (beginning-of-buffer)
    (if (search-forward "VGA1 connected" nil 'noerror)
        (start-process-shell-command
         "xrandr" nil "xrandr --output VGA1 --primary --auto --output LVDS1 --off")
      (start-process-shell-command
       "xrandr" nil "xrandr --output LVDS1 --auto"))))
