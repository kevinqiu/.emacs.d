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

;;package stuff - straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;use package declarations
(straight-use-package 'use-package)
(require 'use-package-ensure)
(setq use-package-always-ensure t)
(setq straight-use-package-by-default t)

;;magit
(use-package magit)
(global-set-key (kbd "C-x g") 'magit-status)

;;load theme
(use-package solarized-theme)
(load-theme 'solarized-light t)

;;flycheck
(use-package flycheck
  :init (global-flycheck-mode))

;;Undo Tree
(use-package undo-tree)
(global-undo-tree-mode)
(setq undo-tree-auto-save-history 0)
(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))

;;TODO
(use-package hl-todo)
(setq global-hl-todo-mode 1)

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

;;lsp
(use-package lsp-mode)
(use-package company-lsp)
(setq lsp-file-watch-threshold 5000)

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
(load (expand-file-name "config/magit.el" user-emacs-directory))
(load (expand-file-name "config/copilot.el" user-emacs-directory))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))
 '(magit-use-overlays nil)
 '(package-selected-packages
   '(hl-todo prettier-js go-eldoc company-go go-guru go-mode company yaml-mode use-package undo-tree solarized-theme rjsx-mode projectile multiple-cursors magit ivy flycheck anaconda-mode))
 '(show-trailing-whitespace t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
