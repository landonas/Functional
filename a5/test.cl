;;Author: Landon Soriano
;;Assignment Five 
;;03/31/14


;;Circuit-Element with subclasses Voltage-Source, Gate and Multi-Gate. 
;;Circuit-Element should have the slots name (:type symbol), level (:type integer), and outputs (:type list) 
;;with :default-initargs of 0 for :level and nil for :outputs.

;;defclass Circuit-Element() 


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


(defclass Voltage-Source (Circuit-Element)
  ;Documentation string for the Voltage-Source class (which inherits from Circuit-Element)
  ; etc.
   name (:type symbol)
   level (:type integer)
   output(:type list)



	)
)
;;Now you can create an account and specify the slot values at the same time.

;(defparameter *account*
 ;; (make-instance 'bank-account :customer-name "John Doe" :balance 1000))

;;(slot-value *account* 'customer-name) ==> "John Doe"
;(slot-value *account* 'balance)       ==> 1000
;(deflclass Ground (Voltage-Source)
	
	;previously initialized vars
	(name 
	level 
	output)
;; no extra slots?
	(allocation :init-arg: allocation)

	(class:init-arg: class)

	(High:init-arg: High)

	(default-initargs :init-arg: default-initargs)


	)

;;No, Ground is not a superclass of anything. But it is a subclass of Voltage-Source
;;not sure if Ground is a superclass or its own? 
(defclass Ground (Voltage-Source)



	)

;;Basically, for each class specified in the assignment, start with just the data fields and inheritance. 
;;Any references to slots are instructions to create instance variables (ex. the name variable in the first class in this email), 
;;and any other attributes describing the slot (ex. the ":type symbol") are also given in the specifications and should be inserted immediately after the variable name. 

;;Voltage-Source has subclasses Ground, which should redefine the level slot to have :allocation :class, and High, 
;;which should also redefine level to have :allocation :class and :default-initargs :level to 1, and Switch,
;; which has no extra slots or redefined slots besides class-name (see below for the class-name spec).

;;(defclass fruit (food)
;;((color :initarg :color
;;        :reader fruit-color)
;; (price :initarg :price
;;        :accessor fruit-price))
;; (:default-initargs :color 'red)
;; (:documentation "This represents a fruit."))
;;
;; : inputs , :comp, inputs == nil
;;
;;
;;


;;Gate should have a comp slot with :allocation :class and :type function and an inputs slot with :type list and :default-initargs nil. 
;;Each subclass of Gate should redefine the comp slot to have :default-initargs :comp of #'function, 

(deflclass Gate (Circuit-Element)
	((input :initarg :input
		     :reader :input)

    (comp :initarg :comp
    	  :accessor :comp))
	(:default-initargs :comp 'nil)

	(:documentation "This represents a Gate."))

;;Gate should have a comp slot with :allocation :class and :type function and an inputs slot with :type list and :default-initargs nil. 
;;Each subclass of Gate should redefine the comp slot to have :default-initargs :comp of #'function, 


(defclass Not-Gate (Gate)
((class-name :initarg :class-name :allocation :class :type string :accessor class-name
    :documentation "the name of the class of the circuit element")
    (comp :initarg :comp :allocation :class :type function :accessor comp
    :documentation "the function used to compute the output level"))
    (:default-initargs :class-name "NOT" :comp #'lognot)
    (:documentation "A Not Gate"))
    ;use this to figure out the rest.

;;all gates should include the comp slot, and a class-name woudld be useful. Here is one example:
(defclass Not-Gate (Gate)
((Not-Gate :initarg :Not-Gate :allocation :Not-Gate :type string :accessor Not-Gate
    :documentation "the name of the class of the circuit element")

    (comp :initarg :comp :allocation :class :type function :accessor comp
    :documentation "the function used to compute the output level"))
    (:default-initargs :Not-Gate "NOT" :comp #'lognot)
    (:documentation "A Not Gate"))
    ;use this to figure out the rest.

;Buffer-Gate class
(defclass Buffer-Gate (Gate)
 ((Buffer-Gate :initarg :Buffer-Gate :allocation :Buffer-Gate :type string :accessor :Buffer-Gate
 		:documentation "the name of the Buffer-Gate class")
 		(comp :initarg :comp :allocation :class :type function :accessor comp
 		:documentation "fucntion used to compute the output level"))
 		(:default-initargs :Buffer-Gate "Buffer" :comp #'Buffer)
 		(:documentation "A Buffer Gate"))
 	

	
;And-Gate class
(defclass And-Gate (Gate)
  ;(setf (:comp :default-initargs :comp 'And-Gate))
 ((And-Gate :initarg :And-Gate :allocation :Buffer-Gate :type string :accessor :And-Gate
  	:documentation "the name of the And-Gate class")
  	(comp :initarg :comp :allocation :class :type function :accessor comp
  	:documentation "the function to compute output level"))
  	(:default-initargs :And-Gate "And" :comp #'And)
  	(:documentation "An And Gate")

	

(defclass Or-Gate (Gate)
  ;(setf (:comp :default-initargs :comp 'Or-Gate))
	((Or-Gate :initarg :Or-Gate :allocation :Or-Gate :type string :accessor :Or-Gate
	  :documentation "the name of the Or-Gate class ")
	  (comp :initarg :comp :allocation :class :type function :accessor comp
	  :documentation "function to compute output level"))
	  (:default-initargs :Or-Gate "Or" :comp #'Or)
	  (:documentation "An Or Gate")


(defclass Nand-Gate (Gate)
  ;(setf (:comp :default-initargs :comp 'Nand-Gate))
  	((Nand-Gate :init-arg :Nand-Gate :allocation :Nand-Gate :type string :accessor :Nand-Gate
	:documentation "the name of the Nand-Gate class")
  	(comp :initarg :comp :allocation :class :type function :accessor comp
  	:documentation "function to compute output level"))
  	(:default-initargs :Nand-Gate "Nand" :comp #'Nand)
  	(:documentation "A Nand Gate")	
	

(defclass Nor-Gate (Gate)
  ;(setf (:comp :default-initargs :comp 'Nor-Gate))
	((Nor-Gate :init-arg :Nor-Gate :allocation :Nor-Gate :type string :accessor :Nor-Gate
	:documentation "the name of the Nor-Gate class")
	(comp :initarg :comp :allocation :class :type function :accessor comp
	:documentation "function to compute output level")
	(:default-initargs :Nor-Gate "Nor" :comp #'Nor)
	(:documentation "A Nor-Gate")

(defclass Xor-Gate (Gate)
  ;(setf (:comp :default-initargs :comp 'Xor-Gate))
  ((Xor-Gate :init-arg :Xor-Gate :allocation :Xor-Gate :type string :accessor :Xor-Gate
  :documentation "then name of th Xor-Gate class")
  (comp :initarg :comp :allocation :class :type function :accessor comp
  :documentation "the funtion to computer output level")
  (:default-initargs :Xor-Gate "Xor" :comp #'Xor)
  (:documentation "A Xor-Gate")	


;;multi-gate class (Half-Adder, Full-Adder, S-R-Flip-Flop)
;;4) Each multi-gate class (Half-Adder, Full-Adder, S-R-Flip-Flop) should have a corresponding initialize-instance method, 
;;which essentially "hooks up" everything. Use let and setf to assign appropriate outputs,
;;inputs and output-gates (output-gates and ones that produce the final output, as opposed to intermediary ones. 
;;For instance, a FullAdder has 5 gates total, but only 2 output-gates). Refer to the circuits site from above (#2) to see what the outputs, 
;;inputs and output-gates should be. begins the multigate functions
(defclass Multi-gate (Gate))



;;input = 2
;;output = 2
(defclass Half-Adder (multi-gate))


;;input = 3
;;output = 2
(defclass Full-Adder (multi-gate))



;;input = 1
;;output = 1
(defclass S-R-Flip-Flop (Multi-gate))


;;logical statements




