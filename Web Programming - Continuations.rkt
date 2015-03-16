#lang web-server/insta

(define questions 
  (list
   "What is the best controller for shooters?"
   "What is the best gate?"
   "Do you prefer horizontal or vertical scrolling?"
   "What is the best horizontal shooter?"
   "Which is the better developer?" 
   "What is Cave’s best release?"
   "What is Treasure’s best release?"))

(define option-lists 
  (list
   (list "Arcade Stick" "Gamepad" "Keyboard") 
   (list "Circular" "Octangonal" "Square")
   (list "Horizontal" "Vertical")
   (list "Gradius V" "Sexy Parodius" "Border Down" "Deathsmiles" "other")
   (list "Cave" "Treasure")
   (list "Dodonpachi" "Ketsui kizuna jigoku tachi" "Mushihimesama Futari 1.5" "other")
   (list "Radiant Silvergun" "Sin and Punishment" "Ikaruga" "Sin and Punishment: Star Successor" "other")))

(define (start initial-request)
  (local [(define answer1 (get-answer (list-ref questions 0) (list-ref option-lists 0)))
          (define answer2 (if (string=? answer1 "Arcade Stick")
                              (get-answer (list-ref questions 1) (list-ref option-lists 1))
                              ""))
          (define answer3 (get-answer (list-ref questions 2) (list-ref option-lists 2)))
          (define answer4 (if (string=? answer3 "Horizontal")
                              (get-answer (list-ref questions 3) (list-ref option-lists 3))
                              ""))
          (define answer5 (if (string=? answer4 "Vertical")
                              (get-answer (list-ref questions 4) (list-ref option-lists 4))
                              ""))
          (define answer6 (if (string=? answer5 "Cave")
                              (get-answer (list-ref questions 5) (list-ref option-lists 5))
                              ""))
          (define answer7 (if (and (string=? answer3 "Vertical")
                                   (string=? answer5 "Treasure"))
                                   (get-answer (list-ref questions 6) (list-ref option-lists 6))
                                   ""))
          (define answers (list answer1 answer2 answer3 answer4 answer5 answer6 answer7))]
    (send/back (response/xexpr 
                `(html (head (title "Results"))
                       (body 
                        (h1 "Your lame results")
                        (div
                          ,@(map render-answer questions answers))))))))

(define (render-answer question answer)
  (if (string=? answer "")
      ""
      `(ul ,question
        (li ,answer))))

(define (render-option option)
  (if (string=? option "other")
      `(div (input ([name "answer"] [type "radio"] [value ,option]) ,option
                   (input ([name "customtxt"] [type "text"]))))
      `(div (input ([name "answer"] [type "radio"] [value ,option]) ,option))))

(define (get-answer prompt options)
  (local [(define req 
            (send/suspend 
             (lambda (k-url)
               (response/xexpr 
                `(html (head (title "Lame Questions"))
                       (body
                        (form ([action ,k-url])
                              ,prompt
                              (br)
                              (div
                               ,@(map render-option options))
                              (br)
                              (input ([type "submit"])))))))))
          (define bindings (request-bindings req))
          (define value (extract-binding/single 'answer bindings))]
    value))