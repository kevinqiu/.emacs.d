;;package stuff
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(setq package-enable-at-startup nil)
(setq use-package-always-ensure t)

;;useful settings
(setq backup-directory-alist `(("." . "~/.saves")))
(setq auto-save-file-name-transforms `((".*" ,"~/.saves" t)))
(tool-bar-mode -1)
(setq backup-by-copying t)
(desktop-save-mode 1)
(line-number-mode 1)
(column-number-mode 1)  ; makes the column number show up
(display-time)
(show-paren-mode 1)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
(global-linum-mode 1)
(global-auto-revert-mode 1)
(setq-default indent-tabs-mode nil)
(setq tab-width 2) ; or any other preferred value
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)
(setq css-indent-offset 2)
(delete-selection-mode 1)


;;various package declarations
(unless (package-installed-p 'use-package)
  (package-refresh-contents) (package-install 'use-package))
(use-package multiple-cursors)

;;magit
(use-package magit)
(global-set-key (kbd "C-x g") 'magit-status)

;;load theme
(use-package solarized-theme)
(load-theme 'solarized-dark t)

;;flycheck
(use-package flycheck)

;;js
(use-package rjsx-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
(setq js2-include-node-externs t)

;; python
(use-package anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-mode)

;;Undo Tree
(use-package undo-tree)
(global-undo-tree-mode)

;;ivy
(use-package ivy)
(ivy-mode 1)
; Slim down ivy display
(setq ivy-count-format ""
      ivy-display-style nil
      ivy-minibuffer-faces nil)
; Use Enter on a directory to navigate into the directory, not open it with dired.
(define-key ivy-minibuffer-map (kbd "C-m") 'ivy-alt-done)

;;projectile
(use-package projectile)
; Let projectile use ivy
(setq projectile-completion-system 'ivy)


;;whitespace
(require 'whitespace)
(autoload 'whitespace-mode  "whitespace" "Toggle whitespace visualization."        t)
(global-whitespace-mode 1)



;;scala
;;(use-package scala-mode2)
;;(add-to-list 'auto-mode-alist '("\.scala" . scala-mode)
;;'("\.sbt\'" . scala-mode) )


;;ocaml - tuareg
(load "/Users/kevin/.opam/4.06.1/share/emacs/site-lisp/tuareg-site-file")
(use-package exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;ocaml - merlin
(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
  (when (and opam-share (file-directory-p opam-share))
    ;; Register Merlin
    (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
    (autoload 'merlin-mode "merlin" nil t nil)
    ;; Automatically start it in OCaml buffers
    (add-hook 'tuareg-mode-hook 'merlin-mode t)
    (add-hook 'caml-mode-hook 'merlin-mode t)
    ;; Use opam switch to lookup ocamlmerlin binary
    (setq merlin-command 'opam)))

;;merlin keybindings
(global-set-key (kbd "C-t") 'merlin-type-enclosing)
(use-package ocp-indent)

;;Ruby
(use-package ruby-mode)
(add-to-list 'auto-mode-alist '("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

;;auto-complete(company-mode)
(use-package company)
(add-hook 'after-init-hook 'global-company-mode)

;;protobuf
(use-package protobuf-mode)

; Make company aware of merlin
(with-eval-after-load 'company
 (add-to-list 'company-backends 'merlin-company-backend))
; Enable company on merlin managed buffers
(add-hook 'merlin-mode-hook 'company-mode)
; Or enable it globally:
; (add-hook 'after-init-hook 'global-company-mode)

;; yaml
(use-package yaml-mode)

;; freenode irc
(defun irc ()
  "Connect to the freenode"
  (interactive)
  (erc :server "irc.freenode.net"
       :port 6667))

(global-set-key "\C-ci"  'irc)


;;mac settings
(when (eq system-type 'darwin)
  (setq mac-command-key-is-meta t)
  (setq mac-command-modifier 'meta)
  (setq mac-option-key-is-meta t)
  (setq mac-option-modifier 'meta)
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(magit-use-overlays nil)
 '(show-trailing-whitespace t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
