#lang racket

;a^2 + b^2 = c^2
;a + b + c = 1000
;a = 1..332
;b = 2..499
;c = 334..997

;a^2 + b^2 > 334 && 997
;Find the whole square roots between those numbers

;cpu time: 3323 real time: 3317 gc time: 0
;cpu time: 3385 real time: 3390 gc time: 0
;cpu time: 3292 real time: 3301 gc time: 0
(time
 (for ([c (in-range 334 997 1)])
   (for ([a (in-range 1 332 1)])
     (for ([b (in-range 2 499 1)])
       (when (equal? (+ a b c) 1000)
         (when (< b c)
           (when (< a b)
             (when (equal? (+ (* a a) (* b b)) (* c c))
               (begin
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