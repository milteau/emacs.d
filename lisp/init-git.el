;;; init-git.el --- Git and Magit Configuration -*- lexical-binding: t; -*-

;; 确保 use-package 已经安装（原生配置利器）
(eval-when-compile
  (require 'use-package))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)     ; 最核心的启动看板快捷键
         ("C-x M-g" . magit-dispatch) ; 弹窗菜单（如果不记得全局键）
         ("C-c f g" . magit-file-dispatch)) ; 针对当前文件的 Git 操作
  
  :config
  ;; 优化：让 Magit 在当前窗口打开，而不是弹出一个丑陋的弹窗
  ;; 退出 Magit (按 q) 时，会自动恢复之前的窗口布局
  (setq magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)

  ;; 性能优化：在大型仓库中，关闭不必要的刷新（可选）
  ;; (setq magit-refresh-status-buffer nil)
  )

(provide 'init-git)
;;; init-git.el ends here
