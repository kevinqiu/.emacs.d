;;javascript/js
(use-package rjsx-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
(setq js2-include-node-externs t)
(use-package add-node-modules-path)
(use-package prettier-js)
(use-package json-mode)
(eval-after-load 'rjsx-mode
  '(progn
     (add-hook 'rjsx-mode-hook 'add-node-modules-path)
     (add-hook 'rjsx-mode-hook 'prettier-js-mode)
     (add-hook 'rjsx-mode-hook 'flycheck-mode)))
(setq js2-basic-offset 2)
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)
(setq css-indent-offset 2)
