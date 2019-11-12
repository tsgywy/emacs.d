;;tags配置

(use-package rtags
    :ensure t
    :defer t
    :init
    (add-hook 'c-mode-hook 'rtags-start-process-unless-running)
    (add-hook 'c++-mode-hook 'rtags-start-process-unless-running)
    (add-hook 'objc-mode-hook 'rtags-start-process-unless-running)
    )

(provide 'init-tags)