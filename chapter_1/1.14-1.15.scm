#lang sicp

;;; Exercise 1.14

;;; count-change
(define (count-change amount) (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination
                         kinds-of-coins))
                     kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

         
;   (cc 11 5)

;   (cc 11 4)    (cc -39 5)

;   (cc 11 3)	 (cc -14 4)

;   (cc 11 2)							   (cc 1 3)

;   (cc 11 1)	           (cc 6 2)	                           (cc 1 2)	(cc -9 3)

;   (cc 11 0)   (cc 10 1)  (cc 6 1)            (cc 1 2)	           (cc 1 1)	(cc -4 2)

;   (cc 10 0)   (cc 9 1)   (cc 6 0) (cc 5 1)   (cc 1 1) (cc -4 2)  (cc 1 0)	(cc 0 1)

;   (cc 9 0)    (cc 8 1)   (cc 5 0) (cc 4 1)   (cc 1 0) (cc 0 1)

;   (cc 8 0)	(cc 7 1)   (cc 4 0) (cc 3 1)

;   (cc 7 0)	(cc 6 1)   (cc 3 0) (cc 2 1)

;   (cc 6 0)	(cc 5 1)   (cc 2 0) (cc 1 1)

;   (cc 5 0)	(cc 4 1)   (cc 1 0) (cc 0 1)

;   (cc 4 0)	(cc 3 1)

;   (cc 3 0)	(cc 2 1)

;   (cc 2 0)	(cc 1 1)

;   (cc 1 0)	(cc 0 1)

;;; The space consumed by the recursive process generated by cc is going to be proportional to the maximum height of the recursion tree corresponding to an instance of cc, 
;;; since at any given point in the recursive process, we must only keep track of the trail of nodes that leads to the root of the tree.
;;; And the time grows exponentially with the number of allowed denominations of coins.
;;; Reference: 	https://yati-sagade.github.io/2015/04/12/sicp-change-growth/

;;; Exercise 1.15

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))
	  
;;; a)
(sine 12.15)
(p (sine 4.05))
(p (p (sine 1.35)))
(p (p (p (sine 0.45))))
(p (p (p (p (sine 0.15)))))
(p (p (p (p (p (sine 0.05))))))
(p (p (p (p (p 0.05)))))

5 times

;;; b)
;;; because the number of calls to p is O(log a), the space used by the sine procedure varies directly with the number of p calls,
;;; and the number of total steps in calculating (sine a) is an integer multiple of Θ(loga),
;;; so the order of growth in space and number of steps are same,is O(log a)
;;; Reference: https://yati-sagade.github.io/2015/04/22/sicp-sine/
