;; init-ui.el — 主题 / modeline / org 视觉

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
