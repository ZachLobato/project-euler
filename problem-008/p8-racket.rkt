#lang racket


;Open file with large number

(define (char->number num)
  (- (char->integer num) 48))

(define (get-largest file)
  (define in (open-input-file file))
  (define (add-next-num a-list a-num)
    (set! a-list (append (cdr a-list) `(,a-num)))
    (displayln a-list))
  
  (define max-val 0)
  (define max-list '(0))
  
  (let max-value ([list-nums (map char->number (string->list (read-string 13 in)))])
    ;(displayln list-nums)
    (let ([val (apply * list-nums)]
          [next-letter (read-string 1 in)])
      (when (< max-val val)
        (set! max-val val)
        (set! max-list list-nums))
      
      (match next-letter
        [(? eof-object?) 0]
        ["\r" (max-value list-nums)]
        ["\n" (max-value list-nums)]
        ["0" (max-value (append (cdr list-nums) '(0)))]
        ["1" (max-value (append (cdr list-nums) '(1)))]
        ["2" (max-value (append (cdr list-nums) '(2)))]
        ["3" (max-value (append (cdr list-nums) '(3)))]
        ["4" (max-value (append (cdr list-nums) '(4)))]
        ["5" (max-value (append (cdr list-nums) '(5)))]
        ["6" (max-value (append (cdr list-nums) '(6)))]
        ["7" (max-value (append (cdr list-nums) '(7)))]
        ["8" (max-value (append (cdr list-nums) '(8)))]
        ["9" (max-value (append (cdr list-nums) '(9)))])))
  
  ;(add-next-num list-nums (string->number (read-string 1 in)))
  ;(displayln max-val)
  ;(displayln max-list)
  (displayln (apply * max-list))
  (close-input-port in))

(get-largest "large-num.txt")