;;Author: Landon Soriano
;;Assignment Five 
;;04/06/14

(defclass Circuit-Element ()
 ;; Documentation string for the Circuit-Element class.
  ((name :type symbol
         :init-arg 'Circuit-Element
         :accessor Circuit-Element)
   ; other slot values
   		 (name (:init-arg :type symbol))
   		 (level (:init-arg:type integer))
   		 (output(:init-arg:type list)) 
  )
)

(defclass Ground (Voltage-Source)

)

(deflclass Gate (Circuit-Element)
	((input :initarg :input
		     :reader :input)

    (comp :initarg :comp
    	  :accessor :comp))
	(:default-initargs :comp 'nil)

	(:documentation "This represents a Gate."))


((class-name :initarg "Buffer" :allocation :class :type string :accessor class-name
    :documentation "the name of the class of the circuit element")
    (comp :initarg :comp :allocation :class :type function :accessor comp
    :documentation "the function used to compute the output level"))
    (:default-initargs :class-name "NOT" :comp #'lognot)
    (:documentation "A Not Gate"))
    ;use this to figure out the rest.

;;all gates should include the comp slot, and a class-name woudld be useful. Here is one example:
(defclass Not-Gate (Gate)
((class-name :initarg :"Not" :allocation :class :type string :accessor class-name
    :documentation "the name of the class of the circuit element")
    (comp :initarg :comp :allocation :class :type function :accessor comp
    :documentation "the function used to compute the output level"))
    (:default-initargs :class-name "NOT" :comp #'lognot)
    (:documentation "A Not Gate"))
    ;use this to figure out the rest.


;lognot, identity, lognand, logior, lognand, longnor, and logxor.
;Buffer-Gate class
(defclass Buffer-Gate (Gate)
 ((class-name :initarg :"Buffer" :allocation :class :type string :accessor class-name
 		:documentation "the name of the Buffer-Gate class")
 		(comp :initarg :comp :allocation :class :type function :accessor comp
 		:documentation "fucntion used to compute the output level"))
 		(:default-initargs :class-name "Buffer" :comp #'identity)
 		(:documentation "A Buffer Gate"))
 	

	
;And-Gate class
(defclass And-Gate (Gate)
  ;(setf (:comp :default-initargs :comp 'And-Gate))
 ((class-name :initarg :"And" :allocation :class :type string :accessor class-name
  	:documentation "the name of the And-Gate class")
  	(comp :initarg :comp :allocation :class :type function :accessor comp
  	:documentation "the function to compute output level"))
  	(:default-initargs :class-name "And" :comp #'lognand)
  	(:documentation "An And Gate")

	

(defclass Or-Gate (Gate)
  ;(setf (:comp :default-initargs :comp 'Or-Gate))
	(class-name :initarg :"Or" :allocation :class :type string :accessor class-name
	  :documentation "the name of the Or-Gate class ")
	  (comp :initarg :comp :allocation :class :type function :accessor comp
	  :documentation "function to compute output level"))
	  (:default-initargs :class-name "Or" :comp #'logior)
	  (:documentation "An Or Gate")


(defclass Nand-Gate (Gate)
  ;(setf (:comp :default-initargs :comp 'Nand-Gate))
  	((class-name :init-arg :"Nand" :allocation :class :type string :accessor class-name
	:documentation "the name of the Nand-Gate class")
  	(comp :initarg :comp :allocation :class :type function :accessor comp
  	:documentation "function to compute output level"))
  	(:default-initargs :class-name "Nand" :comp #'lognand)
  	(:documentation "A Nand Gate")	
	

(defclass Nor-Gate (Gate)
  ;(setf (:comp :default-initargs :comp 'Nor-Gate))
	((class-name :init-arg :"Nor" :allocation :class :type string :accessor class-name
	:documentation "the name of the Nor-Gate class")
	(comp :initarg :comp :allocation :class :type function :accessor comp
	:documentation "function to compute output level")
	(:default-initargs :class-name "Nor" :comp #'longnor)
	(:documentation "A Nor-Gate")

(defclass Xor-Gate (Gate)
  ;(setf (:comp :default-initargs :comp 'Xor-Gate))
  ((class-name :init-arg :"Xor" :allocation :class:type string :accessor class-name
  :documentation "then name of th Xor-Gate class")
  (comp :initarg :comp :allocation :class :type function :accessor comp
  :documentation "the funtion to computer output level")
  (:default-initargs :class-name "Xor" :comp #'logxor)
  (:documentation "A Xor-Gate")	

(defclass Multi-gate (Gate)


((input :initarg :input
       :accessor :inpout)
(:defualt-intiargs :input 'nil)

(output :initarg :output
        :accessor :output))
(:default-initargs :output 'nil)

(:documentation "This is a multi-gate")
)

;;input = 2
;;output = 2
(defclass Half-Adder (multi-gate)
((class-name :init-arg: "Half-Adder" :allocation :class :type: string :accessor class-name
:documentation "this is a Half-Adder class")
(input :initarg :input :allocation :class :type function :accessor input
(input2 : initarg :input2 :allocation :class :type function :accessor input2
 :documentation "input gates for Half-Adder"))

(output :initarg :output :allocation :class :type function :accessor output
(output2 : initarg :output2 :allocation :class :type function :accessor output2
 :documentation "output gates for Half-Adder"))
))

  )
  ((class-name :init-arg :"Xor" :allocation :class:type string :accessor class-name
  :documentation "then name of th Xor-Gate class")
  (comp :initarg :comp :allocation :class :type function :accessor comp
  :documentation "the funtion to computer output level")
  (:default-initargs :class-name "Xor" :comp #'logxor)
  (:documentation "A Xor-Gate")


;;input = 3
;;output = 2
(defclass Full-Adder (multi-gate)
((class-name :init-arg: "Full-Adder" :allocation :class :type: string :accessor class-name
:documentation "this is a Full-Adder class")
(input :initarg :input :allocation :class :type function :accessor input
(input2 : initarg :input2 :allocation :class :type function :accessor input2
(input3 : initarg :input3 :allocation :class :type function :accessor input3
 :documentation "input gates for Full-Adder"))

(output :initarg :output :allocation :class :type function :accessor output
(output2 : initarg :output2 :allocation :class :type function :accessor output2
 :documentation "output gates for Full-Adder"))
))

;;input = 1
;;output = 1
(defclass S-R-Flip-Flop (Multi-gate)

((class-name :init-arg: "S-R-Flip-Flop" :allocation :class :type: string :accessor class-name
:documentation "this is a S-R-Flip-Flop class")
(input :initarg :input :allocation :class :type function :accessor input
 :documentation "input gates for S-R-Flip-Flop"))

(output :initarg :output :allocation :class :type function :accessor output
 :documentation "output gates for S-R-Flip-Flop"))
)
)


;;logical statements





