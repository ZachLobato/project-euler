#lang racket

(require math/number-theory)
(require test-engine/racket-tests)


(define (sum-primes n)
  (define (iter cur-prime)
    (if (> cur-prime n)
        0
        (+ cur-prime (iter (next-prime cur-prime)))))
  (iter 2))

(time (apply + (next-primes 1 148933)))

;cpu time: 0 real time: 1 gc time: 0
;(time (sum-primes 10))

;cpu time: 7878 real time: 7954 gc time: 1531
;(time (sum-primes 2000000))

;simple, easy, and effective

(check-expect (sum-primes 10) 17)
(test)

