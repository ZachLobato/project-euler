#lang racket

(require math/number-theory)

;Returns the nth prime
;n = natural num
(define (return-nth-prime n)
  (if (natural? n)
      (let nth-prime ([cur-prime 1][i n])
        (cond
          [(equal? i 0) cur-prime]
          [else (nth-prime (get-next-prime cur-prime) (sub1 i))]))
      (error "Invalid Input")))

; Calculates the next prime number given any natural number
; num = natural num
(define (get-next-prime num)
  (let next-prime ([possible-next (add1 num)])
    (cond
      [(prime? possible-next) possible-next]
      [else (next-prime (add1 possible-next))])))


; Determines if an input is a natural number or not
; Assuming zero is not natural
; num = any input
(define (natural? val)
  (and (integer? val) (positive? val)))

(return-nth-prime 10001)