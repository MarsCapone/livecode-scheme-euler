(load "require.scm")

(define series-add
	(lambda (start end)
		(foldr + 0 (map (lambda (x) (expt x x))
										(range start end)))))

(define pe48*
	(lambda (max-n)
		(map string
			(reverse 
				(take 
					(reverse 
						(string->list 
							(number->string 
								(series-add 1 max-n)))) 10)))))

(define pe48
	(lambda ()
		(pe48* 1000)))
