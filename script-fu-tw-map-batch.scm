(define (script-fu-tw-map-batch pattern outsuffix)
(let* (
    (filelist (cadr (file-glob pattern 1)))
    (filename "")
    (outfn "")
      )
    (while (not (null? filelist))
        (set! filename (car filelist))
        (set! outfn 
            (string-append 
                (string-append 
                    (substring filename 0 (- (string-length filename) 4))
                    outsuffix)
                (substring filename (- (string-length filename) 4))
            )
        )
        (script-fu-tw-map filename outfn)
        (set! filelist (cdr filelist))
    )
))
(script-fu-register "script-fu-tw-map-batch"
    "Batch Edger"
    "Removes junk from the edges of a series of images"
    "Chris Kent"
    "WireBear.com"
    "August 2011"
    "RGB* GRAY*"
    SF-STRING "Pattern" "*.png"
    SF-STRING "OutputSuffix" "_out"
)
script-fu-tw-map-batch()
