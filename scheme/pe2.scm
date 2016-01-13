(define even-fibonacci
	(lambda (max-n a b acc)
		(let ((next-fibo (+ a b)))
			(if (<= next-fibo max-n)
					(if (even? next-fibo)
							(even-fibonacci max-n b next-fibo (+ acc next-fibo))
							(even-fibonacci max-n b next-fibo acc))
					acc))))

(define pe2*
	(lambda (max-n)
		(even-fibonacci max-n 0 1 0)))

(define pe2 
	(lambda ()
		(pe2 4000000)))
