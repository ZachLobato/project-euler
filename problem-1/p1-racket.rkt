#lang racket

; returns the sum of the values less than or equal to n
(define (multiples-sum n)
  (cond
    [(equal? 0 n) 0]
    [(equal? 0 (modulo n 5)) (+ n (multiples-sum (- n 1)))]
    [(equal? 0 (modulo n 3)) (+ n (multiples-sum (- n 1)))]
    [else (multiples-sum (- n 1))]))

;(multiples-sum 1000)


; more complicated solution
; still has same problems with large numbers
(define (set-less-than val n)
  (for/set ([i (+ 1 (quotient n val))])
    (* i val)))

(define (multiples-sum-2 n)
  (for/sum ([i (set-union (set-less-than 5 n) (set-less-than 3 n))]) i))