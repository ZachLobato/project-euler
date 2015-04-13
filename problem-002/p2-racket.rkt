#lang racket

; First solution
(define (even-fib-count start next)
  (cond
    [(> next 4000000) 0]
    [(even? next) (+ next (even-fib-count next (+ start next)))]
    [else (even-fib-count next (+ start next))]))

(even-fib-count 1 2)