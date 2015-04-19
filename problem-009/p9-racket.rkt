#lang racket

;a^2 + b^2 = c^2
;a + b + c = 1000
;a = 1..332
;b = 2..499
;c = 334..997

;a^2 + b^2 > 334 && 997
;Find the whole square roots between those numbers

(define possible-answers-c-squared '())
(define possible-answers-c '())
(for ([c (in-range 334 997 1)])
  (set! possible-answers-c-squared (cons (* c c) possible-answers-c-squared)))

(define possible-answers-a '())
(define possible-answers-b '())
(for ([c-squared possible-answers-c-squared])
  (for ([a (in-range 1 332 1)])
    (for ([b (in-range 2 499 1)])
      (when (equal? (+ (* a a) (* b b)) c-squared)
        (when (and (< a b) (< b (sqrt c-squared)) (equal? (+ a b (sqrt c-squared)) 1000))
          (begin
            (displayln a)
            (displayln b)
            (displayln (sqrt c-squared))
            (displayln (* a b (sqrt c-squared)))))))))

; A little slow, but it works!