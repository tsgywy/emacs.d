;;一些在线笔记

;;蚂蚁笔记
(use-package leanote
    :ensure t
    :hook markdown-mode
    :config
    (add-hook 'markdown-mode-hook
          (lambda ()
            (leanote)
            (leanote-spaceline-status)  ;; optional, use it if necessary
            )))

(use-package geeknote
    :ensure t
    :defer t)

(provide 'init-note)