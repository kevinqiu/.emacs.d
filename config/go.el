;; go
(use-package go-mode)
(use-package go-guru)
(use-package company-go)
(use-package go-eldoc)
(global-set-key (kbd "C-.") 'godef-jump)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook 'flycheck-mode)
(add-hook 'go-mode-hook 'go-eldoc-setup)
(add-hook 'go-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends) '(company-go))
;            (whitespace-toggle-options '(tabs))
            (setq whitespace-style '(face spaces trailing lines
                                     space-before-tab newline
                                     indentation empty space-after-tab
                                     space-mark tab-mark
                                     newline-mark))
            (setq tab-width 4)))

(use-package exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))
