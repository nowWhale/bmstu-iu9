(define (save-data data path)
  (define output-file (open-output-file path))
  (write data output-file)
  (close-output-port output-file))

(define (load-data path)
  (define input-file (open-input-file path))
  (display (read input-file))
  (close-input-port input-file))

(define (str-count path)
  (define input-file (open-input-file path))
  (define (iter char counter)
    (if (eof-object? char)
        (begin
          (display "There are ")
          (display counter)
          (display " strings in input file")
          (newline))
        (if (equal? char #\newline)
            (iter (read-char input-file) (+ counter 1))
            (iter (read-char input-file) counter))))
  (iter (read-char input-file) 1)
  (close-input-port input-file))

(str-count "input-strings.txt")
(load-data "input.txt")
;(save-data "it works!" "output.txt")
