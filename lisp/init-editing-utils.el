
;;vim插件
(use-package evil
    :ensure t
    :config
    (evil-mode 1))
;;(require-package 'evil)
;;(evil-mode 1)

;;helm插件
(use-package helm
    :init
    (helm-mode 1)
    :config
    (global-set-key (kbd "M-x") #'helm-M-x)
    (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
    (global-set-key (kbd "C-x C-f") #'helm-find-files))

;;必应词典
(use-package bing-dict
    :ensure t
    :config
    (global-set-key (kbd "C-c d") 'bing-dict-brief)
    )

;;文件列表
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-follow-delay             0.2
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-desc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-width                         35)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)
  
(use-package paradox
  :ensure t
  :config
  (paradox-enable)
  (remove-hook 'paradox--report-buffer-print 'paradox-after-execute-functions)
  (remove-hook 'paradox--report-buffer-display-if-noquery 'paradox-after-execute-functions))

(use-package ctags-update
  :ensure t
  :config
  (ctags-global-auto-update-mode)
  (setq ctags-update-prompt-create-tags nil);you need manually create TAGS in your project
  (autoload 'turn-on-ctags-auto-update-mode "ctags-update" "turn on 'ctags-auto-update-mode'." t)
  (add-hook 'c-mode-common-hook  'turn-on-ctags-auto-update-mode)
  (add-hook 'c++-mode-common-hook  'turn-on-ctags-auto-update-mode)
  (add-hook 'cc-mode-common-hook  'turn-on-ctags-auto-update-mode)
  (add-hook 'objc-mode-common-hook  'turn-on-ctags-auto-update-mode)
  (add-hook 'python-mode-hook  'turn-on-ctags-auto-update-mode)
  (add-hook 'java-mode-hook  'turn-on-ctags-auto-update-mode)
  (add-hook 'emacs-lisp-mode-hook  'turn-on-ctags-auto-update-mode)
  (add-hook 'emacs-lisp-mode-hook  'turn-on-ctags-auto-update-mode)

  (autoload 'ctags-update "ctags-update" "update TAGS using ctags" t)
  (global-set-key "\C-ce" 'ctags-update)

;;  on windows ,you can custom ctags-update-command like this:

;;(when (equal system-type 'windows-nt)
  ;;  (setq ctags-update-command (expand-file-name  "~/.emacs.d/bin/ctags.exe")))
  )
;;括号高亮
(use-package highlight-parentheses
  :ensure t
  :config
  (define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
  (global-highlight-parentheses-mode t))

;;自动保存


)

(provide 'init-editing-utils)

