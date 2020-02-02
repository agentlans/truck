# truck

Creates a new Common Lisp package, imports other packages, and makes their external symbols available to the newly created package. This means you don't have to use colons to call functions from the libraries.

The packages are imported in their given order. If two packages have the same symbol, then this script will import the one from the most newly loaded package.

## Install
Just download the script and load it in Common Lisp. It's not a proper installable Lisp library yet.

## Use
```lisp
(load "truck.lisp")
(new-package :new-package-name '(alexandria iterate whatever-other-packages-here))
(in-package :new-package-name)

;; Optionally, you can call QUICKLOAD and SHADOWING-IMPORT if you want a certain symbol to shadow previous ones.

;; If you want to use a symbol from a particular package, you can use the regular calling convention. For example, foo from the bar package can be referred to as #'foo:bar

;; Your package's code here
```

## Author, license
"truck.lisp" by Alan Tseng is licensed under Creative Commons Zero v1.0 Universal
