;;
;; Landon Soriano
;; ICS 313
;; Assignment Four - macros
;; 03/16/15
;;


;;defconstant variables for the number of days in a week. 
(defconstant DAYS 0)
(defconstant DAYS 1)
(defconstant DAYS 2)
(defconstant DAYS 3)
(defconstant DAYS 4)
(defconstant DAYS 5)
(defconstant DAYS 6)

;;interning each day to convert each string into a symbol 
(intern (concatenate 'string (DAYS 'day) "->" (DAYS 'number) "->" (DAYS 'SUNDAY)))
(intern (concatenate 'string (DAYS 'day) "->" (DAYS 'number) "->" (DAYS 'MONDAY)))
(intern (concatenate 'string (DAYS 'day) "->" (DAYS 'number) "->" (DAYS 'TUESDAY)))
(intern (concatenate 'string (DAYS 'day) "->" (DAYS 'number) "->" (DAYS 'WEDNESDAY)))
(intern (concatenate 'string (DAYS 'day) "->" (DAYS 'number) "->" (DAYS 'THURSDAY)))
(intern (concatenate 'string (DAYS 'day) "->" (DAYS 'number) "->" (DAYS 'FRIDAY)))
(intern (concatenate 'string (DAYS 'day) "->" (DAYS 'number) "->" (DAYS 'SATURDAY)))

;;an association list merging the strings with each number
'( (cons 'SUNDAY '0) 
   (cons 'MONDAY '1) 
   (cons 'TUESDAY '2)
   (cons 'WEDNESDAY '3) 
   (cons ' THURSDAY '4) 
   (cons 'FRIDAY '5)
   (cons ' SATURDAY '6)
   
   )