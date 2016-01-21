(load "euler.scm")

(define pe20*
	(lambda (n)
		(digit-sum (! n))))

(define pe20
	(lambda ()
		(pe20* 100)))
