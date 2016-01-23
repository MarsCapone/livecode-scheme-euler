(define mults-of
	(lambda (n acc)
		(if (= 0 n)
				acc
				(if (or (integer? (/ n 3))
								(integer? (/ n 5)))
						(mults-of (- n 1) (+ acc n))
						(mults-of (- n 1) acc)))))

(define pe1*
	(lambda (max-n)
		(mults-of (- max-n 1) 0)))

(define pe1
	(lambda ()
		(pe1* 1000)))
