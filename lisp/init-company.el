


(use-package company
  :ensure t
  :config
  (global-company-mode t)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3)
  "(setq company-backends
        '((company-files
           company-keywords
           company-lsp
           company-yasnippet
           )
          (company-abbrev company-dabbrev)))")
          
(use-package flycheck
  :ensure t)

(use-package company-c-headers
  :ensure t
  :config
  (add-to-list 'company-backends 'company-c-headers))
(provide 'init-company)
