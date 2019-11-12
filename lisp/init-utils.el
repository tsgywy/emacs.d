
;;不显示工具栏
(tool-bar-mode 0)

;;不现实菜单栏
(menu-bar-mode 0)

;;不显示滚动条
(scroll-bar-mode 0)

;;显示行号与列号
(global-linum-mode 1)
(column-number-mode 1)

;;关闭启动动画
(setq inhibit-startup-message 1)

;;设置初始工作目录
;;(if (string-equal system-type "windows-nt")
;;    (setq default-directory "G:\\projects")
;;  (setq default-directory "~/work"))

;;设置问答提示为 y-or-n,而不是yes-or-no
(fset 'yes-or-no-p 'y-or-n-p)

;;不生成备份文件，即 xxx.xx~ 类文件
(setq make-backup-files nil)
(setq make-backup-files nil)

;;设置备份文件路径
;;(setq backup-directory-alist '(("" . "~/.emacs-cache")))
;;关闭自动备份
(setq auto-save-default nil)

;;文件备份时不修改日期
(setq backup-by-copying t)

;;文件自动刷新
(global-auto-revert-mode 1)

;;光标修改为竖线
(setq-default cursor-type 'bar)

;;自动括号匹配
(electric-pair-mode 1)


;;C/C++代码缩进
(setq-default indent-tabs-mode nil) ; tab 改为插入空格
(setq c-basic-offset 4) ; c c++ 缩进4个空格
(setq c-default-style "linux"); 没有这个 { } 就会瞎搞
(setq default-tab-width 4)

;;设置默认编码
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(provide 'init-utils)
