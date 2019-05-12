;; slime
(use-package slime)
(setq inferior-lisp-program "/usr/bin/sbcl")
(when (eq system-type 'darwin)
  (setq inferior-lisp-program "/usr/local/bin/sbcl"))
(setq slime-contribs '(slime-fancy))
