#lang racket

; Final Solution

; Determines if an input is a natural number or not
; Assuming zero is not natural
; num = any input
(define (natural? num)
  (and (integer? num) (positive? num)))

; Calculates the sum from 1 to n
; n = natural number
(define (sum n)
  (/ (* n (+ n 1)) 2))

; Calculates the sum from val to n by multiples of val
; n = natural number
; val = natural number
(define (sum-by val n)
  (* val (sum (quotient n val))))

; Calculates the sum of the set of the union of the 
;                                        values from a to n by a and
;                                        values from b to n by b
; n = natural number
; a = natural number
; b = natural number
(define (generic-multiples-sum n a b)
  (if (and (natural? n)
           (natural? a)
           (natural? b))
      (+ (sum-by a n) (sum-by b n) (* -1 (sum-by (* a b) n)))
      (error "Invalid Input")))

; Answer
(generic-multiples-sum 999 3 5)

; Calculates extremely large number
(generic-multiples-sum 1000000000000000000000000000000000000000 3 5)