#lang racket

;Calculates the sum of squares from 1 to N
;n = natural number
(define (sum-of-squares n)
  (for/sum ([i (in-range (add1 n))]) (* i i)))

;Calculates the square of sums from 1 to N
;n = Natural number
(define (square-of-sum n)
  (expt (for/sum ([i (in-range (add1 n))]) i) 2))

;Calculates the difference between the square of sums and the
;  sum of squares from 1 to N
;n = Natural number
(define (difference-between n)
  (- (square-of-sum n) (sum-of-squares n)))


;Resulting output
(difference-between 10)
(difference-between 100)