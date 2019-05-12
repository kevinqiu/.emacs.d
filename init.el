;;package stuff
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(setq package-enable-at-startup nil)

;;useful settings
(setq backup-directory-alist `(("." . "~/.saves")))
(setq auto-save-file-name-transforms `((".*" ,"~/.saves" t)))
(tool-bar-mode -1)
(setq backup-by-copying t)
(desktop-save-mode 1)
(line-number-mode 1)
(column-number-mode 1)  ;make the column number show up
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
(delete-selection-mode 1)

;;various package declarations
(unless (package-installed-p 'use-package)
  (package-refresh-contents) (package-install 'use-package))
(require 'use-package-ensure)
(setq use-package-always-ensure t)
(use-package multiple-cursors)

;;magit
(use-package magit)
(global-set-key (kbd "C-x g") 'magit-status)

;;load theme
(use-package solarized-theme)
(load-theme 'solarized-dark t)

;;flycheck
(use-package flycheck)

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
(autoload 'whitespace-mode "whitespace" "Toggle whitespace visualization." t)
(global-whitespace-mode 1)

;;auto-complete(company-mode)
(use-package company)
(add-hook 'after-init-hook 'global-company-mode)

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

;; yaml
(use-package yaml-mode)

;;(load (expand-file-name "config/ocaml.el" user-emacs-directory))
;;(load (expand-file-name "config/scala.el" user-emacs-directory))
;;(load (expand-file-name "config/ruby.el" user-emacs-directory))
(load (expand-file-name "config/javascript.el" user-emacs-directory))
(load (expand-file-name "config/python.el" user-emacs-directory))
(load (expand-file-name "config/lisp.el" user-emacs-directory))
(load (expand-file-name "config/go.el" user-emacs-directory))
(load (expand-file-name "config/protobuf.el" user-emacs-directory))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(magit-use-overlays nil)
 '(package-selected-packages
   (quote
    (prettier-js go-eldoc company-go go-guru go-mode company yaml-mode use-package undo-tree solarized-theme rjsx-mode projectile multiple-cursors magit ivy flycheck anaconda-mode)))
 '(show-trailing-whitespace t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
