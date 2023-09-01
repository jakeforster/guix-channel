;;;
;;; Copyright (C) 2023 Jake Forster <jakecameron.forster@gmail.com>
;;;
;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation, either version 3 of the License, or
;;; (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; This file is NOT part of the Guix project.

(define-module (jforst packages python-xyz)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (gnu packages python-build) ;python-hatchling, python-tomli
  #:use-module (gnu packages python)
  #:use-module (gnu packages check)
  #:use-module (gnu packages python-xyz) ;python-matplotlib, python-numpy
  #:use-module (gnu packages python-science) ;python-scipy
  #:use-module (gnu packages tcl) ;tk
  #:use-module ((guix licenses)
                #:prefix license:))

(define-public python-radcomp-0-2-0
  (package
    (name "python-radcomp")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "radcomp" version))
              (sha256
               (base32
                "0nw5wmf3f510346zkkkiwg86ma6mchwrbz75s3xifzvc49mkccgc"))))
    (build-system pyproject-build-system)
    (native-inputs `(("python-hatchling" ,python-hatchling)
                     ("python-pytest" ,python-pytest)))
    (propagated-inputs `(("python-matplotlib" ,python-matplotlib)
                         ("python-numpy" ,python-numpy)
                         ;; only need tomli if python version < 3.11
                         ("python-tomli" ,python-tomli)
                         ("python-scipy" ,python-scipy)))
    (home-page "https://github.com/jakeforster/radcomp")
    (synopsis "Radioactive compartment models")
    (description
     "Model the movement of radioactive nuclei and their progeny through a system.")
    (license license:expat)))

