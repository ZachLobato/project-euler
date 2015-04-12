#lang racket

; returns the sum of the values less than or equal to n
(define (multiples-sum n)
  (cond
    [(equal? 0 n) 0]
    [(equal? 0 (modulo n 5)) (+ n (multiples-sum (- n 1)))]
    [(equal? 0 (modulo n 3)) (+ n (multiples-sum (- n 1)))]
    [else (multiples-sum (- n 1))]))