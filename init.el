(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(setq package-enable-at-startup nil)

(setq backup-directory-alist `(("." . "~/.saves")))
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
(desktop-save-mode 1)
(global-auto-revert-mode 1)
(setq-default indent-tabs-mode nil)
(delete-selection-mode 1)
(load-theme 'solarized-dark t)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;;Undo Tree
(require 'undo-tree)
(global-undo-tree-mode)


;;ido
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)

;;scala
(require 'scala-mode2)
(add-to-list 'auto-mode-alist '("\.scala" . scala-mode) '("\.sbt\'" . scala-mode) )

;;Ruby
(add-to-list 'auto-mode-alist
               '("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
               '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

;;C# mode
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
           (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))


;; Typescript highlighting/autocomplete
(require 'typescript)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

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
