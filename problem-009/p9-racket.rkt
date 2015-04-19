#lang racket

;a^2 + b^2 = c^2
;a + b + c = 1000
;a = 1..332
;b = 2..499
;c = 334..997

;a^2 + b^2 > 334 && 997
;Find the whole square roots between those numbers

;Not my solution, but it is better because:
;  - It terminates after 199375 checks 
;    + compared to 15069414 checks before finding the solution AND
;    + 31875000 guaranteed loops
; The math behind this is quite nifty
;  We consolodate the two equations down to one:
;    ab -1000a -1000b + 500000 = 0
;@1000
;cpu time: 31 real time: 35 gc time: 0
;cpu time: 15 real time: 19 gc time: 0
;cpu time: 16 real time: 17 gc time: 0
;@332
;cpu time: 16 real time: 11 gc time: 0
;cpu time: 16 real time: 13 gc time: 0
;cpu time: 15 real time: 12 gc time: 0
(define (attempt a b)
  (+ (* a b) (* -1000 a) (* -1000 b) 500000))

(define (problem9)
  (define (iter a b count)
    (if (= 0 (attempt a b))
        (* a b (- 1000 (+ a b)))
        (if (= a 332) ; Updated this from 1000 to 332 (as this is the max)
            (iter 1 (add1 b) (add1 count))
            (iter (add1 a) b (add1 count)))))
  (iter 1 1 1))
(time (problem9))

;(time (problem9))
; Making my solution iterate equals much faster
;cpu time: 1295 real time: 1277 gc time: 0
;cpu time: 1186 real time: 1209 gc time: 0
;cpu time: 1186 real time: 1202 gc time: 0
(define (problem9z)
  (define (iter a b c)
    (if (and (= 1000 (+ a b c))
             (< b c)
             (< a b)
             (= (+ (* a a) (* b b)) (* c c)))
        (* a b c)
        (cond 
          [(= b 499) (iter (add1 a) 2 c)]
          [(= a 332) (iter 1 b (add1 c))]
          [else (iter a (add1 b) c)])))
  (iter 1 2 334))
  
(time (problem9z))
          

;cpu time: 3323 real time: 3317 gc time: 0
;cpu time: 3385 real time: 3390 gc time: 0
;cpu time: 3292 real time: 3301 gc time: 0
; THE PROBLEM
(define counta 0)
#;(time
 (for ([c (in-range 334 997 1)])
   (for ([a (in-range 1 332 1)])
     (for ([b (in-range 2 499 1)])
       (set! counta (add1 counta))
       (when (equal? (+ a b c) 1000)
         (when (< b c)
           (when (< a b)
             (when (equal? (+ (* a a) (* b b)) (* c c))
               (begin
                 (displayln counta)
                 (displayln a)
                 (displayln b)
                 (displayln c)
                 (displayln (* a b c)))))))))))

;cpu time: 3323 real time: 3308 gc time: 0
;cpu time: 3338 real time: 3336 gc time: 0
;cpu time: 3681 real time: 3696 gc time: 0
#;(time
 (for ([c (in-range 334 997 1)])
   (for ([a (in-range 1 332 1)])
     (for ([b (in-range 2 499 1)])
       (when (equal? (+ a b c) 1000)
         (when (< a b)
           (when (< b c)
             (when (equal? (+ (* a a) (* b b)) (* c c))
               (begin
                 (displayln a)
                 (displayln b)
                 (displayln c)
                 (displayln (* a b c)))))))))))

;cpu time: 3385 real time: 3403 gc time: 0
;cpu time: 3526 real time: 3522 gc time: 0
;cpu time: 3385 real time: 3372 gc time: 0
#;(time
(for ([c (in-range 334 997 1)])
  (for ([a (in-range 1 332 1)])
    (for ([b (in-range 2 499 1)])
      (when (equal? (+ a b c) 1000)
        (when (< a b c)
          (when (equal? (+ (* a a) (* b b)) (* c c))
            (begin
              (displayln a)
              (displayln b)
              (displayln c)
              (displayln (* a b c))))))))))

;cpu time: 4258 real time: 4278 gc time: 31
;cpu time: 4180 real time: 4198 gc time: 0
;cpu time: 4414 real time: 4439 gc time: 46
#;(time
 (for ([c (in-range 334 997 1)])
   (for ([a (in-range 1 332 1)])
     (for ([b (in-range 2 499 1)])
       (when (and (equal? (+ a b c) 1000)
                  (< b c)
                  (< a b)
                  (equal? (+ (* a a) (* b b)) (* c c)))
                  (begin
                    (displayln a)
                    (displayln b)
                    (displayln c)
                    (displayln (* a b c))))))))

; Reordered for better timing.
;cpu time: 4399 real time: 4452 gc time: 31
;cpu time: 4244 real time: 4264 gc time: 0
;cpu time: 4399 real time: 4459 gc time: 0
#;(time
(for ([c (in-range 334 997 1)])
  (for ([a (in-range 1 332 1)])
    (for ([b (in-range 2 499 1)])
      (when (< a b c)
        (when (equal? (+ a b c) 1000)
          (when (equal? (+ (* a a) (* b b)) (* c c))
            (begin
              (displayln a)
              (displayln b)
              (displayln c)
              (displayln (* a b c))))))))))

;Slow and unnecessarily complicated
;cpu time: 9610 real time: 9645 gc time: 0
(define possible-answers-c-squared '())
(define possible-answers-c '())
(for ([c (in-range 334 997 1)])
  (set! possible-answers-c-squared (cons (* c c) possible-answers-c-squared)))

(define possible-answers-a '())
(define possible-answers-b '())
#;(time
(for ([c-squared possible-answers-c-squared])
  (for ([a (in-range 1 332 1)])
    (for ([b (in-range 2 499 1)])
      (when (equal? (+ (* a a) (* b b)) c-squared)
        (when (and (< a b) (< b (sqrt c-squared)) (equal? (+ a b (sqrt c-squared)) 1000))
          (begin
            (displayln a)
            (displayln b)
            (displayln (sqrt c-squared))
            (displayln (* a b (sqrt c-squared))))))))))