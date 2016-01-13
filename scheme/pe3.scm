(load "euler.scm")

(define pe3*
	(lambda (n)
		(car (reverse (prime-factors n)))))

(define pe3 
	(lambda ()
		(pe3* 600851475143)))
