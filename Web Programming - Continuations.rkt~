#lang web-server/insta

(define questions (list ""
                        "What is the best controller for shooters?"
                        "What is the best gate?"
                        "Do you prefer horizontal or vertical scrolling?"
                        "What is the best horizontal shooter?"
                        "Which is the better developer?" 
                        "What is Cave’s best release?"
                        "What is Treasure’s best release?"))


(define option1 (list '(input ([name "answer"] [type "radio"] [value "TEST1"]) "TEXT1 HERE")
                      '(input ([name "answer"] [type "radio"] [value "TEST2"]) "TEXT2 HERE")
                      '(input ([name "answer"] [type "radio"] [value "TEST3"]) "TEXT3 HERE")))

(define option2 (list '(input ([name "answer"] [type "radio"] [value "TEST1"]) "TEXT1 HERE")
                      '(input ([name "answer"] [type "radio"] [value "TEST2"]) "TEXT2 HERE")
                      '(input ([name "answer"] [type "radio"] [value "TEST3"]) "TEXT3 HERE")))

(define option3 (list '(input ([name "answer"] [type "radio"] [value "TEST1"]) "TEXT1 HERE")
                      '(input ([name "answer"] [type "radio"] [value "TEST2"]) "TEXT2 HERE")
                      '(input ([name "answer"] [type "radio"] [value "TEST3"]) "TEXT3 HERE")))

(define option4 (list '(input ([name "answer"] [type "radio"] [value "TEST1"]) "TEXT1 HERE")
                      '(input ([name "answer"] [type "radio"] [value "TEST2"]) "TEXT2 HERE")
                      '(input ([name "answer"] [type "radio"] [value "TEST3"]) "TEXT3 HERE")))

(define option5 (list '(input ([name "answer"] [type "radio"] [value "TEST1"]) "TEXT1 HERE")
                      '(input ([name "answer"] [type "radio"] [value "TEST2"]) "TEXT2 HERE")
                      '(input ([name "answer"] [type "radio"] [value "TEST3"]) "TEXT3 HERE")))

(define option6 (list '(input ([name "answer"] [type "radio"] [value "TEST1"]) "TEXT1 HERE")
                      '(input ([name "answer"] [type "radio"] [value "TEST2"]) "TEXT2 HERE")
                      '(input ([name "answer"] [type "radio"] [value "TEST3"]) "TEXT3 HERE")))

(define option7 (list '(input ([name "answer"] [type "radio"] [value "TEST1"]) "TEXT1 HERE")
                      '(input ([name "answer"] [type "radio"] [value "TEST2"]) "TEXT2 HERE")
                      '(input ([name "answer"] [type "radio"] [value "TEST3"]) "TEXT3 HERE")))

(define option-list (list option1 option2 option3 option4 option5 option6 option7))

(define (start initial-request)
  (local [(define result1 (get-answer (list-ref questions 1) 1))
          (define result2 (get-answer (list-ref questions 2) 2))
          (define result3 (get-answer (list-ref questions 3) 3))
          (define result4 (get-answer (list-ref questions 4) 4))
          (define result5 (get-answer (list-ref questions 5) 5))
          (define result6 (get-answer (list-ref questions 6) 6))
          (define result7 (get-answer (list-ref questions 7) 7))]
    (send/back (response/xexpr `(html (head (title "Your result"))
                                      (body (p ,result1
                                               )))))))



(define (get-answer prompt)
  (local [(define req (send/suspend (lambda (k-url)
                                      (response/xexpr 
                                       `(html (head (title "Question x"))
                                              (body
                                               (form ([action ,k-url])
                                                     ,prompt
                                                     (br)
                                                     ,@(map (lambda (x) x) a1)
                                                     (input ([type "submit"])))))))))
          (define bindings (request-bindings req))
          (define value (extract-binding/single 'answer bindings))]
    value ; return the value as a number
    ))

