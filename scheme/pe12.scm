(load "euler.scm")

(define pe12*
	(lambda (last-triangle next-n count max-factors)
		(if (> count max-factors)
				last-triangle
				(pe12* (+ last-triangle next-n)
							 (+ next-n 1)
							 (factor-count (+ last-triangle next-n))
							 max-factors))))

(define pe12
	(lambda ()
		(pe12* 1 2 1 500)))
