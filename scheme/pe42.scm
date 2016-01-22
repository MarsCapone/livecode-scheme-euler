(load "euler.scm")

(define small-triangles
	(map (lambda (n) (inexact->exact (round (* 0.5 n (+ n 1))))) (range 1 500)))

(define triangle?
	(lambda (n)
		(member n small-triangles)))

(define words-lst
	(vector->list (string-split "\",\"" (car (file->lines "../extras/pe42.txt")))))

(define triangle-word?
	(lambda (word)
		(triangle? (namescore word))))

(define pe42
	(lambda ()
		(length (filter triangle-word? words-lst))))
