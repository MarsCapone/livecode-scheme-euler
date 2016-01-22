(load "euler.scm")

(define pentagonal?
	(lambda (x)
		(integer? (/ (+ (sqrt (+ (* 24 x) 1)) 1) 6))))

; all hexagonals are triangles. 
; generate hexagonals and check if they are pentagonal.

(define pe45*
	(lambda  (n)
		(if (pentagonal? (* n (- (* 2 n) 1)))
				(* n (- (* 2 n) 1))
				(pe45* (+ n 1)))))

(define pe45
	(lambda ()
		(pe45* 144)))
