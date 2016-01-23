(load "require.scm")

(define smallest-multiple
	(lambda (start end) 
		(foldr lcm 1 (range start end))))

(define pe5*
	(lambda (n)
		(smallest-multiple 1 n)))

(define pe5
	(lambda ()
		(pe5* 20)))
