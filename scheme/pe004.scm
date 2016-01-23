(load "euler.scm")

(define looper
	(lambda (const lst m)
		(if (null? lst)
				m
				(let ((next-val (* const (car lst))))
					(looper const 
									(cdr lst) 
									(if (and (palindrome? next-val)
													 (> next-val m))
											next-val
											m))))))

(define looper2
	(lambda (const-lst loop-lst m)
		(if (null? const-lst)
				m
				(let ((next-max (looper (car const-lst) loop-lst m)))
					(looper2 (cdr const-lst)
									 loop-lst
									 (if (> next-max m)
										 	 next-max
											 m))))))
(define pe4*
	(lambda (max-a max-b) 
		(looper2 (range max-a 1) (range max-b 1) 0)))

(define pe4
	(lambda ()
		(pe4* 999 999)))


				
