;;; tconv.el --- Converter temperature values

;; Copyright (C) 2014 Artem Petrov <pa2311@gmail.com>

;; Author: Artem Petrov <pa2311@gmail.com>
;; Created: 04 May 2014
;; Keywords: calculation convertion temperature dimension
;; Version: 0.1.0

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

(defun temperature-converter (value dimension)
  "Convert temperature value from C to F and vice versa"
  (cond ((equal dimension "C")
         (setq result (+ (* value (/ 9.0 5.0)) 32.0))
         (message "%f %s = %f %s" value dimension result "F"))
        ((equal dimension "F")
         (setq result (* (- value 32.0) (/ 5.0 9.0)))
         (message "%f %s = %f %s" value dimension result "C"))
        (t (message "Wrong dimension!")))
  )

(temperature-converter (string-to-number (elt argv 0))
                       (elt argv 1))
