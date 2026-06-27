;;; init-treemacs.el --- 文件树配置 -*- lexical-binding: t; -*-

;;;###autoload
(defun my-treemacs-toggle ()
  "延迟加载 Treemacs 的入口函数。"
  (interactive)
  (require 'init-treemacs)
  (treemacs))

;;;###autoload
(defun my-treemacs-select ()
  "延迟加载 Treemacs 并选中窗口。"
  (interactive)
  (require 'init-treemacs)
  (treemacs-select-window))

;; ── 核心配置 ──────────────────────────────────────────────
(use-package treemacs
  :ensure t
  :defer t
  :config
  ;; 你可以在这里添加其他的 treemacs 细节个性化配置
  (setq treemacs-no-png-images t) ; 如果在 WSL/终端下，开启这个可以加速渲染
  )

(provide 'init-treemacs)
;;; init-treemacs.el ends here
