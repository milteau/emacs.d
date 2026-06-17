;; init-treemacs.el — 文件树
(use-package treemacs
  :ensure t
  :defer t                          ;; 不在启动时加载，用到时才加载
  :bind (("C-x t t" . treemacs)
         ("C-x t 1" . treemacs-select-window)))

(provide 'init-treemacs)
