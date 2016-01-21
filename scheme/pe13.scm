(load "require.scm")


(define pe13
	(lambda ()
		(substring 
			(number->string (foldr + 
														 0 
														 (map string->number 
																	(file->lines "../extras/pe13.txt")))) 
			0 10)))

