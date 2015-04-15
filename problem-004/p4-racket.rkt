#lang racket

(define (reverse-string word)
  (list->string (reverse (string->list word))))

(define (palindrome? val)
  (match val
    [(? number?) (equal? (number->string val) (reverse-string (number->string val)))]
    [(? string?) (equal? val (reverse-string val))]
    [else (error "Not a valid input")]))

(define (make-palindrome val)
  (match val
    [(? number?) (string->number (list->string (append (string->list (number->string val)) (string->list (reverse-string (number->string val))))))]
    [(? string?) (string->number(list->string (append (string->list val) (string->list (reverse-string val)))))]
    [else (error "Not a valid input")]))

(define (find-largest-palindrome)
  (for ([x (in-range 999 100 -1)])
    (define pal (make-palindrome x))
    (for ([y (in-range 999 100 -1)])
      (when (and (equal? (modulo pal y) 0)
                 (< (/ pal y) 1000)
                 (> (/ pal y) 100))
        (displayln pal)
        (displayln (/ pal y))
        (displayln y)
        (displayln "----")))))

(define (find-largest-palindrome-stop)
  (define answer-set #f)
  (for ([x (in-range 999 100 -1)]
        #:break (equal? answer-set #t))
    (define pal (make-palindrome x))
    (for ([y (in-range 999 100 -1)]
          #:break (equal? answer-set #t))
      (when (and (equal? (modulo pal y) 0)
                 (< (/ pal y) 1000)
                 (> (/ pal y) 100))
        (displayln pal)
        (displayln (/ pal y))
        (displayln y)
        (displayln "----")
        (set! answer-set #t)))))

(find-largest-palindrome-stop)