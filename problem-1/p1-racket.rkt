#lang racket

; returns the sum of the values less than or equal to n
(define (multiples-sum n)
  (cond
    [(equal? 0 n) 0]
    [(equal? 0 (modulo n 5)) (+ n (multiples-sum (- n 1)))]
    [(equal? 0 (modulo n 3)) (+ n (multiples-sum (- n 1)))]
    [else (multiples-sum (- n 1))]))

; more complicated solution
; still has same problems with large numbers
(define (set-less-than val n)
  (for/set ([i (+ 1 (quotient n val))])
    (* i val)))

(define (multiples-sum-2 n)
  (for/sum ([i (set-union (set-less-than 5 n) (set-less-than 3 n))]) i))

; better solution
; still can't reach 1,000,000,000 threshold
(define (list-less-than val n)
  (for/list ([i (+ 1 (quotient n val))])
    (* i val)))

(define (sum-list val n)
  (for/sum ([i (list-less-than val n)]) i))

(define (multiples-sum-3 n)
  (+ (sum-list 5 n) (sum-list 3 n) (* -1 (sum-list 15 n))))

; latest approach
; maths makes things faster

(define (quick-sum n)
  (/ (* n (+ n 1)) 2))

(define (quick-sum-by val n)
  (* val (quick-sum (quotient n val))))

(define (multiples-sum-4 n)
  (+ (quick-sum-by 3 n) (quick-sum-by 5 n) (* -1 (quick-sum-by 15 n))))
  

; Generic Solution
(define (generic-multiples-sum n a b)
  (+ (quick-sum-by a n) (quick-sum-by b n) (* -1 (quick-sum-by (* a b) n))))

; Answer
(generic-multiples-sum 999 3 5)

; Proof of Large Number Concept
(generic-multiples-sum 1000000000000000000000000000000000000000 3 5)