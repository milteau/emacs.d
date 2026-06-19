;;; init-ui.el --- 主题 / modeline / org 视觉 -*- lexical-binding: t; -*-

;; ── 主题 ────────────────────────────────────────────────
(use-package modus-themes
  :ensure t
  :init
  (setq modus-themes-completions '((t . (extrabold)))
        modus-themes-subheadings '((t . (bold))))
  :config
  (load-theme 'modus-operandi t))

;; ── 图标支持 ────────────────────────────────────────────
(use-package nerd-icons
  :ensure t
  :config
  ;; 强制让 Emacs 的 Unicode 字符集走刚装好的新字体
  (when (eq system-type 'windows-nt)
    (set-fontset-font t 'unicode (font-spec :family "Symbols Nerd Font Mono") nil 'append)))

;; ── 增强型全局字体与符号映射（解决 Windows 顽固方块） ──────────────────
(when (eq system-type 'windows-nt)
  ;; 1. 让所有非标字符和特殊符号优先尝试走刚装好的 Nerd Font
  (set-fontset-font t 'symbol (font-spec :family "Symbols Nerd Font Mono") nil 'prepend)
  
  ;; 2. 让所有标准的彩色 Emoji（比如书本、星星、火箭等）走 Windows 自带的 Segoe UI Emoji 字体
  (set-fontset-font t 'emoji (font-spec :family "Segoe UI Emoji") nil 'prepend)
  
  ;; 3. 针对某些老版本 Emacs 的多重保障（强制将指定编码段映射到 Segoe UI Emoji）
  (set-fontset-font t '(#x1f000 . #x1f9ff) (font-spec :family "Segoe UI Emoji") nil 'prepend))

;; ── doom-modeline ───────────────────────────────────────
(use-package doom-modeline
  :ensure t
  :init (setq doom-modeline-icon t) 
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-height 26)              ; 状态栏高度
  (doom-modeline-bar-width 4)            ; 左侧垂直状态条宽度
  (doom-modeline-major-mode-icon t)      ; 显示主模式图标
  
  ;; 精简现代风设置
  (doom-modeline-minor-modes nil)        ; 隐藏右侧一长串 Minor Modes
  (doom-modeline-buffer-encoding nil)     ; 隐藏 UTF-8 编码提示
  (doom-modeline-indent-info nil)        ; 隐藏缩进提示
  (doom-modeline-vcs-max-length 15))

;; ── which-key ───────────────────────────────────────────
(use-package which-key
  :ensure t
  :hook (after-init . which-key-mode))

;; ── Org Mode 视觉增强 ────────────────────────────────────
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
