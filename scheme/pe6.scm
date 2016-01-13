(load "require.scm")

(define sum-of-square
	(lambda (lst)
		(foldr +
					 0
					 (map (lambda (x) (* x x))
								lst))))

(define square-of-sum
	(lambda (lst)
		((lambda (x) (* x x)) 
		 (foldr + 0 lst))))

(define pe6*
	(lambda (first-n)
		(let ((l (range 1 first-n )))
			(abs (- (square-of-sum l)
							(sum-of-square l))))))

(define pe6
	(lambda () 
		(pe6* 100)))
