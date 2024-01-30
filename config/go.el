;; go
(use-package go-mode)

(defun v-go-shorten-lines ()
  "Shorten long lines in current file."
  (interactive)
  (when (eq major-mode 'go-mode)
    (save-buffer)
    (shell-command
     (format "golines -m 120 --shorten-comments --no-reformat-tags --base-formatter=gofmt -w %s"
             buffer-file-name))))
;;(add-hook 'before-save-hook 'v-go-shorten-lines)

(use-package flymake-go-staticcheck)
(add-hook 'go-mode-hook #'flymake-go-staticcheck-enable)
(add-hook 'go-mode-hook #'flymake-mode)

(add-hook 'go-mode-hook #'lsp-deferred)
(global-set-key (kbd "C-.") 'godef-jump)
(add-hook 'before-save-hook 'flycheck-mode)
(add-hook 'go-mode-hook 'flycheck-mode)
(add-hook 'go-mode-hook
          (lambda ()
;            (whitespace-toggle-options '(tabs))
            (setq whitespace-style '(face spaces trailing
                                     space-before-tab newline
                                     indentation empty space-after-tab
                                     space-mark tab-mark
                                     newline-mark))
            (setq tab-width 4)))
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

(use-package exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))
