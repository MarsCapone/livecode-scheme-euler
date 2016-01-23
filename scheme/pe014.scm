(define odd-collatz
	(lambda (n)
		(+ (* 3 n) 1)))

(define even-collatz
	(lambda (n)
		(/ n 2)))

(define collatz*
	(lambda (n depth)
		(cond ((= n 1) depth)
					((even? n) (collatz* (even-collatz n) (+ depth 1)))
					(else (collatz* (odd-collatz n) (+ depth 1))))))

(define collatz
	(lambda (n)
		(collatz* n 1)))

(define collatz-helper
	(lambda (current-start max-start max-depth)
		(if (<= current-start 1)
				max-start
				(let ((col (collatz current-start)))
					(collatz-helper (- current-start 1)
													(if (> col max-depth)
															current-start
															max-start)
													(if (> col max-depth)
															col
															max-depth))))))

(define pe14*
	(lambda (max-start-num)
		(collatz-helper max-start-num 1 1)))

(define pe14
	(lambda ()
		(pe14* 1000000)))
		
