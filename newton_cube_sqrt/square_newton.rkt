#lang scheme

(define (sqrt-iter guess x)
  (if
   (good-enough-new? guess x)
   guess
   (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))


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


(display (sqrt-new 8))