(define foldr
	(lambda (f init seq)
		(if (null? seq)
				init
				(f (car seq)
					 (foldr f init (cdr seq))))))

(define range
	(lambda (n . m)
		(let ((n (if (null? m) 0 n))
					(m (if (null? m) n (car m))))
			(cond ((= n m) (list n))
						(else (cons n (range ((if (< n m)
																			+ 
																			-) n 1) m)))))))

(define take 
	(lambda (lst n)
		(if (> n 0)
				(cons (car lst) (take (cdr lst) (- n 1)))
				'())))
