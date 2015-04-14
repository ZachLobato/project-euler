#lang racket


(require math/number-theory)

; For this problem, I just took the common factors of the numbers 1-20
(* 19 17 13 11 7 5 3 3 2 2 2 2)

; 2 2 5x
; 19x
; 2 3 3x
; 17x
; 2 2 2 2x
; 3 5x
; 2 7x
; 13x
; 2 2 3x
; 11x
; 5 2x
; 3 3x
; 2 2 2x
; 1 7x
; 2 3x
; 1 5x
; 2 2x
; 1 3x
; 1 2x

; TODO
; create a hashtable
; if key already in dictionary, check value
;   if value is higher, update key to higher value
;   else, do nothing
; else, add key-value pair to dictionary
; calculate multiples of all of the values