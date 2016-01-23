; pythagorean triplet such that a + b + c = 1000
(load "require.scm")

(define triple?
	(lambda (a b c)
		(if (= (expt c 2) (+ (expt a 2) (expt b 2)))
				#t
				#f)))

(define special-triple?
	(lambda (a b c s)
		(if (and (triple? a b c)
						 (= (+ a b c) s))
				#t
				#f)))

(define find-c
	(lambda (a b)
		(if (integer? (sqrt (+ (expt a 2) (expt b 2))))
				(sqrt (+ (expt a 2) (expt b 2)))
				#f)))

(define looper
	(lambda (const lst)
		(cond ((null? lst) #f)
					((and (find-c const (car lst))
						 		(special-triple? const (car lst) (find-c const (car lst)) 1000))
					 (* const (car lst) (find-c const (car lst))))
					(else (looper const (cdr lst))))))

(define looper2
	(lambda (const-lst loop-lst)
		(if (null? const-lst) 
				#f
				(let ((next-val (looper (car const-lst) loop-lst)))
					(if next-val
							next-val
							(looper2 (cdr const-lst) loop-lst))))))

(define pe9
	(lambda ()
		(looper2 (range 1 500) (range 1 500))))

