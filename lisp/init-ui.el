;; init-ui.el — 主题 / modeline / org 视觉

;; ── 主题 ────────────────────────────────────────────────
;; 主题必须立即加载，否则启动时会白屏闪烁
(use-package modus-themes
  :ensure t
  :config
  (load-theme 'modus-operandi t))

;; ── 图标支持（现代 UI 插件的基石） ──────────────────────
(use-package nerd-icons
  :ensure t
  :defer t
  :custom
  (nerd-icons-font-family "Symbols Nerd Font Mono")) ; 👈 确保这里有有效的配置

;; ── doom-modeline ───────────────────────────────────────
;; 确保在 nerd-icons 加载后再加载，避免找不到字体导致的卡顿
(use-package doom-modeline
  :ensure t
  :after nerd-icons
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-height          28)
  (doom-modeline-icon            t) ; 启用图标支持
  (doom-modeline-major-mode-icon t)
  (doom-modeline-buffer-encoding t)
  (doom-modeline-indent-info     t))

;; ── which-key ───────────────────────────────────────────
(use-package which-key
  :ensure t
  :hook (after-init . which-key-mode))

;; ── org-bullets ─────────────────────────────────────────
(use-package org
  :defer t
  :hook (org-mode . org-indent-mode)
  :config
  (setq org-startup-folded 'content))

(use-package org-bullets
  :ensure t
  :after org
  :hook (org-mode . org-bullets-mode))

(provide 'init-ui);; init-ui.el — 主题 / modeline / org 视觉

;; ── 主题 ────────────────────────────────────────────────
;; 主题必须立即加载，否则启动时会白屏闪烁，这里保持 require
(use-package modus-themes
  :ensure t
  :config
  (load-theme 'modus-operandi t))

;; ── doom-modeline ───────────────────────────────────────
;; 改为 after-init hook，避免启动时立即加载（省约 200ms）
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-height          28)
  (doom-modeline-icon            t)
  (doom-modeline-major-mode-icon t)
  (doom-modeline-buffer-encoding t)
  (doom-modeline-indent-info     t))

;; ── which-key ───────────────────────────────────────────
;; after-init 后启动，不阻塞主加载流程
(use-package which-key
  :ensure t
  :hook (after-init . which-key-mode))

;; ── org-bullets ─────────────────────────────────────────
;; 已正确使用 :defer t 和 :after org，保持不变
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
