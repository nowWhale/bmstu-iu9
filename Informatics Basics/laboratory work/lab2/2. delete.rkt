(define (delete pred? xs)
  (define (iter ys)
    (if (null? ys)
        '()
        (if (pred? (car ys))
            (iter (cdr ys))
            (cons (car ys) (iter (cdr ys))))))
  (iter xs))

(delete even? '(0 1 2 3)) 
(delete even? '(0 2 4 6)) 
(delete even? '(1 3 5 7))
(delete even? '()) 