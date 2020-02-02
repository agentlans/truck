;; Usage:
;; (load "truck.lisp")
;; (new-package :mypackage '(fset iterate))
;; (in-package :mypackage)

(defmacro new-package (new-package-name needed-packages)
  "Macro to define a new package 
and to import every needed dependency in order."
  `(progn
     (defpackage ,new-package-name
       (:use :cl))

     ;; Must do this next line manually:
     (in-package ,new-package-name)

     ;; Load the packages
     (loop for pkg in ,needed-packages
	do (ql:quickload pkg))

     ;; Turn the names into package objects then load them.
     ;; Packages in the front of the list
     ;; will be shadowed by packages in the back of the list.
     (let ((pkg-obj (mapcar #'find-package ,needed-packages)))
       (loop for p in pkg-obj
	  do (loop for s being the external-symbols of p
		do (shadowing-import s))))))

