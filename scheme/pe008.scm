(load "require.scm")

(define file (open-input-file "../extras/pe8.txt"))
(define big-number (read-line file))
(close-input-port file)

(define big-number-lst
	(map (lambda (x) (- (char->integer x) 48)) 
			 (string->list big-number)))

(define next-n-product
	(lambda (n lst)
		(foldr * 1 (take lst n))))

(define pe8*
	(lambda (lst adj-d m)
		(if (< (length lst) adj-d)
				m
				(pe8* (cdr lst)
							adj-d
							(if (> (next-n-product adj-d lst) m)
									(next-n-product adj-d lst)
									m)))))

(define pe8
	(lambda ()
		(pe8* big-number-lst 13 0)))
