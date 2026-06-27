;;; init-ui.el --- 主题 / modeline / org 视觉 -*- lexical-binding: t; -*-

;; ── 1. 主题与极简风 ──────────────────────────────────────
(use-package modus-themes
  :ensure t
  :init
  (setq modus-themes-completions '((t . (extrabold)))
        modus-themes-subheadings '((t . (bold))))
  :config
  (load-theme 'modus-operandi t))

;; ── 2. 字体与图标整合（合并 Windows 防御代码） ───────────────────
(use-package nerd-icons
  :ensure t
  :config
  ;; 将 Windows 特效代码合并到一个优雅的 block 中
  (when (eq system-type 'windows-nt)
    (let ((nerd-font (font-spec :family "Symbols Nerd Font Mono"))
          (emoji-font (font-spec :family "Segoe UI Emoji")))
      (set-fontset-font t 'unicode nerd-font nil 'append)
      (set-fontset-font t 'symbol nerd-font nil 'prepend)
      (set-fontset-font t 'emoji emoji-font nil 'prepend)
      (set-fontset-font t '(#x1f000 . #x1f9ff) emoji-font nil 'prepend))))

;;── 4. 内置状态栏扩展（时间、电量、标签页） ──────────────────────
;; 从 early-init.el 迁移至此，确保 GUI 和内置库加载完毕后安全启用

;; 4.1 开启时间显示（24小时制，隐藏负载）
(setq display-time-24hr-format t)
(setq display-time-default-load-average nil)
(display-time-mode 1)

;; 4.2 开启电量显示（如果是台式机或 WSL 也可以安全保留，不报错）
(display-battery-mode 1)

;; 4.3 开启内置标签页
(if (fboundp 'tab-bar-mode)
    (progn
      (setq tab-bar-close-button-show nil)  ; 隐藏标签页上的关闭[x]按钮
      (setq tab-bar-new-button-show nil)  ; 隐藏顶部的 [+]按钮
      (tab-bar-mode 1)))

;; ── 5. 其他功能模块 ──────────────────────────────────────
(use-package which-key
  :ensure t
  :hook (after-init . which-key-mode))

(use-package org
  :defer t
  :hook (org-mode . org-indent-mode)
  :config
  (setq org-startup-folded 'content))

(use-package org-bullets
  :ensure t
  :after org
  :hook (org-mode . org-bullets-mode))

(provide 'init-ui)
;;; init-ui.el ends here
