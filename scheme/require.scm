(load "sort.scm")

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
; first n elements of a list
(define take
	(lambda (lst n)
		(if (> n 0)
				(cons (car lst) (take (cdr lst) (- n 1)))
				'())))

; filename to list of lines
;
(define file-lines-helper
	(lambda (inport current-lst)
		(let ((line (read-line inport)))
			(if (eof-object? line)
					current-lst
					(file-lines-helper inport (cons line current-lst))))))

(define file->lines
	(lambda (filename)
		(let ((inport (open-input-file filename)))
			(begin (define result (file-lines-helper inport '()))
						 (close-input-port inport)
						 result))))


; file to string
(define file->string
	(lambda (filename)
		(with-input-from-file filename read)))

(define filter
	(lambda (pred lst)
		(cond ((null? lst) '())
					((pred (car lst)) (cons (car lst) (filter pred (cdr lst))))
					(else (filter pred (cdr lst))))))

