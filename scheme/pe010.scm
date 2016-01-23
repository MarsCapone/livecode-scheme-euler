(load "euler.scm")

(define pe10*
	(lambda (n)
		(foldr + 0 (sieve n))))

(define pe10
	(lambda ()
		(pe10* 2000000)))
