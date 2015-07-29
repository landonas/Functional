;;; -*- Mode: LISP; Syntax: Common-lisp; Package: USER; Base: 10 -*-
;;; Name:Landon Soriano                   Date: 03/01/2015
;;; Course: ICS313        Assignment: Three 
;;; File: header.lisp

(in-package :User) ; optional 


;;;=========================================================================
;;; Prints out a solution to the N-queens problem, for any N >= 4. A simple
;;; implementation of an algorithm from the SIGART bulletin, so feel free to
;;; do whatever you would like with this code. Uses the CLtL/2 loop macro.
;;;
;;; Invoke by calling (N-Queens <Board-Size>). Eg:
;;; > (N-Queens 16)
;;; -----------------------------------
;;; | _ Q _ _ _ _ _ _ _ _ _ _ _ _ _ _ |
;;; | _ _ _ Q _ _ _ _ _ _ _ _ _ _ _ _ |
;;; | _ _ _ _ _ Q _ _ _ _ _ _ _ _ _ _ |
;;; | _ _ _ _ _ _ _ Q _ _ _ _ _ _ _ _ |
;;; | _ _ _ _ _ _ _ _ _ Q _ _ _ _ _ _ |
;;; | _ _ _ _ _ _ _ _ _ _ _ Q _ _ _ _ |
;;; | _ _ _ _ _ _ _ _ _ _ _ _ _ Q _ _ |
;;; | _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ Q |
;;; | Q _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ |
;;; | _ _ Q _ _ _ _ _ _ _ _ _ _ _ _ _ |
;;; | _ _ _ _ Q _ _ _ _ _ _ _ _ _ _ _ |
;;; | _ _ _ _ _ _ Q _ _ _ _ _ _ _ _ _ |
;;; | _ _ _ _ _ _ _ _ Q _ _ _ _ _ _ _ |
;;; | _ _ _ _ _ _ _ _ _ _ Q _ _ _ _ _ |
;;; | _ _ _ _ _ _ _ _ _ _ _ _ Q _ _ _ |
;;; | _ _ _ _ _ _ _ _ _ _ _ _ _ _ Q _ |
;;; -----------------------------------
;;;
;;; 1991 Marty Hall marty_hall@jhuapl.edu.
;;;=========================================================================

;;;=========================================================================

;;
;; functor_name: N-Queens
  ;;; From algorithm in SIGART Bulletin, Vol 2, Number 2, page 7. Determines 
;;; where to place each queen in constant time, so it takes longer to print
;;; out the board than to do the calculations. I am not aware of a 
;;; non-exponential approach that finds ALL solutions, as this just finds 
;;; ONE solution. Do not specify a value for ``Extra-Space?'' when
;;; calling this from the top-level.
;;; 4/91 Marty Hall
;;
;;   contains code from: http://www2.hawaii.edu/~nreed/ics313/assignments/lisp/N-Queens.lisp
;;


(defun N-Queens (N &optional Extra-Space?)
  (cond
    ((and (evenp N) (not (integerp (/ (- N 2) 6))))
     (Even-Queens-1 N Extra-Space?))
    ((evenp N)
     (Even-Queens-2 N Extra-Space?))
    (t
      (Odd-Queens N))
     ))

;;
;; functor_name: Even-Queens-1
;;   N even but not of form 6K+2.
;;
;;   http://www2.hawaii.edu/~nreed/ics313/assignments/lisp/N-Queens.lisp
;;
;;;========================================================================

(defun Even-Queens-1 (N &optional Extra-Space?)
  (let ((M (if Extra-Space? (1+ N) N)))
    (Print-Border M)
    (loop for I from 1 to (/ N 2) do
      (Print-Row M (* 2 I)))
    (loop for I from 1 to (/ N 2) do
      (Print-Row M (1- (* 2 I))))
    (unless Extra-Space? (Print-Border N))
    (values)
))


;;
;; functor_name: Even-Queens-2
;;; N even but not of form 6K
;;
;;   contains code from: http://www2.hawaii.edu/~nreed/ics313/assignments/lisp/N-Queens.lisp

;;;========================================================================


(defun Even-Queens-2 (N &optional Extra-Space?)
  (let ((M (if Extra-Space? (1+ N) N)))
    (Print-Border M)
    (loop for I from 1 to (/ N 2) do
      (Print-Row M (1+ (Queen-Mod I N))))
    (loop for I from (/ N 2) downto 1 do
      (Print-Row M (- N (Queen-Mod I N))))
    (unless Extra-Space? (Print-Border N))
    (values)
))


;;
;; functor_name: Queen-Mod
;;  modifies the Queen functor 
;;
;;   contains code from: http://www2.hawaii.edu/~nreed/ics313/assignments/lisp/N-Queens.lisp
;;

;;;=========================================================================

(defun Queen-Mod (I N)
  (mod (+ (* 2 (1- I)) (/ N 2) -1) N))


;;
;; functor_name: Odd-Queens
;;  For odd N, just do N-1 case and then place queen on (N,N).
;;
;;   contains code from: http://www2.hawaii.edu/~nreed/ics313/assignments/lisp/N-Queens.lisp
;;

;;;=========================================================================

(defun Odd-Queens (N)
  (N-Queens (1- N) t)
  (Print-Row N N)
  (Print-Border N)
  (values)
)

;;
;; functor_name: Print-Border
;;  prints the border for the output of the chess
;;  board. 
;;
;;   contains code from: http://www2.hawaii.edu/~nreed/ics313/assignments/lisp/N-Queens.lisp
;;

;;;=========================================================================

(defun Print-Border (N)
  (fresh-line)
  (dotimes (I (+ N 1))
    (princ "--"))
  (princ "-")
)


;;
;; functor_name: Print-Row
;;  Will print out the board, a Q will indicate the Queens  
;;  positions on the board. Will be blank if no Queen is at 
;;  that position. 
;;
;;  contains code from: http://www2.hawaii.edu/~nreed/ics313/assignments/lisp/N-Queens.lisp
;;

;;;=========================================================================


(defun Print-Row (Length Position)
  (fresh-line)
  (princ "|")
  (dotimes (I (1- Position))
    (princ " _"))
  (princ " Q")
  (dotimes (I (- Length Position))
    (princ " _"))
  (princ " |")
)


;;;======================================================================

(format t "~%Finds A (not ALL) solutions to any given size of the N-Queens~%~
             problem. Finds the position of each queen in constant time, so~%~
             the limiting step is printing out the board which is obviously~%~
             O(N^2).  Invoke with  (N-Queens <N>). ")

;;;======================================================================