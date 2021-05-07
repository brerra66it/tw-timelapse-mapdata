(define (script-fu-tw-map filename outfilename width height left top)
(let* (
    (img (car (gimp-file-load RUN-NONINTERACTIVE filename filename)))
      )

   ;Crop Image
    (gimp-image-crop img width height left top)
   ;Set no interpolation
    (gimp-context-set-interpolation 0)
   ;resize to fullHD
    (gimp-image-scale img 1280 720)
   ;Save
    (gimp-file-save RUN-NONINTERACTIVE
        img
        (car (gimp-image-active-drawable img))
        outfilename
        outfilename)

   ;Cleanup
    (gimp-image-delete img)
))
(script-fu-register "script-fu-tw-map"
    "Edger"
    "Removes junk from the edges of an image"
    "Chris Kent"
    "WireBear.com"
    "August 2011"
    "RGB* GRAY*"
    SF-STRING "Filename" ""
    SF-STRING "OutputFilename" ""
    SF-VALUE "TopEdge" "0"
    SF-VALUE "RightEdge" "0"
    SF-VALUE "BottomEdge" "0"
    SF-VALUE "LeftEdge" "0"
)
script-fu-tw-map()