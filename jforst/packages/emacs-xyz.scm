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

(define-module (jforst packages emacs-xyz)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system emacs)
  #:use-module (gnu packages emacs-xyz))

(define-public emacs-numpydoc
  (package
    (name "emacs-numpydoc")
    (version "0.9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/douglasdavis/numpydoc.el")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ld5m75mmfb7kp18sww5blvlazk0j1j0yhdkhsx1m624dq5rag1c"))))
    (build-system emacs-build-system)
    (inputs `(("emacs-dash" ,emacs-dash)
              ("emacs-s" ,emacs-s)))
    (home-page "https://github.com/douglasdavis/numpydoc.el")
    (synopsis "Insert NumPy style docstrings in Python functions")
    (description "An Emacs Lisp package to automatically insert NumPy style
docstrings in Python function definitions.")
    (license license:gpl3+)))

