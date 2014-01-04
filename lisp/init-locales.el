(defun sanityinc/utf8-locale-p (v)
  "Return whether locale string V relates to a UTF-8 locale."
  (and v (string-match "UTF-8" v)))

(defun locale-is-utf8-p ()
  "Return t iff the \"locale\" command or environment variables prefer UTF-8."
  (or (sanityinc/utf8-locale-p (and (executable-find "locale") (shell-command-to-string "locale")))
      (sanityinc/utf8-locale-p (getenv "LC_ALL"))
      (sanityinc/utf8-locale-p (getenv "LC_CTYPE"))
      (sanityinc/utf8-locale-p (getenv "LANG"))))

(when (or window-system (locale-is-utf8-p))
  (setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
  (set-language-environment 'utf-8)
  (setq locale-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (unless (eq system-type 'windows-nt)
   (set-selection-coding-system 'utf-8))
  (prefer-coding-system 'utf-8))

;;启用全屏功能,运行 M-x fullscreen 或 fullscreen-toggle 进入或退出全屏
(require 'fullscreen)

;;启用行号显示
(require 'linum)
(global-linum-mode t)

;;显示时间
(display-time)
;;时间格式
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-format "%m月%d日,%A,%H:%M")
(setq display-time-interval 10)

;;Org mode 自动换行
(add-hook 'org-mode-hook
          (lambda () (setq truncate-lines nil)))

;;Emacs 复制内容到系统的剪贴板
;;(setq x-select-enable-clipboard t)

;;标题栏显示文件名：%f，缓冲区完整路径；%p，页面百分数；%l，行号
;;(setq frame-title-format "%f %l")

;;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线
(mouse-avoidance-mode 'animate)

;;设置个人信息
(setq user-full-name "tuhaihe")
(setq user-mail-address "1132321739qq@gmail.com")

;;禁用菜单栏 menubar，F10开启/关闭菜单
;;(menu-bar-mode nil)

;;禁用工具栏
;;(setq tool-bar-mode nil)

;;编辑器标签
(require 'tabbar)
(tabbar-mode)
(global-set-key [M-left] 'tabbar-backward);;切换到左侧标签
(global-set-key [M-right] 'tabbar-forward);;切换到右侧标签

;; 设置tabbar外观
;; 设置默认主题: 字体, 背景和前景颜色，大小
(set-face-attribute 'tabbar-default nil
                        :family "DejaVu Sans Mono"
                        :background "gray80"
                        :foreground "gray30"
                        :height 1.0
                        )
;; 设置左边按钮外观：外框框边大小和颜色
(set-face-attribute 'tabbar-button nil
                    :inherit 'tabbar-default
                    :box '(:line-width 1 :color "yellow70")
                    )
;; 设置当前tab外观：颜色，字体，外框大小和颜色
(set-face-attribute 'tabbar-selected nil
                    :inherit 'tabbar-default
                    :foreground "DarkGreen"
                    :background "LightGoldenrod"
                    :box '(:line-width 2 :color "DarkGoldenrod")
                    :overline "black"
                    :underline "black"
                    :weight 'bold
                    )
;; 设置非当前tab外观：外框大小和颜色
(set-face-attribute 'tabbar-unselected nil
                    :inherit 'tabbar-default
                    :box '(:line-width 2 :color "#00B2BF")
                    )
;;关闭启动画面
;;(setq inhibit-startup-message t)

;;设置字体、字体大小
;;(set-default-font "Menlo-11")

;;设置C->键作为窗口之间的切换，默认的是C-x-o
(global-set-key (kbd "C->") 'other-window)

;; 改变Emacs要你回答yes的行为,按y或空格键表示yes，n表示no
(fset 'yes-or-no-p 'y-or-n-p)

;;设置C-/为undo,M-/为set-mark
(global-set-key (kbd "C-/") 'undo)

;;设置M-/作为标志位，默认C-@来setmark,C-@不太好用
;;M-/本来对应zap-to-char，这里占用了
(global-set-key (kbd "M-/") 'set-mark-command)

(provide 'init-locales)
