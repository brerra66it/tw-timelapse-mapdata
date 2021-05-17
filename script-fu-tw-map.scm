; 1) save this file as `$HOME/.gimp-2.10.8/scripts/script-fu-tw-map.scm' (the path can be found/created in Edit > Preferences > Folders > Scripts)
; 2) run via Script-Fu Console with command (script-fu-tw-map "c:\\Users\\test\\1620378072.png" "c:\\Users\\test\\1620378072.png")

; script is based on the Edger script of Chris Kent found there https://stackoverflow.com/questions/5811378/how-do-i-write-a-custom-auto-crop-script-using-the-gimp

(define (script-fu-tw-map filename outfilename)
  (let*
    (;variables
      (img-date (car (gimp-file-load RUN-NONINTERACTIVE filename filename)))
      (img-map (car (gimp-file-load RUN-NONINTERACTIVE filename filename)))
      (layer-date (car (gimp-layer-new img-map 110 23 INDEXED-IMAGE "layer for date" 100 LAYER-MODE-NORMAL)))
    )
    ; expressions to implement
    ; https://docs.gimp.org/en/gimp-using-script-fu-tutorial-script.html
    ;(gimp-display-new img-map)
	
	
    ;crop date signature and translate it over map file
    (gimp-image-crop img-date 110 23 0 0)
    (set! layer-date (car (gimp-layer-new-from-visible img-date img-map "date")))
    (gimp-image-delete img-date)
    (gimp-image-insert-layer img-map layer-date 0 0)
    (gimp-layer-translate layer-date 650 390)

    ;Crop Image without interpolation and resize to 720p
    (gimp-image-crop img-map 432 243 372 380)
    (gimp-context-set-interpolation 0)
    (gimp-image-scale img-map 1280 720)

    ;Save
    (gimp-file-save RUN-NONINTERACTIVE
        img-map
        (car (gimp-image-merge-down img-map layer-date CLIP-TO-BOTTOM-LAYER))
        outfilename
        outfilename)

    ;Cleanup
    (gimp-image-delete img-map)
    )
)
(script-fu-register "script-fu-tw-map"
    "tw-map-process"
    "resize and upscale middle part of the map"
    "Leonid"
    "https://github.com/brerra66it/tw-timelapse-mapdata"
    "May 2021"
    "RGB* GRAY*"
    SF-STRING "Filename" ""
    SF-STRING "OutputFilename" ""
)
script-fu-tw-map()
