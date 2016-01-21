(load "euler.scm")

(define d
	(lambda (n)
		; remove n to account for `factors' including n.
		(- (foldr + 0 (factors n)) n))) 

(define amicable?
	(lambda (a b)
		(and (= (d a) b)
				 (= (d b) a)
				 (not (= a b)))))

(define amicable-mem?
	(lambda (n)
		(amicable? n (d n))))

(define pe21-helper
	(lambda (n current-sum)
		(if (< n 1)
				current-sum
				(pe21-helper (- n 1) 
							 (if (amicable-mem? n)
								 	 (+ current-sum n)
									 current-sum)))))

(define pe21*
	(lambda (max-n) 
		(pe21-helper (- max-n 1) 0)))

(define pe21
	(lambda ()
		(pe21* 10000)))

