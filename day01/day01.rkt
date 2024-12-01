#lang racket

(define lines (file->lines "input.txt"))

(define splitted
    (map (lambda (line) (string-split line "   ")) lines))

(define firsts (map (lambda (e) (string->number (car e))) splitted))
(define lasts (map (lambda (e) (string->number (car (cdr e)))) splitted))

(define sorted-firsts (sort firsts <))
(define sorted-lasts (sort lasts <))

(define (sum l1 l2)
    (apply + (map abs (map - l1 l2)))
)

;; part 1
;;(displayln (sum sorted-firsts sorted-lasts))


;; part 2
;; TODO: learn how to use a hash
(define (count-occurrences x lst)
  (length (filter (lambda (item) (equal? item x)) lst)))

(define result
    (apply + (map (lambda (e) (* e (count-occurrences e sorted-lasts))) sorted-firsts))
)

(displayln result)
