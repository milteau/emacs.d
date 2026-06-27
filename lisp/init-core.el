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

;; ── 拦截 Treemacs 字符串越界 Bug 的防御性 Advice ───────────────────
(defun my-safe-substring-advice (orig-fun string &optional from to)
  "如果 string 为空字符串且 to 为 -1，拦截并安全返回空字符串。"
  (if (and (string= string "") (eq to -1))
      ""
    (funcall orig-fun string from to)))

;; 将该 advice 挂载到内置的 substring 函数上
(advice-add 'substring :around #'my-safe-substring-advice)

(provide 'init-core)
