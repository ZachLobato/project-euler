#lang racket


(require math/number-theory)

; Calculate the least-common-multiple of a list of values
; list-of-values = natural numbers
(define (least-common-multiples list-of-nums)
  ; create a hashtable
  (define ht-factors (make-hash))
  ; for each number
  (for/list ([i list-of-nums])
    ; for each of its factors
    (for/list ([pair (factorize i)])
      (if (dict-has-key? ht-factors (car pair))
          ; if key already in dictionary, check value
          (let ([power (hash-ref ht-factors (car pair))])
            ; when value is higher, update key to higher value
            (when (> (cadr pair) power)
              (hash-set! ht-factors (car pair) (cadr pair))))
          ; else, add key-value pair to dictionary
          (hash-set! ht-factors (car pair) (cadr pair)))))
  ; calculate multiples of all of the values
  (for/product ([key (hash-keys ht-factors)])
    (expt key (hash-ref ht-factors key))))

(least-common-multiples '(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20))
(least-common-multiples '(1 2 3 4 5 6 7 8 9 10))
