#lang racket

(require math/number-theory)

(define (divisors-sum x)
  (- (apply + (divisors x)) x))

(define (amicable? x y)
  (if (and (equal? x (divisors-sum y))
           (not (equal? x y)))
      #t
      #f))

(for/sum ([i (in-range 9999)])
  (if (amicable? i (divisors-sum i))
      i
      0))