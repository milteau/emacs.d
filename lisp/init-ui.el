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

;; ── 3. doom-modeline（原生接管：去文本，留图标） ───────────────
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-height 22)               ; 稍微调低高度更精致
  (doom-modeline-bar-width 3)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon t)       ; 开启图标
  (doom-modeline-major-mode-color-icon t)
  
  ;; 极致精简：关闭一切不需要的文本提示
  (doom-modeline-minor-modes nil)
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-indent-info nil)
  (doom-modeline-vcs-max-length 15)
  
  :config
  ;; 核心精简：直接重写 dashboard 映射，不需要写繁琐的 advice
  (with-eval-after-load 'doom-modeline
    (add-to-list 'doom-modeline-mode-alist
                 '(dashboard-mode . (progn
                                      (setq-local doom-modeline-major-mode-icon t)
                                      (setq-local mode-name ""))))))

;; ── 4. 其他功能模块 ──────────────────────────────────────
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
