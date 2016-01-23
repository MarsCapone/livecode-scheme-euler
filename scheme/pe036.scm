; sum of all numbers less than 1000000 that are palindromic in base 10 and 2

(load "euler.scm")

(define pe36*
	(lambda (n current-sum)
		(if (<= n 0)
				current-sum
				(pe36* (- n 1) 
							 (if (and (palindrome? n)
												(palindrome? (binary n)))
								 	 (+ n current-sum)
									 current-sum)))))

(define pe36
	(lambda ()
		(pe36* 1000000 0)))
