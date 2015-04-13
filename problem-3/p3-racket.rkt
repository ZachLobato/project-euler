#lang racket

;Calculates the largest prime factor for the input x
; x = natural number
(define (largest-prime-factor x)
  (if (natural? x)
      (begin
        (set! x (inexact->exact x)) 
        (if (orig-prime? x)
            x
            (let find-fact ([i 2] [limit x])
              (if (equal? 0 (modulo limit i))
                  (let ([possible-prime (/ limit i)])
                    (if (orig-prime? possible-prime)
                        possible-prime
                        (find-fact 2 possible-prime)))
                  (find-fact (get-next-prime i) limit)))))
      (error "Invalid Input")))

; Calculates the next prime number given any natural number
; num = natural num
(define (get-next-prime num)
  (let next-prime ([possible-next (add1 num)])
    (cond
      [(orig-prime? possible-next) possible-next]
      [else (next-prime (add1 possible-next))])))

; Determines if an input is a natural number or not
; Assuming zero is not natural
; num = any input
(define (natural? val)
  (and (integer? val) (positive? val)))

; Determines if the given input is a prime number
; x = any input
(define (orig-prime? val)
  (cond 
    [(not (natural? val)) #f]
    [(equal? 2 val) #t]
    [(equal? 3 val) #t]
    [(equal? 0 (modulo val 2)) #f]
    [else (let test ([test-divisor 3] [sqrt-val (sqrt val)])
            (cond
              [(equal? 0 (modulo val test-divisor)) #f]
              [(> test-divisor sqrt-val) #t]
              [else (test (+ 2 test-divisor) sqrt-val)]))]))

(largest-prime-factor 600851475143)

; Import math/number-theory library
; :( haha much easier to write and much faster

; While this is faster and better...
;   I definitely learned more from implementing it
;   without the help of external libraries. Thus, I
;   will keep my old solution here as well.
(require math/number-theory)

(define (largest-prime-factor-2 x)
  (apply max (map (lambda (y)
                    (car y))
                  (factorize x))))

(largest-prime-factor-2 600851475143)