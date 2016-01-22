(load "euler.scm")

(define names-lst 
	(string-split "\",\"" (car (file->lines "../extras/pe22.txt"))))

(define sorted-names
	(sort names-lst string<?))

(define pe22*
	(lambda (lst lst-index total)
		(if (null? lst)
				total
				(pe22* (cdr lst)
							 (+ lst-index 1)
							 (+ (* (namescore (car lst))
										 lst-index)
									total)))))

(define pe22
	(lambda ()
		(pe22* sorted-names 1 0)))
; NOT WORKING
