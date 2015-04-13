#lang racket

(require math/number-theory)

(define ht-amicables (make-hash))

(define (divisors-sum x)
  (begin
    (if (dict-has-key? ht-amicables x)
        (hash-ref ht-amicables x)
        (begin
          (hash-set! ht-amicables x (- (apply + (divisors x)) x))
          (hash-ref ht-amicables x)))))

(define (amicable? x y)
  (if (and (equal? x (divisors-sum y))
           (not (equal? x y)))
      #t
      #f))

(for/sum ([i (in-range 9999)])
  (if (amicable? i (divisors-sum i))
      i
      0))