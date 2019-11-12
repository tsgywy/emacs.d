;;lsp配置
(use-package lsp-mode
    :ensure t
    :commands lsp
    :defer t
    :config
    (require 'yasnippet))

;; optionally
;(use-package lsp-ui :commands lsp-ui-mode :defer t)
;(use-package company-lsp :commands company-lsp :defer t))
;(use-package helm-lsp :commands helm-lsp-workspace-symbol :defer t))
;(use-package lsp-treemacs :commands lsp-treemacs-errors-list :defer t))
;; optionally if you want to use debugger
;(use-package dap-mode :defer t))
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

(use-package ccls
    :ensure t
    :hook ((c-mode c++-mode objc-mode cuda-mode) .
         (lambda () (require 'ccls) (lsp)))
    :config
    (setq ccls-executable "/usr/bin/ccls"))

(use-package yasnippet
    :ensure t
    :defer t)

(use-package lsp-ui
    :ensure t
    :init
    ;; 启用 lsp-ui
    (add-hook 'lsp-mode-hook 'lsp-ui-mode)
    ;; 启用 flycheck
    (add-hook 'c-mode-hook 'flycheck-mode)
    (add-hook 'c++-mode-hook 'flycheck-mode)
    (add-hook 'cc-mode-hook 'flycheck-mode)
    (add-hook 'objc-mode-hook 'flycheck-mode)
    (add-hook 'java-mode-hook 'flycheck-mode)
    (add-hook 'python-mode-hook 'flycheck-mode)
    
    :config
    (setq lsp-enable-eldoc nil) ;we will got error "Wrong type argument: sequencep" from `eldoc-message' if `lsp-enable-eldoc' is non-nil
    (setq lsp-message-project-root-warning t) ;avoid popup warning buffer if lsp can't found root directory (such as edit simple *.py file)
    (setq create-lockfiles nil)) ;we will got error "Error from the Language Server: FileNotFoundError" if `create-lockfiles' is non-nil)

 (use-package lsp-ui
    :ensure t
    :commands lsp-ui-mode
    :defer t
    :config
    (add-hook 'lsp-mode-hook 'lsp-ui-mode)
    (add-hook 'c-mode-hook 'flycheck-mode)
    (add-hook 'c++-mode-hook 'flycheck-mode)
    (add-hook 'cc-mode-hook 'flycheck-mode)
    (add-hook 'objc-mode-hook 'flycheck-mode)
    (add-hook 'java-mode-hook 'flycheck-mode)
    (add-hook 'python-mode-hook 'flycheck-mode)
    (add-hook 'html-mode-hook 'flycheck-mode)
    (add-hook 'css-mode-hook 'flycheck-mode))

(use-package helm-lsp
    :ensure t
    :commands helm-lsp-workspace-symbol
    :defer t)

(use-package company-lsp
    :ensure t
    :config
    ;; 设置 company-lsp 为后端
    (push 'company-lsp company-backends))

(use-package lsp-python-ms
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp))))  ; or lsp-deferred
(provide 'init-lsp)