;; init-core.el — 编辑器基本行为

;; 关闭启动画面
(setq inhibit-startup-message t)

;; 显示行号
(global-display-line-numbers-mode t)

;; ==========================
;; Visual Line Mode 配置
;; =========================

(add-hook 'text-mode-hook #'visual-line-mode)   ; 纯文本
(add-hook 'org-mode-hook  #'visual-line-mode)   ; Org
(add-hook 'markdown-mode-hook #'visual-line-mode) ; Markdown

(provide 'init-core)
