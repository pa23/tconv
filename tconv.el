#!/usr/bin/emacs --script

;;; tconv.el --- Converter temperature values

;; Copyright (C) 2014 Artem Petrov <pa2311@gmail.com>

;; Author: Artem Petrov <pa2311@gmail.com>
;; Created: 04 May 2014
;; Keywords: calculation convertion temperature dimension
;; Version: 0.3.0

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;;; caption

(message (concat "\n\tEmacs v" emacs-version " on "
                 (prin1-to-string system-type) " " system-name))
(message "\ttconv v0.3.0\n")

;;;; function definitions

(defun pa23-tconv (value dimension)
  "Convert temperature value from C to F and vice versa."
  (cond ((equal dimension "C")
         (setq result (+ (* value (/ 9.0 5.0)) 32.0))
         (message "%f %s = %f %s" value dimension result "F\n"))
        ((equal dimension "F")
         (setq result (* (- value 32.0) (/ 5.0 9.0)))
         (message "%f %s = %f %s" value dimension result "C\n"))
        (t (message "Wrong dimension!"))
        )
  )

;;;; main

(let (arg0 arg1)
  (if (< (length argv) 2)
      (progn
        (message "Enter temperature value.")
        (setq arg0 (read t))
        (message "Enter temperature dimension (\"C\" or \"F\").")
        (setq arg1 (read t))
        )
    (progn
      (setq arg0 (string-to-number (elt argv 0)))
      (setq arg1 (elt argv 1))
      )
    )
  (pa23-tconv arg0 arg1)
  )
