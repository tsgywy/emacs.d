
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(setq package-enable-at-startup nil)
;;(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
;;                         ("org"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
;;                         ("user42". "https://mirrors.tuna.tsinghua.edu.cn/elpa/user42/")))

(setq package-archives '(("gnu"   . "http://mirrors.163.com/elpa/gnu/")
                         ("melpa" . "http://mirrors.163.com/elpa/melpa/")
                         ("org"   . "http://mirrors.163.com/elpa/org/")
                         ("user42". "http://mirrors.163.com/elpa/user42/")))

;;(setq package-archives '(("gnu"   . "https://mirrors.cloud.tencent.com/elpa/gnu/")
;;                         ("melpa" . "https://mirrors.cloud.tencent.com/elpa/melpa/")
;;                         ("org"   . "https://mirrors.cloud.tencent.com/elpa/org/")
;;                         ("user42". "https://mirrors.cloud.tencent.com/elpa/user42/")))

;;(setq package-archives '(("gnu"   . "http://mirrors.bit.edu.cn/elpa/gnu/")
;;                         ("melpa" . "http://mirrors.bit.edu.cn/elpa/melpa/")
;;                         ("org"   . "http://mirrors.bit.edu.cn/elpa/org/")
;;                         ("user42". "http://mirrors.bit.edu.cn/elpa/user42/")))

;;(setq package-archives '(("gnu"   . "http://mirrors.zju.edu.cn/elpa/gnu/")
;;                         ("melpa" . "http://mirrors.zju.edu.cn/elpa/melpa/")
;;                         ("org"   . "http://mirrors.zju.edu.cn/elpa/org/")
;;                         ("user42". "http://mirrors.zju.edu.cn/elpa/user42/")))

;;(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
;;                         ("melpa" . "http://elpa.emacs-china.org/melpa/")
;;                         ("org"   . "http://elpa.emacs-china.org/org/")
;;                         ("user42". "http://elpa.emacs-china.org/user42/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(defun require-package (package &optional min-version)
  "Install PACKAGE if it's not installed.
Optionally require MIN-VERSION."
  (or (package-installed-p package min-version)
      (if (assoc package package-archive-contents)
          (package-install package)
        (progn
          (package-refresh-contents)
          (package-install package)))))

(defun maybe-require-package (package &optional min-version)
  "Try to install PACKAGE, and return non-nil if successful or PACKAGE exists.
In the event of failure, return nil and print a warning message.
Optionally require MIN-VERSION."
  (condition-case err
      (require-package package min-version)
    (error
     (message "Failed to install optional package `%s': %S" package err)
     nil)))

(provide 'init-elpa)

