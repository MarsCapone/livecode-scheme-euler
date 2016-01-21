(load "euler.scm")

(define pe16*
	(lambda (n)
		(digit-sum n)))

(define pe16
	(lambda ()
		(pe16* (expt 2 1000))))
