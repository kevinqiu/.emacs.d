(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

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

(guru-global-mode  +1)
(setq guru-warn-only)

;;ido
(require 'ido)
(ido-mode t)

;;Ruby
(add-to-list 'auto-mode-alist
               '("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
               '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))


;; Typescript highlighting/autocomplete
(require 'typescript)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(require 'tss)
;; Key binding
(setq tss-popup-help-key "C-:")
(setq tss-jump-to-definition-key "C->")
;; Do setting recommemded configuration
(tss-config-default)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
