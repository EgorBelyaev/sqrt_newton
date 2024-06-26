#lang scheme


(define (sqrt-iter guess x)
  (if
   (good-enough? guess x)
   guess
   (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (square x)
  (* x x))


 (define (good-enough-new? g-last g-old)
          (< (/ (* (abs (- g-last g-old)) 100)
                   g-last)
             0.01))


(define (sqrt-iter-new guess guess-old x)
  (if
   (good-enough-new? guess guess-old)
   guess
   (sqrt-iter-new (improve guess x) guess x)))

(define (sqrt-new x)
  (sqrt-iter-new 1.0 0.0 x))


(display (sqrt 4))
(newline)
(display (sqrt-new 4))
(newline)
(display (sqrt 16))
(newline)
(display (sqrt-new 16))
(newline)
(display (sqrt 100))
(newline)
(display (sqrt-new 100))