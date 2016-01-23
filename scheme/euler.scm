(load "require.scm")

; prime factors of a number in size order
(define prime-factors
	(lambda (n)
		(define factor*
			(lambda (div num)
				(if (> (* div div) num)
						(list num)
						(let ((next-num (/ num div)))
							(if (integer? next-num)
									(cons div
												(factor* div next-num))
									(factor* (+ div 1) num))))))
		(factor* 2 n)))

; find if a value is palindromic
(define palindrome?
	(lambda (v)
		(cond ((list? v)
					 (equal? v (reverse v)))
					((string? v)
					 (palindrome? (string->list (string-downcase v))))
					((integer? v)
					 (palindrome? (number->string v))))))

; check if a number is prime. - it should only have 1 prime factor
(define prime?
	(lambda (n)
		(= (length (prime-factors n))
			 1)))

; find primes below n (from rosetta code)
(define sieve
	(lambda (n)
		(define aux
			(lambda (u v)
				(let ((p (car v)))
					(if (> (* p p) n)
						(let rev-append ((u u) (v v))
							(if (null? u) v (rev-append (cdr u) (cons (car u) v))))
						(aux (cons p u)
								 (let wheel ((u '()) (v (cdr v)) (a (* p p)))
									 (cond ((null? v) (reverse u))
												 ((= (car v) a) (wheel u (cdr v) (+ a p)))
												 ((> (car v) a) (wheel u v (+ a p)))
												 (else (wheel (cons (car v) u) (cdr v) a)))))))))
		(aux '(2)
				 (let range ((v '()) (k (if (odd? n) n (- n 1))))
					 (if (< k 3) v (range (cons k v) (- k 2)))))))

(define nth-prime*
	(lambda (n c p)
		(cond ((= n 1) 2)
					((= c n) p)
					(else (if (prime? (+ p 2))
										(nth-prime* n (+ c 1) (+ p 2))
										(nth-prime* n c (+ p 2)))))))

; find the nth prime
(define nth-prime
	(lambda (n) 
		(nth-prime* n 2 3)))

; find the factors of a number
(define factors
	(lambda (n)
		(define factors*
			(lambda (d)
				(cond ((> d n) '())
							((= (modulo n d) 0) (cons d (factors* (+ d 1))))
							(else (factors* (+ d 1))))))
		(factors* 1)))

; find the number of factors of a number from permuting the primes

(define factor-count*
	(lambda (n prime-lst prev-prime multiplier counter)
		(cond ((< n 2) 1)
					((null? prime-lst) (* multiplier (+ counter 1)))
					((= (car prime-lst) prev-prime) 
					 (factor-count* n (cdr prime-lst) (car prime-lst) multiplier (+ counter 1)))
					(else (factor-count* n (cdr prime-lst) (car prime-lst) (* multiplier (+ counter 1)) 1)))))

(define factor-count
	(lambda (n)
		(factor-count* n (prime-factors n) 0 1 0)))

(define digit-sum
	(lambda (n)
		; sum of str->num of char->int -48 
		(foldr + 0 (map (lambda (x) (- x 48)) (map char->integer (string->list (number->string n)))))))

(define !
	(lambda (n)
		(if (= n 0)
				1
				(* n (! (- n 1))))))


(define binary
	(lambda (n)
		(number->string n 2)))


(define namescore
	(lambda (name)
		(namescore-helper (string->list name) 0)))

(define namescore-helper
	(lambda (char-lst score)
		(if (null? char-lst)
				score
				(namescore-helper (cdr char-lst) 
													(if (and (>= (char->integer (car char-lst))
																			 65)
																	 (<= (char->integer (car char-lst))
																			 90))
															(+ (- (char->integer (car char-lst)) 
																		64)
																 score)
															score)))))

